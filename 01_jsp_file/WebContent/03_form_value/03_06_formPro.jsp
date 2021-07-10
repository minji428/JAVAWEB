<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>from에서 값을 전달하는 방법</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		int age = Integer.parseInt(request.getParameter("age"));
		String email = request.getParameter("eamil");				
	%>
	
	<h2>아이디 : <%=id %></h2>
	<h2>패스워드 : <%= pw %></h2>
	<h2>나이 : <%=age %></h2>
	<h2>이메일 : <%= email %></h2>
</body>
</html>