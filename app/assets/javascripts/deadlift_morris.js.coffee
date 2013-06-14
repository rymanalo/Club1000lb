deadlift_datapoints = undefined

$(document).ready ->

  $.ajax(
   url: '/deadlift_data_points.json'
   method: 'get',
   dataType: 'json',
   success: (data) ->
    deadlift_datapoints = data
    Morris.Line(
      element: 'deadliftMorris'
      data: deadlift_datapoints
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
      gridTextFamily: 'Roboto Slab'
      gridTextSize: 14
    )
  )