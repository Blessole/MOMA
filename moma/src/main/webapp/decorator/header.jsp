<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><html>
<c:set var="id" value='${sessionScope.id}'/>
<head><meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/common.css">
</head><body>   
	<header>
		<div class='header_inner'>
			<div class='header_logo'>
				<a href="/views/content/momaMain.so"><img src='/img/momalogo.jpg'></a>
			</div>
			<nav>
				<ul class='nav_sub'>
					<c:if test="${empty id }">
						<li><a href="/views/member/loginForm.bb">로그인</a></li>
						<li><a href="/views/member/joinForm.bb">회원가입</a></li>
					</c:if>
					<c:if test="${not empty id }">
						<c:if test="${id != 'admin'}">
							<li><a href="/views/member/logout.bb">로그아웃</a></li>
						</c:if>
						<c:if test="${id == 'admin'}">
							<li><a href="/views/member/logout.bb">로그아웃</a></li>
							<li><a href="/views/admin/adminMain.so">관리자페이지</a></li>
						</c:if>
					</c:if>
				</ul>
				<ul class='nav_main'>
					<li><a href="/views/content/movieMain.so" id="movie">영화</a></li>
					<li><a href="/views/content/dramaMain.so" id="drama">드라마</a></li>
					<li><a href="/views/board/boardMain.ha?pageNum=1" id="board">저널게시판</a></li>
					<li><a href="/views/myPage/myMain.bb" id="myPage">마이페이지</a></li>
				</ul>
			</nav>
		</div>
	</header>
</body>
</html>