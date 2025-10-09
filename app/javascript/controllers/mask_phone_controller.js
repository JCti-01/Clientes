import { Controller } from "@hotwired/stimulus"

// Controller para aplicar máscara de telefone no input
export default class extends Controller {
  static targets = ["input"]

  connect() {
    this.inputTarget.addEventListener("input", this.applyMask.bind(this))
  }

  applyMask(event) {
    let value = event.target.value.replace(/\D/g, "")

    if (value.length > 11) value = value.slice(0, 11)

    if (value.length <= 10) {
      // formato fixo: (99) 9999-9999
      value = value.replace(/^(\d{2})(\d{4})(\d{0,4}).*/, "($1) $2-$3")
    } else {
      // formato celular: (99) 99999-9999
      value = value.replace(/^(\d{2})(\d{5})(\d{0,4}).*/, "($1) $2-$3")
    }

    event.target.value = value
  }
}
