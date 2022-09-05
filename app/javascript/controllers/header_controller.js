import { Controller } from "@hotwired/stimulus";
import { toggle } from "el-transition";

export default class extends Controller {
  static targets = ["openUserMenu", "userAuthLink"];

  connect() {
    this.openUserMenuTarget.addEventListener("click", this.toggleDropDownMenu);

    this.userAuthLinkTargets.forEach((link) => {
      link.addEventListener("click", (e) => {
        e.preventDefault();
        document.getElementById("modal-trigger").click(); // This doesn't feel good
      });
    });
  }

  toggleDropDownMenu() {
    toggle(document.getElementById("menu-dropdown-items"));
  }
}