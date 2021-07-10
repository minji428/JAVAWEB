<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>2차원 반복문</title>
</head>
<body>
	<h2>차원반복문</h2>
	<%
		int k=4;
		for(int i=0; i<5; i++){ 
			for(int j=k; j>0; j--){ %>
				&nbsp;
			<% }
			for(int j=0; j<i+1; j++){ %>
				*
			<%} %>
			<br>
		<%
			k--;
		}%>
		
</body>
</html>