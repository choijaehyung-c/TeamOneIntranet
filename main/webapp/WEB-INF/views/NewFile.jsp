<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
        
<title>Insert title here</title>
 <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.min.js"></script>
<script>
            var chart;

            var chartData = [
                {
                    "country": "USA",
                    "visits": 3025,
                    "color": "#FF0F00"
                },
                {
                    "country": "China",
                    "visits": 1882,
                    "color": "#FF6600"
                },
                {
                    "country": "Japan",
                    "visits": 1809,
                    "color": "#FF9E01"
                },
                {
                    "country": "Germany",
                    "visits": 1322,
                    "color": "#FCD202"
                },
                {
                    "country": "UK",
                    "visits": 1122,
                    "color": "#F8FF01"
                },
                {
                    "country": "France",
                    "visits": 1114,
                    "color": "#B0DE09"
                },
                {
                    "country": "India",
                    "visits": 984,
                    "color": "#04D215"
                },
                {
                    "country": "Spain",
                    "visits": 711,
                    "color": "#0D8ECF"
                },
                {
                    "country": "Netherlands",
                    "visits": 665,
                    "color": "#0D52D1"
                },
                {
                    "country": "Russia",
                    "visits": 580,
                    "color": "#2A0CD0"
                },
                {
                    "country": "South Korea",
                    "visits": 443,
                    "color": "#8A0CCF"
                },
                {
                    "country": "Canada",
                    "visits": 441,
                    "color": "#CD0D74"
                }
            ];


            AmCharts.ready(function () {
                // SERIAL CHART
                chart = new AmCharts.AmSerialChart();
                chart.dataProvider = chartData;
                chart.categoryField = "country";
                chart.startDuration = 1;
                chart.depth3D = 50;
                chart.angle = 30;
                chart.marginRight = -45;

                // AXES
                // category
                var categoryAxis = chart.categoryAxis;
                categoryAxis.gridAlpha = 0;
                categoryAxis.axisAlpha = 0;
                categoryAxis.gridPosition = "start";

                // value
                var valueAxis = new AmCharts.ValueAxis();
                valueAxis.axisAlpha = 0;
                valueAxis.gridAlpha = 0;
                chart.addValueAxis(valueAxis);

                // GRAPH
                var graph = new AmCharts.AmGraph();
                graph.valueField = "visits";
                graph.colorField = "color";
                graph.balloonText = "<b>[[category]]: [[value]]</b>";
                graph.type = "column";
                graph.lineAlpha = 0.5;
                graph.lineColor = "#FFFFFF";
                graph.topRadius = 1;
                graph.fillAlphas = 0.9;
                chart.addGraph(graph);

                // CURSOR
                var chartCursor = new AmCharts.ChartCursor();
                chartCursor.cursorAlpha = 0;
                chartCursor.zoomable = false;
                chartCursor.categoryBalloonEnabled = false;
                chartCursor.valueLineEnabled = true;
                chartCursor.valueLineBalloonEnabled = true;
                chartCursor.valueLineAlpha = 1;
                chart.addChartCursor(chartCursor);

                chart.creditsPosition = "top-right";

                // WRITE
                chart.write("chartdiv");
            });
        </script>
        
        
