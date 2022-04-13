<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<c:set var="id" value='${sessionScope.id}'/>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/moma/css/myPage/common_my.css");</style>
<%@ include file="../sessionChk.jsp"%>
</head>
<body>
	<div class="container_middle">
		<!-- adMainMenu -->
		<jsp:include page="adMain.jsp"></jsp:include>
		
		<div class="title">컨텐츠 관리</div>
		
	</div>
</body>
</html>