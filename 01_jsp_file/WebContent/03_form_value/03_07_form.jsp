<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>form에서 값을 전달하는 방법</title>
</head>
<body>
	<%
		String id = "qwer";
		String pw = "1234";
	%>
	<form method="post" action="03_08_formSubmit.jsp">
		<%-- 방법3)
			input type의 button 속성값으로 전달하는 방법
			form태그 안에서 submit버튼은 한번만 사용 가능
			때문에 추가로 이동할 페이지를 설정해야 할 경우, button을 통해 이동 가능
			이때 전달할 값이 있을 경우 주소를 통해 [이름=값]의 형태로 전달이 가능
			button은 hidden으로 값을 넘길 수 없기 때문
		 --%>
		 
		 <input type="hidden" name="id" value="<%=id %>">
		 <input type="hidden" name="pw" value="<%=pw %>">
		 <input type="submit" value="서브밋으로 이동하기">
		 
		 <input type="button" value="버튼으로 이동하기"
		 onclick="window.location.href='03_09_formButton.jsp?id=<%=id %>&pw=<%= pw %>'">
	</form>
</body>
</html>