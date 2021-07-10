<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8"); %>
	<jsp:useBean	id="member" class="_06_bean.Member">
		<jsp:setProperty name="member" property="*"/>
	</jsp:useBean>
	
	<%
	String[] arr = request.getParameterValues("hobby");
	String hobby="";
	for(int i=0; i<arr.length; i++){
		hobby += arr[i];
		if(i!= arr.length -1){
			hobby += ",";
		}
	}
	member.setHobby(hobby);
	%>
	<table border="1">
		<tr>
			<td>아이디</td>
			<td><%=member.getId() %></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><%=member.getPw() %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=member.getName() %></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><%= member.getGender() %></td>
		</tr>
		<tr>
			<td>취미</td>
			<td><%= member.getHobby() %></td>
		</tr>
	</table>
</body>
</html>