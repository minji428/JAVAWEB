
<%@page import="_04_rentcar.RentcarDao"%>
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
			String id = request.getParameter("id");
			int seq = Integer.parseInt(request.getParameter("seq"));
			
			RentcarDao rdao = RentcarDao.getInstance();
			// 예약삭제 메소드 호출
			
			rdao.carRemoveReserve(id, seq);
			response.sendRedirect("01_carMain.jsp");
	%>
</body>
</html>