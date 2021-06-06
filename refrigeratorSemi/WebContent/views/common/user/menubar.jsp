<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.refrigerator.common.model.vo.PageInfo, 
				 java.util.ArrayList, 
				 com.refrigerator.recipe.model.vo.Recipe,
				 com.refrigerator.member.model.vo.Member"%>

<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	//ArrayList<Recipe> list = (ArrayList<Recipe>)request.getAttribute("list");
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
        height: 105px;
        margin: 0;
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
        margin: 0 0 0 230px;
        
		/* Jaewon */
		display:flex;
        width:520px;
        justify-content:space-between;      
    }
    .navigation-secondary_menu_item{
        position: relative;
        text-decoration: none;
        display: inline-block;
        cursor: pointer;
        font-size: 15px;
        margin: 8px 0px;
        font-weight: 700;
        padding: 6px 20px;
        color: #424242;
    }
    
    /* Jaewon 각각 메뉴들 위치가 바뀌었을시의 위치잡기용 */
    /*.menu{position: absolute;}*/
    .menu1{width:55px;}
    .menu2{width:100px;}
    .menu3{width:85px;}
    .menu4{width:85px;}
    .menu5{width:100px;} 
    
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

                    <!--중앙 메인로고-->
                    <div class="navigation-first_logo">
                        <a href=""><img style="width: 100px; height: 50px;" src="<%=contextPath%>/resources/css/mainIcon.png">
                        </a>
                    </div>

                    <!--중앙 검색창 form -->
                    <form action="<%=contextPath %>/search.main?currentPage=1" method="post">
                    <div class="navigation-search">
                        <div class="navigation-search_content">
                            <input type="text" name="searchWord" value="${param.searchWord}" placeholder="알고 싶은 레시피나 가진 재료로 검색해보세요!">
                            <button class="btn-search" type="submit"><img style="width: 20px; height: 20px;" src="<%=contextPath%>/resources/css/searchicon.png"></button>
                        </div>
                    </div>
                    </form>

                </div>

            </div>

            <!-- 메뉴바 + 로그인 -->
            <div class="navigation-secondary-warp">
                
                <div class="navigation-secondary_content"> <!--flex--> 
                
                	<!-- Jaewon 네브 메뉴 순서 변경 기능 삽입 완료 -->
					<script>
					$(function(){						
						$.ajax({ 
							url : "select.nav",
							type:"post", 
							success: function(list){ 
								var homeMenu = $('a[class="navigation-secondary_menu_item menu menu1"]');
								var categoryMenu = $("a[class='navigation-secondary_menu_item menu menu2']");
								var eventMenu = $("a[class='navigation-secondary_menu_item menu menu3']");
								var recipeMenu = $("a[class='navigation-secondary_menu_item menu menu4']");
								var csMenu = $("a[class='navigation-secondary_menu_item menu menu5']");
																
								$(homeMenu).css('order',list[0].menuOrder)
								$(categoryMenu).css('order',list[1].menuOrder)
								$(eventMenu).css('order',list[2].menuOrder)
								$(recipeMenu).css('order',list[3].menuOrder)
								$(csMenu).css('order',list[4].menuOrder)
							},
							error:function(){
								console.log("ajax통신실패");
								alert("예상치 못한 오류로 인해 조회가 불가합니다 개발자에게 문의하세요")
							}
						})
					})
					</script>

                    <!--메뉴바-->
                    <nav class="navigation-secondary_menu">
                        <a class="navigation-secondary_menu_item menu menu1">홈</a>
                        <a class="navigation-secondary_menu_item menu menu2">카테고리</a>
                        <a class="navigation-secondary_menu_item menu menu3" href="<%=contextPath%>/list.event?currentPage=1">이벤트</a>
                        <a class="navigation-secondary_menu_item menu menu4" href="<%=contextPath%>/recipeList.recipe?currentPage=1">레시피</a>
                        <a class="navigation-secondary_menu_item menu menu5" href="<%=contextPath%>/list.no?currentPage=1">고객센터</a>
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
                                            <li><a href="<%=contextPath%>/updateForm.pro"">마이페이지</a></li>
                                            <li><a href="<%=contextPath%>/logout.member">로그아웃</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="<%=contextPath%>/myInfo.me" class="navigation-login-area_item"><%= loginUser.getUserId() %></a></li>
                                    <li><a href="<%=contextPath%>/enroll.rcp" class="navigation-login-area_item" id="write">글쓰기</a></li>
                                </ul>
                            	
                            <% }%>
                        </div>

                    </div>

                </div>
            </div>
            
        </div>
        <!-- Jaewon 예지님 최근본레시피 뽑아가시기 편하게 만든 스크립트  -->
       	<script>
		// 쿠키에 저장된 값을 뽑아오는 메소드
		function getCookie(cookie_name) {
			  var x, y;
			  var val = document.cookie.split(';');
	
			  for (var i = 0; i < val.length; i++) {
			    x = val[i].substr(0, val[i].indexOf('='));
			    y = val[i].substr(val[i].indexOf('=') + 1);
			    x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
			    if (x == cookie_name) {
			      return unescape(y); // unescape로 디코딩 후 값 리턴
			    }
			  }
		}
		
		$(function(){
			var recentRecipe = getCookie("recentRecipeNo");
			sessionStorage.setItem("recentRecipeNo", getCookie("recentRecipeNo"));
		})
		</script>
        
        
    </header>

</body>
</html>