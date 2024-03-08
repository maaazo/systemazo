document.addEventListener("DOMContentLoaded", function() {
  // Get the date input field
  var dateOfBirthField = document.getElementById("date-of-birth-field");

  // Get the minimum date (18 years ago)
  var minDate = new Date();
  minDate.setFullYear(minDate.getFullYear() - 18);

  // Convert the minimum date to a string in "yyyy-mm-dd" format
  var minDateString = minDate.toISOString().split('T')[0];

  // Set the minimum attribute of the date input field
  dateOfBirthField.setAttribute("min", minDateString);
});
