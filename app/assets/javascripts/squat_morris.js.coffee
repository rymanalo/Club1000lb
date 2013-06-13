squat_datapoints = undefined

$(document).ready ->

  $.ajax(
   url: '/squat_data_points.json'
   method: 'get',
   dataType: 'json',
   success: (data) ->
    squat_datapoints = data
    Morris.Line(
      element: 'squatMorris'
      data: squat_datapoints
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