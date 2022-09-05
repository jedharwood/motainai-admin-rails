import { Controller } from "@hotwired/stimulus";
import axios from "axios";

export default class extends Controller {
  static targets = ["emailInput", "submitButton", "emailInputWrapper", "invalidSvg", "validationMessage"];

  connect() {
    this.submitButtonTarget.addEventListener("click", (e) => {
      e.preventDefault();

      if (this.emailInputTarget.value.length === 0) {
        this.emailInputWrapperTarget.classList.add("invalid-inset-input-text-field", "focus-within:ring-rose-500", "focus-within:border-rose-500");
        this.emailInputWrapperTarget.classList.remove("focus-within:ring-slate-800", "focus-within:border-slate-800");
        this.invalidSvgTarget.classList.remove("hidden");
        this.validationMessageTarget.classList.remove("hidden");
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