<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
    int myPageNo = (int)request.getAttribute("myPageNo");
%>    
    <!-- 여기서 받아주면 된다 request.getAttribute로다가 !!!  -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- 작성자 : 재원      ※ 혹여나 해당 페이지에 작업시에 작업하신부분에 주석으로 성함과 영역을 표시해주세요! (혹여나 파일이 날라갈수있으니 push전에 백업부탁드려요~)  -->

<title>Insert title here</title>
<style>
        .inner-page{
            width: 1200px;
            margin: auto;
        }

        .navbar{
            width: 200px;
            height: 470px;
            margin-left: 65px;
            padding: 0px;
            padding-top: 20px;
            background-color: white;
            float: left;
        }

        .navbar span{
            font-size: 27px;
            font-weight: 900;
            padding-bottom: 35px;
        }

        .navbar-nav{
            width: 100%;
            height: 385px;
            margin: 0px;
            background-color: white;
        }

        .nav-item{
            width: 100%;
            height: 48px;
            border: 1px solid rgb(224,224,224);
            border-bottom: none;
            line-height: 32px;
            padding-left: 22px;
        }

        .navbar-nav:last-child{
            border-bottom: 1px solid rgb(224,224,224);
        }

        .nav-item a{
            color: rgb(127,127,127);
            font-size: 18px;
            font-weight: 700;
            position: relative;
        }

        .nav-item a:hover{
            color: orange;
            transform: scale(1.02);
        }

        .fa-chevron-right{
            position: absolute;
            top: 14px;
            right: 10px;
        }

        /* 각각의 페이지로 넘어가는 서블렛에서 !!! request.getRequestDispatcher로 forward해서 url요청을 하거나 혹은 
            재요청을 할때 !! request.setAttribute("myPageNo", 1);
            이런식으로 번호를 넘기면 해당 페이지에서 받아서 넣어주면 먹는다! 

            질문드렸는데 이 같이 해도된다 하신다!! 
         */
        .nav-item:nth-child(<%= myPageNo %>) a{    
            color: rgb(0,102,51);
        }

        .nav-item:nth-child(<%= myPageNo %>) {    
            background-color: rgb(241,241,241);
        }
        /*-- 기본적으로 outer에 flaot right 부여한 상태이다. --*/
        .outer{
            float: right;
        }
        /* ------------------------------------------------- */
</style>
</head>
<body>

    <div class="inner-page">
        <nav class="navbar">
            <!-- Links -->
            <span>마이페이지</span>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/myInfo.me" >회원정보수정<i class="fas fa-chevron-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="08myResentRecipePage.html">최근본레시피<i class="fas fa-chevron-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="09myScrapRecipePage.html">찜한레시피<i class="fas fa-chevron-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="10myRecipePage.html">내가 쓴 레시피<i class="fas fa-chevron-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="12myReplyPageWithModal.html">내 댓글 관리<i class="fas fa-chevron-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/updateForm.pro">프로필 수정<i class="fas fa-chevron-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/review.me?currentPage=1">후기&별점 관리<i class="fas fa-chevron-right"></i></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">팔로잉 관리<i class="fas fa-chevron-right"></i></a>
                </li>
            </ul>
        </nav>        
</body>
</html>