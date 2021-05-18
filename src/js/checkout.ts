declare var Stripe: any;
let stripe = Stripe(process.env.MIX_STRIPE_PUBLIC_KEY);

window.onload = function () {
  var buttons = document.querySelectorAll('[data-subscribe]')

  buttons.forEach(button => button.addEventListener('click', (event) => {
    fetch(`/create-checkout-session/${button.id}`)
      .then(response => response.json())
      .then((json) => {
        stripe.redirectToCheckout({
          sessionId: json.sessionId
        })
          .then(function (result) {
          });
      });
    event.returnValue = false;
  }))

}

// https://stackoverflow.com/questions/57884800/new-stripe-sca-checkout-flow-in-rails
// ---
//   (The Stimulus controller)
// app / javascript / controllers / subscription_controller.js
// import { Controller } from "stimulus"

// export default class extends Controller {
//   static targets = ['sessionID']

//   get sessionID() {
//     return this.sessionIDTarget.parentElement.dataset.session
//   }

//   initialize() {
//     const script = document.createElement('script')
//     script.src = "https://js.stripe.com/v3/"

//     document.head.appendChild(script)
//   }

//   redirectToCheckout(e) {
//     e.preventDefault()

//     // grab your key securely in whichever way works for you
//     const stripe = Stripe('pk_test_xxx')

//     const CHECKOUT_SESSION_ID = this.sessionID

//     stripe.redirectToCheckout({
//       sessionId: CHECKOUT_SESSION_ID
//     }).then((result) => {
//       console.log(result.error.message)
//     })
//   }
// }
