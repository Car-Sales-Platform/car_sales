import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = [ "form", "make", "model", "year"]


  formSubmit(event) {
    const form = event.target;
    let isValid = this.validateForm(form);

    event.preventDefault();

    if (isValid) {
      
      this.submitForm(event);
    }
  }

  async submitForm() {
    let make = this.makeTarget.value;
    let model = this.modelTarget.value;
    let year = this.yearTarget.value;

    let url = `/search?make=${make}&model=${model}&year=${year}`;

    const response = await get(url, {
      responseKind: 'turbo-stream'
    })

    if(response.ok) {
      this.formTarget.reset();
      this.modelTarget.disabled = true;
      this.yearTarget.disabled = true;
      // update url 
      window.history.pushState({}, null, url);
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
