<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="common.css">
</head><body>
	<div class="container">
		<!-- prevUrl 로그인누르기 전 이전페이지로 이동. javascript:history.go(-1)도 가능한가? -->
		<!-- <form action="loginAction.bb" method="post"> -->
		<form action="loginAction.bb?prevUrl=${prevUrl}" method="post">
			<h1 class="title">LOGIN</h1>
			<hr>
			<p>
			<!-- input -->
			<input type="text" name="id" required="required"
				autofocus="autofocus" placeholder="아이디"> 
			<input type="password" name="password" required="required" placeholder="비밀번호">
			<input type="submit" value="LOGIN">
		</form>
		<a class="btn" href="joinForm.bb">회원가입</a>
		<a class="btn" href="findFormId.bb">아이디 찾기</a>
		<a class="btn" href="findFormPw.bb">비밀번호 찾기</a>
	</div>
</body>
</html>