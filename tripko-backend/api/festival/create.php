<?php
// Enable error reporting (for debugging — disable in production)
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Headers for JSON response
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// Include the database connection
require_once($_SERVER['DOCUMENT_ROOT'] . '/TripKo-System/tripko-backend/config/tripko_db.php');

// Allow only POST requests
if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    http_response_code(405);
    echo json_encode(['success' => false, 'message' => 'Method not allowed']);
    exit;
}

try {
    // Get and sanitize inputs
    $festival_name = trim($_POST['name'] ?? '');
    $description   = trim($_POST['description'] ?? '');
    $festival_date = trim($_POST['date'] ?? '');
    $town_id       = trim($_POST['municipality'] ?? '');

    if ($festival_name === '' || $description === '' || $festival_date === '' || $town_id === '') {
        throw new Exception("Please fill in all required fields.");
    }

    // Handle image upload
    $image_path = '';
    if (isset($_FILES['image']) && $_FILES['image']['error'] === 0) {
        $uploadDir = $_SERVER['DOCUMENT_ROOT'] . '/TripKo-System/uploads/';
        if (!is_dir($uploadDir)) {
            mkdir($uploadDir, 0755, true);
        }

        $filename = time() . '_' . basename($_FILES['image']['name']);
        $targetFile = $uploadDir . $filename;

        if (!move_uploaded_file($_FILES['image']['tmp_name'], $targetFile)) {
            throw new Exception("Image upload failed.");
        }

        $image_path = $filename;
    }

    // ✅ FIXED: use `date` instead of `festival_date`
    $sql = "INSERT INTO festivals (name, description, date, town_id, image_path)
            VALUES (?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->execute([$festival_name, $description, $festival_date, $town_id, $image_path]);

    // Respond success
    echo json_encode([
        'success' => true,
        'message' => 'Festival successfully added.'
    ]);
} catch (Exception $e) {
    http_response_code(400);
    echo json_encode([
        'success' => false,
        'message' => 'Failed to add festival: ' . $e->getMessage()
    ]);
}
