<%@page import="_03_board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% request.setCharacterEncoding("utf-8");%>
	
	<jsp:useBean id="board" class="_03_board.BoardDTO">
		<jsp:setProperty name="board" property="*"/>
	</jsp:useBean>
	
	<%
		BoardDAO boardDAO = BoardDAO.getInstance();
		String pw = boardDAO.getPw(board.getNum());
		
		if(pw.equals(board.getPw())){
			boardDAO.updateBoard(board);
			response.sendRedirect("04_boardList.jsp");
		}else{
	%>
		<script>
			alert("비밀번호를 확인해주세요");
			history.go(-1);
		</script>
	<%	} %>
</body>
</html>