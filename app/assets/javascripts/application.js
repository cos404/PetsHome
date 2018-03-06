// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require turbolinks
//= require popper
//= require bootstrap-sprockets
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl


function select_image (a) {
  document.main_img.src=a
}

$(document).on("turbolinks:load", function(){

  // Annotation
  $(document).click(function(event){
    if(!$(event.target).is('.annotation') && !$(event.target).is('.annotation-toggle') && !$('.list-spec_name').has(event.target).length){
      $('.product-tip-wrapper').hide();
    }
    else if($(event.target).parent().children('.product-tip-wrapper').css('display') == 'none'){
      $('.product-tip-wrapper').hide();
      $(event.target).parent().children('.product-tip-wrapper').show();
    }
    else if($(event.target).parent().children('.product-tip-wrapper').css('display') == 'block' && $(event.target).is('.annotation-toggle')){
      $('.product-tip-wrapper').hide();
    }
  });

  // Question icon
  $(".list-spec").hover(
    function() {
      $(this).children().children('.annotation-toggle').toggle();
    }
  );

  // Remove|Add nested fields
  $(function() {
    $('form').on('click', '.remove_fields', function(event) {
      $(this).prev('input[type=hidden]').val('1');
      $(this).closest('fieldset').hide();
      return event.preventDefault();
    });

    return $('form').on('click', '.add_fields', function(event) {
      var regexp, time;
      time = new Date().getTime();
      regexp = new RegExp($(this).data('id'), 'g');
      $(this).before($(this).data('fields').replace(regexp, time));
      return event.preventDefault();
    });
  });

})