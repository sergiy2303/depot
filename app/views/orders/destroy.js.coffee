$('header').html("<%= j(render 'layouts/header') %>")
$('.products-in-cart').html("<%= j(render 'products') %>")
$('#total_price').text('Order total: ' + totalPrice(0))
