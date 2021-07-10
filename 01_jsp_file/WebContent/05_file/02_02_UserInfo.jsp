<%@page import="_05_user.UserDTO"%>
<%@page import="_05_user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 페이지(사용자 정보)</title>
</head>
<body>
	<%
		String id = request.getParameter("id");
	
		UserDTO user = UserDAO.getInstance().getUserId(id);
	%>
	
	<h2>관리자 페이지(회원 정보 확인하기)</h2>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><%=user.getId() %></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><%= user.getPw() %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=user.getName() %></td>
		</tr>
		<tr>
			<td>가입날짜</td>
			<td><%=user.getReg_date() %></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="메인으로" onclick="window.location.href='02_01_adminMain.jsp'">
			</td>
		</tr>
	</table>
</body>
</html>