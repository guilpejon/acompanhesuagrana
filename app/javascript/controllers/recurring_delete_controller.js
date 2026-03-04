import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    this.boundHandleKeydown = this.handleKeydown.bind(this)
  }

  show(event) {
    event.preventDefault()
    this.modalTarget.style.display = "flex"
    document.addEventListener("keydown", this.boundHandleKeydown)
    document.body.style.overflow = "hidden"
  }

  hide() {
    this.modalTarget.style.display = "none"
    document.removeEventListener("keydown", this.boundHandleKeydown)
    document.body.style.overflow = ""
  }

  backdropClick(event) {
    if (event.target === this.modalTarget) this.hide()
  }

  handleKeydown(event) {
    if (event.key === "Escape") this.hide()
  }
}
