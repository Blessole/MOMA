<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result>0 }">
	<script type="text/javascript">
		alert("리뷰가 삭제 되었습니다");
		location.href="/views/myPage/myReviewList.bb";
	</script>
</c:if>

<c:if test="${result==0 }">
	<script type="text/javascript">
		alert("리뷰 삭제 실패\n다시 시도해주세요");
		history.go(-1);
	</script>
</c:if>
</body>
</html>