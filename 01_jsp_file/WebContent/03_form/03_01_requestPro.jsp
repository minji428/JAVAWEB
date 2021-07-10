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
		// post 방식에 관한 한글 인코딩 처리
		request.setCharacterEncoding("utf-8");
	%>
	
	<%
		// request.getParameter('')를 사용해서 03_01_request에 저장되어 있던거를 불러온다
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		/*
			out은 java를 html로 변경시켜준다
			그래서 java에서 썼던 변수도 사용 가능하고 html에서 쓰던 <b>같은것도 사용이 가능하다
			
		*/
		if(age >= 20){
			out.println("<b>"+name+"</b>님의 나이는 20세 이상입니다");
		}else{ 
			out.println("<b>"+ name+"</b> 님은 미성년입니다");
		}
	%>
</body>
</html>