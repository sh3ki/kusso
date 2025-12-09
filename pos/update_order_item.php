<?php
// update_order_item.php
// AJAX endpoint for updating order item quantity
// POST: product_id, qty (amount to change: positive or negative), sugar_level (optional), size (required)
// Returns: JSON with success status and updated item data

include('../includes/config.php');
header('Content-Type: application/json');

if (!isset($_POST['product_id']) || !isset($_POST['qty'])) {
    echo json_encode(['success' => false, 'error' => 'Missing parameters']);
    exit;
}

$product_id = intval($_POST['product_id']);
$qty_change = intval($_POST['qty']); // Amount to change (can be positive or negative)
$sugar_level = isset($_POST['sugar_level']) ? $_POST['sugar_level'] : null;
$size = isset($_POST['size']) ? $_POST['size'] : '16oz'; // Default to 16oz
$item_id = isset($_POST['item_id']) ? $_POST['item_id'] : null; // Original item ID for tracking

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // Get product to find its category
    $prodStmt = $pdo->prepare("SELECT category_id FROM products WHERE id = :product_id");
    $prodStmt->execute([':product_id' => $product_id]);
    $product = $prodStmt->fetch(PDO::FETCH_ASSOC);

    if (!$product) {
        echo json_encode(['success' => false, 'error' => 'Product not found']);
        exit;
    }

    // Get required ingredients ONLY from category_ingredients table based on size
    $stmtIng = $pdo->prepare("
        SELECT 
            ci.ingredient_id, 
            ci.quantity_requirement as quantity_required, 
            i.name as ingredient_name 
        FROM category_ingredients ci 
        JOIN ingredients i ON ci.ingredient_id = i.id 
        WHERE ci.category_id = :category_id 
        AND ci.size = :size
    ");
    $stmtIng->execute([
        ':category_id' => $product['category_id'],
        ':size' => $size
    ]);
    $ingredients = $stmtIng->fetchAll(PDO::FETCH_ASSOC);

    if (empty($ingredients)) {
        echo json_encode(['success' => false, 'error' => 'No ingredients configured for this product size']);
        exit;
    }

    // Separate sweetener from other ingredients
    $sweetener_ing = null;
    $other_ingredients = [];
    
    foreach ($ingredients as $ing) {
        if (stripos($ing['ingredient_name'], 'sweetener') !== false || stripos($ing['ingredient_name'], 'sugar') !== false) {
            $sweetener_ing = $ing;
        } else {
            $other_ingredients[] = $ing;
        }
    }

    // Check stock if deducting (qty_change < 0)
    if ($qty_change < 0) {
        foreach ($other_ingredients as $ing) {
            $check = $pdo->prepare("SELECT quantity FROM ingredients WHERE id = :id");
            $check->execute([':id' => $ing['ingredient_id']]);
            $row = $check->fetch(PDO::FETCH_ASSOC);
            if (!$row || $row['quantity'] < abs($qty_change) * $ing['quantity_required']) {
                echo json_encode(['success' => false, 'error' => 'Insufficient stock for ingredient: ' . $ing['ingredient_name']]);
                exit;
            }
        }
    }

    // Adjust stock for non-sweetener ingredients (never allow negative)
    foreach ($other_ingredients as $ing) {
        $update = $pdo->prepare("UPDATE ingredients SET quantity = GREATEST(quantity + (:qty * :mult), 0) WHERE id = :id");
        $update->execute([
            ':qty' => $qty_change,
            ':mult' => $ing['quantity_required'],
            ':id' => $ing['ingredient_id']
        ]);
    }

    // Handle sweetener adjustment based on sugar level
    if ($sugar_level && $sweetener_ing) {
        $sweetener_multiplier = 0;
        
        switch ($sugar_level) {
            case 'no-sugar':
                $sweetener_multiplier = 0;
                break;
            case 'less-sugar':
                $sweetener_multiplier = 0.5;
                break;
            case 'normal-sugar':
                $sweetener_multiplier = 1;
                break;
            case 'more-sugar':
                $sweetener_multiplier = 1.5;
                break;
            default:
                $sweetener_multiplier = 1;
        }
        
        // Calculate sweetener adjustment
        $sweetener_qty = $sweetener_ing['quantity_required'] * $sweetener_multiplier * $qty_change;
        
        if ($sweetener_multiplier > 0) {
            $adjust_sweetener = $pdo->prepare("UPDATE ingredients SET quantity = GREATEST(quantity + :qty, 0) WHERE id = :id");
            $adjust_sweetener->execute([
                ':qty' => $sweetener_qty,
                ':id' => $sweetener_ing['ingredient_id']
            ]);
        }
    }

    // Return success response with updated data
    echo json_encode([
        'success' => true,
        'message' => 'Item quantity updated successfully',
        'item_id' => $item_id,
        'product_id' => $product_id,
        'qty_change' => $qty_change
    ]);

} catch (PDOException $e) {
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
?>
