<%@page import="_05_user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>메인페이지</h2>
	<%
		String log = (String)session.getAttribute("log");
		if(log != null){%>
			<p><%=log  %> 님, 환영합니다</p>
			<p><a href="03_06_logout.jsp">로그아웃</a></p>	<br>
			<p><a href="03_07_update.jsp">회원정보수정</a></p>	<br>
			<p><a href="03_09_delete.jsp">회원탈퇴</a></p>	<br>
		<%}else if(log==null){%>
			<p><a href="03_02_join.jsp">회원가입</a></p>		<br>
			<p><a href="03_04_login.jsp">로그인</a></p>		<br>
		<%} %>
</body>
</html>