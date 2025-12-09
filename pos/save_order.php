<?php
session_start();
include('../includes/config.php');
include('../includes/invoice_helper.php');

// Function to auto-deduct inventory based on ordered items
function autoDeductInventory($pdo, $items) {
    // No longer needed: deduction is now handled in adjust_stock.php on add/increase only
    return;
}

// Get the JSON data from the request
$data = json_decode(file_get_contents('php://input'), true);

if ($data) {
    try {
        $pdo = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        

    if (isset($data['order_id']) && !empty($data['order_id'])) {
            // Check if the order exists
            $stmt = $pdo->prepare("SELECT * FROM orders WHERE id = :order_id");
            $stmt->bindParam(':order_id', $data['order_id'], PDO::PARAM_INT);
            $stmt->execute();
            $existingOrder = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($existingOrder) {
                // Determine new payment status
                $payment_status = $existingOrder['payment_status'];
                if (
                    (isset($data['payment_type']) && strtolower($data['payment_type']) === 'cash')
                    || (isset($data['payment_status']) && $data['payment_status'] === 'paid')
                ) {
                    $payment_status = 'paid';
                } elseif (isset($data['payment_type']) && strtolower($data['payment_type']) === 'pay later') {
                    $payment_status = 'unpaid';
                }

                // Update the existing order
                $orderNotes = isset($data['order_notes']) ? $data['order_notes'] : null;
                $stmt = $pdo->prepare("UPDATE orders SET payment_type = :payment_type, total_amount = :total_amount, amount_tendered = :amount_tendered, payment_status = :payment_status, note = :note WHERE id = :order_id");
                $stmt->execute([
                    ':order_id' => $data['order_id'],
                    ':payment_type' => $data['payment_type'],
                    ':total_amount' => $data['total_amount'],
                    ':amount_tendered' => $data['amount_tendered'],
                    ':payment_status' => $payment_status,
                    ':note' => $orderNotes
                ]);

                // Update order items if necessary
                foreach ($data['items'] as $item) {
                    $stmt = $pdo->prepare("UPDATE order_items SET qty = :qty, price = :price, amount = :amount, options = :options, note = :note WHERE order_id = :order_id AND product_id = :product_id");
                    $stmt->execute([
                        ':order_id' => $data['order_id'],
                        ':product_id' => $item['id'],
                        ':qty' => $item['qty'],
                        ':price' => $item['price'],
                        ':amount' => $item['amount'],
                        ':options' => isset($item['options']) ? $item['options'] : null,
                        ':note' => isset($item['note']) ? $item['note'] : null
                    ]);
                }

                // No deduction here; already handled on add/increase

                echo json_encode(['success' => true, 'message' => 'Order updated to paid status.']);
            } else {
                echo json_encode(['success' => false, 'message' => 'Order not found.']);
            }
        } else {

            // Insert new order - Generate invoice number with daily counter
            // Use device timestamp if provided for consistent date handling
            $deviceTimestamp = isset($data['device_timestamp']) ? $data['device_timestamp'] : null;
            $orderNumber = generateInvoiceNumber($pdo, $deviceTimestamp);
            $paymongoReference = isset($data['paymongo_reference']) ? $data['paymongo_reference'] : null;

            // Determine payment status
            $paymentStatus = 'unpaid'; // default
            
            if (isset($data['payment_type'])) {
                $paymentType = strtolower($data['payment_type']);
                if ($paymentType === 'cash') {
                    $paymentStatus = 'paid';
                } elseif ($paymentType === 'paymongo' || $paymentType === 'other') {
                    // PayMongo payments should be marked as paid when created
                    // (user has already processed the payment successfully)
                    $paymentStatus = 'paid';
                }
            } elseif (isset($data['payment_status']) && $data['payment_status'] === 'paid') {
                // Honor explicit paid status
                $paymentStatus = 'paid';
            }

            // If payment_type is cash, set payment_status to paid; if pending (pay later), set to unpaid
            // If payment_type is paymongo, set payment_status based on payment_status param or default to paid
            $orderNotes = isset($data['order_notes']) ? $data['order_notes'] : null;
            
            // Use device timestamp for created_at to ensure accurate daily reset
            $createdAt = isset($data['device_timestamp']) ? $data['device_timestamp'] : date('Y-m-d H:i:s');
            
            $stmt = $pdo->prepare("INSERT INTO orders (order_number, order_type, payment_type, paymongo_reference, total_amount, amount_tendered, payment_status, note, created_at) VALUES (:order_number, :order_type, :payment_type, :paymongo_reference, :total_amount, :amount_tendered, :payment_status, :note, :created_at)");
            $stmt->execute([
                ':order_number' => $orderNumber,
                ':order_type' => $data['order_type'],
                ':payment_type' => $data['payment_type'],
                ':paymongo_reference' => $paymongoReference,
                ':total_amount' => $data['total_amount'],
                ':amount_tendered' => $data['amount_tendered'],
                ':payment_status' => $paymentStatus,
                ':note' => $orderNotes,
                ':created_at' => $createdAt
            ]);
            
            $orderId = $pdo->lastInsertId();

            // Insert order items
            $stmt = $pdo->prepare("INSERT INTO order_items (order_id, product_id, qty, price, amount, options, note) VALUES (:order_id, :product_id, :qty, :price, :amount, :options, :note)");
            foreach ($data['items'] as $item) {
                $stmt->execute([
                    ':order_id' => $orderId,
                    ':product_id' => $item['id'],
                    ':qty' => $item['qty'],
                    ':price' => $item['price'],
                    ':amount' => $item['amount'],
                    ':options' => isset($item['options']) ? $item['options'] : null,
                    ':note' => isset($item['note']) ? $item['note'] : null
                ]);
            }

            // No deduction here; already handled on add/increase

            echo json_encode(['success' => true, 'message' => 'New order created.','order_number' => $orderNumber]);
        }
    } catch (PDOException $e) {
        echo json_encode(['success' => false, 'message' => $e->getMessage()]);
    }
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid data']);
}
?>