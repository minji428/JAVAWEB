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
	<% request.setCharacterEncoding("UTF-8"); %>
	
	<jsp:useBean id="board" class="_03_board.BoardDTO">
		<jsp:setProperty name="board" property="*" />
	</jsp:useBean>
	
	<%
		BoardDAO.getInstance().replyBoardWrite(board);
		response.sendRedirect("04_boardList.jsp");
	%>
</body>
</html>