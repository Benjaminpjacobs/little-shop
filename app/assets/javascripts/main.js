$(document).ready(function(){
  $(".order-filter a").click(function(){
   $("#all-orders").find("." + this.id).toggle()
  }
});
