import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["aside"];

  handleKeydown = (event) => {
    if (event.code === "Escape") {
      this.close();
    }
  }

  open() {
    this.asideTarget.classList.remove("hidden");
  }

  close() {
    this.asideTarget.classList.add("hidden");
  }
}