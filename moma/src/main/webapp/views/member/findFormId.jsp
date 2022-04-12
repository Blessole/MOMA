<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">@import url("/moma/css/member/join.css");</style>
</head><body>
<div class="container">
	<div class="find find-id">
		<h2 class="title">아이디 찾기</h2>
		<form action="findIdAction.bb" method="post">
			<input type="text" name="mname" placeholder="이름을 입력주세요." required="required"><p>
			<input type="text" name="email" placeholder="이메일 주소를 입력해주세요." required="required"><p>
		<div class="container_submit">
			<input type="submit" class="btn" value="확인하기">
		</div>
		</form>
		<a class="btn1" href="loginForm.bb">로그인</a>
		<a class="btn3" href="findFormPw.bb">비밀번호 찾기</a>
	</div>
</div>
</body>
</html>