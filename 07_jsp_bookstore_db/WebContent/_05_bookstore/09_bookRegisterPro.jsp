<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<% 
	request.setCharacterEncoding("utf-8");
%>

<%
	String realFolder="";	// 웹 어플리케이션상의 절대 경로
	String filename="";
	MultipartRequest imageUp = null;
	
	String saveFolder="_05_bookstore/imageFile";	// 파일이 업로드 되는 폴더 지정
	String encType = "utf-8";
	int maxSize = 2*1024*1024;	// 최대 업로드될 파일크기 5MB
	
	ServletContext context = getServletContext();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>