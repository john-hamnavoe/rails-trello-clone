import { Controller } from "@hotwired/stimulus"
import Sortable from 'sortablejs';
import { put } from '@rails/request.js'

// Connects to data-controller="sortable"
export default class extends Controller {
  static values = {
    group: String
  }

  connect() {
    console.log()
    this.sortable = Sortable.create(this.element, {
      filter: '.filtered', // 'filtered' class is not draggable
      onEnd: this.onEnd.bind(this),
      group: this.groupValue,
    })
  }

  onEnd(event) {
    console.log("onEnd - url", event.item.dataset.sortableUpdateUrl)
    console.log("onEnd - parent_id", event.to.dataset.id)

    var sortableUpdateUrl = event.item.dataset.sortableUpdateUrl
    var parentId = event.to.dataset.id

    put(sortableUpdateUrl, {
      body: JSON.stringify({ row_position: event.newIndex + 1, parent_id: parentId })
    })
  }
}