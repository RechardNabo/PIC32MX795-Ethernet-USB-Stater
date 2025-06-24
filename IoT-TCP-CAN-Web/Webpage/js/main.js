/**
 * Main JavaScript for PIC32MX Web Application
 */

document.addEventListener('DOMContentLoaded', function() {
  // Initialize the application
  initApp();
});

/**
 * Initialize the application
 */
function initApp() {
  // Add event listeners
  addEventListeners();
  
  // Show current time
  updateClock();
  
  // Update clock every second
  setInterval(updateClock, 1000);
}

/**
 * Add event listeners to interactive elements
 */
function addEventListeners() {
  // Mobile menu toggle
  const menuToggle = document.getElementById('menu-toggle');
  if (menuToggle) {
    menuToggle.addEventListener('click', function() {
      const navbarNav = document.getElementById('navbar-nav');
      if (navbarNav) {
        navbarNav.classList.toggle('show');
      }
    });
  }
}

/**
 * Update the clock with current time
 */
function updateClock() {
  const clockElement = document.getElementById('current-time');
  if (clockElement) {
    const now = new Date();
    const timeString = now.toLocaleTimeString();
    clockElement.textContent = timeString;
  }
}

/**
 * Show a notification message
 * @param {string} message - The message to display
 * @param {string} type - The type of message (success, error, warning, info)
 */
function showNotification(message, type = 'info') {
  const notificationArea = document.getElementById('notification-area');
  if (!notificationArea) return;
  
  const notification = document.createElement('div');
  notification.className = `notification ${type}`;
  notification.textContent = message;
  
  notificationArea.appendChild(notification);
  
  // Auto remove after 5 seconds
  setTimeout(() => {
    notification.classList.add('fade-out');
    setTimeout(() => {
      notificationArea.removeChild(notification);
    }, 500);
  }, 5000);
}

/**
 * Fetch data from the server
 * @param {string} endpoint - The API endpoint to fetch from
 * @param {Function} callback - The callback function to handle the response
 */
function fetchData(endpoint, callback) {
  fetch(endpoint)
    .then(response => {
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      return response.text();
    })
    .then(data => {
      callback(null, data);
    })
    .catch(error => {
      console.error('Fetch error:', error);
      callback(error, null);
    });
}
