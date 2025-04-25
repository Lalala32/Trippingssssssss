<?php
// tripko-backend/login.php
session_start();
require_once(__DIR__ . '/config/tripko_db.php');
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
  $u = trim($_POST['username']);
  $p = $_POST['password'];
  if ($u===''||$p==='') {
    header('Location: ../tripko-frontend/file html/SignUp_LogIn_Form.php?error=empty');
    exit;
  }
  $stmt = $conn->prepare("SELECT * FROM user WHERE username=:u");
  $stmt->execute([':u'=>$u]);
  $user = $stmt->fetch(PDO::FETCH_ASSOC);
  if ($user && password_verify($p,$user['password'])) {
    $_SESSION['user_id']=$user['user_id'];
    header('Location: ../tripko-frontend/file html/dashboard.html');
    exit;
  } else {
    header('Location: ../tripko-frontend/file html/SignUp_LogIn_Form.php?error=invalid');
    exit;
  }
}
?>
