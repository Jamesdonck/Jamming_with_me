// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// Import CSS
import 'mapbox-gl/dist/mapbox-gl.css';
import { showForm, closeForm } from "../components/form"
import flatpickr from "flatpickr";
import 'flatpickr/dist/flatpickr.min.css';
// import 'bootstrap'
// External imports

// Internal imports
import { initMapbox } from '../plugins/init_mapbox';
import { initAutocomplete } from '../plugins/init_autocomplete';

document.addEventListener('turbolinks:load', () => {
  initMapbox();
  initAutocomplete();
  showForm();
  closeForm();
  if (document.querySelector(".datepicker")) {
    flatpickr(".datepicker",{
      altInput: true,
      enableTime: true
    });
  }
});
