// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
// = require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require materialize
//= require toastr
//= require gmaps/google
//= require_tree .

navigator.geolocation.getCurrentPosition(displayOnMap);
function displayOnMap(position) {
  var currentMarker = ({
    lat: position.coords.latitude,
    lng: position.coords.longitude
  });
  handler.map.centerOn(currentMarker);
}

$(document).ready(function() {

  toastr.options = {
      "closeButton": false,
      "debug": false,
      "positionClass": "toast-top-left",
      "onclick": null,
      "showDuration": "300",
      "hideDuration": "1000",
      "timeOut": "5000",
      "extendedTimeOut": "1000",
      "showEasing": "swing",
      "hideEasing": "linear",
      "showMethod": "fadeIn",
      "hideMethod": "fadeOut"
    };




});
