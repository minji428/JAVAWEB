<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8");%>
	
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		// db에서 eclipse로 가져오기 위해 변수가 하나 더 필요
		ResultSet rs = null;
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/joindb01?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT COUNT(*) FROM member WHERE id=? AND pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				int result = rs.getInt(1);
				
				if(result == 1){
					sql = "UPDATE member SET name=? WHERE id=?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, name);
					pstmt.setString(2, id);
					pstmt.executeUpdate();
					
					out.print("result = "+result+"<br>");
				}else{
					out.print("아이디와 패스워드를 확인해주세요.<br>");
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null){try{conn.close();}catch(SQLException e){}}
			if(pstmt != null){try{pstmt.close();}catch(SQLException e){}}
			if(rs != null){try{rs.close();}catch(SQLException e){}}
		}
	%>
	<a href = "00_main.jsp">메인으로 돌아가기</a>
</body>
</html>