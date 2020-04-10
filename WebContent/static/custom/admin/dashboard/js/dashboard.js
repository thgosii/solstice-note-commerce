$(document).ready(() => {

  async function getDashboardAt(minDate, maxDate) {
    return await $.ajax(`/note-commerce/admin/dashboard?minDate=${minDate}&maxDate=${maxDate}&operation=consult`)
  }

  function updateDashboardWith(data) {
    salesChart.updateSeries(data.salesChart)
    salesMap.series.regions[0].setValues()
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
  var d = []
  var names = ['Acer', 'Asus', 'Dell', 'Hp', 'Lenovo', 'Positivo', 'Samsung']
  for (let i = 0; i < names.length; i++) {
    var v = []
    for (let j = 0; j < 10; j++) {
      v.push({
        x: new Date(1483057000025 + (j * 1000 * 3600 * 24)).toISOString().split('T')[0],
        y: Math.round(Math.random() * 150)
      })
    }
    d.push({
      name: names[i],
      data: v
    })
  }
  console.log('sales chart fake data:', d)

  var salesChartOptions = {
    series: d, // update series: https://apexcharts.com/docs/methods/
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
          return (val).toFixed(0)
        }
      }
    }
  };

  var salesChart = new ApexCharts(document.querySelector("#sales-brand-chart"), salesChartOptions);
  salesChart.render();

  // ***********************************************************************************

  /*
    Sales per region map
  */

  // Fake demo values
  let mapvalues = {}
  "ac al ap am ba ce df es go ma mt ms mg pa pr pr pe pi rj rn rs ro rr sc sp se to"
    .split(' ').forEach(e => mapvalues[e] = Math.random() > 0.2 ? Math.round(Math.random() * 10000) : undefined)
  console.log('sales map fake data:', mapvalues)

  $('#region-sales-map').vectorMap({
    map: 'brazil',
    backgroundColor: '#eee',
    regionStyle: { initial: { fill: '#ccc' }, hover: { fill: '#A0D1DC' } },
    // colors: { 'am-to': '#222222' },
    series: {
      regions: [{
        values: mapvalues,
        scale: ['#C8FFEE', '#005411'],
        normalizeFunction: 'polynomial'
      }]
    },
    onRegionTipShow: function (e, el, code) {
      el.html(`${el.html()}: ${mapvalues[code] ? mapvalues[code] + ' vendas' : 'sem vendas'} (12%)`);
    }
  });

  var salesMap = $('#region-sales-map').vectorMap('get', 'mapObject')

})