import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['container'];

  connect() {
    this.toggleClass = 'hidden';
    this.element.addEventListener('turbo:submit-end', (event) => {
      if (event.detail.success && event.detail.fetchResponse.redirected) {
        console.log(event.detail, "turbo:submit-end success and redirect - make sure closed")
        this.close(event);
      }
    })

  }

  disconnect() {
    this.close();
  }

  open() {
    console.log("open.modal")
    document.body.classList.add('fixed', 'inset-x-0', 'overflow-hidden');
    this.containerTarget.classList.remove(this.toggleClass);
  }

  close(event) {
    if (typeof event !== 'undefined') {
      event.preventDefault()
    }
    this.containerTarget.classList.add(this.toggleClass);
  }

  beforeCache() {
    "this.close();"
  }
}
