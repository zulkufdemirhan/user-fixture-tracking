import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["menu", "button"];

  toggle() {
    this.menuTarget.classList.toggle("hidden");
  }

  hide(event) {
    const buttonClicked = this.buttonTarget.contains(event.target);
    
    if (!buttonClicked) {
      this.menuTarget.classList.add("hidden");
    }
  }
}