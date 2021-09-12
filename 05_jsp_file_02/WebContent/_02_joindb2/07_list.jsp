<%@page import="_02joindb2.MemberDAO"%>
<%@page import="_02joindb2.MemberDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>회원목록</h2>
	<%
		ArrayList<MemberDTO> memberList = MemberDAO.getInstance().getMemberList();
	%>
	<table border="1">
		<tr>	
			<td>아이디</td>
			<td>패스워드</td>
			<td>이름</td>
			<td>가입일</td>
		</tr>
	<%for(MemberDTO member : memberList){ %>
		<tr>
			<td><%=member.getId() %></td>
			<td><%=member.getPw() %></td>
			<td><%=member.getName() %></td>
			<td><%=member.getRegDate() %></td>
		</tr>
	<%} %>
	</table>
	
	<a href="00_main.jsp">메인으로 돌아가기</a>
</body>
</html>