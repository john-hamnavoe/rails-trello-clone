// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import Sortable from "sortablejs"
import Rails from '@rails/ujs';

export default class extends Controller {

  connect() {
    this.sortable = Sortable.create(this.element, {
      group: "lists",
      onEnd: this.end.bind(this)
    })
  }

  end(event) {
    console.log("thisv", event)
    console.log("newIndexv", event.newIndex)
    console.log("itemv", event.item)
    console.log("item_idv", event.item.dataset.id)
    console.log("fromv", event.from)
    console.log("tov", event.to.dataset.id)  
  }
}
