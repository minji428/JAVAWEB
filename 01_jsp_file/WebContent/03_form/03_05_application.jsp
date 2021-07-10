<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>application 내장객체</h2>
	
	<%
		String info = application.getServerInfo();
		String path = application.getRealPath("/");
		application.log("로그 기록 :" );
	%>
	
	웹 컨테이너의 이름과 버전 : <%=info %><p>
	웹 어플리케이션 폴더의 로컬 시스템 경로 : <%=path %>
	
	<!-- 어플리케이션은 새로운 장소를 제공? 하는데
	원래 가지고 있던 폴더의 위치는 사본이 되는것이고
	어플리케이션 폴더의 로컬 시스템 경로가 원본이 된다
	
	예를 들면 쇼핑몰 게시판에 문의글을 남겼을 때 사진을 올리게 되면 
	사진같은 것들은 원래 폴더에 저장되지 않고 어플리케이션 폴더의 로컬 시스템 경로에 저장된다 
	 -->
</body>
</html>