<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<pre>
 세션 기본 예제 
 버튼을 한개 만들고 버튼 클릭할때마다
 숫자 1씩 증가하고 숫자가 5가 되었을 때 버튼 사라짐  
</pre>
<%
	int btn = 0;
	if(session.getAttribute("btn")==null){
		
	}else{
		btn = (int)session.getAttribute("btn");
	}
	if(btn < 5){%>
		<button onclick="<%btn++;
		session.setAttribute("btn", btn);%>
		<!-- 페이지이동시  값을 전달할때 ?을사용   (?변수=값) -->
		location.href='basic01.jsp?btn=<%=btn%>'"> 클릭 </button>
<%	} else{%>
		<h2>5번 클릭 성공!</h2>	
<%		session.invalidate();		// 세션 초기화 전부 지워짐
	} %>

</body>
</html>