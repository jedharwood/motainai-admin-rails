import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["userAuthLink"];

  connect() {
    this.userAuthLinkTargets.forEach((link) => {
      link.addEventListener("click", (e) => {
        e.preventDefault();
        document.getElementById("modal-trigger").click();
      });
    });
  }
}