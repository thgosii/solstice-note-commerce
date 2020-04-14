$(document).ready(() => {

  $.ajax('/note-commerce/customer/balance?operation=consult')
    .then(data => {
      const currentBalanceText = Number(data.balance)
        .toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })
      $('#navbar-customer-balance').text(currentBalanceText)
    })

})