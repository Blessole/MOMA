<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html><html><head>
<%@ include file="../sessionChk.jsp" %>
<meta charset="UTF-8"><title>Insert title here</title>
</head><body>

<c:if test="${result>0 }">
	<script type="text/javascript">
		alert("리뷰가 수정되었습니다.");
		location.href="/views/myPage/myReviewList.bb";
	</script>
</c:if>

<c:if test="${result<=0} ">
	<script type="text/javascript">
		alert("리뷰 수정 실패\n다시 시도해주세요")
		history.back();
	</script>
</c:if>

</body>
</html>