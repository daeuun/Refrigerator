<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script>
        $(document).ready(function(){
          $('.home-chef-wrap').bxSlider();
        });
    </script>
    <style>
        .home-section{
            margin: 30px;
        }
        
        .home-chef-wrap {text-align: center;}
        .home-chef li {display: inline-block;}
        .bx-wrapper {position: relative;}
        .bx-controls-direction {font-size: 60px;}
        .bx-controls-direction a {
            position: absolute;
            top: 50%;
            display: block; 
            width: 60px; 
            height: 70px; 
            overflow: hidden;
            transform: translateY(-50%);
            text-decoration: none;
            color: rgb(122, 122, 122);
        }
        .bx-controls-direction .bx-prev{left: 0;}
        .bx-controls-direction .bx-next{right: 0;}
        .bx-controls-direction .bx-prev:before{
            content: "\e93d"; 
            font-family: 'xeicon';
        }
        .bx-controls-direction .bx-next:before{
            content: "\e940"; 
            font-family: 'xeicon';
        }
        .bx-pager{
            position: absolute; 
            left: 0;
            bottom: -92px;
            width: 100%;
            text-align: center;
        }
        .bx-pager div{
            display: inline-block;
            padding: 5px;
        }
        .bx-pager div a{
            display: block;
            font-size: 0;
            color: transparent;
            width: 24px;
            height: 3px;
            background: #999;
        }
        .bx-pager div a.active{ background: #000;}
    </style>
</head>
<body>
	<div class="home-page">

        <div class="home-header">
            <!-- 헤더영역 배너 -->

            <div class="home-header_recipe">
                <!--레시피 배너-->
                <article>
                    <a class="main-recipe-link" href="레시피경로">
                        <div class="main-recipe_image-warp"> <!--메인 이미지-->
                            <img class="main-recipe_image" src="대표이미지경로">
                        </div>

                        <div class="main-recipe_content-warp"> <!--메인 내용(바로가기 버튼) -->
                            <div class="main-recipe_content"> <!--레시피 소개 영역-->
                                <div class="main-recipe_content-title"> <!--레시피 제목 텍스트-->
                                    요즘 유행하는 로제 떡볶이? <br>
                                    로제 스파게티 소스로 충분해!
                                </div>
                                <div class="main-recipe_content-profile"> <!--작성자 프로필-->
                                    <a class="main-recipe_content-profile-image" href="작성자 프로필 바로가기"></a>
                                </div>
                            </div>
                            <div class="main-recipe_content-more"> <!-- 바로가기 버튼 -->
                                레시피 보러가기
                            </div>
                        </div>
                    </a>
                </article>
            </div>
            
            <div class="home-header_banner-wrap">
                <!--이벤트/광고 슬라이드 배너-->
                <div class="home-header_banner-container"></div>
            </div>
        </div>

        <section class="home-section"> <!-- 재료 카테고리 -->
            <header class="home-section_header">
                <h2 class="home-section_header-title">제가 가진 재료는 이런 것이에요!</h2>
                <div class="home-section_header-content">재료를 선택해서 레시피를 검색해보세요.</div>
            </header>
            <div class="home-category-list-warp"> 

                <div class="home-category-item-wrap"> <!-- 재료 개별요소 (1) -->
                    
                    <a href="해당 재료 카테고리 페이지 경로"></a>

                    <div class="home-category-item"> <!-- 재료 이미지 -->
                        <img class="home-category-item_image" href="재료 이미지 경로"></img>
                    </div>
                    <div class="home-category-item_title"> <!-- 재료 텍스트 -->
                        고기
                    </div>
                </div>

                <div class="home-category-item-wrap"> <!-- 재료 개별요소 (2) -->
                    
                    <a href="해당 재료 카테고리 페이지 경로"></a>

                    <div class="home-category-item"> <!-- 재료 이미지 -->
                        <img class="home-category-item_image" href="재료 이미지 경로"></img>
                    </div>
                    <div class="home-category-item_title"> <!-- 재료 텍스트 -->
                        채소
                    </div>
                </div>

                <div class="home-category-item-wrap"> <!-- 재료 개별요소 (3) -->
                    
                    <a href="해당 재료 카테고리 페이지 경로"></a>

                    <div class="home-category-item"> <!-- 재료 이미지 -->
                        <img class="home-category-item_image" href="재료 이미지 경로"></img>
                    </div>
                    <div class="home-category-item_title"> <!-- 재료 텍스트 -->
                        해물
                    </div>
                </div>

            </div>
        </section>

        <section class="home-section home-viewRecipe"> <!-- 오늘의 레시피 -->
            <header class="home-section_header">
                <h2 class="home-section_header-title">오늘의 레시피</h2>
                <div class="home-section_header-content">냉장고에 뭐 있지? 에서많은 셰프가 이런 레시피를 봤어요.</div>
            </header>
            <div>
                <div class="home-viewRecipes_content"> <!-- 레시피 목록 -->
                    <div class="home-viewRecipe"> <!-- 레시피 (1) -->
                        <a class="home-viewRecipe_link" href="상세레시피경로">
                            <div>
                                <img class="home-viewRecipe_image" src="레시피대표이미지경로"> <!--레시피 대표 이미지-->
                                <div class="home-viewRecipe_content">
                                    <div class="home-viewRecipe_content-title">
                                        레시피 제목자리
                                    </div>
                                    <div class="home-viewRecipe_content-user">
                                        <img class="home-viewRecipe_content-user_img" src="유저프로필이미지경로">
                                        <span class="home-viewRecipe_content-user_name">
                                            유저닉네임~~
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="home-viewRecipe"> <!-- 레시피 (2) -->
                        <a class="home-viewRecipe_link" href="상세레시피경로">
                            <div>
                                <img class="home-viewRecipe_image" src="레시피대표이미지경로"> <!--레시피 대표 이미지-->
                                <div class="home-viewRecipe_content">
                                    <div class="home-viewRecipe_content-title">
                                        레시피 제목자리
                                    </div>
                                    <div class="home-viewRecipe_content-user">
                                        <img class="home-viewRecipe_content-user_img" src="유저프로필이미지경로">
                                        <span class="home-viewRecipe_content-user_name">
                                            유저닉네임~~
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="home-viewRecipe"> <!-- 레시피 (3) -->
                        <a class="home-viewRecipe_link" href="상세레시피경로">
                            <div>
                                <img class="home-viewRecipe_image" src="레시피대표이미지경로"> <!--레시피 대표 이미지-->
                                <div class="home-viewRecipe_content">
                                    <div class="home-viewRecipe_content-title">
                                        레시피 제목자리
                                    </div>
                                    <div class="home-viewRecipe_content-user">
                                        <img class="home-viewRecipe_content-user_img" src="유저프로필이미지경로">
                                        <span class="home-viewRecipe_content-user_name">
                                            유저닉네임~~
                                        </span>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>

                </div>
                <div class="home-section_more"> <!-- 더보기 버튼-->
                    <a class="home-section_more-btn" href="오늘의레시피 목록페이지 경로">더보기</a>
                </div>
            </div>
        </section>

        <section class="home-section home-starRecipe"> <!-- 쉐프가 선택한 레시피 -->
            <header class="home-section_header">
                <h2 class="home-section_header-title">쉐프가 선택한 레시피</h2>
                <div class="home-section_header-content">쉐프들의 마음을 사로잡은 레시피를 소개합니다.</div>
            </header>
            <div>
                <div class="home-starRecipes_content"> <!-- 레시피 목록 -->

                    <div class="home-starRecipe"> <!-- 레시피 (1) -->
                        <a class="home-starRecipe_link" href="상세레시피경로">
                            <div>
                                <div class="home-starRecipe_content">
                                    <div class="home-starRecipe_content-title">
                                        레시피 제목자리
                                    </div>
                                    <div class="home-starRecipe_content-user">
                                        <img class="home-starRecipe_content-user_img" src="유저프로필이미지경로">
                                        <span class="home-starRecipe_content-user_name">
                                            유저닉네임~~
                                        </span>
                                    </div>
                                </div>
                                <img class="home-starRecipe_image" src="레시피대표이미지경로"> <!--레시피 대표 이미지-->
                                <div class="home-starRecipe-more"> <!-- 바로가기 버튼 -->
                                    <span class="home-starRecipe-more_text">
                                        See more
                                    </span>
                                    <img class="home-starRecipe-more_img" src="더보기버튼이미지">
                                </div>
                            </div>
                        </a>
                    </div>

                    <div class="home-starRecipe"> <!-- 레시피 (2) -->
                        <a class="home-starRecipe_link" href="상세레시피경로">
                            <div>
                                <div class="home-starRecipe_content">
                                    <div class="home-starRecipe_content-title">
                                        레시피 제목자리
                                    </div>
                                    <div class="home-starRecipe_content-user">
                                        <img class="home-starRecipe_content-user_img" src="유저프로필이미지경로">
                                        <span class="home-starRecipe_content-user_name">
                                            유저닉네임~~
                                        </span>
                                    </div>
                                </div>
                                <img class="home-starRecipe_image" src="레시피대표이미지경로"> <!--레시피 대표 이미지-->
                                <div class="home-starRecipe-more"> <!-- 바로가기 버튼 -->
                                    <span class="home-starRecipe-more_text">
                                        See more
                                    </span>
                                    <img class="home-starRecipe-more_img" src="더보기버튼이미지">
                                </div>
                            </div>
                        </a>
                    </div>


                </div>
            </div>
        </section>

        <section class="home-section home-chefs"> <!-- 오늘의 쉐프 -->
            <header class="home-section_header">
                <h2 class="home-section_header-title">오늘의 쉐프</h2>
            </header>
            <div class="home-chefs-list-wrap">

                <div class="home-chef-wrap">

                    <div class="home-chef">쉐프모음페이지1
                        <li> <!-- 쉐프(1) -->
                            <a class="home-chef_image" href="쉐프프로필페이지" style="display:table-cell;padding:10px;" tabindex="0">
                                <img src="쉐프이미지경로">
                            </a>
                            <span class="home-chef_userNicname" id="chefFriend1_name" style="width:auto;">
                                쉐프 닉네임~~~~
                            </span>
                            <a href="" id="chefFriend1" class="home-chef_subBtn">
                                구독하기
                            </a>
                        </li>
                        <li> <!-- 쉐프(2) -->
                            <a class="home-chef_image" href="쉐프프로필페이지" style="display:table-cell;padding:10px;" tabindex="0">
                                <img src="쉐프이미지경로">
                            </a>
                            <span class="home-chef_userNicname" id="chefFriend1_name" style="width:auto;">
                                쉐프 닉네임~~~~
                            </span>
                            <a href="" id="chefFriend1" class="home-chef_subBtn">
                                구독하기
                            </a>
                        </li>
                        <li> <!-- 쉐프(3) -->
                            <a class="home-chef_image" href="쉐프프로필페이지" style="display:table-cell;padding:10px;" tabindex="0">
                                <img src="쉐프이미지경로">
                            </a>
                            <span class="home-chef_userNicname" id="chefFriend1_name" style="width:auto;">
                                쉐프 닉네임~~~~
                            </span>
                            <a href="" id="chefFriend1" class="home-chef_subBtn">
                                구독하기
                            </a>
                        </li>
                    </div>

                    <div class="home-chef">쉐프모음페이지2
                        <li> <!-- 쉐프(4) -->
                            <a class="home-chef_image" href="쉐프프로필페이지" style="display:table-cell;padding:10px;" tabindex="0">
                                <img src="쉐프이미지경로">
                            </a>
                            <span class="home-chef_userNicname" id="chefFriend1_name" style="width:auto;">
                                쉐프 닉네임~~~~
                            </span>
                            <a href="" id="chefFriend1" class="home-chef_subBtn">
                                구독하기
                            </a>
                        </li>
                        <li> <!-- 쉐프(5) -->
                            <a class="home-chef_image" href="쉐프프로필페이지" style="display:table-cell;padding:10px;" tabindex="0">
                                <img src="쉐프이미지경로">
                            </a>
                            <span class="home-chef_userNicname" id="chefFriend1_name" style="width:auto;">
                                쉐프 닉네임~~~~
                            </span>
                            <a href="" id="chefFriend1" class="home-chef_subBtn">
                                구독하기
                            </a>
                        </li>
                        <li> <!-- 쉐프(6) -->
                            <a class="home-chef_image" href="쉐프프로필페이지" style="display:table-cell;padding:10px;" tabindex="0">
                                <img src="쉐프이미지경로">
                            </a>
                            <span class="home-chef_userNicname" id="chefFriend1_name" style="width:auto;">
                                쉐프 닉네임~~~~
                            </span>
                            <a href="" id="chefFriend1" class="home-chef_subBtn">
                                구독하기
                            </a>
                        </li>
                    </div>
                    
                  </div>


            </div>
        </section>
    </div>
</body>
</html>