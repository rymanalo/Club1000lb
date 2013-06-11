var data;
var updatedData;

$.ajax({
  url: '/deadlift_data_points.json',
  method: 'get',
  dataType: 'json',
  success: function(datapoints) {
    if(datapoints !== undefined){
    data = datapoints.slice(0, (datapoints.length - 1));
    updatedData = datapoints;
    }
  },
  error: function () {
    console.log('Error!');
  }
  });

Array.max = function( array ){
return Math.max.apply( Math, array );
};



$( document ).ready(function() {
  var button = document.getElementById('button');
  var container = document.getElementById('container');
  var svg = d3.select('div#container svg');

  var heightPoints = [];
  var element = null;
  for (var i = 0; i < updatedData.length; i++) {
    element = updatedData[i];
    heightPoints.push(element['data_point']);
  }

  $('div#container').width((updatedData.length * 50) + 50);
  $('div#container').height(Array.max(heightPoints) + 50);

  var lineFunction = d3.svg.line()
    .x(function(d, i){ return (i * 50) + 50;})
    .y(function(d){ return (Array.max(heightPoints) + 100) - d.data_point;})
    .interpolate('linear');

  var lastData = $(data).last();

  svg.append("text")
      .attr("class", "x label")
      .style("text-anchor", "middle")
      .attr("x", ((updatedData.length * 50) + 50)/2)
      .attr("y", (Array.max(heightPoints) + 50) - 5)
      .text("Date");

  svg.append("text")
      .attr("class", "y label")
      .style("text-anchor", "middle")
      .attr("y", 5)
      .attr("x", -(Array.max(heightPoints) + 50)/2)
      .attr("dy", ".75em")
      .attr("transform", "rotate(-90)")
      .text("Weight (lb)");

  svg.append('path')
    .style("fill", "none")
    .style("stroke", "#799adc")
    .style("stroke-width", 5)
    .attr("d", lineFunction(data));


  button.onclick = function () {
    svg.append('path')
      .transition()
      .duration(1000)
      .style("fill", "none")
      .style("stroke", "#4180f3")
      .style("stroke-width", 5)
      .attr("d", lineFunction( updatedData ));
      this.onclick=null;
  };
});