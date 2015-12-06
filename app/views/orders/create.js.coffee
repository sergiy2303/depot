$('.modal').modal('toggle')
$('body').prepend("<%= j(render 'shared/flashes') %>")
$('.row.navbar').html("<%= j(render 'shared/navbar' )%>")
