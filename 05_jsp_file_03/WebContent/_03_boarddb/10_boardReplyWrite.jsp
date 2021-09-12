<%@page import="_03_board.BoardDAO"%>
<%@page import="_03_board.BoardDTO"%>
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
		int num = Integer.parseInt(request.getParameter("num"));
	
		BoardDTO board = BoardDAO.getInstance().getOneBoard(num);
		
		int ref = board.getRef();
		int reStep = board.getReStep();
		int reLevel = board.getReLevel();
	%>
	
	<div align="center">	
		<h2>답변 작성하기</h2>
		<form action="11_boardReplyPro.jsp" method="post">
			<table border="1">
				<tr height="40">
					<td width="150" align="center">작성자</td>
					<td width="450"> <input type="text" name="writer" size="60"></td>
				</tr>
				<tr height="40">
					<td width="150" align="center"> 제목 </td>
					<td width="450"> <input type="text" name="subject" value="[답변]" size="60"> </td>
				</tr>
				<tr height="40">
					<td width="150" align="center"> 이메일 </td>
					<td width="450"> <input type="email" name="email" size="60"> </td>
				</tr>
				<tr height="40">
					<td width="150" align="center"> 비밀번호 </td>
					<td width="450"> <input type="password" name="pw" size="60"> </td>
				</tr>
				<tr height="40">
					<td width="150" align="center"> 글 내용 </td>
					<td width="450"> <textarea rows="10" cols="60" name="content"></textarea> </td>
				</tr>
				
				<tr height="40">
					<%--form에서 사용자로부터 데이터를 입력받지 않고 데이터를 넘김 --%>
					<td align="center" colspan="2">
						<input type="hidden" name="ref" value=<%=ref %>>			
						<input type="hidden" name="reStep" value=<%=reStep %>>			
						<input type="hidden" name="reLevel" value=<%=reLevel %>>			
						
						<input type="submit" value="답글쓰기완료"/>&nbsp;&nbsp;
						<input type="reset" value="취소"/>
						<input type="button" onclick="location.href ='04_boardList.jsp'" value="전체글 보기">
			</table>
		</form>
	</div>
</body>
</html>