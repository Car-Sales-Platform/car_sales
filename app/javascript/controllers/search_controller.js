import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = [ "form", "make", "model", "year"]

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
 
  async loadModels(event) {
    let model = event.target.value;
    const response = await get(`/cars/models?make=${model}`, {
      responseKind: 'turbo-stream'
    })

    if(response.ok) {
      this.modelTarget.disabled = false;  
    }
  }

}
