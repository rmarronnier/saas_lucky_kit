/* eslint no-console:0 */
console.log(process.env.MIX_GOOGLE_CLIENT_ID)
// Rails Unobtrusive JavaScript (UJS) is *required* for links in Lucky that use DELETE, POST and PUT.
// Though it says "Rails" it actually works with any framework.
require("@rails/ujs").start();

// Turbolinks is optional. Learn more: https://github.com/turbolinks/turbolinks/
require("turbolinks").start();

import "@fontsource/inter";

// If using Turbolinks, you can attach events to page load like this:
//
// document.addEventListener("turbolinks:load", function() {
//   ...
// })

import { Application } from "stimulus";
import { definitionsFromContext } from "stimulus/webpack-helpers";

const application = Application.start();
const context = require.context("./controllers", true, /\.ts$/);
application.load(definitionsFromContext(context));

declare var gapi: any;

function onLibraryLoaded() {
  gapi.load('auth2', function () {
    gapi.auth2.init({
      client_id: process.env.MIX_GOOGLE_CLIENT_ID,
      scope: 'profile'
    })
    console.log('gapi loaded')
  })
}

function onSignInClicked() {
  gapi.load('auth2', function () {
    gapi.auth2.signIn().then(function (googleUser) {
      console.log('user signed in')
    }, function (error) {
      console.log('user failed to sign in')
    })
  })
}

// function onSignIn(googleUser) {
//   // Useful data for your client-side scripts:
//   var profile = googleUser.getBasicProfile();
//   console.log("ID: " + profile.getId()); // Don't send this directly to your server!
//   console.log('Full Name: ' + profile.getName());
//   console.log('Given Name: ' + profile.getGivenName());
//   console.log('Family Name: ' + profile.getFamilyName());
//   console.log("Image URL: " + profile.getImageUrl());
//   console.log("Email: " + profile.getEmail());

//   // The ID token you need to pass to your backend:
//   var id_token = googleUser.getAuthResponse().id_token;
//   console.log("ID Token: " + id_token);
// }

// https://www.intricatecloud.io/2019/07/adding-google-sign-in-to-your-webapp-using-the-js-library/

// function isUserSignedIn() {
//   gapi.load('auth2', function () {
//     var isSignedIn = auth2.isSignedIn.get();
//     console.log('is signed in? ', isSignedIn)
//   })
// }

// isUserSignedIn()