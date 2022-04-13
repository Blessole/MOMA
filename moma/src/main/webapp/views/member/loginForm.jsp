<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("../../css/member/join.css");</style>
</head><body>
	<div class="container">
		<!-- prevUrl 로그인누르기 전 이전페이지로 이동. javascript:history.go(-1)도 가능한가? -->
		<!-- <form action="loginAction.bb" method="post"> -->
		<!-- <div class="container_form"> -->
		<form action="loginAction.bb?prevUrl=${prevUrl}" method="post">
			<h1 class="title">L O G I N</h1>
			<!-- input -->
			<input type="text" name="id" required="required"
				autofocus="autofocus" placeholder="아이디"> 
			<input type="password" name="password" required="required" placeholder="비밀번호">
		<!-- </div> -->
		<div class="container_submit">
			<input type="submit" class="btn" value="로그인 하기">
		</div>
		</form>
		<a class="btn1" href="joinForm.bb">회원가입</a>
		<a class="btn2" href="findFormId.bb">아이디 찾기</a>
		<a class="btn2" href="findFormPw.bb">비밀번호 찾기</a>
	</div>
</body>
</html>