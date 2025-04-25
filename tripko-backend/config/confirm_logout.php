<?php
session_start();

// If form was submitted:
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['confirm']) && $_POST['confirm'] === 'yes') {
        // Destroy session and redirect to login
        $_SESSION = [];
        session_destroy();
        header('Location: login.php');
        exit;
    } else {
        // User chose "No" -> redirect back to dashboard
        header('Location: ../tripko-frontend/file html/dashboard.html');
        exit;
    }
}

// Otherwise show the confirmation form:
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Confirm Logout</title>
  <link rel="stylesheet" href="../file_css/SignUp_LogIn_Form.css"><!-- reuse your css or add styling -->
</head>
<body class="bg-white text-gray-900 flex items-center justify-center min-h-screen">
  <div class="bg-white p-6 rounded shadow-lg text-center">
    <h2 class="text-xl font-semibold mb-4">Do you want to sign out?</h2>
    <form method="post">
      <button type="submit" name="confirm" value="yes" class="btn bg-red-600 text-white px-4 py-2 rounded mr-2">
        Yes
      </button>
      <button type="submit" name="confirm" value="no" class="btn bg-gray-300 px-4 py-2 rounded">
        No
      </button>
    </form>
  </div>
</body>
</html>
