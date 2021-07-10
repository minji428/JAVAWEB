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
	int[] seat = (int[])session.getAttribute("seat");
	int count = (int)session.getAttribute("count");
	
	int seatNum = Integer.parseInt(request.getParameter("seatNum"));
	seatNum--;
	if(seat[seatNum] == 0){
		seat[seatNum]=1;
		seatNum++;
		count++;
		session.setAttribute("seat", seat);
		session.setAttribute("count", count);
	
%>
<script>
	alert(<%=seatNum %>+'번 좌석이 예매되었습니다');
	location.href='Ex04_01.jsp';
</script>
	<%}else{%>
<script>
	alert('이미 예매된 좌석입니다 다시 선택해주세요');
	location.href='Ex04_01.jsp';
</script>		
	<%} %>
</body>
</html>