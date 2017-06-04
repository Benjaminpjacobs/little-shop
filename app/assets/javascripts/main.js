$(document).ready(function(){
  $(".filter-link").click(function(e){
   $("." + e.currentTarget.id).toggle()
  }
});
