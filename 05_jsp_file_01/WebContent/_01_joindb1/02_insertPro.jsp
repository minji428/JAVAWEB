<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="_01joindb1.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
	
	<jsp:useBean id="member" class="_01joindb1.MemberDTO">
		<jsp:setProperty name="member" property="*"/>
	</jsp:useBean>
	
	<%
		Timestamp regDate = new Timestamp(System.currentTimeMillis());
		member.setRegDate(regDate);
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try{
			// sql 서버 연결 코드
			// conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw); 까지 5줄
			String jdbcUrl = "jdbc:mysql://localhost:3306/joindb01?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "INSERT INTO member VALUES(?,?,?,now())";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getName());
			//pstmt.setTimestamp(4, member.getRegDate());
			
			pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn!=null){try{conn.close();}catch(SQLException e){}}
			if(pstmt!=null){try{pstmt.close();}catch(SQLException e){}}
		}
	%>
	<a href="00_main.jsp">메인으로 돌아가기</a>
</body>
</html>