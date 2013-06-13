datapoints = undefined

$(document).ready ->

  $.ajax(
   url: '/deadlift_data_points.json'
   method: 'get',
   dataType: 'json',
   success: (data) ->
    datapoints = data
    Morris.Line(
      element: 'deadliftMorris'
      data: datapoints
      xkey: 'date'
      ykeys: ['weight']
      labels: ['weight']
      xLabels: "day"
      parseTime: false
      postUnits: " lbs"
      goals: [250]
      goalLineColors: ['green']
    )
  )