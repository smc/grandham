// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs

//= require twitter/bootstrap

//= require dataTables/jquery.dataTables
//= require dataTables/jquery.dataTables.bootstrap
//= require best_in_place
//= require turbolinks
//= require_tree .

//= require nprogress
//= require nprogress-turbolinks

// $(document).ready(function() {
// /* Activating Best In Place */
//   jQuery(".best_in_place").best_in_place();
// });


var ready;

ready = function() {
  jQuery(".best_in_place").best_in_place();

  $('.grandham-list-data-table').dataTable({
    "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    "sPaginationType": "bootstrap"
  });

  $('input[id=book_covers_attributes_0_image]').change(function(){
    $(this).closest('form').submit();
  });
};

$(document).ready(ready);
$(document).on('page:load', ready);

// var startSpinner;

// startSpinner = function () {
//   $('.ajax-loader').show();
// }

// var stopSpinner;

// stopSpinner = function () {
//   $('.ajax-loader').hide();
// }

// document.addEventListener("page:fetch", startSpinner);
// document.addEventListener("page:receive", stopSpinner);