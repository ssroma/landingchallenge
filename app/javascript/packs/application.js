// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// Toastr notice and alert make prettier
global.toastr = require("toastr")

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


// Bulmar humberg menu
import Bulmar from "./bulmarHumberger";
// Customized js to deal with the checkbox selections
import CheckBox from "./customized";

Rails.start()
Turbolinks.start()
ActiveStorage.start()
Bulmar();
CheckBox();