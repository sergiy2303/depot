$('#products').html("<%= j(render 'products', products: products) %>");
$('#productModal').html("<%= j(render 'modal') %>");
$('.modal').modal();
