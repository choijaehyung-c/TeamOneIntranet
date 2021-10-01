<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery.js"></script> 
<script>
	$(document).ready(function(){
 		connectWs();
 	});
 
 	let socket = null; 
 	function connectWs(){
 		
 	let ws = new Websocket("ws://localhost/cEcho");
 	socket = ws;
 	
 	ws.onopen = function(){
 		console.log('connection opened');
 	}
 	
 	ws.onmessage = function(event){
 		console.log(event.data+'\n');
 	}
 	
 	ws.onclose = function(event){
 		console.log('connection close');
 		setTimeout(function(){connectWs();},1000);
 	}
 	ws.onerror = function(err){console.log('Error : '+err);}
 	}
 	//if(socket)
 	//socket.send()
</script>

</head>
<body>

</body>
</html>