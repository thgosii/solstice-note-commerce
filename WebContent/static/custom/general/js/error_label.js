function displayFormErrors(errorListString) {
  $(document).ready(() => {
  
    if (errorListString || errorListString.trim())
      return
    
    const errors = errorListString.split('\n')

    console.log('Error list:', errors)

    errors.forEach(error => {
      const errorField = error.split(':')[0].trim()
      const errorMessage = error.split(':')[1].trim()

      // Add error label and mark input as invalid
      $(`[name=${errorField}]`).addClass('is-invalid')
      $(`[name=${errorField}]`).after(`<span class="text-danger">${errorMessage}</span>`)
    });

  })
}