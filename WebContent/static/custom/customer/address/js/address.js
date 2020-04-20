$(document).ready(() => {

  async function loadStates() {
    console.log("load states");
    $('#state').prop("disabled", true);
    $('#state').html("")
    await $.ajax("https://servicodados.ibge.gov.br/api/v1/localidades/estados")
      .then(data => {
        // Sort states
        data.sort((a, b) => a.nome > b.nome ? 1 : (a.nome < b.nome ? -1 : 0))

        // Enable state select
        $('#state').prop("disabled", false);

        // Fill state select options
        data.forEach(s => {
          const option = new Option(s.nome, s.sigla, false, false);
          $(option).attr('data-ibge-id', s.id) // Necessary for IBGE API city request
          if ("${address.state}" != null && "${address.state}" != "") {
            if ("${address.state}" == s.sigla) {
              $(option).prop('selected', true)
              $("#city").prop("disabled", false);
              loadCities(s.id);
            }
          }
          $("#state").append(option)
        });
      });
  }

  async function loadCities(ufId) {
    console.log("load cities:", ufId);
    $('#city').prop("disabled", true);
    $('#city').html("");
    await $.ajax("https://servicodados.ibge.gov.br/api/v1/localidades/estados/" + ufId + "/municipios")
      .then(data => {
        // Sort cities
        data.sort((a, b) => a.nome > b.nome ? 1 : (a.nome < b.nome ? -1 : 0))

        // Fill city select options
        data.forEach(c => {
          const option = new Option(c.nome, c.nome, false, false);
          $(option).attr('data-ibge-id', c.id) // Necessary for IBGE API city request
          if ("${address.city}" != null && "${address.city}" != "") {
            if ("${address.city}" == c.nome) {
              $(option).prop('selected', true)
            }
          }
          $("#city").append(option)
        })

        // Enable state select
        $('#city').prop("disabled", false);
      });
  }

  async function searchCEP(cep) {
    console.log("search cep: " + cep);
    return await $.ajax('https://viacep.com.br/ws/' + cep + '/json/unicode/');
  }

  // **************************************************************************************

  // Load cities on state selection
  $("#state").change(e => {
    const selectedState = $("#state").select2("data")[0];
    const ufId = $(selectedState.element).attr('data-ibge-id');
    console.log('selected state:', selectedState.text);

    loadCities(ufId);
  });

  // Search CEP and fill fields when CEP is typed and valid
  $("#cep").on('input', e => {
    const cep = $("#cep").val().replace("-", "");
    if (!cep || !cep.match(/\d{8}/)) return;

    searchCEP(cep)
      .then(async data => {
        if (data.erro) {
          console.log('CEP not found');
          return;
        }

        $("#publicPlace").val(data.logradouro);
        $("#neighbourhood").val(data.bairro);
        $("#state").val(data.uf);
        $("#state").trigger("change");

        const selectedState = $("#state").select2("data")[0];
        const ufId = $(selectedState.element).attr('data-ibge-id');
        console.log('selected state2:', selectedState.text);
        await loadCities(ufId);

        //const cepUfId = $("#state option[value=" + data.uf + "]").data("ibge-id");
        //await loadCities(cepUfId);

        //$("#city").val(data.localidade);
        //$("#city option:selected").removeAttr("selected");
        $("#city option[data-ibge-id=" + data.ibge + "]").prop("selected", true);
        $("#city").trigger("change");
      });

  });

  // **************************************************************************************

  $("#cep").inputmask("99999-999");

  $(".select2bs4").select2({ // #city and #state
    theme: 'bootstrap4',
    language: "pt-BR",
    disabled: true
  })

  // Selenium IDE inputmask type fix
  $("#cep").click(e => {
    $("#cep").val("");
  });

  loadStates();

})