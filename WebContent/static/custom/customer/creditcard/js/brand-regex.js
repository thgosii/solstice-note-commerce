$(document).ready(() => {

  $("#cc-brand").change(e => {
    console.log('Brand:', $("#cc-brand").val())
    switch ($("#cc-brand").val()) {
      // CC brand regex: https://www.regular-expressions.info/creditcard.html
      default:
      case "VISA":
        $("#cc-number").attr('data-inputmask-regex', "^4[0-9]{12}(?:[0-9]{3})?$")
        break;
      case "MASTER_CARD":
        $("#cc-number").attr('data-inputmask-regex', "^(?:5[1-5][0-9]{2}|222[1-9]|22[3-9][0-9]|2[3-6][0-9]{2}|27[01][0-9]|2720)[0-9]{12}$")
        break;
    }

    $("#cc-number").inputmask();
  });

  $("#cc-brand").trigger('change');

  // Selenium IDE inputmask type fix
  $("#cc-number").click(e => {
    $("#cc-number").val("");
  });
});
