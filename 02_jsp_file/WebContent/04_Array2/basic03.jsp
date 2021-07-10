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
		  예)
		  ###
		  ###
		  ###
</pre>

<%
	for(int i=0; i<3; i++){
		for(int j=0; j<3; j++){
			out.print("#");
		}
		out.println("<br>");
	}
	out.println("<br>");
%>

<pre>
	문제1)
	#
	##
	###
</pre>
<%
	for(int i=0; i<3; i++){
		for(int j=0; j<=i; j++){
			out.print("#");
		}
		out.println("<br>");
	}
	out.println("<br>");
%>
<pre>
	문제2)
	###
	##
	#
</pre>
<%
	for(int i=0; i<3; i++){
		for(int j=3; j>i; j--){
			out.print("#");
		}
		out.println("<br>");
	}
	out.println("<br>");
%>
<pre>
	문제3)
	@##
	@@#
	@@@
</pre>
<%
	for(int i=0; i<3; i++){
		for(int j=0; j<=i; j++){
			out.print("@");
		}
		for(int j=2; j>i; j--){
			out.print("#");
		}
		out.println("<br>");
	}
	out.println("<br>");
%>
<pre>
	문제4)
	  #  
	 ###
	#####
</pre>
<%
	int k=0;
	for(int i=0; i<3; i++){
		for(int j=2; j>i; j--){
			out.print("&nbsp;&nbsp;");
		}
		for(int j=0; j<=k; j++){
			out.print("#");
		}
		out.println("<br>");
		k+=2;
	}
%>
</body>
</html>