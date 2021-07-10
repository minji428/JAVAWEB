<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>과락</h2>
	<h4>문제</h4>
	
	<pre>
3과목의 평균이 60점 이상이면, 합격 출력
단, 어느 한 과목이라도 50점 미만이면 , 불합격 출력
	</pre>
	
	<%
		int kor = 100;
		int eng = 87;
		int math = 41;
		
		int total = kor + eng + math;
		double avg = total / 3.0;
		String pass="";
		
		boolean check = avg >= 60 && kor >=50 && eng >=50 && math >=50;
		
		if(check){
			pass="합격입니다";
		}else{
			pass="불합격입니다";
		}
	%>
	
	<h2>국어 : <%=kor %> 영어 : <%=eng %> 수학 : <%=math %></h2>
	<h2>결과는 <%=pass %></h2>
</body>
</html>