<?php
session_start();
session_destroy();
header("Location: ../tripko-frontend/file html/SignUp_LogIn_Form.html");
exit();
?>