<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*, dao.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	MemberDao md = MemberDao.getInstance();
	
	for (int i = 0; i < 50; i++) {
		Member member = new Member();
		
		member.setId("hjhjhj");
		member.setPassword("1111");
		member.setEmail("@@@");
		member.setMname("현정"+i);
		member.setNickname("현정"+i);
		member.setPhone("010-0000-0000");
		member.setSms_check("y");
		member.setEmail_check("y");
		
		md.insert(member);
	}
%>
</body>
</html>