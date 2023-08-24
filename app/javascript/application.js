import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"

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
