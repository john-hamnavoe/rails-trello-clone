import { Controller} from "stimulus"

export default class extends Controller {
  static targets = ["button"]

  connect () {
  }

  reset() {
    this.element.reset()
    this.buttonTarget.disabled = false
  }
}