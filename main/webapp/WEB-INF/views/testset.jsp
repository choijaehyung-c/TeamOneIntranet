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
<select>
      <option :key="i" :value="d.v" v-for="(d, i) in list">{{ d.v }}</option>
</select>
</div>

<script src="${pageContext.request.contextPath}/resources/vue/vue.js"></script>
<script type="${pageContext.request.contextPath}/resources/"></script>
</body>
</html>