$(document).ready(() => {

  // Modal event
  $('a[data-target="#sale-detail-modal"]').on('click', (e) => {
      const a = $(e.delegateTarget)

      // Gets the id from the table row
      const id = a.data('id')
      $('#delete-modal-btn').val(id)

      // Request sale data
      // Fill modal
  })

})