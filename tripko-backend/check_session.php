<?php
session_start();

function checkAdminSession() {
    if (!isset($_SESSION['user_id']) || $_SESSION['user_type'] !== 'Admin') {
        header("Location: ../tripko-frontend/file html/SignUp_LogIn_Form.html");
        exit();
    }
}
?>