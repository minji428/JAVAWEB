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
		session.removeAttribute("log");	// 특정세션을 지정해서 삭제하기
		session.invalidate();			// 모든 세션 지우기
	%>
	<script>
		alert("로그아웃 되었습니다");
		location.href="03_01_userMain.jsp";
	</script>
</body>
</html>