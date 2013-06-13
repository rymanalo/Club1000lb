// setTimeout(function() {
//   $( document ).ready(function() {

//     var button = document.getElementById('button');
//     var container = document.getElementById('container');


//     var svg = d3.select('div#container svg');
//     var data = [
//       {x: 0, y: 10},
//       {x: 0, y: 20},
//       {x: 0, y: 30},
//       {x: 0, y: 40},
//       {x: 0, y: 50},
//       {x: 0, y: 10}
//     ];

//     var lineFunction = d3.svg.line()
//       .x(function(d, i){ return (i * 50) + 25;})
//       .y(function(d){ return 175 - d.y;})
//       .interpolate('linear');

//     var lastData = $(data).last();

//     svg.append("text")
//         .attr("class", "x label")
//         .style("text-anchor", "middle")
//         .attr("x", 200)
//         .attr("y", 200 - 5)
//         .text("Date");

//     svg.append("text")
//         .attr("class", "y label")
//         .style("text-anchor", "middle")
//         .attr("y", 5)
//         .attr("x", -100)
//         .attr("dy", ".75em")
//         .attr("transform", "rotate(-90)")
//         .text("Weight (lb)");

//     svg.append('path')
//       .style("fill", "none")
//       .style("stroke", "#799adc")
//       .style("stroke-width", 5)
//       .attr("d", lineFunction(data));


//     button.onclick = function () {
//       data.push({x: 300, y: 50});
//       svg.append('path')
//         .transition()
//         .duration(1000)
//         .style("fill", "none")
//         .style("stroke", "#4180f3")
//         .style("stroke-width", 5)
//         .attr("d", lineFunction(data));
//         this.onclick=null;
//     };

//   });
// }, 100);