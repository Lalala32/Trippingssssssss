<?php
require_once('config/tripko_db.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = password_hash($_POST['password'], PASSWORD_DEFAULT);
    
    $sql = "INSERT INTO user (username, password) VALUES (:username, :password)";
    $stmt = $conn->prepare($sql);
    
    try {
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':password', $password);
        $stmt->execute();
        echo "Registration successful";
        header("Location: login.php");
    } catch(PDOException $e) {
        echo "Error: " . $e->getMessage();
    }
}
?>