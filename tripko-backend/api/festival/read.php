<?php
// Enable error reporting (disable in production)
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");

// Include your DB connection
require_once($_SERVER['DOCUMENT_ROOT'] . '/TripKo-System/tripko-backend/config/tripko_db.php');

try {
    // Allow GET (since the frontend fetches via GET)
    if ($_SERVER['REQUEST_METHOD'] !== 'GET') {
        http_response_code(405);
        echo json_encode(['success' => false, 'message' => 'Method not allowed']);
        exit;
    }

    // 🔑 Use the real column names: `name`, `date` on festivals; `town_name` on towns
    $sql = "
      SELECT
        f.name,
        f.description,
        f.date,
        f.image_path,
        t.town_name
      FROM festivals AS f
      LEFT JOIN towns     AS t ON f.town_id = t.town_id
      ORDER BY f.date DESC
    ";
    $stmt = $conn->prepare($sql);
    $stmt->execute();

    $records = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode(['success' => true, 'records' => $records]);
} catch (Exception $e) {
    http_response_code(500);
    echo json_encode([
        'success' => false,
        'message' => 'Could not read festivals: ' . $e->getMessage()
    ]);
}
