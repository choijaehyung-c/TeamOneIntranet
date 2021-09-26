<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" >
	<script src="${pageContext.request.contextPath}/resources/vue/vue.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jsIYJ.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/js.js"></script>
	
<title>Insert title here</title>
</head>
<body onLoad="chartMain()">

  <div class="container" id="mainVue">
  	<div class="row">
  		<div class="col-md-4">
  			<canvas id="myChartOne"></canvas>
  		</div>
  	</div>
  </div>
 
  <script >
  
  function gettingRanking(data){
	  
  
  	let myChartOne = document.getElementById('myChartOne').getContext('2d');
  	
  	let doughnut = new Chart(myChartOne,{
  		type:'doughnut',
  		data : {
  			labels:[data[0].od_prcode, data[1].od_prcode, data[2].od_prcode, data[3].od_prcode],
  			datasets :[{
  				label:'바울랩 매출액',
  				data : [
  					data[0].od_quantity,data[1].od_quantity,data[2].od_quantity,data[3].od_quantity,
  				],
  				backgroundColor:['red','skyBlue','pink','green'],
  				hoverBorderWidth : 8
  			}]
  		}
  	
  	});
  }
  </script>
</body>
</html>