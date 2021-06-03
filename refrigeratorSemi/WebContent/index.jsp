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
	
	<!-- Author : seong 5/29 -->
	<div><a href="<%=contextPath%>/rlist.admin?currentPage=1">관리자 댓글 관리 페이지</a></div>
	
	<!-- Author : seong 5/30 -->
	<div><a href="<%=contextPath%>/reviewlist.admin?currentPage=1">관리자 요리 후기 관리 페이지</a></div>
	
	
	<!-- @author leeyeji -->
	<div><a href="<%=contextPath%>/list.no?currentPage=1">공지사항 페이지</a></div>
	
	<!-- @author leeyeji -->
	<div><a href="<%=contextPath%>/list.faq?currentPage=1">FAQ 페이지</a></div>
	
	<!-- @author daeun -->
	<div><a href="<%=contextPath%>/menubar">메뉴바</a></div>
	
	<!-- @author daeun -->
	<div><a href="<%=contextPath%>/findId.me">아이디찾기</a></div>
	
	<!-- @author daeun -->
	<div><a href="<%=contextPath%>/findPwd.me">비밀번호재설정</a></div>
	
	<!-- @author daeun -->
	<div><a href="<%=contextPath%>/main">메인</a></div>
	
	<!-- @author daeun -->
	<div><a href="<%=contextPath%>/recipeView.main?currentPage=1">조회수 많은 레시피 목록 더보기버튼</a></div>
	
	
</body>
</html>