import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["zip", "address", "city", "state"]

  connect() {
    // Quando o input muda, aplica máscara e busca dados
    this.zipTarget.addEventListener("input", this.handleZipInput.bind(this))
    // Quando muda o estado, atualiza as cidades
    this.stateTarget.addEventListener("change", this.updateCities.bind(this))
  }

  // formata CEP enquanto digita 
  formatCEP(value) {
    let v = value.replace(/\D/g, "")
    v = v.substring(0, 8)
    if (v.length > 5) {
      v = v.replace(/^(\d{2})(\d{3})(\d{0,3})$/, "$1.$2-$3")
    } else if (v.length > 2) {
      v = v.replace(/^(\d{2})(\d{0,3})$/, "$1.$2")
    }
    return v
  }

  handleZipInput() {
    this.zipTarget.value = this.formatCEP(this.zipTarget.value)

    const cepNumbers = this.zipTarget.value.replace(/\D/g, "")
    if (cepNumbers.length === 8) {
      this.fetchAddressData(cepNumbers)
    }
  }

  // busca dados no ViaCEP ===
  async fetchAddressData(cep) {
    try {
      const response = await fetch(`https://viacep.com.br/ws/${cep}/json/`)
      const data = await response.json()

      if (!data.erro) {
        this.addressTarget.value = data.logradouro || ""
        this.stateTarget.value = data.uf || ""

        // Atualiza cidade
        this.cityTarget.innerHTML = `<option value="${data.localidade}" selected>${data.localidade}</option>`
      } else {
        alert("CEP não encontrado.")
      }
    } catch (e) {
      console.error("Erro ao buscar CEP:", e)
    }
  }

  // Atualiza cidades (IBGE)
  async updateCities() {
    const uf = this.stateTarget.value
    this.cityTarget.innerHTML = '<option value="">Selecione a cidade</option>'
    if (!uf) return

    try {
      const response = await fetch(`https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf}/municipios`)
      const cities = await response.json()

      cities.forEach(c => {
        const option = document.createElement("option")
        option.value = c.nome
        option.text = c.nome
        this.cityTarget.appendChild(option)
      })
    } catch (err) {
      console.error("Erro ao buscar cidades:", err)
    }
  }
}
