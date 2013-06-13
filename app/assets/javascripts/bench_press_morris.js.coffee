bench_press_data_points = undefined

$(document).ready ->

  $.ajax(
   url: '/deadlift_data_points.json'
   method: 'get',
   dataType: 'json',
   success: (data) ->
    bench_press_data_points = data
    Morris.Line(
      element: 'benchPressMorris'
      data: bench_press_data_points
      xkey: 'date'
      ykeys: ['weight']
      labels: ['weight']
      xLabels: "day"
      parseTime: false
      postUnits: " lbs"
      goals: [250]
      goalLineColors: ['gold']
      goalStrokeWidth: 3
      lineWidth: 5
      pointSize: 6
      pointStrokeColors: 'gold'
      hideHover: true
      gridTextColor: '#68f'
    )
  )