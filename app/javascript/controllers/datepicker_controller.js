import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  connect() {
    this.picker = flatpickr(this.element, {
      dateFormat: "Y-m-d",
    })

    this._beforeCache = () => this.picker?.destroy()
    document.addEventListener("turbo:before-cache", this._beforeCache)
  }

  disconnect() {
    document.removeEventListener("turbo:before-cache", this._beforeCache)
    this.picker?.destroy()
  }
}
