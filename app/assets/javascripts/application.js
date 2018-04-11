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
//= require i18n/translations

function cl(text) {
  console.log(text);
}

function select_image(a) {
  document.main_img.src=a
}

$(document).on("turbolinks:load", function(){
  I18n.locale = $('body').data('locale')
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

  // Remove|Add form nested fields
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

  // Remove photo
  $("#photos").on( "click", ".photo-delete", function() {
    var element = $(this),
        id      = element.data("id"),
        type    = element.data("type"),
        url     = window.location.href;

    if(!confirm(element.data("confirm"))) return false;

    $.ajax({
        type: 'DELETE',
        url: `/${type}/${id}`,
        dataType: 'json',
        headers: {
          'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        success: function(data) {
          element.parent().parent().remove();
        },
        error: function(data) {
          cl(data);
        }
    })
  });

  // Set avatar\cover
    $("#photos").on("click", ".set-photo", function(){
      var element = $(this),
          id      = element.data("id"),
          type    = element.data("type"),
          url     = window.location.href;

      if(!confirm(element.data("confirm"))) return false;

      $.ajax({
        type: 'PATCH',
        url: `/${type}/set_photo/${id}`,
        dataType: 'json',
        headers: {
          'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        },
        success: function() {
          $(".photo-default").remove();

          var exDefault = $("#main-image"),
          exControl = exDefault.children(":first"),
          exId = exControl.data("id");

          exDefault.removeAttr("id");
          exDefault.empty();
          exDefault.append(`
            <i title="${I18n.t('view.button.cover')}" data-id="${exId}" data-confirm="${I18n.t('view.button.cover_confirm')}" data-type="${type}" class="fa fa-check-circle set-photo"></i>
            <i title="${I18n.t('view.button.delete')}" data-id="${exId}" data-confirm="${I18n.t('view.button.delete_confirm')}" data-type="${type}_photos" class="fa fa-times-circle photo-delete"></i>`
          );

          element.parent().attr('id', 'main-image');
          element.parent().empty();
          $("#main-image").append(`
            <i title="${I18n.t('view.button.cover')}" data-id="${id}" data-type="${type}" class="fa fa-info-circle"></i>
          `);
        }
      })
    });

  // COMMENTS CREATE
    $(function() {
      return $(".comment-form").on("ajax:beforeSend", function(evt, xhr, settings) {
        return $(this).find('textarea').addClass('uneditable-input').attr('disabled', 'disabled');
      }).on("ajax:success", function(evt, data, status, xhr) {
        $(this).find('textarea').removeClass('uneditable-input').removeAttr('disabled', 'disabled').val('');
        return $(xhr.responseText).hide().insertAfter($(this)).show('slow');
      }).on("ajax:error", function(evt, data, status, xhr) {
        alert(I18n.t('view.comment.create.error'));
        return $(this).find('textarea').removeClass('uneditable-input').removeAttr('disabled', 'disabled').val('');
      });
    });
  // COMMENTS DESTROY
    $(document).on("ajax:beforeSend", ".comment", function() {
      if(!confirm(I18n.t('view.comment.delete.confirm'))) return false;
      return $(this).fadeTo('fast', 0.5);
    }).on("ajax:success", ".comment", function() {
      return $(this).hide('fast');
    }).on("ajax:error", ".comment", function() {
      alert(I18n.t('view.comment.delete.error'));
      return $(this).fadeTo('fast', 1);
    });

  // File uploader
    $(function() {
      return $('#uploader').fileupload({
        dataType: "script",
        add: function(e, data) {
          var file, types;
          types = /(\.|\/)(gif|jpe?g|png)$/i;
          file = data.files[0];
          if (types.test(file.type) || types.test(file.name)) {
            return data.submit();
          } else {
            return alert(file.name + " is not a gif, jpeg, or png image file");
          }
        }
      });
    });

})