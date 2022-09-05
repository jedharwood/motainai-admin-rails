import { Controller } from "@hotwired/stimulus";
import { toggle } from "el-transition";

export default class extends Controller {
  static targets = ["openUserMenu", "userAuthLink", "openNavBarMenu"];

  connect() {
    this.openUserMenuTarget.addEventListener("click", this.toggleDropDownMenu);
    this.openNavBarMenuTarget.addEventListener("click", this.toggleNavBarMenu);

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

  toggleNavBarMenu() {
    toggle(document.getElementById("nav-bar-menu"));
  }
}