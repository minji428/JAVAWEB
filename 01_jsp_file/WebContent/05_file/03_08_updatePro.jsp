<%@page import="_05_user.UserDTO"%>
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
	<%=request.getParameter("id") %>
	
	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("passwd");
		String name = request.getParameter("name");
		System.out.println(id);
		System.out.println(pw);
		System.out.println(name);
		boolean check = UserDAO.getInstance().checkUserIdPw(id, pw);
		if(check == true){
			UserDTO user = UserDAO.getInstance().getUserId(id);
			user.setId(id);
			user.setPw(pw);
			user.setName(name);
			UserDAO.getInstance().updateUser(user);
	%>
		<script>
			alert("내용이 수정되었습니다");
			location.href="03_01_userMain.jsp";
		</script>
	<%	}else{%>
			<script>
				alert("아이디와 비밀번호를 확인해주세요");
				location.href="03_01_userMain.jsp";
			</script>
	<%	} %>
</body>
</html>