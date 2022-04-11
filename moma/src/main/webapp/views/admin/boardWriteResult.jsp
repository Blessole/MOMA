<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			if (${action == 'insert'}) { // 글작성
				location.href = "boardMain.do?pageNum=1";
		</script>
	</c:if>
	
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			history.back();
		</script>
	</c:if>
</body>
</html>