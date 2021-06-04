<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.refrigerator.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">

<style>
    .navigation-first-warp{
        height: 80px;
    }
    /*검색창*/
    .navigation-search{
        height: 45px;
        background-color: #009764;
        margin: 10px 0;
    }
    .navigation-search_content{
        position: relative;
        display: inline-block;
        border-bottom: 1px solid #fff;
        height: 40px;
        width: 650px;
    }
    .navigation-search input{
        display: inline-block;
        width: 350px;
        border: none;
        caret-color: #fff;
        background-color: #009764;
        outline: 0;
        margin: 8px 80px 8px 60px;
    }
    .navigation-search input::placeholder{
        text-align: center;
        color: #fff;
    }
    .navigation-search button{
        color: transparent;
        background-color: transparent;
        border: none;
        width: 30px;
        height: 30px;
        margin-right: -100px;
    }
    
    #login-form, #user-info{float:right}
    #user-info a{
        text-decoration: none;
        color: black;
        font-size: 12px;
    }
    .navigation-secondary_content{
        background: #fff;
        display: flex;
        justify-content: center; 
        height: 50px;
    }
    
    .navigation-secondary_menu {
        padding: 0 0 0 320px;
    }
    .navigation-secondary_menu_item{
        position: relative;
        text-decoration: none;
        display: inline-block;
        cursor: pointer;
        font-size: 15px;
        margin: 8px 10px;
        font-weight: 700;
        padding: 6px 20px;
        color: #424242;
    }
    
    
    .navigation-first_logo, .navigation-search{
        text-align: center;
    }
    .navigation-login-area{
        display: flex;
        text-align: center;
        flex: 0 420px;
    }
    
    .navigation-login-area_item{
        position: relative;
        text-decoration: none;
        display: inline-block;
        cursor: pointer;
        font-size: 15px;
        line-height: 23px;
        margin: 8px 4px;
        padding: 6px 5px 4px;
        color: #424242;
    }
    .navigation-login-area_item_login{
        color: #009764;
    }
    .navigation-secondary_menu_item:hover{
        color: #009764;
        text-decoration: none;
    }
    .navigation-first-warp, .navigation-secondary-warp{
        border-bottom: 1px solid #009764;
    }
    #write{
        border-radius: 5px;
        background-color: #009764;
        color: #fff;
        border: none;
        height: 36px;
        margin: 8pxpx;
        padding: 8px 10px 9px 10px;
    }
    #write:hover{
        text-decoration: none;
        color: #fff;
        background-color: rgb(106, 189, 161);
    }

    /*로그인후*/
    .login-area{
        margin-left: 40px;
        height: 100%;
        
    }
    .login-area a{
        text-decoration: none;
        color: #424242;
    }
    .login-area ul li{
        display: block;
        width: 90px;
        height: 30px;
        line-height: 53px;
        margin: 0;
    }
    .login-area>ul>li>a{
        display:block;
        height: 20px;
    }
    .login-area>ul>li>img{
        display:block;
        height: 20px;
    }
    ul li {
        float: left;
        list-style-type:none;
        padding-left: 0;
    }
    /*프로필사진 드롭박스*/
    .login-area>ul>li>ul{
        position: relative;
        z-index : 5;
        font-size: 14px;
        list-style-type:none;
        text-decoration: none;
        padding: 0;
        display: none;
        width: 150px;
    }
    .login-area>ul>li a:hover+ul{
        display: block;
    }
    .login-area>ul>li>a:hover+ul{display: block;}

    .login-area>ul>li>ul:hover{display:block;}
    
    #profileImg-outer{
        background-color: #fff;
        border-radius: 4px;
        width: 120px;
        height: 115px;
        padding: 0 0 0 10px;
        border: 1px solid #009764;
    }
    #profileImg-outer>li>a:hover{
        color: #009764;
        cursor: pointer;
    }

        
    

</style>
</head>
<body>
    <header clsss="navigation-bar">

            <!-- 로고 + 검색바-->
            <div class="navigation-first-warp">

                <div class="navigation-first_content">

                    <!--중앙로고-->
                    <div class="navigation-first_logo">
                        <a href=""">로고아이콘
                        </a>
                    </div>

                    <!--중앙검색바-->
                    <div class="navigation-search">
                        <div class="navigation-search_content">
                            <input type="text" placeholder="알고 싶은 레시피나 가진 재료로 검색해보세요!">
                            <button type="button"><img src="../../../resources/image/searchicon.png">검색버튼</button>
                        </div>
                        
                    </div>

                </div>

            </div>

            <!-- 메뉴바 + 로그인 -->
            <div class="navigation-secondary-warp">
                
                <div class="navigation-secondary_content"> <!--flex--> 

                    <!--메뉴바-->
                    <nav class="navigation-secondary_menu">
                        <a class="navigation-secondary_menu_item">홈</a>
                        <a class="navigation-secondary_menu_item">카테고리</a>
                        <a class="navigation-secondary_menu_item" href="<%=contextPath%>/list.event?currentPage=1">이벤트</a>
                        <a class="navigation-secondary_menu_item" href="<%=contextPath%>/recipeList.recipe?currentPage=1">레시피</a>
                        <a class="navigation-secondary_menu_item" href="<%=contextPath%>/list.no?currentPage=1">고객센터</a>
                    </nav>

                    <!--로그인-->
                    <div class="navigation-login-area">
                        
                        <div class="login-area" id="login-form" method="post">
                        
                        	<!--로그인 전 => 로그인버튼 -->
                        	<% if(loginUser == null){ %>
                        	
                        		<a href="<%= contextPath %>/loginView.me" class="navigation-login-area_item_login">로그인</a>
                            	<a href="<%= contextPath %>/insert.me" class="navigation-login-area_item">회원가입</a>
                            	
                            <!-- 로그인 후 => 프로필사진 + 닉네임 -->
                            <% }else { %>
                                <ul id="login-area_profile"> 
                                    <li id="lihover"><a href="">프사</a>
                                        <ul id="profileImg-outer">
                                            <li><a href="">최근본레시피</a></li>
                                            <li><a href="<%=contextPath%>/updateForm.pro">마이페이지</a></li>
                                            <li><a href="<%=contextPath%>/logout.member">로그아웃</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="<%=contextPath%>/myInfo.me" class="navigation-login-area_item"><%= loginUser.getUserId() %></a></li>
                                    <li><a href="" class="navigation-login-area_item" id="write">글쓰기</a></li>
                                </ul>
                            	
                            <% }%>
                        </div>

                    </div>

                </div>
            </div>
        </div>
        
    </header>

</body>
</html>