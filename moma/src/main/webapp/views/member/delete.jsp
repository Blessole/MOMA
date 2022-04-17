<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result>0 }">
	<script type="text/javascript">
<<<<<<< HEAD
		
		alert("탈퇴처리 되었습니다");
		
		var preUrl = document.referrer.split("/")[6];
		if (preUrl == "adMember.bb") {
			location.href="/moma/views/admin/adMember.bb";
		}
		else location.href="/moma/views/content/momaMain.so";
		
=======
		var preUrl = document.referrer.split("/")[6];
		alert("탈퇴처리 되었습니다");
		
		if (preUrl == "updateForm.bb") {
			location.href="../content/momaMain.so";
		}
>>>>>>> branch 'main' of https://github.com/Blessole/MOMA.git
	</script>
</c:if>

<c:if test="${result==0 }">
	<script type="text/javascript">
		alert("탈퇴 실패\n다시 시도해주세요");
		history.go(-1);
	</script>
</c:if>
</body>
</html>