import { Controller } from "stimulus"
import consumer from "channels/consumer"

export default class extends Controller {
  static targets = [ "lists" ]

  connect() {
    this.subscription = consumer.subscriptions.create({ channel: "ListsChannel", id: this.data.get("id") }, {
      connected: this._connected.bind(this),
      disconnected: this._disconnected.bind(this),
      received: this._received.bind(this)
    })
  }

  disconnect() {
    consumer.subscriptions.remove(this.subscription)
  }

  _connected() {
  }

  _disconnected() {
  }

  _received(data) {
    this.listsTarget.innerHTML = data.lists
  }
}