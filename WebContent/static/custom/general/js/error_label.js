function displayFormErrors(errorListString) {
  $(document).ready(() => {
  
    if (errorListString || errorListString.trim())
      return
    
    const errors = errorListString.split('\n')

    console.log('Error list:', errors)

    errors.forEach(error => {
      if (!error || !error.trim())
        return

      const errorField = error.split(':')[0].trim()
      const errorMessage = error.split(':')[1].trim()

      // Add error label and mark input as invalid
      $(`[name=${errorField}]`).addClass('is-invalid')
      if ($(`[name=${errorField}]`).next('span[class=text-danger]').length === 0) {
        $(`[name=${errorField}]`).after(`<span class="text-danger">${errorMessage}</span>`) // Span does not exist, creating
      } else {
        $(`[name=${errorField}]`).next('span[class=text-danger]').html(errorMessage)        // Span exists, replacing inner text
      }
    });

  })
}