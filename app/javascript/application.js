import "@hotwired/turbo-rails"
import "./channels"
import "./controllers"

import "./jquery"

$(document).on("turbo:load", function() {
  // console.log("Hello World!");
});

