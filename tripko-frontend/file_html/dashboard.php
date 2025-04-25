<?php
session_start();
if (!isset($_SESSION['user_id']) || $_SESSION['user_type_id'] != 1) {
    header("Location: SignUp_LogIn_Form.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>TripKo Pangasinan Dashboard</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Merriweather&display=swap" rel="stylesheet" />
  <link rel="stylesheet" href="../file css/dashboard.css" />
</head>
<body class="bg-white text-gray-900">
  <div class="flex min-h-screen">
     <!-- Sidebar -->
     <aside class="flex flex-col justify-between bg-[#255D8A] w-64 p-6 text-white">
        <div>
          <div class="flex items-center gap-3 mb-10">
            <div class="rounded-full border border-white p-2">
              <i class="fas fa-user-circle text-3xl"></i>
            </div>
            <div class="font-semibold text-lg leading-tight">
              TripKo<br />Pangasinan
            </div>
          </div>
          <nav class="flex flex-col space-y-5 text-sm font-semibold">
            <a href="../file html/dashboard.html" class="nav-link">
              <i class="fas fa-home text-white text-lg"></i> Dashboard
            </a>
            <a href="../file html/tourist_spot.html" class="nav-link">
              <i class="fas fa-umbrella-beach text-white text-lg"></i> Tourist Spots
            </a>
            <a href="../file html/itineraries.html" class="nav-link">
              <i class="fas fa-map-marker-alt text-white text-lg"></i> Itineraries
            </a>
            <a href="../file html/festival.html" class="nav-link">
              <i class="fas fa-carrot text-white text-lg"></i> Festivals
            </a>
            <a href="#" class="nav-link active" onclick="toggleTransportDropdown(event)">
              <div class="flex items-center justify-between">
                <div class="flex items-center">
                  <i class="fas fa-bus text-white text-lg"></i>
                  <span class="ml-2">Transportation</span>
                </div>
                <i class="fas fa-chevron-down text-sm transition-transform" id="transportDropdownIcon"></i>
              </div>
            </a>
            <div id="transportDropdown" class="hidden pl-8 mt-2 space-y-2">
              <a href="transportation-types.html" class="nav-link">
                <i class="fas fa-list text-white text-lg"></i>
                <span class="ml-2">Types</span>
              </a>
              <a href="terminal-locations.html" class="nav-link">
                <i class="fas fa-map-marker-alt text-white text-lg"></i>
                <span class="ml-2">Terminals</span>
              </a>
              <a href="terminal-routes.html" class="nav-link">
                <i class="fas fa-route text-white text-lg"></i>
                <span class="ml-2">Routes</span>
              </a>
            </div>
            <a href="../file html/fare.html" class="nav-link">
              <i class="fas fa-money-bill-wave text-white text-lg"></i> Fare
            </a>
            <a href="#" class="nav-link">
              <i class="fas fa-user-friends text-white text-lg"></i> Users
            </a>
            <a href="#" class="nav-link">
              <i class="fas fa-chart-bar text-white text-lg"></i> Reports
            </a>
            <a href="#" class="nav-link">
              <i class="fas fa-cog text-white text-lg"></i> Settings
            </a>
            <a href="../../tripko-backend/logout.php" class="nav-link">
              <i class="fas fa-sign-out-alt text-white text-lg"></i> Sign Out
          </a>
          </nav>
        </div>
        <div class="flex items-center gap-3 font-semibold">
          <div class="rounded-full border border-white p-2">
            <i class="fas fa-user-circle text-3xl"></i>
          </div>
          <div>
            <?php echo $_SESSION['username']; ?><br />
            <span class="text-sm">Administrator</span>
        </div>
        </div>
      </aside>
    <!-- Main content -->
    <main class="flex-1 bg-[#F3F1E7] p-6">
      <header class="flex items-center justify-between mb-6">
        <div class="flex items-center gap-3 text-gray-900 font-normal text-base">
          <button aria-label="Menu" class="focus:outline-none">
            <i class="fas fa-bars text-lg"></i>
          </button>
          <span>Home</span>
        </div>
        <div class="flex items-center gap-4">
          <div>
            <input type="search" placeholder="Search" class="w-48 md:w-64 rounded-full border border-gray-400 bg-[#F3F1E7] py-1.5 px-4 text-gray-600 placeholder-gray-400 focus:outline-none focus:ring-2 focus:ring-[#255D8A]" />
          </div>
          <button aria-label="Notifications" class="text-black text-xl focus:outline-none">
            <i class="fas fa-bell"></i>
          </button>
        </div>
      </header>

      <h2 class="font-semibold text-xl mb-6">Dashboard</h2>

      <section class="grid grid-cols-1 sm:grid-cols-3 gap-6 max-w-4xl">
        <div class="bg-[#F3F1E7] p-4 rounded-md">
          <p class="text-sm text-[#255D8A] mb-1">Total Visitors</p>
          <p class="font-semibold text-2xl">1,500</p>
        </div>
        <div class="bg-[#F3F1E7] p-4 rounded-md">
          <p class="text-sm text-[#255D8A] mb-1">Most Visited</p>
          <p class="font-semibold text-lg">Bolinao</p>
        </div>
        <div class="bg-[#F3F1E7] p-4 rounded-md">
          <p class="text-sm text-[#255D8A] mb-1">Top Itinerary</p>
          <p class="font-semibold text-lg">Bolinao</p>
        </div>
      </section>
    </main>
  </div>

  <script>
     function toggleTransportDropdown(event) {
      event.preventDefault();
      const dropdown = document.getElementById('transportDropdown');
      const icon = document.getElementById('transportDropdownIcon');
      
      dropdown.classList.toggle('hidden');
      icon.style.transform = dropdown.classList.contains('hidden') ? 'rotate(0deg)' : 'rotate(180deg)';
    }
  </script> 
</body>
</html>