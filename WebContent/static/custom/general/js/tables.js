$(document).ready(() => {

  // Delete modal event
  $('a[data-target="#delete-modal"]').on('click', (e) => {
      const a = $(e.delegateTarget)

      // Gets the id from the table row
      const id = a.data('id')
      $('#delete-modal-btn').val(id)

      // Shows the text in the modal
      const text = a.parent().next('.title').text()
      $('#delete-modal-text').text(text)
  })

})