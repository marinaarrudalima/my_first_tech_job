import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ['button', 'side']
  static values = { id: Number }

  connect() {
    console.log(this.buttonTarget);
    console.log(this.sideTarget)

  }

  open(event) {
    console.log('button clicked')
    const matchId = event.currentTarget.dataset.toggleIdValue;
    this.sideTargets.forEach((side) => {
      if (side.dataset.toggleIdValue === matchId) {
        side.classList.toggle('d-none');
      }
    });
  }
}
