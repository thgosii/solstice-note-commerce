$(document).ready(() => {

  let saleInProgress
  const cardList = $('#cardList');

  // Calculates valid disposition of usage values and updates all credit card sliders
  function updateAll(idUpdated) {
    const currentValues = []                         // Credit cards sliders values
    const saleTotal = saleInProgress.total           // Sale total
    const balance = Number($('#balance').val()) || 0 // Currently inserted balance usage
    const ccMin = balance && balance != 0 ? 0 : 10   // Minimum credit card sliders value (10 if no balance, 0 otherwise)
    
    // Get sliders values and credit card representatives
    $('[data-id]', cardList).each((i, elem) => {
      currentValues.push({
        id: Number($(elem).attr('data-id')),
        val: Number($(elem).val())
      })
    })

    const ccMax = saleTotal - (balance && balance != 0 ? balance : currentValues.length * ccMin)
    console.log('cc min max:', ccMin, ccMax)

    console.log('log label:', 'getSumSliders()', 'balance', 'saleTotal', 'getTotalDifference()')

    const getSumSliders = () => currentValues.reduce((a, b) => a + b.val, 0)
    const getTotalDifference = () => Math.round((saleTotal - balance - getSumSliders()) * 100) / 100

    console.log('values 1:', getSumSliders(), balance, saleTotal, getTotalDifference())

    if (currentValues.length > 1) {

      // Drag sliders that went past ccMin/ccMax
      currentValues.forEach((v, i) => {
        if (currentValues[i].val < ccMin) {
          currentValues[i].val = ccMin;
        } else if (currentValues[i].val > ccMax) {
          currentValues[i].val = ccMax;
        }
      })

      console.log('values 2:', getSumSliders(), balance, saleTotal, getTotalDifference())

      if (getTotalDifference() > 0.01) { // total is higher than sum of usages, must increase sliders values
        currentValues.forEach((v, i) => {
          // Correct sliders without modifying the updated one
          if (v.id != idUpdated && getTotalDifference() > 0.01) {
            const maxSliderAddition = ccMax - v.val; // The maximum the slider can be increased
            console.log(i, getTotalDifference(), maxSliderAddition)
            currentValues[i].val += Math.min(maxSliderAddition, getTotalDifference())
          }
        })
        console.log('values 3:', getSumSliders(), balance, saleTotal, getTotalDifference())
      } else if (getTotalDifference() < -0.01) { // total is lower than sum of usages, must decrease sliders values
        currentValues.forEach((v, i) => {
          // Correct sliders without modifying the updated one
          if (v.id != idUpdated && getTotalDifference() < -0.01) {
            const maxSliderSubtraction = (v.val - ccMin) * -1; // The maximum the slider can be decreased
            console.log(i, getTotalDifference(), maxSliderSubtraction)
            currentValues[i].val += Math.max(maxSliderSubtraction, getTotalDifference())
          }
        })
        console.log('values 4:', getSumSliders(), balance, saleTotal, getTotalDifference())
      } else {
        console.info("total difference is ~0!", getSumSliders(), balance, saleTotal, getTotalDifference())
      }

      // Update slider elements with new currentValues
      console.log('updating with:', currentValues, getTotalDifference())
      $('[data-id]', cardList).each((i, elem) => {
        // if (Number($(elem).attr('data-id')) === idUpdated) {
        // }
        $(elem).data("ionRangeSlider").update({ from: Math.round(currentValues[i].val * 100) / 100 })
      })
    } else {
      // If there's only one credit card it must be used to pay all the total (minus balance usage)
      $('[data-id]', cardList).data("ionRangeSlider").update({ from: Math.round((total - balance) * 100) / 100 })
    }

  }

  function createCCRow(cc) {
    const row = $($('#template-cc').html())
    row.find('[name^=ids]').val(cc.id)
    row.find('[name^=values]').attr('data-id', cc.id)
    row.find('.cc-number-text').text(cc.number)
    row.find('.cc-owner').text(cc.printedName)
    cardList.append(row)
  }

  $('#balance').change(() => {
    // $('[data-id]', cardList).each((i, elem) => {
    //   $(elem).data("ionRangeSlider").update({ from: 0 })
    // })
    updateAll();
  })
  
  // Get sale in progress
  $.ajax({
      url: '/note-commerce/shop/saleInProgress?operation=consult',
      type: 'GET',
      dataType: 'json',
      success: function (data) {
        saleInProgress = data
        saleInProgress.total = Math.round(saleInProgress.total * 100) / 100

        const totalText = Number(data.total)
            .toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })
          $("#total").text(totalText);

        // Get credit cards
        $.ajax({
          url: '/note-commerce/customer/creditCards?operation=consult&isAsync=true',
          type: 'GET',
          dataType: 'json',
          success: function (json) {
            // Insert credit card list rows
            cardList.html('')

            const numberOfActiveCards = json.filter(j => !j.isDeleted).length

            if (numberOfActiveCards == 0) {
              cardList.html('Você não possui nenhum cartão já cadastrado!')
              $('#nextStepButton').attr('disabled', 'disabled')
            }

            $.each(json, function (i, cc) {
              if (!cc.isDeleted && i < 10) {
                createCCRow(cc)
                const balance = $('#balance').val();

                // Initialize row slider
                $('#cardList [data-id=' + cc.id + ']').ionRangeSlider({
                  type : 'single',
                  skin: "round",
                  prefix: 'R$ ',
                  step: 0.01,
                  from: saleInProgress.total / numberOfActiveCards,
                  min: 0,
                  max: (saleInProgress.total).toFixed(2),
                  onFinish: obj => { updateAll(cc.id) }
                })
              }
            });

            // Get balance
            $.ajax('/note-commerce/customer/balance?operation=consult')
              .then(data => {
                currentBalance = data.balance;
                console.info('currentBalance:', data.balance)
                const currentBalanceText = Number(data.balance)
                  .toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' })
                $('#cus_balance').text(currentBalanceText)

                // Cannot use digital balance if its empty
                if (currentBalance != 0) {
                  $('#balance').attr('max', Math.min(currentBalance, saleInProgress.total))
                  $('#balance').inputmask('currency', {
                    groupSeparator: ',',
                    digits: 2,
                    radixPoint: '.',
                    prefix: 'R$ ',
                    rightAlign: false,
                    max: Math.min(currentBalance, saleInProgress.total),
                    allowMinus: false,
                    autoUnmask: true,
                    removeMaskOnSubmit: true
                  });
                  $('#balance').val(0)
                } else {
                  $('#balance').attr('disabled', 'disabled')
                  $('#balance').attr('placeholder', 'Você não tem saldo para utilizar nessa compra')
                  $('#balance').val('')
                }
              })
          }
        });
      }
  });

})