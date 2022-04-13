<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set var="id" value='${sessionScope.id}'></c:set>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// nav active control
	$(document).ready(function() { // window.onload보다 document.ready가 더 빠르고 안정적!
		var curUrl = window.location.href; // 현재 url가져오기
		var sliceUrl = curUrl.split("/")[6].split(".")[0]; // 필요한 부분만 슬라이스
		
		//$('.nav_main a').removeClass("active");
		$('#'+sliceUrl).addClass("active");
	}) 
</script>

</head>
<body>    
	<header>
		<div class='header_inner'>
			<div class='header_logo'>
				<a href="/moma/views/admin/adMain.bb"><img src='/moma/img/momalogo.jpg'></a>
			</div>
			<nav>
				<ul class='nav_sub'>
					<li><a href="/moma/views/member/logout.bb">로그아웃</a></li>
					<li><a href="/moma/views/content/momaMain.so">모마 홈페이지</a></li>
				</ul>
				<ul class='nav_main'>
					<li><a href="/moma/views/content/movieMain.so" id="movie">영화</a></li>
					<li><a href="/moma/views/content/dramaMain.so" id="drama">드라마</a></li>
					<li><a href="/moma/views/board/boardMain.ha?pageNum=1" id="board">저널게시판</a></li>
				</ul>
			</nav>
		</div>
	</header>
</body>

</html>