import "@hotwired/turbo-rails"
import "./channels"
import "./controllers"

import "./jquery"

$(document).on("turbo:load", function() {
  $("#search input").on("focus blur", function() {
    $(this)
      .parent()
      .parent()
      .toggleClass("focus");
  });
});

