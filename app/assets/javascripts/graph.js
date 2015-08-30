$(document).on("ready page:load", function(){

  if( $("#graph-container").length > 0 ){
    graphData = $('#graph-container').data("graph-series");

    $('#graph-container').highcharts({
        chart: {
            type: 'bar'
        },
        title: {
            text: 'Transacciones Historicas'
        },
        xAxis: {
        categories: ["Tipo Transacciones"]
        },
        yAxis: {
            title: {
                text: 'Efectivo ($)'
            }
        },
        tooltip: {
              pointFormat: '{series.name}: <b>$ {point.y:.1f}</b>'
          },
        credits: {
            enabled: false
        },
        series: [{
            name: 'Depositos',
            data: [parseFloat(graphData.depositos)]
        }, {
            name: 'Retiros',
            data: [parseFloat(graphData.retiros)]
        }, {
            name: 'Intereses',
            data: [parseFloat(graphData.intereses)]
        },
         {
            name: 'Diferencia Historica',
            data: [parseFloat(graphData.diferencia)]
        }]
    });
  }
});
