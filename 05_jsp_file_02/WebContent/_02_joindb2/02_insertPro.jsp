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
	<% request.setCharacterEncoding("utf-8"); %>
	
	<jsp:useBean id="member" class="_02joindb2.MemberDTO">
		<jsp:setProperty name="member" property="*"/>
	</jsp:useBean>
	
	<%
		MemberDAO.getInstance().insertMember(member);
	%>
	
	<a href="00_main.jsp">메인으로 돌아가기</a>
</body>
</html>