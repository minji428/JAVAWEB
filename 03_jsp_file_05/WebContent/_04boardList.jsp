<%@page import="com.green.board.BoardDAO"%>
<%@page import="com.green.board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>
	<%
		ArrayList<BoardDTO> boardList = BoardDAO.getInstance().getBoardList();
		// 전체 게시글 수
		int allArticlesCount = BoardDAO.getInstance().getAllCount();
		
		// 한 페이지에 보여줄 게시글 수
		int onePageArticlesCount = 5;
		if(session.getAttribute("onePageArticlesCount")!=null){
			onePageArticlesCount = ((Integer)session.getAttribute("onePageArticlesCount")).intValue();			
		}
		// 전체 페이지 수
		int allPageCount = allArticlesCount / onePageArticlesCount;
		if(allArticlesCount % onePageArticlesCount != 0){
			allPageCount += 1;
		}
		// 현재 페이지 번호
		int currentPageNumber = 1;
		if(request.getParameter("currentpageNumber") != null){
			currentPageNumber = Integer.parseInt(request.getParameter("currentPageNumber"));
		}
		
		// 현재 페이지의 게시글 시작 번호
		int startRow = (currentPageNumber -1)*onePageArticlesCount;
		// 현재 페이지의 게시글 마지막 번호
		int endRow = startRow + onePageArticlesCount;
		if(endRow > allArticlesCount) endRow = allArticlesCount;
	%>
	
	<div align="center">
		<h2>게시글 목록(<%= allArticlesCount %>개)</h2>
		<form method="get" action="_12updateBoardSize.jsp">
			<table border="1">
				<tr>
					<td colspan="5">
						한 페이지에 보여줄 게시글 수 
						<select name="onePageArticlesCount">
							<option value="5">5개씩</option>
							<option value="10">10개씩</option>
							<option value="15">15개씩</option>
							<option value="20">20개씩</option>
							<option value="30">30개씩</option>
							<option value="40">40개씩</option>
							<option value="50">50개씩</option>
						</select>
						
						<input type="submit" value="수정하기">
					</td>
				</tr>
				<tr>
					<td colspan="5"><a href="_01index.jsp">메인으로</a></td>
				</tr>
				<tr>
					<td colspan="5"><a href="_10dummySave.jsp">dummy 10개 추가하기</a></td>
				</tr>
				<tr>
					<td colspan="5"><a href="_11boardClear.jsp">전체 게시글 삭제</a></td>
				</tr>
				<tr>
					<td colspan="5" align="right"><a href="_02boardWrite.jsp">새 글쓰기</a></td>
				</tr>
				<tr>
					<td>번호</td>
					<td>작성자</td>
					<td>제목</td>
					<td>작성일</td>
					<td>조회수</td>
				</tr>
			<%	
				for(int i=startRow; i<endRow; i++) { 
					BoardDTO board = boardList.get(i);
			%>
				<tr>
					<td><%= board.getNum() %></td>
					<td><%= board.getWriter() %></td>
					<td><a href="_05boardInfo.jsp?num=<%= board.getNum() %>"><%= board.getSubject() %></a></td>
					<td><%= board.getRegDate() %></td>
					<td><%= board.getReadCount() %></td>
				</tr>
			<%	} %>
			</table>
			
			<%
			int clickablePageCount = 5;			
			int startPageNum = 1;
			
			// 현재 페이지 번호가 (1~4 일때와 5일때)
			if(currentPageNumber % clickablePageCount != 0){
				startPageNum = (currentPageNumber / clickablePageCount) * clickablePageCount + 1;
			}else{
				startPageNum = (currentPageNumber / clickablePageCount - 1) * clickablePageCount + 1;
			}
			int endPageNum = startPageNum + clickablePageCount  - 1;
			if(endPageNum > allPageCount){
				endPageNum = allPageCount;
			}
			%>
			<%
			if(startPageNum > clickablePageCount) {
			%>
				[<a href="_04boardList.jsp?currentPageNumber=<%= startPageNum - clickablePageCount %>">이전</a>]
			<%
			}
			%>
			<%
			for(int i=startPageNum; i<=endPageNum; i++) {
			%>
				[<a href="_04boardList.jsp?currentPageNumber=<%= i %>"><%= i %></a>]
			<%
			}
			%>
			<%
			if(allPageCount > endPageNum) {
			%>
				[<a href="_04boardList.jsp?currentPageNumber=<%= endPageNum + 1 %>">이후</a>]
			<%
			}
			%>
		</form>
	</div>
</body>
</html>