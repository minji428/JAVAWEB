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
		if(session.getAttribute("log") == null){
	%>		
		<p><a href="07_list.jsp">회원목록</a></p>
		<p><a href="01_insert.jsp">회원가입</a></p>
		<p><a href="08_login.jsp">로그인</a></p>
	<%
		}else{
	%>
		<p><a href="03_delete.jsp">회원삭제</a>
		<p><a href="05_update.jsp">회원수정</a>
		<p><a href="10_logout.jsp">로그아웃</a>	
	<%
		}
	%>
</body>
</html>
<%--
CREATE DATABASE joindb01;

USE joindb01;

CREATE TABLE member(
	id VARCHAR(20),
    pw VARCHAR(20),
    name VARCHAR(20),
    reg_date DATETIME
);

INSERT INTO member (id, pw, name, reg_date) VALUES ('qwwer', '1234', '홍길동', now());
INSERT INTO member (id, pw, name, reg_date) VALUES ('abcd', '1234', '박대길', now());

SELECT * FROM member;
--%>