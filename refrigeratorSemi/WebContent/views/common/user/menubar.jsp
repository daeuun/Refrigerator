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

<style>
    .navigation-first-warp{
        height: 80px;
    }
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
        padding: 6px 20px 4px;
        color: #424242;
    }
    
    .navigation-first_logo, .navigation-search{
        text-align: center;
    }
    .navigation-login-area{
        display: inline-block;
        text-align: right;
        flex: 0 320px;
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
    
</style>
</head>
<body>
        
        
    
        <br clear="both">
        <br>

    <header clsss="navigation-bar">

            <!-- 로고 + 검색바-->
            <div class="navigation-first-warp">

                <div class="navigation-first_content">

                    <!--중앙로고-->
                    <div class="navigation-first_logo">
                        <a href="navigation-first_logo_icon">로고아이콘</a>
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
                        <a class="navigation-secondary_menu_item">이벤트</a>
                        <a class="navigation-secondary_menu_item">레시피</a>
                        <a class="navigation-secondary_menu_item">고객센터</a>
                    </nav>

                    <!--로그인-->
                    <div class="navigation-login-area">
                        
                        <div id="login-form" method="post">
                        
                        	<!--로그인 전 => 로그인버튼 -->
                        	<% if(loginUser == null){ %>
                        	
                        		<a href="<%= contextPath %>/loginView.me" class="navigation-login-area_item_login">로그인</a>
                            	<a href="" class="navigation-login-area_item">회원가입</a>
                            	
                            <!-- 로그인 후 => 프로필사진 + 닉네임 -->
                            <% }else { %>
                            	<a href="" class="navigation-login-area_item">프사</a>
                            	<a href="" class="navigation-login-area_item"><%= loginUser.getUserId() %></a>
	                            <a href="" class="navigation-login-area_item">글쓰기</a>
                            
                            <% }%>
                        </div>

                    </div>

                </div>
            </div>
            
        </div>
        
    </header>

</body>
</html>