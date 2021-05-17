declare var stripe: any;
// declare var priceId: any;
// declare var customerId: any;
// declare var changeLoadingStatePrices: any;

// let stripe = Stripe(process.env.MIX_STRIPE_PUBLIC_KEY);

var checkoutButtons = Array.from(document.getElementsByClassName("checkout-button"));

checkoutButtons.forEach(button => button.addEventListener("click", function (evt) {
  // You'll have to define PRICE_ID as a price ID before this code block
  createCheckoutSession(button.id).then(function (data) {
    // Call Stripe.js method to redirect to the new Checkout page
    stripe
      .redirectToCheckout({
        sessionId: data.sessionId
      })
      .then(function (result) {
        // If `redirectToCheckout` fails due to a browser or network
        // error, you should display the localized error message to your
        // customer using `error.message`.
        if (result.error) {
          alert(result.error.message);
        }
      });
  });
}));


var createCheckoutSession = function (priceId) {
  return fetch("/create-checkout-session", {
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      priceId: priceId
    })
  }).then(function (result) {
    return result.json();
  });
};

var customerPortalButtons = Array.from(document.getElementsByClassName("customer-portal-button"));

customerPortalButtons.forEach(button => button.addEventListener('click', function (e) {
  e.preventDefault();
  fetch('/customer-portal', {
    method: 'POST'
  })
    .then(function (response) {
      return response.json()
    })
    .then(function (data) {
      window.location.href = data.url;
    })
    .catch(function (error) {
      console.error('Error:', error);
    });
}));
