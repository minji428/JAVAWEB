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
		if(session.getAttribute("log") == null){
	%>
		<p><a href="07_list.jsp">회원목록</a></p>
		<p><a href="01_insert.jsp">회원가입</a>
		<p><a href="08_login.jsp">로그인</a>		
	<%
		}else{
	%>
		<p><a href="03_delete.jsp">회원삭제</a>
		<p><a href="05_update.jsp">회원수정</a>
		<p><a href="10_logout.jsp">로그아웃</a>
	<%		
		}
	%>
</body>
</html>