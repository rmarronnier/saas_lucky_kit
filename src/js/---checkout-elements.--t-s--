declare var Stripe: any;
declare var priceId: any;
declare var customerId: any;
declare var changeLoadingStatePrices: any;

let stripe = Stripe(process.env.MIX_STRIPE_PUBLIC_KEY);
let elements = stripe.elements();

fetch('/create-subscription', {
  method: 'POST',
  headers: {
    'Content-Type': 'application/json',
  },
  body: JSON.stringify({
    price_id: "price_1IqjDxJN5FrkuvKhKExUK1B2",
    customer_id: "cus_JTgLnEE8ky1Sr2",
  }),
}).then(function (response) {
  response.json().then(function (json) {


    const btn = document.querySelector('#submit-payment-btn');
    btn.addEventListener('click', async (e) => {
      e.preventDefault();
      const nameInput = document.getElementById('name');

      // Create payment method and confirm payment intent.
      stripe.confirmCardPayment(clientSecret, {
        payment_method: {
          card: cardElement,
          billing_details: {
            name: nameInput.value,
          },
        }
      }).then((result) => {
        if (result.error) {
          alert(result.error.message);
        } else {
          // Successful subscription payment
        }
      });
    });


    let card = elements.create('card');
    card.mount('#card-element');

    card.on('change', function (event) {
      displayError(event);
    });
    function displayError(event) {
      changeLoadingStatePrices(false);
      let displayError = document.getElementById('card-element-errors');
      if (event.error) {
        displayError.textContent = event.error.message;
      } else {
        displayError.textContent = '';
      }
    }
  });
})

