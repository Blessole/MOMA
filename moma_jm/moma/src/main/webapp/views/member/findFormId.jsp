<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css"></style>
</head><body>
<div class="container">
	<div class="find find-id">
		<h2 class="title">아이디 찾기</h2>
		<hr>
		<form action="findIdAction.bb" method="post">
			<input type="text" name="mname" placeholder="이름을 입력주세요." required="required"><p>
			<input type="text" name="email" placeholder="이메일 주소를 입력해주세요." required="required"><p>
			<input type="submit" class="btn" value="아이디 확인하기"><p>
		</form>
		<a class="btn btn_stroke" href="loginForm.bb">로그인</a>
		<a class="btn btn_stroke" href="findFormPw.bb">비밀번호 찾기</a>
	</div>
</div>
</body>
</html>