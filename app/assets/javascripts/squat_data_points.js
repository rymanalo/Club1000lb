// var squatData;
// var squatUpdatedData;

// $.ajax({
//   url: '/squat_data_points.json',
//   method: 'get',
//   dataType: 'json',
//   success: function(datapoints) {
//     if(datapoints !== undefined){
//     squatData = datapoints.slice(0, (datapoints.length - 1));
//     squatUpdatedData = datapoints;
//     }
//   },
//   error: function () {
//     console.log('Error!');
//   }
//   });

// Array.max = function( array ){
// return Math.max.apply( Math, array );
// };


// setTimeout(function() {
//   $( document ).ready(function() {
//     var squat_button = document.getElementById('squat_button');
//     var squat_container = document.getElementById('squat_container');
//     var squat_svg = d3.select('div#squat_container svg');

//     var squat_heightPoints = [];
//     var squat_element;

//     for (var i = 0; i < squatUpdatedData.length; i++) {
//       squat_element = squatUpdatedData[i];
//       squat_heightPoints.push(squat_element['data_point']);
//     }

//     $('div#squat_container').width((squatUpdatedData.length * 50) + 50);
//     $('div#squat_container').height(Array.max(squat_heightPoints) + 50);

//     var squat_lineFunction = d3.svg.line()
//       .x(function(d, i){ return (i * 50) + 50;})
//       .y(function(d){ return (Array.max(squat_heightPoints) + 100) - d.data_point;})
//       .interpolate('linear');

//     squat_svg.append("text")
//         .attr("class", "x label")
//         .style("text-anchor", "middle")
//         .attr("x", ((squatUpdatedData.length * 50) + 50)/2)
//         .attr("y", (Array.max(squat_heightPoints) + 50) - 5)
//         .text("Date");

//     squat_svg.append("text")
//         .attr("class", "y label")
//         .style("text-anchor", "middle")
//         .attr("y", 5)
//         .attr("x", -(Array.max(squat_heightPoints) + 50)/2)
//         .attr("dy", ".75em")
//         .attr("transform", "rotate(-90)")
//         .text("Weight (lb)");

//     squat_svg.append('path')
//       .style("fill", "none")
//       .style("stroke", "#799adc")
//       .style("stroke-width", 5)
//       .attr("d", squat_lineFunction(squatData));

//     if(squat_button !== null){
//       squat_button.onclick = function () {
//         squat_svg.append('path')
//           .transition()
//           .duration(1000)
//           .style("fill", "none")
//           .style("stroke", "#4180f3")
//           .style("stroke-width", 5)
//           .attr("d", squat_lineFunction( squatUpdatedData ));
//           this.onclick=null;
//       };
//     }
//   });
// }, 100);