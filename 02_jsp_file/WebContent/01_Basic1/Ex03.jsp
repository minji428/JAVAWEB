<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>문제</h2>
	<h3># 가위 바위 보 게임[1단계]</h3>
	
	<%
		String com = "바위";
	%>
	<form action="Ex03pro.jsp">
		(가위) (바위) (보) 중에 한개의 값을 입력 : 
		<input type="text" name="input"/>
		
		<!-- (중요) form에서 입력받지 않은 값을 다음페이지로 이동시킬 때 hidden 사용 -->
		<input type="hidden" name="com" value="<%=com %>"/>
		
		<input type="submit" value="확인"/>
	</form>
</body>
</html>