</head>
<body>
 <canvas id="myChart" width="300" height="186"></canvas>
	<div id="chartdiv">
		<div style="width: 100%; height: 100%; position: relative;">
			<svg version="1.1" xmlns="http://www.w3.org/2000/svg"
				xmlns:xlink="http://www.w3.org/1999/xlink" role="group"
				style="width: 100%; height: 100%; overflow: visible;">
				<defs>
				<clipPath id="id-61">
				<path
					d=" M0,0  L25.9808,-15  L1506.0008,-15  L1506.0008,73  L1480.02,88  L1480.02,88  L0,88  Z"></path></clipPath>
				<clipPath id="id-62">
				<rect width="1536" height="175"></rect></clipPath>
				<linearGradient id="gradient-id-85" x1="1%" x2="99%" y1="59%"
					y2="41%">
				<stop stop-color="#474758" offset="0"></stop>
				<stop stop-color="#474758" stop-opacity="1" offset="0.75"></stop>
				<stop stop-color="#3cabff" stop-opacity="1" offset="0.755"></stop></linearGradient>
				<filter id="filter-id-94" filterUnits="objectBoundingBox"
					width="200%" height="200%" x="-50%" y="-50%"></filter>
				<filter id="filter-id-115" filterUnits="objectBoundingBox"
					width="200%" height="200%" x="-50%" y="-50%"></filter>
				<clipPath id="id-136">
				<path d="M0,0 L1480.02,0 L1480.02,138.3365 L0,138.3365 L0,0"></path></clipPath>
				<clipPath id="id-242"
					transform="translate(-2.3306280950291525e-16,0)">
				<rect width="1480.02" height="88"></rect></clipPath>
				<filter id="filter-id-67" filterUnits="objectBoundingBox"
					width="200%" height="200%" x="-50%" y="-50%">
				<feGaussianBlur result="blurOut" in="SourceGraphic"
					stdDeviation="1.5"></feGaussianBlur>
				<feOffset result="offsetBlur" dx="1" dy="1"></feOffset>
				<feFlood flood-color="#000000" flood-opacity="0.5"></feFlood>
				<feComposite in2="offsetBlur" operator="in"></feComposite>
				<feMerge>
				<feMergeNode></feMergeNode>
				<feMergeNode in="SourceGraphic"></feMergeNode></feMerge></filter>
				<filter id="filter-id-82" filterUnits="objectBoundingBox"
					width="120%" height="120%" x="-10%" y="-10%">
				<feColorMatrix type="saturate" values="0"></feColorMatrix></filter>
				<filter id="filter-id-141" filterUnits="objectBoundingBox"
					width="200%" height="200%" x="-50%" y="-50%">
				<feGaussianBlur result="blurOut" in="SourceGraphic"
					stdDeviation="1.5"></feGaussianBlur>
				<feOffset result="offsetBlur" dx="1" dy="1"></feOffset>
				<feFlood flood-color="#000000" flood-opacity="0.5"></feFlood>
				<feComposite in2="offsetBlur" operator="in"></feComposite>
				<feMerge>
				<feMergeNode></feMergeNode>
				<feMergeNode in="SourceGraphic"></feMergeNode></feMerge></filter>
				<linearGradient id="gradient-id-394" x1="0%" x2="100%" y1="50%"
					y2="50%">
				<stop stop-color="#dcaf67" stop-opacity="1" offset="0"></stop>
				<stop stop-color="#a5834d" stop-opacity="1" offset="0.5"></stop>
				<stop stop-color="#dcaf67" stop-opacity="1" offset="1"></stop></linearGradient>
				<linearGradient id="gradient-id-381" x1="0%" x2="100%" y1="50%"
					y2="50%">
				<stop stop-color="#dc8c67" stop-opacity="1" offset="0"></stop>
				<stop stop-color="#a5694d" stop-opacity="1" offset="0.5"></stop>
				<stop stop-color="#dc8c67" stop-opacity="1" offset="1"></stop></linearGradient>
				<linearGradient id="gradient-id-368" x1="0%" x2="100%" y1="50%"
					y2="50%">
				<stop stop-color="#dc6967" stop-opacity="1" offset="0"></stop>
				<stop stop-color="#a54f4d" stop-opacity="1" offset="0.5"></stop>
				<stop stop-color="#dc6967" stop-opacity="1" offset="1"></stop></linearGradient>
				<linearGradient id="gradient-id-355" x1="0%" x2="100%" y1="50%"
					y2="50%">
				<stop stop-color="#dc6788" stop-opacity="1" offset="0"></stop>
				<stop stop-color="#a54d66" stop-opacity="1" offset="0.5"></stop>
				<stop stop-color="#dc6788" stop-opacity="1" offset="1"></stop></linearGradient>
				<linearGradient id="gradient-id-342" x1="0%" x2="100%" y1="50%"
					y2="50%">
				<stop stop-color="#dc67ab" stop-opacity="1" offset="0"></stop>
				<stop stop-color="#a54d80" stop-opacity="1" offset="0.5"></stop>
				<stop stop-color="#dc67ab" stop-opacity="1" offset="1"></stop></linearGradient>
				<linearGradient id="gradient-id-329" x1="0%" x2="100%" y1="50%"
					y2="50%">
				<stop stop-color="#dc67ce" stop-opacity="1" offset="0"></stop>
				<stop stop-color="#a54d9b" stop-opacity="1" offset="0.5"></stop>
				<stop stop-color="#dc67ce" stop-opacity="1" offset="1"></stop></linearGradient>
				<linearGradient id="gradient-id-316" x1="0%" x2="100%" y1="50%"
					y2="50%">
				<stop stop-color="#c767dc" stop-opacity="1" offset="0"></stop>
				<stop stop-color="#954da5" stop-opacity="1" offset="0.5"></stop>
				<stop stop-color="#c767dc" stop-opacity="1" offset="1"></stop></linearGradient>
				<linearGradient id="gradient-id-303" x1="0%" x2="100%" y1="50%"
					y2="50%">
				<stop stop-color="#a367dc" stop-opacity="1" offset="0"></stop>
				<stop stop-color="#7a4da5" stop-opacity="1" offset="0.5"></stop>
				<stop stop-color="#a367dc" stop-opacity="1" offset="1"></stop></linearGradient>
				<linearGradient id="gradient-id-290" x1="0%" x2="100%" y1="50%"
					y2="50%">
				<stop stop-color="#8067dc" stop-opacity="1" offset="0"></stop>
				<stop stop-color="#604da5" stop-opacity="1" offset="0.5"></stop>
				<stop stop-color="#8067dc" stop-opacity="1" offset="1"></stop></linearGradient>
				<linearGradient id="gradient-id-277" x1="0%" x2="100%" y1="50%"
					y2="50%">
				<stop stop-color="#6771dc" stop-opacity="1" offset="0"></stop>
				<stop stop-color="#4d55a5" stop-opacity="1" offset="0.5"></stop>
				<stop stop-color="#6771dc" stop-opacity="1" offset="1"></stop></linearGradient>
				<linearGradient id="gradient-id-264" x1="0%" x2="100%" y1="50%"
					y2="50%">
				<stop stop-color="#6794dc" stop-opacity="1" offset="0"></stop>
				<stop stop-color="#4d6fa5" stop-opacity="1" offset="0.5"></stop>
				<stop stop-color="#6794dc" stop-opacity="1" offset="1"></stop></linearGradient>
				<linearGradient id="gradient-id-251" x1="0%" x2="100%" y1="50%"
					y2="50%">
				<stop stop-color="#67b7dc" stop-opacity="1" offset="0"></stop>
				<stop stop-color="#4d89a5" stop-opacity="1" offset="0.5"></stop>
				<stop stop-color="#67b7dc" stop-opacity="1" offset="1"></stop></linearGradient>
				<filter id="filter-id-296" filterUnits="objectBoundingBox"
					width="130%" height="130%" x="-15%" y="-15%"></filter></defs>
				<g>
				<g fill="#ffffff" fill-opacity="0">
				<rect width="1536" height="175"></rect></g>
				<g>
				<g role="region" clip-path="url(&quot;#id-62&quot;)" opacity="1"
					aria-label="Chart">
				<g transform="translate(15,15)">
				<g>
				<g>
				<g>
				<g transform="translate(0,15)">
				<g>
				<g>
				<g transform="translate(0.0001,0)">
				<g fill="#ffffff" fill-opacity="0">
				<rect width="1480.02" height="88"></rect></g>
				<g>
				<g>
				<g></g></g>
				<g>
				<g></g></g>
				<g>
				<g>
				<g clip-path="url(&quot;#id-61&quot;)">
				<g></g></g>
				<g role="group" stroke-opacity="0" fill-opacity="1" stroke="#67b7dc"
					aria-label="Series">
				<g>
				<g clip-path="url(&quot;#id-136&quot;)">
				<g>
				<g>
				<g>
				<g stroke-opacity="1" fill="#67b7dc" fill-opacity="1"
					stroke="#67b7dc" role="menuitem" focusable="true" tabindex="0"
					transform="translate(12.329,21.45)">
				<g>
				<g fill="#67b7dc">
				<g>
				<g transform="translate(49.337,0)" fill="#67b7dc">
				<ellipse r="49.3365" rx="49.3365" ry="16.4455"></ellipse></g>
				<g transform="translate(49.337,66.55)" fill="#67b7dc">
				<ellipse r="49.3365" rx="49.3365" ry="16.4455"></ellipse></g>
				<g fill="url(&quot;#gradient-id-251&quot;)">
				<path
					d=" M0,0  a49.3365,16.4455,0,0,0,98.673,0 L98.673,66.55  a49.3365,16.4455,0,0,1,-98.673,0 Z"></path></g></g></g></g></g>
				<g stroke-opacity="1" fill="#6794dc" fill-opacity="1"
					stroke="#6794dc" role="menuitem" focusable="true" tabindex="0"
					transform="translate(135.673,46.596)" id="id-257">
				<g>
				<g fill="#6794dc">
				<g>
				<g transform="translate(49.329,0)" fill="#6794dc">
				<ellipse r="49.329" rx="49.329" ry="16.443"></ellipse></g>
				<g transform="translate(49.329,41.404)" fill="#6794dc">
				<ellipse r="49.329" rx="49.329" ry="16.443"></ellipse></g>
				<g fill="url(&quot;#gradient-id-264&quot;)">
				<path
					d=" M0,0  a49.329,16.443,0,0,0,98.658,0 L98.658,41.404  a49.329,16.443,0,0,1,-98.658,0 Z"></path></g></g></g></g></g>
				<g stroke-opacity="1" fill="#6771dc" fill-opacity="1"
					stroke="#6771dc" role="menuitem" focusable="true" tabindex="0"
					transform="translate(259.003,48.202)">
				<g>
				<g fill="#6771dc">
				<g>
				<g transform="translate(49.337,0)" fill="#6771dc">
				<ellipse r="49.3365" rx="49.3365" ry="16.4455"></ellipse></g>
				<g transform="translate(49.337,39.798)" fill="#6771dc">
				<ellipse r="49.3365" rx="49.3365" ry="16.4455"></ellipse></g>
				<g fill="url(&quot;#gradient-id-277&quot;)">
				<path
					d=" M0,0  a49.3365,16.4455,0,0,0,98.673,0 L98.673,39.798  a49.3365,16.4455,0,0,1,-98.673,0 Z"></path></g></g></g></g></g>
				<g stroke-opacity="1" fill="#8067dc" fill-opacity="1"
					stroke="#8067dc" role="menuitem" focusable="true" tabindex="0"
					transform="translate(382.334,58.916)">
				<g>
				<g fill="#8067dc">
				<g>
				<g transform="translate(49.337,0)" fill="#8067dc">
				<ellipse r="49.3365" rx="49.3365" ry="16.4455"></ellipse></g>
				<g transform="translate(49.337,29.084)" fill="#8067dc">
				<ellipse r="49.3365" rx="49.3365" ry="16.4455"></ellipse></g>
				<g fill="url(&quot;#gradient-id-290&quot;)">
				<path
					d=" M0,0  a49.3365,16.4455,0,0,0,98.673,0 L98.673,29.084  a49.3365,16.4455,0,0,1,-98.673,0 Z"></path></g></g></g></g></g>
				<g stroke-opacity="1" fill="#a367dc" fill-opacity="1"
					stroke="#a367dc" role="menuitem" focusable="true" tabindex="0"
					transform="translate(505.678,63.316)" id="id-296"
					style="outline: none;">
				<g>
				<g fill="#a367dc">
				<g>
				<g transform="translate(49.329,0)" fill="#a367dc">
				<ellipse r="49.329" rx="49.329" ry="16.443"></ellipse></g>
				<g transform="translate(49.329,24.684)" fill="#a367dc">
				<ellipse r="49.329" rx="49.329" ry="16.443"></ellipse></g>
				<g fill="url(&quot;#gradient-id-303&quot;)">
				<path
					d=" M0,0  a49.329,16.443,0,0,0,98.658,0 L98.658,24.684  a49.329,16.443,0,0,1,-98.658,0 Z"></path></g></g></g></g></g>
				<g stroke-opacity="1" fill="#c767dc" fill-opacity="1"
					stroke="#c767dc" role="menuitem" focusable="true" tabindex="0"
					transform="translate(629.009,63.492)" id="id-309">
				<g>
				<g fill="#c767dc">
				<g>
				<g transform="translate(49.337,0)" fill="#c767dc">
				<ellipse r="49.3365" rx="49.3365" ry="16.4455"></ellipse></g>
				<g transform="translate(49.337,24.508)" fill="#c767dc">
				<ellipse r="49.3365" rx="49.3365" ry="16.4455"></ellipse></g>
				<g fill="url(&quot;#gradient-id-316&quot;)">
				<path
					d=" M0,0  a49.3365,16.4455,0,0,0,98.673,0 L98.673,24.508  a49.3365,16.4455,0,0,1,-98.673,0 Z"></path></g></g></g></g></g>
				<g stroke-opacity="1" fill="#dc67ce" fill-opacity="1"
					stroke="#dc67ce" role="menuitem" focusable="true" tabindex="0"
					transform="translate(752.339,66.352)">
				<g>
				<g fill="#dc67ce">
				<g>
				<g transform="translate(49.337,0)" fill="#dc67ce">
				<ellipse r="49.3365" rx="49.3365" ry="16.4455"></ellipse></g>
				<g transform="translate(49.337,21.648)" fill="#dc67ce">
				<ellipse r="49.3365" rx="49.3365" ry="16.4455"></ellipse></g>
				<g fill="url(&quot;#gradient-id-329&quot;)">
				<path
					d=" M0,0  a49.3365,16.4455,0,0,0,98.673,0 L98.673,21.648  a49.3365,16.4455,0,0,1,-98.673,0 Z"></path></g></g></g></g></g>
				<g stroke-opacity="1" fill="#dc67ab" fill-opacity="1"
					stroke="#dc67ab" role="menuitem" focusable="true" tabindex="0"
					transform="translate(875.683,72.358)">
				<g>
				<g fill="#dc67ab">
				<g>
				<g transform="translate(49.329,0)" fill="#dc67ab">
				<ellipse r="49.329" rx="49.329" ry="16.443"></ellipse></g>
				<g transform="translate(49.329,15.642)" fill="#dc67ab">
				<ellipse r="49.329" rx="49.329" ry="16.443"></ellipse></g>
				<g fill="url(&quot;#gradient-id-342&quot;)">
				<path
					d=" M0,0  a49.329,16.443,0,0,0,98.658,0 L98.658,15.642  a49.329,16.443,0,0,1,-98.658,0 Z"></path></g></g></g></g></g>
				<g stroke-opacity="1" fill="#dc6788" fill-opacity="1"
					stroke="#dc6788" role="menuitem" focusable="true" tabindex="0"
					transform="translate(999.014,73.37)">
				<g>
				<g fill="#dc6788">
				<g>
				<g transform="translate(49.337,0)" fill="#dc6788">
				<ellipse r="49.3365" rx="49.3365" ry="16.4455"></ellipse></g>
				<g transform="translate(49.337,14.63)" fill="#dc6788">
				<ellipse r="49.3365" rx="49.3365" ry="16.4455"></ellipse></g>
				<g fill="url(&quot;#gradient-id-355&quot;)">
				<path
					d=" M0,0  a49.3365,16.4455,0,0,0,98.673,0 L98.673,14.63  a49.3365,16.4455,0,0,1,-98.673,0 Z"></path></g></g></g></g></g>
				<g stroke-opacity="1" fill="#dc6967" fill-opacity="1"
					stroke="#dc6967" role="menuitem" focusable="true" tabindex="0"
					transform="translate(1122.344,75.24)">
				<g>
				<g fill="#dc6967">
				<g>
				<g transform="translate(49.337,0)" fill="#dc6967">
				<ellipse r="49.3365" rx="49.3365" ry="16.4455"></ellipse></g>
				<g transform="translate(49.337,12.76)" fill="#dc6967">
				<ellipse r="49.3365" rx="49.3365" ry="16.4455"></ellipse></g>
				<g fill="url(&quot;#gradient-id-368&quot;)">
				<path
					d=" M0,0  a49.3365,16.4455,0,0,0,98.673,0 L98.673,12.76  a49.3365,16.4455,0,0,1,-98.673,0 Z"></path></g></g></g></g></g>
				<g stroke-opacity="1" fill="#dc8c67" fill-opacity="1"
					stroke="#dc8c67" role="menuitem" focusable="true" tabindex="0"
					transform="translate(1245.688,78.254)">
				<g>
				<g fill="#dc8c67">
				<g>
				<g transform="translate(49.329,0)" fill="#dc8c67">
				<ellipse r="49.329" rx="49.329" ry="16.443"></ellipse></g>
				<g transform="translate(49.329,9.746)" fill="#dc8c67">
				<ellipse r="49.329" rx="49.329" ry="16.443"></ellipse></g>
				<g fill="url(&quot;#gradient-id-381&quot;)">
				<path
					d=" M0,0  a49.329,16.443,0,0,0,98.658,0 L98.658,9.746  a49.329,16.443,0,0,1,-98.658,0 Z"></path></g></g></g></g></g>
				<g stroke-opacity="1" fill="#dcaf67" fill-opacity="1"
					stroke="#dcaf67" role="menuitem" focusable="true" tabindex="0"
					transform="translate(1369.019,78.298)">
				<g>
				<g fill="#dcaf67">
				<g>
				<g transform="translate(49.337,0)" fill="#dcaf67">
				<ellipse r="49.3365" rx="49.3365" ry="16.4455"></ellipse></g>
				<g transform="translate(49.337,9.702)" fill="#dcaf67">
				<ellipse r="49.3365" rx="49.3365" ry="16.4455"></ellipse></g>
				<g fill="url(&quot;#gradient-id-394&quot;)">
				<path
					d=" M0,0  a49.3365,16.4455,0,0,0,98.673,0 L98.673,9.702  a49.3365,16.4455,0,0,1,-98.673,0 Z"></path></g></g></g></g></g></g></g></g></g>
				<g></g></g></g></g></g>
				<g clip-path="url(&quot;#id-242&quot;)">
				<g>
				<g fill="#67b7dc" stroke="#67b7dc">
				<g></g></g></g></g>
				<g>
				<g>
				<g>
				<g></g></g>
				<g>
				<g></g></g></g></g>
				<g>
				<g></g></g>
				<g>
				<g></g></g>
				<g role="button" focusable="true" tabindex="0" opacity="0"
					visibility="hidden" aria-hidden="true"
					transform="translate(1440.02,-3)" aria-labelledby="id-37-title">
				<g fill="#6794dc" stroke="#ffffff" fill-opacity="1"
					stroke-opacity="0" transform="translate(0,8)">
				<path
					d="M17,0 L18,0 a17,17 0 0 1 17,17 L35,17 a17,17 0 0 1 -17,17 L17,34 a17,17 0 0 1 -17,-17 L0,17 a17,17 0 0 1 17,-17 Z"></path></g>
				<g transform="translate(9,9)">
				<g stroke="#ffffff" style="pointer-events: none;"
					transform="translate(0,8)">
				<path d=" M0,0  L11,0 " transform="translate(2.5,7.5)"></path></g>
				<g fill="#000000" style="pointer-events: none;"
					transform="translate(17,8)">
				<g display="none"></g></g></g>
				<title id="id-37-title">Zoom Out</title></g></g></g>
				<g>
				<g>
				<g aria-hidden="true">
				<g>
				<g fill="#000000" transform="translate(0,44) rotate(-90)">
				<g display="none"></g></g>
				<g stroke="#000000" stroke-opacity="0.15" fill="none" display="none"
					transform="translate(0,88)" opacity="0" visibility="hidden"
					aria-hidden="true">
				<path transform="translate(-0.5,-0.5)"
					d=" M0,0  L1480.02,0  L1506.0008,-15 "></path></g>
				<g>
				<g>
				<g fill="#000000" aria-label="L" fill-opacity="0" opacity="0"
					stroke-opacity="0" style="pointer-events: none;"
					transform="translate(0,44)" display="none">
				<g transform="translate(-18,-11)" style="user-select: none;">
				<text x="0" y="21.609375" dy="-5.835">
				<tspan>L</tspan></text></g></g></g></g>
				<g stroke="#000000" stroke-opacity="0" fill="none"
					style="pointer-events: none;">
				<path d=" M0,0  L0,88 " transform="translate(-0.5,-0.5)"></path></g></g></g></g></g>
				<g transform="translate(1480.0201,0)">
				<g></g></g></g></g>
				<g>
				<g transform="translate(0.0001,0)"></g></g>
				<g transform="translate(0,88)">
				<g transform="translate(0.0001,0)">
				<g aria-hidden="true">
				<g>
				<g stroke="#000000" stroke-opacity="0" fill="none"
					style="pointer-events: none;">
				<path d=" M0,0  L1480.02,0 " transform="translate(-0.5,-0.5)"></path></g>
				<g>
				<g>
				<g fill="#000000" aria-label="L" fill-opacity="0" opacity="0"
					stroke-opacity="0" style="pointer-events: none;"
					transform="translate(740.01,20)">
				<g transform="translate(-4,10)" style="user-select: none;">
				<text x="0" y="21.609375" dy="-5.835">
				<tspan>L</tspan></text></g></g>
				<g fill="#000000" transform="translate(61.665,20)">
				<g transform="translate(-15,10)" style="user-select: none;">
				<text x="0" y="21.609375" dy="-5.835">
				<tspan>USA</tspan></text></g></g>
				<g fill="#000000" transform="translate(185.003,20)">
				<g transform="translate(-20.5,10)" style="user-select: none;">
				<text x="0" y="21.609375" dy="-5.835">
				<tspan>China</tspan></text></g></g>
				<g fill="#000000" transform="translate(308.34,20)">
				<g transform="translate(-21,10)" style="user-select: none;">
				<text x="0" y="21.609375" dy="-5.835">
				<tspan>Japan</tspan></text></g></g>
				<g fill="#000000" transform="translate(431.67,20)">
				<g transform="translate(-32,10)" style="user-select: none;">
				<text x="0" y="21.609375" dy="-5.835">
				<tspan>Germany</tspan></text></g></g>
				<g fill="#000000" transform="translate(555.007,20)">
				<g transform="translate(-10.5,10)" style="user-select: none;">
				<text x="0" y="21.609375" dy="-5.835">
				<tspan>UK</tspan></text></g></g>
				<g fill="#000000" transform="translate(678.345,20)">
				<g transform="translate(-23.5,10)" style="user-select: none;">
				<text x="0" y="21.609375" dy="-5.835">
				<tspan>France</tspan></text></g></g>
				<g fill="#000000" transform="translate(801.675,20)">
				<g transform="translate(-17.5,10)" style="user-select: none;">
				<text x="0" y="21.609375" dy="-5.835">
				<tspan>India</tspan></text></g></g>
				<g fill="#000000" transform="translate(925.013,20)">
				<g transform="translate(-19.5,10)" style="user-select: none;">
				<text x="0" y="21.609375" dy="-5.835">
				<tspan>Spain</tspan></text></g></g>
				<g fill="#000000" transform="translate(1048.35,20)">
				<g transform="translate(-43.5,10)" style="user-select: none;">
				<text x="0" y="21.609375" dy="-5.835">
				<tspan>Netherlands</tspan></text></g></g>
				<g fill="#000000" transform="translate(1171.68,20)">
				<g transform="translate(-22.5,10)" style="user-select: none;">
				<text x="0" y="21.609375" dy="-5.835">
				<tspan>Russia</tspan></text></g></g>
				<g fill="#000000" transform="translate(1295.018,20)">
				<g transform="translate(-43.5,10)" style="user-select: none;">
				<text x="0" y="21.609375" dy="-5.835">
				<tspan>South Korea</tspan></text></g></g>
				<g fill="#000000" transform="translate(1418.355,20)">
				<g transform="translate(-26.5,10)" style="user-select: none;">
				<text x="0" y="21.609375" dy="-5.835">
				<tspan>Canada</tspan></text></g></g>
				<g fill="#000000" display="none" transform="translate(1541.685,20)">
				<g transform="translate(0,10)" display="none"></g></g></g></g>
				<g stroke="#000000" stroke-opacity="0.15" fill="none" display="none"
					transform="translate(1480,-88)" opacity="0" visibility="hidden"
					aria-hidden="true">
				<path transform="translate(-0.5,-0.5)"
					d=" M25.9808,-15  L0,0  L0,88 "></path></g>
				<g fill="#000000" transform="translate(740,42)">
				<g display="none"></g></g></g></g></g></g></g></g></g></g>
				<g></g></g></g>
				<g>
				<g>
				<g role="tooltip" visibility="hidden" opacity="0">
				<g fill="#ffffff" fill-opacity="0.9" stroke-width="1"
					stroke-opacity="1" stroke="#ffffff"
					filter="url(&quot;#filter-id-67&quot;)"
					style="pointer-events: none;" transform="translate(0,6)">
				<path
					d="M3,0 L3,0 L0,-6 L13,0 L21,0 a3,3 0 0 1 3,3 L24,8 a3,3 0 0 1 -3,3 L3,11 a3,3 0 0 1 -3,-3 L0,3 a3,3 0 0 1 3,-3"></path></g>
				<g>
				<g fill="#ffffff" style="pointer-events: none;"
					transform="translate(12,6)">
				<g transform="translate(0,7)" display="none"></g></g></g></g>
				<g visibility="hidden" display="none" style="pointer-events: none;">
				<g fill="#ffffff" opacity="1">
				<rect width="1536" height="600"></rect></g>
				<g>
				<g transform="translate(768,300)">
				<g>
				<g stroke-opacity="1" fill="#f3f3f3" fill-opacity="0.8">
				<g>
				<g>
				<path
					d=" M53,0  a53,53,0,0,1,-106,0 a53,53,0,0,1,106,0 M42,0  a42,42,0,0,0,-84,0 a42,42,0,0,0,84,0 L42,0 "></path></g></g></g>
				<g stroke-opacity="1" fill="#000000" fill-opacity="0.2">
				<g>
				<g>
				<path
					d=" M50,0  a50,50,0,0,1,-100,0 a50,50,0,0,1,100,0 M45,0  a45,45,0,0,0,-90,0 a45,45,0,0,0,90,0 L45,0 "></path></g></g></g>
				<g fill="#000000" fill-opacity="0.4">
				<g transform="translate(-19.5,-11)" style="user-select: none;">
				<text x="19.5px" y="21.609375" dy="-5.835" text-anchor="middle">
				<tspan>100%</tspan></text></g></g></g></g></g></g>
				<g opacity="0.3" aria-labelledby="id-82-title"
					filter="url(&quot;#filter-id-82&quot;)" style="cursor: pointer;"
					transform="translate(0,154)">
				<g fill="#ffffff" opacity="0">
				<rect width="66" height="21"></rect></g>
				<g>
				<g shape-rendering="auto" fill="none" stroke-opacity="1"
					stroke-width="1.7999999999999998" stroke="#3cabff">
				<path
					d=" M15,15  C17.4001,15 22.7998,15.0001 27,15 C31.2002,14.9999 33.2999,6 36,6 C38.7001,6 38.6999,10.5 40.5,10.5 C42.3001,10.5 42.2999,6 45,6 C47.7001,6 50.9999,14.9999 54,15 C57.0002,15.0001 58.7999,15 60,15"></path></g>
				<g shape-rendering="auto" fill="none" stroke-opacity="1"
					stroke-width="1.7999999999999998"
					stroke="url(&quot;#gradient-id-85&quot;)">
				<path
					d=" M6,15  C8.2501,15 9.7498,15.0001 15,15 C20.2502,14.9999 20.7748,3.6 27,3.6 C33.2252,3.6 33.8998,14.9999 39.9,15 C45.9002,15.0001 45.9748,15 51,15 C56.0252,15 57.7499,15 60,15"></path></g></g>
				<title id="id-82-title">Chart created using amCharts library</title></g>
				<g role="tooltip" visibility="hidden" opacity="0">
				<g fill="#000000" fill-opacity="1" stroke-width="1"
					stroke-opacity="1" stroke="#000000" style="pointer-events: none;"
					transform="translate(15,118)">
				<path
					d="M0,0 L0,0 L0.00009999999999976694,0 L10,0 L20,0 a0,0 0 0 1 0,0 L20,10 a0,0 0 0 1 -0,0 L0,10 a0,0 0 0 1 -0,-0 L0,0 a0,0 0 0 1 0,-0"></path></g>
				<g>
				<g fill="#ffffff" style="pointer-events: none;"
					transform="translate(25,118)">
				<g transform="translate(0,5)" display="none"></g></g></g></g>
				<g role="tooltip" visibility="hidden" opacity="0">
				<g fill="#000000" fill-opacity="1" stroke-width="1"
					stroke-opacity="1" stroke="#000000" style="pointer-events: none;"
					transform="translate(-25,30)">
				<path
					d="M0,0 L20,0 a0,0 0 0 1 0,0 L20,0 L20,0 L25,0 L20,10 L20,10 a0,0 0 0 1 -0,0 L0,10 a0,0 0 0 1 -0,-0 L0,0 a0,0 0 0 1 0,-0"></path></g>
				<g>
				<g fill="#ffffff" style="pointer-events: none;"
					transform="translate(-15,30)">
				<g transform="translate(0,5)" display="none"></g></g></g></g>
				<g role="tooltip" opacity="0" aria-describedby="id-257"
					transform="translate(200.0021,76.596)" aria-hidden="true"
					visibility="hidden">
				<g fill="#6794dc" fill-opacity="0.9" stroke-width="1"
					stroke-opacity="1" stroke="#ffffff"
					filter="url(&quot;#filter-id-141&quot;)"
					style="pointer-events: none;" transform="translate(6,-16.5)">
				<path
					d="M3,0 L59,0 a3,3 0 0 1 3,3 L62,30 a3,3 0 0 1 -3,3 L3,33 a3,3 0 0 1 -3,-3 L0,30 L0,21.5 L-6,16.5 L0,11.5 L0,3 a3,3 0 0 1 3,-3"></path></g>
				<g>
				<g fill="#000000" style="pointer-events: none;"
					transform="translate(37,-16.5)">
				<g transform="translate(-19,7)" style="user-select: none;">
				<text x="0" y="21.609375" dy="-5.835">
				<tspan>1,882</tspan></text></g></g></g></g></g></g></g></g></svg>
		</div>
	</div>
	
	
	<script>
	var myChart = new Chart(ctx, {
		  type: 'doughnut',
		    data: {
		      datasets: [{
		        data: [40, 60],      // 섭취량, 총급여량 - 섭취량
		        backgroundColor: [
		          '#9DCEFF',
		          '#F2F3F6'
		        ],
		        borderWidth: 0,
		        scaleBeginAtZero: true,
		      }
		    ]
		  },
		});
	</script>
	
	    <script src="${pageContext.request.contextPath}/resources/js/core.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/charts.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/animated.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
    <script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/serial.js"></script>
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>
</body>
</html>