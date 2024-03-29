import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
import Toastify from "toastify-js"

export default class extends Controller {
  static values = { userId: Number }
  static targets = ["toast"]

  connect() {


    this.channel = createConsumer().subscriptions.create(
      { channel: "NotificationChannel", id: this.userIdValue },
      { received: (data) => {


        Toastify({
          text: "There is an update to your job application",
          duration: 3000,
          destination: "matches/my",
          newWindow: true,
          close: true,
          gravity: "top", // `top` or `bottom`
          position: "left", // `left`, `center` or `right`
          stopOnFocus: true, // Prevents dismissing of toast on hover
          style: {
            background: "linear-gradient(to right, #B7C9B7, #736372)",
          },
          onClick: function(){} // Callback after click
        }).showToast();


      }}
    )
    console.log(`Subscribe to notification with the user id ${this.userIdValue}.`)
  }
}
