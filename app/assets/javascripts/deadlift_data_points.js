var deadliftData;
var deadliftUpdatedData;

$.ajax({
  url: '/deadlift_data_points.json',
  method: 'get',
  dataType: 'json',
  success: function(datapoints) {
    if(datapoints !== undefined){
    deadliftData = datapoints.slice(0, (datapoints.length - 1));
    deadliftUpdatedData = datapoints;
    }
  },
  error: function () {
    console.log('Error!');
  }
  });

Array.max = function( array ){
return Math.max.apply( Math, array );
};


setTimeout(function() {
  $( document ).ready(function() {
    var deadlift_button = document.getElementById('deadlift_button');
    var deadlift_container = document.getElementById('deadlift_container');
    var deadlift_svg = d3.select('div#deadlift_container svg');

    var deadlift_heightPoints = [];
    var deadlift_element;

    for (var i = 0; i < deadliftUpdatedData.length; i++) {
      deadlift_element = deadliftUpdatedData[i];
      deadlift_heightPoints.push(deadlift_element['data_point']);
    }

    $('div#deadlift_container').width((deadliftUpdatedData.length * 50) + 50);
    $('div#deadlift_container').height(Array.max(deadlift_heightPoints) + 50);

    var deadlift_lineFunction = d3.svg.line()
      .x(function(d, i){ return (i * 50) + 50;})
      .y(function(d){ return (Array.max(deadlift_heightPoints) + 100) - d.data_point;})
      .interpolate('linear');

    deadlift_svg.append("text")
        .attr("class", "x label")
        .style("text-anchor", "middle")
        .attr("x", ((deadliftUpdatedData.length * 50) + 50)/2)
        .attr("y", (Array.max(deadlift_heightPoints) + 50) - 5)
        .text("Date");

    deadlift_svg.append("text")
        .attr("class", "y label")
        .style("text-anchor", "middle")
        .attr("y", 5)
        .attr("x", -(Array.max(deadlift_heightPoints) + 50)/2)
        .attr("dy", ".75em")
        .attr("transform", "rotate(-90)")
        .text("Weight (lb)");

    deadlift_svg.append('path')
      .style("fill", "none")
      .style("stroke", "#799adc")
      .style("stroke-width", 5)
      .attr("d", deadlift_lineFunction(deadliftData));


    if(deadlift_button !== null){
      deadlift_button.onclick = function () {
        deadlift_svg.append('path')
          .transition()
          .duration(1000)
          .style("fill", "none")
          .style("stroke", "#4180f3")
          .style("stroke-width", 5)
          .attr("d", deadlift_lineFunction( deadliftUpdatedData ));
          this.onclick=null;
      };
    }
  });
}, 100);