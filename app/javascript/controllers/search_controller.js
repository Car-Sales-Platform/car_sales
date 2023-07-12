import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form" ]

  formSubmit(event) {
    const form = event.target;
    let isValid = this.validateForm(form);

    if (!isValid) {
      event.preventDefault();
    }
  }

  validateForm(form) {
    let isValid = true;
    let emptyFields = [];

    let requiredFields = form.querySelectorAll('select');

    requiredFields.forEach((field) => {
      if (!field.disabled && !field.value.trim()) {
        emptyFields.push(field);
        isValid = false;
      }
    });

    emptyFields.forEach((field) => {
      field.focus();
    });

    return isValid;
  }
}
