import { Controller } from "@hotwired/stimulus";
import axios from "axios";

export default class extends Controller {
  static targets = ["emailInput", "submitButton"];

  connect() {
    this.submitButtonTarget.addEventListener("click", (e) => {
      e.preventDefault();

      if (this.emailInputTarget.value.length === 0) {
        // do nothing
      } else {
        axios
          .get("/api/user_by_email", {
            params: {
              email: this.emailInputTarget.value,
            },
            headers: {
              ACCEPT: "application/json",
            },
          })
          .then((res) => {
            Turbo.visit("/users/sign_in");
          })
          .catch((res) => {
            Turbo.visit("/users/sign_up");
          });
      }
    });
  }
}