// $(document).ready(function() {
//     $(".order-filter a").click(function() {
//         $("#all-orders").find("." + this.id).addClass("show")
//         $("#all-orders").find("." + this.id).removeClass("hidden")
//         $("#all-orders .orders-table").not("." + this.id).removeClass("show")
//         $("#all-orders .orders-table").not("." + this.id).addClass("hidden")
//     })

//     $("#show-all").click(function() {
//         $("#all-orders .orders-table").removeClass("hidden")
//     })
// });



$(document).ready(function() {

    $(".order-filter a").click(function() {
        $.get('/admin/dashboard?retrieve', this.id, null, "script");
        return false;
    })
});

// $(document).ready(function() {
//     $("#search_form input").keyup(function() {
//         $.get($("#search_form").attr("action"), $("#search_form").serialize(), null, "script");
//         return false;
//     });
// });