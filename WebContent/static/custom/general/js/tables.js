$(document).ready(() => {

  // Delete modal event
  $('a[data-target="#delete-modal"]').on('click', (e) => {
    const a = $(e.delegateTarget)

    // Gets the id from the table row
    const id = a.data('id')
    $('#id').val(id)

    // Shows the text in the modal
    const text = a.parent().next('.title').text()
    $('#delete-modal-text').text(text)
  })

  // Auto filter using URL table_filter param
  const tableFilter = new URL(window.location).searchParams.get('table_filter') || ''
  $('table[id$=table]').ready(() => { // id must be "<something>-table"
    if (tableFilter && tableFilter.trim()) {
      $('.dataTables_filter input[type=search]').val(tableFilter)
      $('.dataTables_filter input[type=search]').trigger('change')
      $('.dataTables_filter input[type=search]').trigger('input')
    }
  })
})