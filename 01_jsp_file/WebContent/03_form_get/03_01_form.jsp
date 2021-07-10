<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원가입</h2>
	
	<%--
		# get방식은 아래와 같이 주소를 통해 전달되는 값이 모두 노출이 된다
		http://localhost:8080/01_jsp_file_01_basic_file/_03_form_get/_03_02_formPro.jsp?id=qwer&pw=1234
	 --%>
	 
	 <form method="get" action="03_02_formPro.jsp">
	 	<p>아이디 : <input type="text" name="id"></p>
	 	<p>패스워드 : <input type="text" name="pw"></p>
	 	<p><input type="submit" value="회원가입"></p>	 
	 </form>
</body>
</html>