<?php
// delete_order_item.php
// AJAX endpoint for removing order items and restoring inventory
// POST: product_id, qty (number of units to restore), sugar_level (optional), size (required)
// Returns: JSON with success status

include('../includes/config.php');
header('Content-Type: application/json');

if (!isset($_POST['product_id']) || !isset($_POST['qty'])) {
    echo json_encode(['success' => false, 'error' => 'Missing parameters']);
    exit;
}

$product_id = intval($_POST['product_id']);
$qty = intval($_POST['qty']); // Number of units being removed (to restore)
$sugar_level = isset($_POST['sugar_level']) ? $_POST['sugar_level'] : null;
$size = isset($_POST['size']) ? $_POST['size'] : '16oz'; // Default to 16oz

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

    // Restore all non-sweetener ingredients (add qty back)
    foreach ($other_ingredients as $ing) {
        $update = $pdo->prepare("UPDATE ingredients SET quantity = quantity + (:qty * :mult) WHERE id = :id");
        $update->execute([
            ':qty' => $qty,
            ':mult' => $ing['quantity_required'],
            ':id' => $ing['ingredient_id']
        ]);
    }

    // Restore sweetener based on sugar level
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
        
        // Calculate sweetener to restore
        $sweetener_qty = $sweetener_ing['quantity_required'] * $sweetener_multiplier * $qty;
        
        if ($sweetener_multiplier > 0) {
            $adjust_sweetener = $pdo->prepare("UPDATE ingredients SET quantity = quantity + :qty WHERE id = :id");
            $adjust_sweetener->execute([
                ':qty' => $sweetener_qty,
                ':id' => $sweetener_ing['ingredient_id']
            ]);
        }
    }

    // Return success response
    echo json_encode([
        'success' => true,
        'message' => 'Item removed and inventory restored',
        'product_id' => $product_id,
        'qty_restored' => $qty
    ]);

} catch (PDOException $e) {
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
} catch (Exception $e) {
    echo json_encode(['success' => false, 'error' => $e->getMessage()]);
}
?>
