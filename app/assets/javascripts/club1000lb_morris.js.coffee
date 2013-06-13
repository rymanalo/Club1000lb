index_datapoints = undefined

$(document).ready ->

  $.ajax(
   url: '/index.json'
   method: 'get',
   dataType: 'json',
   success: (data) ->
    index_datapoints = data
    Morris.Bar(
      element: 'indexMorris'
      data: index_datapoints
      xkey: 'name'
      ykeys: ["Current Max", "Max Weight" ]
      labels: ["Current Max", "Max Weight" ]
      postUnits: " lbs"
      goals: [250, 500, 750, 1000]
      goalLineColors: ['#e91c11', '#e91c11', '#e91c11', '#1a54ec']
      goalStrokeWidth: 3
      lineWidth: 5
      pointSize: 6
      pointStrokeColors: 'gold'
      hideHover: true
      gridTextColor: '#68f'
      ymax: 1000
      gridTextSize: 15
    )
  )