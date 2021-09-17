<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="vueZone1">
<select name='fruits'>
      <option v-for="dd in list" :value="dd.v" >{{ dd.v }}</option>
</select>
</div>

<script src="${pageContext.request.contextPath}/resources/vue/vue.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jsCJH.js"></script>
</body>
</html>