<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- [주석] [기본 셋팅 하기]

[character setting] 
1. Window-> preference -> General -> workspace -> other-> utf-8
2. Window-> preference -> Web -> enc 검색 -> html -> utf-8
3. Window-> preference -> Web -> enc 검색 -> css -> utf-8
4. Window-> preference -> Web -> enc 검색 -> utf-8

[server setting]
5. Window -> Show view -> Server -> tomcat 8.5

[chrome setting]
6. Window -> Web browser -> 3.chrome

-->
<!-- 맨 처음에 폴더를 생성하려면
File -> New -> Dynamic Web Project 클릭해서 생성 -->

<!-- 서버가 오류나면
Project Explorer에서 Servers를 지운다  (Delete project Contents on disk 체크)
그리고 다시 서버를 연결해준다	
 -->

<!-- 서버가 한번 꼬이면 jsp가 실행이 안될 수도 있는데
그때는 프로젝트에서 마우스 왼쪽 -> Build Path -> Configure Build Path
	-> Java Build Path의 Libraries -> JRE System Library
	-> WorkSpace default JRE
왼쪽에서 Project Facets -> Runtimes -> 오류난 서버 체크 지우고 새로 만든 서버 클릭하기
  -->


</body>
</html>