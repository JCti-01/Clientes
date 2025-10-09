import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["input", "card"]

  filter() {
    const query = this.inputTarget.value.toLowerCase()

    this.cardTargets.forEach(card => {
      const searchable = card.dataset.search
      if (searchable.includes(query)) {
        card.classList.remove("hidden")
      } else {
        card.classList.add("hidden")
      }
    })
  }
}
