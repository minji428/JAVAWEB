<%@page import="_03_board.BoardDAO"%>
<%@page import="_03_board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
</head>
<body>
	<%
		int num = Integer.parseInt(request.getParameter("num"));
	
		BoardDTO board = BoardDAO.getInstance().getOneBoard(num);
	%>
	
	<div align = "center">
		<h2>게시글 보기</h2>
		<table border="1">
			<tr height="40">
				<td align="center" width="120">글 번호</td>
				<td align="center" width="180"><%=board.getNum() %></td>
				<td align="center" width="120">조회수</td>
				<td align="center" width="180"><%=board.getReadCount() %></td>
			</tr>
			<tr height="40">
				<td align="center" width="120">작성자</td>
				<td align="center" width="180"><%=board.getWriter() %></td>
				<td align="center" width="120">작성일</td>
				<td align="center" width="180"><%=board.getRegDate() %></td>
			</tr>
			<tr height="40">
				<td align="center" width="120"> 이메일 </td>
				<td align="center" colspan="3"> <%= board.getEmail() %></td>
			</tr>
			<tr height="40">
				<td align="center" width="120"> 제목 </td>
				<td align="center" colspan="3"> <%= board.getSubject() %></td>
			</tr>
			<tr height="80">
				<td align="center" width="120"> 글 내용 </td>
				<td align="center" colspan="3"> <%= board.getContent() %></td>
			</tr>
			<tr height="40">
				<td align="center" colspan="4">
					
					<input type="button" value="답글쓰기" onclick="location.href='10_boardReplyWrite.jsp?num=<%= board.getNum() %>'">
					<input type="button" value="수정하기" onclick="location.href='06_boardUpdate.jsp?num=<%= board.getNum() %>'" >
					<input type="button" value="삭제하기" onclick="location.href='08_boardDelete.jsp?num=<%= board.getNum() %>'" >
					<input type="button" value="목록보기" onclick="location.href='04_boardList.jsp'" >
				</td>
			</tr>
		</table>
	</div>
</body>
</html>