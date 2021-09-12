<%@page import="_02joindb2.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		int result = MemberDAO.getInstance().deleteMember(id, pw);
		
		out.println("result = " + result + "<br>");
	%>
	<a href="00_main.jsp">메인으로 돌아가기</a>
</body>
</html>