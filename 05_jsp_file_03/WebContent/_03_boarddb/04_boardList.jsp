<%@page import="_03_board.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
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
		BoardDAO boardDAO = BoardDAO.getInstance();
	
		int onePageArticlesCount = 10;
		
		int currentPageNumber = 1;
		if(request.getParameter("currentpageNumber")!=null){
			currentPageNumber = Integer.parseInt(request.getParameter("currentPageNumber"));
		}
		
		int allArticlesCount = boardDAO.getAllCount();
		
		int startRow = (currentPageNumber -1)*onePageArticlesCount;
		
		// startRow번 부터 onePageArticlesCount 개수 만큼 게시글을 꺼내오기
		ArrayList<BoardDTO> boardList = boardDAO.getBoardList(startRow, onePageArticlesCount);
		
		int number = allArticlesCount - startRow;
	%>
	<div align="center">
		<h2>전체 게시글 보기(<%=allArticlesCount %>개)</h2>
		<table border="1">
			<tr height="40">
				<td width="50" align="center">번호</td>
				<td width="320" align="center"> 제목 </td>
				<td width="100" align="center"> 작성자 </td>
				<td width="200" align="center"> 작성일 </td>
				<td width="50" align="center"> 조회수 </td>
			</tr>
		<%
			for(int i=0; i<boardList.size(); i++){
				BoardDTO board = boardList.get(i);
		%>
			<tr height="40">
				<td width="50" align="center"><%=number-- %></td>
				<td width="320">
				<%
					if(board.getReStep()>1){
						for(int j=0; j<(board.getReStep()-1)*5; j++) {
				%>
					&nbsp;
				<%
						}
					}
				%>
					<a href="05_boardInfo.jsp?num=<%=board.getNum() %>"style="text-decoration: none;">
						<%=board.getSubject() %>
					</a>
				</td>
				<td width="100" align="center"><%=board.getWriter() %></td>
				<td width="200" align="center"> <%=board.getRegDate() %> </td>
				<td width="50" align="center"><%=board.getReadCount() %></td>
			</tr>		
		<%
			}
		%>
		</table>
		<%
			// 전체 페이지 수
			int allPageCount = allArticlesCount / onePageArticlesCount;
			if(allArticlesCount % onePageArticlesCount != 0)
				allPageCount += 1;
			int clickablePageCount = 5;
			int startPageNum = 1;
			
			// 현재 페이지 번호가 (1~4 일때와 5일때)
			if(currentPageNumber % clickablePageCount != 0){
				startPageNum = (currentPageNumber / clickablePageCount) * clickablePageCount +1;
			}else{
				startPageNum  = (currentPageNumber / clickablePageCount-1)*clickablePageCount +1;
			}
			int endPageNum = startPageNum + clickablePageCount -1;
			if(endPageNum > allPageCount){
				endPageNum  = allPageCount;
			}
		%>
		<%
			if(startPageNum > clickablePageCount){
		%>
			[<a href="04_boardList.jsp?currentPageNumber=<%=startPageNum - clickablePageCount %>">이전</a>]
		<%
			}
		%>
		<%
			for(int i=startPageNum; i<=endPageNum; i++) {
		%>
				[<a href="04_boardList.jsp?currentPageNumber=<%= i %>"><%= i %></a>]
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
	</div>
</body>
</html>