<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>회원가입</h2>
	
	<%--
		# post방식은 아래와 같이 주소상에 노출되는 값이 없다
		http://localhost:8080/01_jsp_file_01_basic_file/_03_form_post/_03_04_formPro.jsp
	 --%>
	 
	 <form method="post" action="03_04_formPro.jsp">
	 	<p>아이디 : <input type="text" name="id"></p>
	 	<p>패스워드 : <input type="text" name="pw"></p>
	 	<p><input type="submit" value="회원가입"></p>
	 </form>
</body>
</html>