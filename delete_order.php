<?php
session_start();
include('../kusso/includes/config.php');

if (isset($_GET['id'])) {
    $order_id = $_GET['id'];

    try {
        $pdo = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // First, delete all related order_items
        $stmt_items = $pdo->prepare("DELETE FROM order_items WHERE order_id = :id");
        $stmt_items->bindParam(':id', $order_id, PDO::PARAM_INT);
        $stmt_items->execute();

        // Then, delete the order itself
        $stmt = $pdo->prepare("DELETE FROM orders WHERE id = :id");
        $stmt->bindParam(':id', $order_id, PDO::PARAM_INT);

        if ($stmt->execute()) {
            $_SESSION['success_message'] = "Order deleted successfully.";
        } else {
            $_SESSION['error_message'] = "Failed to delete the order.";
        }
    } catch (PDOException $e) {
        $_SESSION['error_message'] = "Error: " . $e->getMessage();
    }
} else {
    $_SESSION['error_message'] = "Invalid order ID.";
}

header("Location: orders.php");
exit();
?>