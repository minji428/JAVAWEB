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
	int height = Integer.parseInt(request.getParameter("height"));
	int parents = Integer.parseInt(request.getParameter("parents"));
	String result = "";
	if(height>=120){
		result = "놀이기구 이용가능합니다";
	}else if(height <120){
		if(parents == 1){
			result="놀이기구 이용가능합니다";
		}else if(parents == 0){
			result="놀이기구를 이용할 수 없습니다";
		}
	}
%>
<h2><%=result %></h2>
<button onclick="location.href='Ex06.jsp'">뒤로가기</button>

</body>
</html>