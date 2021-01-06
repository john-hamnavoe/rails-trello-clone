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
    this.initialise()
  }

  initialise() {
    this.sortable = Sortable.create(this.element, {
      group: "tasks",
      onEnd: this.end.bind(this)
    })
  }

  end(event) {
    const id = event.item.dataset.id
    const to_id = event.to.dataset.id
    let data = new FormData()
    data.append("position", event.newIndex + 1)
    data.append("to_list_id", to_id)

    
    Rails.ajax({
      url: this.data.get("url").replace(":task_id", id),
      type: 'PATCH',
      data: data
    })
  }
}
