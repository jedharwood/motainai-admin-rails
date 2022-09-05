import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["emailInput", "submitButton"];

  connect() {
    this.submitButtonTarget.addEventListener("click", (e) => {
      e.preventDefault();

      if (this.emailInputTarget.value.length === 0) {
        console.log('// do nothing')
        // do nothing
      } else {
        console.log('// do thing')
        // do thing
      }
    });
  }
}