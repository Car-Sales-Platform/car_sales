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
    let make = event.target.value;
    const response = await get(`/cars/models?make=${make}`, {
      responseKind: 'turbo-stream'
    })

    if(response.ok) {
      this.modelTarget.disabled = false;  
    }
  }

  async loadYears(event) {
    let make = this.makeTarget.value;
    let model = event.target.value;
    const response = await get(`/cars/years?make=${make}&model=${model}`, {
      responseKind: 'turbo-stream'
    })

    if(response.ok) {
      this.yearTarget.disabled = false;  
    }
  }

}
