$(document).ready(() => {

  async function getDashboardAt(minDate, maxDate) {
    console.log('get dashboard at: ', minDate, '-', maxDate)
    await $.ajax(`/note-commerce/admin/dashboard?minDate=${minDate}&maxDate=${maxDate}&operation=consult`)
      .then(data => {
        console.log('Dashboard data received:', data)
        // Map chart series
        const salesChartSeries = []
        const brands = Object.keys(data.brandSaleGraph)
        const saleData = Object.values(data.brandSaleGraph)

        for (let i = 0; i < brands.length; i++) {
          // Creates dummy point to generate line
          if (saleData[i].length === 1) {
            saleData[i].unshift({
              x: moment(saleData[i][0].x).subtract(1, 'days').format('YYYY-MM-DD'),
              y: 0
            })
          }
          salesChartSeries.push({
            name: brands[i],
            data: saleData[i]
          })
        }
        
        salesChartSeries.unshift({
          name: '(Período)',
          data: [ { x: minDate, y: 0 }, { x: maxDate, y: 0 } ]
        })

        salesChart.updateSeries(salesChartSeries)
        // salesChart.zoomX(minDate, maxDate)
        
        createMap(data.regionSaleMap)
        fillTable($('#sale-table tbody'), data.mostSoldProductsTable)
        fillTable($('#trade-table tbody'), data.mostTradedProductsTable)
      })
  }

  // ***********************************************************************************

  /*
    Time Interval Selection
  */

  moment.locale('pt-br')

  $('#time-option').daterangepicker(
    {
      ranges: {
        'Hoje': [moment(), moment()],
        'Ontem': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
        'Últimos 7 dias': [moment().subtract(6, 'days'), moment()],
        'Esse mês': [moment().startOf('month'), moment().endOf('month')],
        'Mês anterior': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')],
        'Últimos 6 meses': [moment().startOf('month'), moment().subtract(6, 'month').endOf('month')]
      },
      startDate: moment().subtract(29, 'days'),
      endDate: moment(),
      maxDate: moment(),
      // pt-BR Locale by João Pedro Raldi (https://stackoverflow.com/a/47271070/11138267)
      locale: { "format": "DD/MM/YYYY", "separator": " - ", "applyLabel": "Aplicar", "cancelLabel": "Cancelar", "fromLabel": "De", "toLabel": "Até", "customRangeLabel": "Período customizado", "daysOfWeek": ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"], "monthNames": ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"], "firstDay": 0 }
    },
    function (start, end) {
      console.log('Chosen dashboard period:', start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'))
      $('#time-option').html(`De ${start.format('MMMM D, YYYY')} até ${end.format('MMMM D, YYYY')}`)
      getDashboardAt(start.format('YYYY-MM-DD'), end.format('YYYY-MM-DD'))
    }
  )
  $('#time-option').html(`Últimos 30 dias`)

  // ***********************************************************************************

  /*
    Sales per brand line chart
  */

  // Script to generate fake series of data
  // var d = []
  // var names = ['Acer', 'Asus', 'Dell', 'Hp', 'Lenovo', 'Positivo', 'Samsung']
  // for (let i = 0; i < names.length; i++) {
  //   var v = []
  //   for (let j = 0; j < 10; j++) {
  //     v.push({
  //       x: new Date(1483057000025 + (j * 1000 * 3600 * 24)).toISOString().split('T')[0],
  //       y: Math.round(Math.random() * 150)
  //     })
  //   }
  //   d.push({
  //     name: names[i],
  //     data: v
  //   })
  // }
  // console.log('sales chart fake data:', d)

  var salesChartOptions = {
    //series: d,
    series: [], // update series: https://apexcharts.com/docs/methods/
    chart: {
      type: 'area',
      stacked: false,
      height: 450,
      zoom: {
        type: 'x',
        enabled: true,
        autoScaleYaxis: false
      },
      toolbar: {
        autoSelected: 'zoom'
      }
    },
    dataLabels: {
      enabled: false
    },
    markers: {
      size: 0,
    },
    // title: {
    //   text: 'Vendas por Marca',
    //   align: 'left'
    // },
    fill: {
      type: 'gradient',
      gradient: {
        shadeIntensity: 1,
        inverseColors: false,
        opacityFrom: 0.5,
        opacityTo: 0,
        stops: [0, 90, 100]
      },
    },
    yaxis: {
      title: {
        text: 'Laptops vendidos'
      },
    },
    xaxis: {
      type: 'datetime',
    },
    tooltip: {
      shared: true,
      y: {
        formatter: val => {
          return val ? (val).toFixed(0) : val
        },
        title: {
          formatter: (seriesName) => seriesName === '(Período)' ? '' : seriesName,
        },
      }
    }
  };

  var salesChart = new ApexCharts(document.querySelector("#sales-brand-chart"), salesChartOptions);
  salesChart.render();

  // ***********************************************************************************

  /*
    Sales per region map
  */

  function createMap(regionValues) {
    try {
      // Destroy current map
      $('#region-sales-map').vectorMap('get', 'mapObject').remove()
      //$('#region-sales-map').replaceWith("<div id=\"region-sales-map\" style=\"height: 465px;\">");
    } catch(e) {
      console.error('Error destroying map, probably is not created yet:\n', e)
    }

    $('#region-sales-map').vectorMap({
      map: 'brazil',
      backgroundColor: '#eee',
      regionStyle: { initial: { fill: '#ccc' }, hover: { fill: '#A0D1DC' } },
      // colors: { 'am-to': '#222222' },
      series: {
        regions: [{
          values: regionValues,
          scale: ['#C8FFEE', '#005411'],
          normalizeFunction: 'polynomial'
        }]
      },
      onRegionTipShow: function (e, el, code) {
        if (!regionValues[code]) {
          el.html(`${el.html()}: sem unidades vendidas`)
        } else {
          const stateSalePercentage = Math.round((regionValues[code] / Number(Object.values(regionValues).reduce((a, b) => (a || 0) + (b || 0), 0))) * 1000) / 10
          el.html(`${el.html()}: ${regionValues[code] + ' unidades'} (${stateSalePercentage}%)`);
        }
      }
    });
  }

  // Fake demo values
  // let mapvalues = {}
  // "ac al ap am ba ce df es go ma mt ms mg pa pr pr pe pi rj rn rs ro rr sc sp se to"
  //   .split(' ').forEach(e => mapvalues[e] = Math.random() > 0.2 ? Math.round(Math.random() * 10000) : undefined)
  // console.log('sales map fake data:', mapvalues)

  // createMap(mapvalues)
  createMap({})

  // var salesMap = $('#region-sales-map').vectorMap('get', 'mapObject')
  // salesMap.series.regions[0].setValues()

  // ***********************************************************************************

  /*
    Products tables
  */
  
  function fillTable(tbody, data) {
    tbody.html('')
    data.forEach(r => {
      tbody.append(`
      <tr>
        <td style="width: 80%">
          <a href="/note-commerce/admin/products?operation=consult&table_filter=${r.product.title}">${r.product.title}</a>
        </td>
        <td>${r.amount}</td>
      </tr>
      `)
    })
  }

  // ***********************************************************************************

  /*
    When everything is ready and initialized calls
  */

  getDashboardAt(moment().subtract(29, 'days').format('YYYY-MM-DD'), moment().format('YYYY-MM-DD'))

})