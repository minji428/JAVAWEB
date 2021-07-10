<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2></h2>
	<%
	    String dbId = "qwer";
		String dbPw = "1111";
   	 %>

	<h3># 로그인[1단계]</h3>

	<h2>로그인</h2>
	<form method="post" action="Ex04pro.jsp">
		아이디 : <input type="text" name="id" /> <br>
		비밀번호 : <input type="password" name="pw" /> <br>
		<!-- (중요) form 에서 입력받지않은 값을 다음페이지로 이동시킬때  hidden 사용 -->
		<input type="hidden" name="dbId" value="<%=dbId %>" /> 
		<input type="hidden" name="dbPw" value="<%=dbPw %>" /> 
		<input type="submit" value="로그인">
	</form>
</body>
</html>