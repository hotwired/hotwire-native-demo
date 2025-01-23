import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "form", "iframe" ]

  connect() {
    this.formTarget.submit()
  }
}
