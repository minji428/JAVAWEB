<%@page import="com.green.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정하기</title>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8"); %>
	
	<jsp:useBean id="boardDTO" class="com.green.board.BoardDTO">
		<jsp:setProperty name="boardDTO" property="*" />
	</jsp:useBean>
	
	<% 
		BoardDAO.getInstance().boardUpdate(boardDTO);
	
		response.sendRedirect("04_boardList.jsp"); 
	%>
</body>
</html>