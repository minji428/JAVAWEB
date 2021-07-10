<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%
		// post 방식에 대한 한글처리이다
		// 반면, get 방식은 톰캣에서 알아서 한글 인코딩 처리를 해준다
		request.setCharacterEncoding("utf-8");
	%>
	
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	
	<h2>아이디 : <%=id %></h2>
	<h2>패스워드 : <%=pw %></h2>
</body>
</html>