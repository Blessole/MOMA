<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css"> @import url("../../css/content/reviewForm.css");
</style>
<script type="text/javascript">
	var bDisplay = true;
	function doDisplay(){
		var con = document.getElementById("review");
		if(con.style.display=='none'){
			con.style.display = 'block';
		}else{
			con.style.display = 'none';
		}
	}

</script>
</head>
<body>
<form action="reviewAction.do?cno=${content.cno }&mno=${member.mno}" method="post" name="frm">
		<a href="javascript:doDisplay();">등록하기</a><br/><br/>
		<div id="review" style="display:block">
		
		등록 폼 만들기
		
		</div>
</form>
</body>
</html>