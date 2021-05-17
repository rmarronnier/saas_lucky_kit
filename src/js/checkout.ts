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
