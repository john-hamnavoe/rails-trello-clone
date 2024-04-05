import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autofocus"
export default class extends Controller {
  connect() {
    this.element.focus()
    console.log(this.element)
  }
}
