<%@page import="_05_user.UserDAO"%>
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
	request.setCharacterEncoding("utf-8");
%>
	<h2>로그인처리페이지</h2>
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		boolean check = UserDAO.getInstance().checkUserIdPw(id, pw);
	%>
	<%
		if(check){
			session.setAttribute("log", id);
			// 세션의 유효시간 설정으로 1분 후 자동 세션이 삭제된다
			session.setMaxInactiveInterval(1*60); //1min
			%>
			<script>
				alert('로그인이 되었습니다');
				//window.location.href="주소 "와 동일한 코드이다
				location.href="03_01_userMain.jsp";
			</script>
		<%}else{
			%>
			
			<script>
				alert('아이디와 패스워드를 확인해주세요');
				location.href="03_04_login.jsp";
			</script>
		<%}
	%>
</body>
</html>