$(document).ready(function(){
  $(".order-filter a").click(function(){
   $("#all-orders").find("." + this.id).addClass("show")
   $("#all-orders").find("." + this.id).removeClass("hidden")
   $("#all-orders .orders-table").not("." + this.id).removeClass("show")
   $("#all-orders .orders-table").not("." + this.id).addClass("hidden")
 })

  $("#show-all").click(function(){
    $("#all-orders .orders-table").removeClass("hidden")
  })
});
