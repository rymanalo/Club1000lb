var bench_pressData;
var bench_pressUpdatedData;

$.ajax({
  url: '/bench_press_data_points.json',
  method: 'get',
  dataType: 'json',
  success: function(datapoints) {
    if(datapoints !== undefined){
    bench_pressData = datapoints.slice(0, (datapoints.length - 1));
    bench_pressUpdatedData = datapoints;
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
    var bench_press_button = document.getElementById('bench_press_button');
    var bench_press_container = document.getElementById('bench_press_container');
    var bench_press_svg = d3.select('div#bench_press_container svg');

    var bench_press_heightPoints = [];
    var bench_press_element;

    for (var i = 0; i < bench_pressUpdatedData.length; i++) {
      bench_press_element = bench_pressUpdatedData[i];
      bench_press_heightPoints.push(bench_press_element['data_point']);
    }

    $('div#bench_press_container').width((bench_pressUpdatedData.length * 50) + 50);
    $('div#bench_press_container').height(Array.max(bench_press_heightPoints) + 50);

    var bench_press_lineFunction = d3.svg.line()
      .x(function(d, i){ return (i * 50) + 50;})
      .y(function(d){ return (Array.max(bench_press_heightPoints) + 100) - d.data_point;})
      .interpolate('linear');

    bench_press_svg.append("text")
        .attr("class", "x label")
        .style("text-anchor", "middle")
        .attr("x", ((bench_pressUpdatedData.length * 50) + 50)/2)
        .attr("y", (Array.max(bench_press_heightPoints) + 50) - 5)
        .text("Date");

    bench_press_svg.append("text")
        .attr("class", "y label")
        .style("text-anchor", "middle")
        .attr("y", 5)
        .attr("x", -(Array.max(bench_press_heightPoints) + 50)/2)
        .attr("dy", ".75em")
        .attr("transform", "rotate(-90)")
        .text("Weight (lb)");

    bench_press_svg.append('path')
      .style("fill", "none")
      .style("stroke", "#799adc")
      .style("stroke-width", 5)
      .attr("d", bench_press_lineFunction(bench_pressData));

    if(bench_press_button !== null){
      bench_press_button.onclick = function () {
        bench_press_svg.append('path')
          .transition()
          .duration(1000)
          .style("fill", "none")
          .style("stroke", "#4180f3")
          .style("stroke-width", 5)
          .attr("d", bench_press_lineFunction( bench_pressUpdatedData ));
          this.onclick=null;
      };
    }
  });
}, 100);