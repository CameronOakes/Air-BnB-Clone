import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"



document.addEventListener("DOMContentLoaded", function() {
  const searchInput = document.getElementById("location-input");

  searchInput.addEventListener("keydown", function(event) {
    if (event.keyCode === 13) {
      event.preventDefault();

      const flatGridSection = document.querySelector(".flat-grid-section");
      flatGridSection.scrollIntoView({ behavior: "smooth" });
    }
  });
});


document.addEventListener('DOMContentLoaded', function() {
  const dateInputs = document.querySelectorAll('.datepicker');

  dateInputs.forEach(input => {
    input.addEventListener('focus', () => {
      input.setAttribute('data-placeholder', input.getAttribute('placeholder'));
      input.removeAttribute('placeholder');
    });

    input.addEventListener('blur', () => {
      if (!input.value) {
        input.setAttribute('placeholder', input.getAttribute('data-placeholder'));
      }
    });
  });
});

console.log("Hello world")
