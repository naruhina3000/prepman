// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start();
require("turbolinks").start();
require("@rails/activestorage").start();
require("channels");

// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initSelect2 } from "../components/init_select2";
import { initFlatPickr } from "../plugins/initFlatPicker";
import { initIngredientAutocomplete } from "../plugins/initIngredientAutocomplete";
import { initSearchForm } from "../components/init_search_form.js";
import { initRecipePortion } from "../components/init_recipe_portion.js";
import { initErrorModal } from "../components/init_error_modal.js";
import { initSweetalert } from "../components/init_sweetalert.js";
import { initMultipleSweetAlert } from "../plugins/initMultipleSweetAlert.js";
// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener("turbolinks:load", () => {
  initFlatPickr();
  // Call your functions here, e.g:
  // initSelect2();
  initSearchForm();
  initRecipePortion();
  initErrorModal();
  initSweetalert('#delete-ingredients', {
    title: "Are you sure?",
    text: "Once you remove these ingredients, you can't have them back.",
    icon: "warning"
  }, (value) => {
    if (value) {
      const link = document.querySelector('#delete-link');
      link.click();
    }
  });
  initSelect2();
  initIngredientAutocomplete();
  initMultipleSweetAlert()
});
