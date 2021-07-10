<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<pre>문제
놀이기구 이용제한
1. 키를 입력받는다
2. 입력받은 키가 120 이상이면, 놀이기구를 이용할 수 있다
3. 키가 120 미만이면, 놀이기구를 이용할 수 없다
4. 단, 부모님과 함께 온 경우 놀이기구 이용이 가능하다
	예) 부모님과 함께 오셨나요? (yes:1, no:0) 
</pre>

	<form action="Ex06pro.jsp">
		<h3>
			키를 입력하세요 <input type="number" name="height">
		</h3>
		부모님을 동반하였나요?
		<input type="radio" name="parents" value = "1"> 예
		&nbsp;&nbsp;&nbsp;
		<input type="radio" name="parents" value = "0"> 아니오
		&nbsp;&nbsp;&nbsp;
		<input type="submit" value="전송">
	</form>
</body>
</html>