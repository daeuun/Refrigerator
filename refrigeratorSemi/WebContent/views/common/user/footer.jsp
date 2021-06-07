<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- inquiry 글작성하는것 !! servlet따와서 박으면된다.. 
	header에 로그인 정보가 있어야 아를 가지고 로그인 종고가 있네 없네를 판단해서 login 창으로 넘기거나 혹은 문의하기로 넘길텐데 일단 기다리자..
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- 작성자 : 재원      ※ 혹여나 해당 페이지에 작업시에 작업하신부분에 주석으로 성함과 영역을 표시해주세요! (혹여나 파일이 날라갈수있으니 push전에 백업부탁드려요~)  -->

<title>냉뭐? footer</title>
    <style>
        footer{width: 1200px; margin: auto; height: 150px; box-sizing: border-box; padding-top: 22px; clear: both;}
        footer{position: relative; bottom: -3400px;}/*author:다은 content영역이랑 안맞아서 위치 추가했습니다*/
        footer > div{margin-top: 30px;}
        footer a {text-decoration: none; color: black; padding: 2px; letter-spacing: -1.2px; font-weight: 500;}
        footer p{font-size: 10px;}
    </style>
</head>
<body>
    <footer align="center">
        <%-- 혹여나 contextPath변수를 header에서 세팅을 안하거나 header는 필요없으나 footer는 필요한 경우를 대비하여 함수로 작성하자--%>

        <div>
            <a href="<%= request.getContextPath() %>/tos.tos?page=service">이용약관</a> |
            <a href="<%= request.getContextPath() %>/tos.tos?page=personal">개인정보취급방침</a> |
            <a href="<%= request.getContextPath() %>/enrollForm.inq">문의하기</a>   
        </div>
        <p>Copyright 2021 What's in my refrigerator All rights reserved</p>
    </footer>
</body>
</html>