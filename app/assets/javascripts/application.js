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
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require bootstrap-sprockets
//= require jquery.jpostal
//= require_tree .


$(function() {
  $(document).on('turbolinks:load', () => {
    $('#user_postal_code').jpostal({
      postcode : [
        '#user_postal_code'
      ],
      address: {
        "#user_address" :"%3%4%5%6%7"
      }
    });
  });
});

$(function() {
  $(document).on('turbolinks:load', () => {
    $('#address_postal_code').jpostal({
      postcode : [
        '#address_postal_code'
      ],
      address: {
        "#address_address" :"%3%4%5%6%7"
      }
    });
  });
});

$(function() {
  $(document).on('turbolinks:load', () => {
    $('#order_ordered_postal_code').jpostal({
      postcode : [
        '#order_ordered_postal_code'
      ],
      address: {
        "#order_ordered_address" :"%3%4%5%6%7"
      }
    });
  });
});


 $(function() {
  $(document).on('turbolinks:load',() => {
    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
    $('#preview').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        }
    }
    $("#item_img").change(function(){
        readURL(this);
    });
  });
  });

  $(function() {
    $(document).on('turbolinks:load',() => {
    function readURL(input) {
        if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
    $('#prev').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        }
    }
    $("#item_image").change(function(){
        readURL(this);
    });
  });
  });


