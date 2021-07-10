<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이름과 나이를 입력하세요</h2>
	
	<!-- method에는 post와 get이 있는데
		method를 안쓰면 그냥 get이 된다
		둘의 차이점은 get을 쓰게되면 실행시켰을 때 위 url창에 ? 뒤에 입력한 데이터들이 & 표시로 나타난다
		하지만 method를 쓰게되면 암호화 처리 되어 나타나지 않는다 
	 -->
	<form method="post" action="03_01_requestPro.jsp">
	이름 : <input type="text" name="name"><br>
	나이 : <input type="text" name="age"><br>
		<input type="submit" value="입력완료">
	</form>
</body>
</html>