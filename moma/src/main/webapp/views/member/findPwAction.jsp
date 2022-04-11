<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
</head><body>
<div class="container">
	<h1 class="title">비밀번호 찾기 결과</h1>
		<c:if test="${result == 0 }">
			이메일을 정확하게 입력해주세요.<p>
		</c:if>
		<c:if test="${result > 0 }">
			비밀번호는 ${member.password } 입니다.<p>
		</c:if>
		<c:if test="${result < 0 }">
			존재하지 않는 회원입니다.<p>
		</c:if> 
		<a class="btn" href="loginForm.bb">로그인</a>
</div>
</body>
</html>