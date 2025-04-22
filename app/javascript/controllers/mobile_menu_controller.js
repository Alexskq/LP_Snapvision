import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["menu"]
  
  connect() {
    // Ferme le menu quand on clique en dehors
    document.addEventListener('click', this.handleOutsideClick.bind(this))
  }
  
  disconnect() {
    document.removeEventListener('click', this.handleOutsideClick.bind(this))
  }
  
  toggle() {
    this.menuTarget.classList.toggle('hidden')
  }
  
  close() {
    this.menuTarget.classList.add('hidden')
  }
  
  handleOutsideClick(event) {
    // Si le clic n'est pas dans le menu ou sur le bouton du menu
    if (!this.element.contains(event.target) || 
        (this.menuTarget.contains(event.target) && event.target.tagName === 'A')) {
      this.close()
    }
  }
} 