import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autofocus"
export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.element.focus()
      const length = this.element.value.length;
      this.element.setSelectionRange(length, length);
    }, 0);

    console.log("autofocus", this.element)
  }
}
