import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="stars"
export default class extends Controller {
  static targets = ["star"];

  connect() {
    const interval = 1000;
    let index = 0;


    const animate = (star) => {
      star.style.setProperty("--star-left", `${this.rand(0, 100)}%`);
      star.style.setProperty("--star-top", `${this.rand(-10, 90)}%`);

      star.style.animation = "none";
      star.offsetHeight;
      star.style.animation = "";
    }

    this.starTargets.forEach((star) => {
      setTimeout(() => {
        animate(star);

        setInterval(() => animate(star), 3000);
      }, index++ * (interval / 3))
    });
  }

  rand(min, max) {
    return Math.floor(Math.random() * (max - min + 1)) + min;
  }
}
