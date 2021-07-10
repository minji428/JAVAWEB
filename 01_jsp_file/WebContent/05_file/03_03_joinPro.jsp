<%@page import="_05_user.UserDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="_05_user.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>
	<%
		UserDTO user = new UserDTO();
		user.setId(request.getParameter("id"));
		user.setPw(request.getParameter("pw"));
		user.setName(request.getParameter("name"));
		Date d = new Date();
		//String str = d.toString();
		//System.out.println("현재날짜 : "+str);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-hh-mm");
		//System.out.println("포맷후 현재날짜 : "+sdf.format(d));
		user.setReg_date(sdf.format(d));
		boolean idCheck = UserDAO.getInstance().checkUserId(user);
		
		if(idCheck){
	%>
		<script>
			alert("중복아이디 입니다");
			window.location.href="03_02_join.jsp";
		</script>	
	<%	}else{
		UserDAO.getInstance().insertUser(user);
		}%>
		<script>
		alert("회원가입을 축하합니다");
		window.location.href="03_01_userMain.jsp";
		</script>
</body>
</html>