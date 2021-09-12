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
	<%
	
		//	<jsp:useBean id="board" class="_03_board.BoardDTO">
		//		<jsp:setProperty name="board" property="*" />
		//	</jsp:useBean>
		// 위의 세줄이 int num ~ String pw와 같은 말
		int num = Integer.parseInt(request.getParameter("num"));
	
		String pw = request.getParameter("pw");
		
		String dbPw = BoardDAO.getInstance().getPw(num);
		
		if(pw.equals(dbPw)){
			BoardDAO.getInstance().deleteBoard(num);
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