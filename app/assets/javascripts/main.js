$(document).ready(function() {

    $(".order-filter a").click(function() {
        $.get('/admin/dashboard', { filter: this.id }, null, "script");
        return false;
    })
})