<%@page import="_01joindb1.MemberDTO"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
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
		ArrayList<MemberDTO> memberList = new ArrayList<MemberDTO>();
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			String jdbcUrl = "jdbc:mysql://localhost:3306/joindb01?serverTimezone=UTC&useSSL=false";
			String dbId = "root";
			String dbPw = "root";
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(jdbcUrl, dbId, dbPw);
			
			String sql = "SELECT * FROM member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				MemberDTO member = new MemberDTO();
				
				member.setId(rs.getString("id"));
				member.setPw(rs.getString("pw"));
				member.setName(rs.getString(3));	//name
				member.setRegDate(rs.getTimestamp(4));
				
				memberList.add(member);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(conn != null){try{conn.close();}catch(SQLException e){}}
			if(pstmt != null){try{pstmt.close();}catch(SQLException e){}}
			if(rs != null){try{rs.close();}catch(SQLException e){}}	
		}
	%>
	
	<table border="1">
		<tr>
			<td>아이디</td>
			<td>패스워드</td>
			<td>이름</td>
			<td>가입일</td>
		</tr>
		<%for(MemberDTO member : memberList){%>
			<tr>
				<td><%=member.getId() %></td>
				<td><%=member.getPw() %></td>
				<td><%=member.getName() %></td>
				<td><%=member.getRegDate() %></td>
		<%} %>
	</table>
	<a href="00_main.jsp">메인으로 돌아가기</a>
</body>
</html>