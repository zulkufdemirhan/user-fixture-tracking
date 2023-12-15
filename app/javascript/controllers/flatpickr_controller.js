import { Controller } from "@hotwired/stimulus";
import flatpickr from "flatpickr";

export default class extends Controller {
  connect() {
    flatpickr(".published_date", {
      dateFormat: "F j, Y h:i K"
    });
  }
}