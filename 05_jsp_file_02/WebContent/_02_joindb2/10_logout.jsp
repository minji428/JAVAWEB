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
		session.invalidate();
		out.print("로그아웃 되었습니다<br>");
	%>
	
	<a href="00_main.jsp">메인으로 돌아가기</a>
</body>
</html>