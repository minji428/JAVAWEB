<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원정보를 입력하세요(useBean태그 사용 전)</h2>
	<form method="post" action="01_02_joinPro.jsp">
		<p>아이디<input type="text" name="id"></p>
		<p>비밀번호<input type="password" name="pw"></p>
		<p>이름<input type="text" name="name"></p>
		<p>나이<input type="text" name="age"></p>
		<p>성별<input type="radio" name="gender" value="women">여성
			<input type="radio" name="gender" value="men">남성</p>
		<p>취미<input type="checkbox" name="hobby" value="study">공부
			<input type="checkbox" name="hobby" value="movie">영화
			<input type="checkbox" name="hobby" value="sports">운동
		</p>
		
		<input type="submit" value="입력완료">
	</form>
</body>
</html>