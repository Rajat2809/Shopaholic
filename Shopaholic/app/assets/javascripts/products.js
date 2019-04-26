$(document).ready(function() {

    $('.addToCart').click(function(){
        debugger;
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
            debugger;
            $("#showSuccessCart").click();
          }
        });
      });
});