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
//= require activestorage
//= require turbolinks
//= require jquery
//= require bootstrap.min
//= require_tree .

$(document).on('turbolinks:load',function() {

    let base_url = window.location.origin;
   
  $('#login').click(function(){
    $.ajax({
      url: "/users/sign_in",
      type: 'POST',
      data:  {
        "user": {
          "email": $('#signin-email').val(),
          "password": $('#signin-password').val()
        }
      },
      success: function(res) {
        window.location.href = base_url+'/products?page=1';
        }
    })
  });
  $('.carousel').carousel({
    interval: 3000,
    wrap: true,
});
  $('#signUp').click(function(){
    $.ajax({
      url: "/users",
      type: 'POST',
      data: {
        "user": {
          "email": $('#signup-email').val(),
          "password": $('#signup-password').val(),
          "password_confirmation": $('#signup-confirm-password').val()
        }
      },
      success: function(res) {
          window.location.href = base_url;
        }
    })
  });

  $('#logoutUser').click(function(){
    $.ajax({
      url: "/users/sign_out",
      type: 'DELETE',
      success: function(res) {
          window.location.href = base_url;
        }
    })
  });

    $('.close').click(function(event){
      $('.popup-overlay').hide();
      $('.popup-content').hide();
    });


  $('.addToCart').click(function(){
    let productID = $(this).data("productid");
    let price = $(this).data("price");

    $.ajax({
      url: "/carts",
      type: "POST",
      data: {
        "cart":{
          "product_id": productID,
          "total_price": price
        }
      },
      success: function(res) {
        $("#showSuccessCart").click();
      }
    });
  });

  $('#checkout').click(function(){
    let cartIds = $(this).data("cartids");
    console.log(cartIds);
    $.ajax({
      url: "/purchases",
      type: "POST",
      data: {
        "purchase":{
          "cart_ids": cartIds
        }
      }, success: function(res){
        console.log(res);
        $('#purchaseAmount').html( res.total_price);
        $('#checkoutPouUp').click();
      }
    })
  });

$('.navLinks').click(function(){

 alert($(this).text() +" page under construction");

});



 });
