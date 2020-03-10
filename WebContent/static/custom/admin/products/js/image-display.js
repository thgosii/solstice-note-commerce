$(document).ready(() => {

  // https://stackoverflow.com/a/57272491/11138267
  const toBase64 = file => new Promise((resolve, reject) => {
    const reader = new FileReader()
    reader.readAsDataURL(file)
    reader.onload = () => resolve(reader.result)
    reader.onerror = error => reject(error)
  })

  $('#image').on('change', async () => {
    let imgElement = $('<img>')
    let imageBase64 = await toBase64($('#image').prop('files')[0])
    imgElement.prop('src', imageBase64)
    $('.product-img-display').html(imgElement)
    $('#imageBase64').val(imageBase64)
  })

})
