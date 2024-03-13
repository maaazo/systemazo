document.addEventListener("DOMContentLoaded", function() {
  // Get the date input field
  var dateOfBirthField = document.getElementById("user_date_of_birth");

  // Set the maximum date (1906)
  var minDate = new Date(1906, 0, 1); // January 1, 1906

  // Set the minimum date (2006 - 18 years)
  var maxDate = new Date();
  maxDate.setFullYear(maxDate.getFullYear() - 18);

  // Convert the maximum and minimum dates to strings in "yyyy-mm-dd" format
  var minDateString = minDate.toISOString().split('T')[0];
  var maxDateString = maxDate.toISOString().split('T')[0];

  // Set the maximum and minimum attributes of the date input field
  dateOfBirthField.setAttribute("min", minDateString);
  dateOfBirthField.setAttribute("max", maxDateString);
});
