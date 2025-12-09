<?php
include('../includes/config.php');

if (isset($_GET['order_id'])) {
    $order_id = $_GET['order_id'];

    try {
        // Database connection using PDO
        $pdo = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Fetch order details
        $query = "SELECT * FROM orders WHERE id = :order_id";
        $stmt = $pdo->prepare($query);
        $stmt->bindParam(':order_id', $order_id, PDO::PARAM_INT);
        $stmt->execute();
        $order = $stmt->fetch(PDO::FETCH_ASSOC);

        // Fetch order items with product names and options
        $query = "
            SELECT oi.*, p.product_name, p.options 
            FROM order_items oi
            JOIN products p ON oi.product_id = p.id
            WHERE oi.order_id = :order_id
        ";
        $stmt = $pdo->prepare($query);
        $stmt->bindParam(':order_id', $order_id, PDO::PARAM_INT);
        $stmt->execute();
        $order_items = $stmt->fetchAll(PDO::FETCH_ASSOC);

        // Return order details and items as JSON
        echo json_encode(['order' => $order, 'order_items' => $order_items]);
    } catch (PDOException $e) {
        echo json_encode(['error' => 'Error fetching order: ' . htmlspecialchars($e->getMessage())]);
    }
} else {
    echo json_encode(['error' => 'Order ID not provided.']);
}
?>