document.addEventListener("DOMContentLoaded", function() {
  // Find all flash messages
  const flashMessages = document.querySelectorAll(".alert");

  // Loop through each flash message and fade it out after 3 seconds
  flashMessages.forEach(function(flashMessage) {
    setTimeout(function() {
      flashMessage.style.transition = "opacity 0.5s ease-in-out";
      flashMessage.style.opacity = 0;
    }, 3000);
  });
});
