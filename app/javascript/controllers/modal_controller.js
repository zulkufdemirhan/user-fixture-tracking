import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  handleKeydown = (event) => {
    if (event.code === "Escape") {
      this.close();
    }
  }

  close() {
    this.element.parentElement.removeAttribute("src");
    this.element.remove();
  }
}
