<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String contextPath = request.getContextPath();

%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>안녕하세요 테스트입니다.</h1>
	
	<!-- @author seong 후에 레시피 조회 페이지와 연동할 예정 -->
	<div><a href="<%=contextPath%>/list.recipe">레시피 상세 페이지</a></div>
	
	<!-- @author yeji 추후 수정할 예정입니다. -->
	<div><a href="<%=contextPath%>/list.no">공지사항 페이지</a></div>
	
</body>
</html>