<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
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

        /*재료카테고리*/
        .home-category ul{
            display: flex;
            margin: 60px 0 200px;
            padding: 0;
        }
        .home-category-item-wrap{ /*카테고리 개별요소*/
            display: inline-block;
            margin: 0 20px;
        }
        .home-category-item{ /*아이콘감싸는배경*/
            border: none;
            width: 80px;
            height: 80px;
            border-radius: 35px;
            background-color: rgb(247, 247, 247);
            text-align: center;
        }
        .home-category-item_title{ /*재료카테고리명*/
            display: block;
            margin: 6px 0 7px;
            font-size: 14px;
            text-align: center;
            font-weight: 500;
        }
        .home-category{
            margin: auto;
        }
        .home-category-item_image{

        }

        /*전체영역*/
        .home-outer{
            position: absolute;
            left: 50%;
            top: 50%;
            margin-left:-600px;
        }
        .join{
        position: relative;
        width:100%;
        height:100%;
        width:1200px;
        }
    
        /*타이틀*/
        .home-section_header-title{
            text-align: center;
            padding: 20px 0;
            margin: 20px 0;
        }
        .home-section_header-content{
            text-align: center;
        }

        /*오늘의 레시피*/
        .home-viewRecipes_content{ /*레시피전체*/
            text-align: center;
        }
        .home-viewRecipe{ /*개별레시피전체영역*/
            display: inline-block;
            padding: 10px;
            margin: 20px 5px;
            height: 300px;
        }
        .home-viewRecipe_image{
            width: 340px;
            height: 200px;
        }
        .home-viewRecipe_link{
            display: inline-block;
            width: 340px;
            height: 270px;
            text-decoration: none;
            color: #000;
            margin: 10px 0;
        }
        .home-viewRecipe_content-title, .home-viewRecipe_content-user{
            padding: 2px 0;
        }
        .home-section_more a{
            display: block;
            text-align: right;
            text-decoration: none;
            color: #009764;
            font-size: 18px;
            font-weight: 900;
            margin: 20px 45px;
        }
        .home-section_more{
            display: inline-block;
            width: 100%;
            margin: auto;
        }
        
    </style>
</head>
<body>

	<%@ include file="menubar.jsp" %>
    
    <div class="home-outer">

        <div class="join">

        

            <!-- 1. 상위 배너 영역 -->
            <div class="home-header">

                <!-- (1) 레시피 배너-->
                <div class="home-header_recipe">
                    
                    <article>
                        <a class="main-recipe-link" href="레시피경로">
                            
                            <!-- * 메인 이미지-->
                            <div class="main-recipe_image-warp"> 
                                <img class="main-recipe_image" src="대표이미지경로">
                            </div>

                            <!-- * 메인 내용(바로가기 버튼) -->
                            <div class="main-recipe_content-warp"> 

                                <!--레시피 소개 영역-->
                                <div class="main-recipe_content"> 
                                    <!--레시피 제목 텍스트-->
                                    <div class="main-recipe_content-title"> 
                                        요즘 유행하는 로제 떡볶이? <br>
                                        로제 스파게티 소스로 충분해!
                                    </div>

                                    <!--작성자 프로필-->
                                    <div class="main-recipe_content-profile"> 
                                        <a class="main-recipe_content-profile-image" href="작성자 프로필 바로가기"></a>
                                    </div>

                                </div>

                                <!-- 바로가기 버튼 -->
                                <div class="main-recipe_content-more"> 
                                    레시피 보러가기
                                </div>

                            </div>

                        </a>
                    </article>
                </div>
                
                <!-- (2) 이벤트/광고 슬라이드 배너-->
                <div class="home-header_banner-wrap">
                    <div class="home-header_banner-container"></div>
                </div>

            </div> 

            <!-- 2. 재료 카테고리 -->
            <nav class="home-section home-category"> 

                <header class="home-section_header">
                    <h2 class="home-section_header-title">제가 가진 재료는 이런 것이에요!</h2>
                    <div class="home-section_header-content">재료를 선택해서 레시피를 검색해보세요.</div>
                </header>

                <ul class="home-category-list-warp"> 

                    <li class="home-category-item-wrap">
                        <a href="해당 재료카테고리 결과페이지 경로"></a>
                        <!-- 재료 이미지 -->
                        <div class="home-category-item"> <img class="home-category-item_image" href="../../resources/main_icon/meat.png"></img></div>
                        <!-- 재료 텍스트 -->
                        <div class="home-category-item_title">고기</div>
                    </li>

                    <li class="home-category-item-wrap">
                        <a href="해당 재료카테고리 결과페이지 경로"></a>
                        <!-- 재료 이미지 -->
                        <div class="home-category-item"> <img class="home-category-item_image" href="../../resources/main_icon/meat.png"></img></div>
                        <!-- 재료 텍스트 -->
                        <div class="home-category-item_title">채소</div>
                    </li>

                    <li class="home-category-item-wrap">
                        <a href="해당 재료카테고리 결과페이지 경로"></a>
                        <!-- 재료 이미지 -->
                        <div class="home-category-item"> <img class="home-category-item_image" href="../../resources/main_icon/meat.png"></img></div>
                        <!-- 재료 텍스트 -->
                        <div class="home-category-item_title">해물</div>
                    </li>

                    <li class="home-category-item-wrap">
                        <a href="해당 재료카테고리 결과페이지 경로"></a>
                        <!-- 재료 이미지 -->
                        <div class="home-category-item"> <img class="home-category-item_image" href="../../resources/main_icon/meat.png"></img></div>
                        <!-- 재료 텍스트 -->
                        <div class="home-category-item_title">달걀/유제품</div>
                    </li>

                    <li class="home-category-item-wrap">
                        <a href="해당 재료카테고리 결과페이지 경로"></a>
                        <!-- 재료 이미지 -->
                        <div class="home-category-item"> <img class="home-category-item_image" href="../../resources/main_icon/meat.png"></img></div>
                        <!-- 재료 텍스트 -->
                        <div class="home-category-item_title">쌀/밀가루</div>
                    </li>

                    <li class="home-category-item-wrap">
                        <a href="해당 재료카테고리 결과페이지 경로"></a>
                        <!-- 재료 이미지 -->
                        <div class="home-category-item"> <img class="home-category-item_image" href="../../resources/main_icon/meat.png"></img></div>
                        <!-- 재료 텍스트 -->
                        <div class="home-category-item_title">콩/두부</div>
                    </li>

                    <li class="home-category-item-wrap">
                        <a href="해당 재료카테고리 결과페이지 경로"></a>
                        <!-- 재료 이미지 -->
                        <div class="home-category-item"> <img class="home-category-item_image" href="../../resources/main_icon/meat.png"></img></div>
                        <!-- 재료 텍스트 -->
                        <div class="home-category-item_title">과일</div>
                    </li>

                    <li class="home-category-item-wrap">
                        <a href="해당 재료카테고리 결과페이지 경로"></a>
                        <!-- 재료 이미지 -->
                        <div class="home-category-item"> <img class="home-category-item_image" href="../../resources/main_icon/meat.png"></img></div>
                        <!-- 재료 텍스트 -->
                        <div class="home-category-item_title">가공식품</div>
                    </li>

                    <li class="home-category-item-wrap">
                        <a href="해당 재료카테고리 결과페이지 경로"></a>
                        <!-- 재료 이미지 -->
                        <div class="home-category-item"> <img class="home-category-item_image" href="../../resources/main_icon/meat.png"></img></div>
                        <!-- 재료 텍스트 -->
                        <div class="home-category-item_title">버섯</div>
                    </li>

                    <li class="home-category-item-wrap">
                        <a href="해당 재료카테고리 결과페이지 경로"></a>
                        <!-- 재료 이미지 -->
                        <div class="home-category-item"> <img class="home-category-item_image" href="../../resources/main_icon/meat.png"></img></div>
                        <!-- 재료 텍스트 -->
                        <div class="home-category-item_title">김치</div>
                    </li>
                </ul>
            </nav>

            <!-- 3. 오늘의 레시피 == 조회수 높은 레시피 -->
            <section class="home-section"> 
                <header class="home-section_header">
                    <h2 class="home-section_header-title">오늘의 레시피</h2>
                    <div class="home-section_header-content">냉장고에 뭐 있지? 에서 많은 셰프가 이런 레시피를 봤어요.</div>
                </header>
                
                <div>

                    <div class="home-section_more"> <!-- 더보기 버튼-->
                        <a class="home-section_more-btn" href="오늘의레시피 목록페이지 경로">더보기</a>
                    </div>

                    <!-- 레시피 전체 목록 -->
                    <div class="home-viewRecipes_content"> 

                        <!-- 개별 레시피 (1) -->
                        <div class="home-viewRecipe"> 

                            <a class="home-viewRecipe_link" href="상세레시피경로">

                                <div>
                                    <!--레시피 대표 이미지-->
                                    <img class="home-viewRecipe_image" src="레시피대표이미지경로"> 
                                    
                                    <!--제목/작성자wrap-->
                                    <div class="home-viewRecipe_content">
                                        
                                        <!-- 레시피 제목 -->
                                        <div class="home-viewRecipe_content-title">
                                        요즘 유행하는 로제 떡볶이? <br>
                                        로제 스파게티 소스로 충분해!
                                        </div>

                                        <!-- 레시피 작성자-->
                                        <div class="home-viewRecipe_content-user">
                                            
                                            <!-- 프로필사진 -->
                                            <img class="home-viewRecipe_content-user_img" src="유저프로필이미지경로">

                                            <!-- 작성자 닉네임 -->
                                            <span class="home-viewRecipe_content-user_name">
                                                유저닉네임~~
                                            </span>

                                        </div>

                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- 개별 레시피 (1) -->
                        <div class="home-viewRecipe"> 

                            <a class="home-viewRecipe_link" href="상세레시피경로">

                                <div>
                                    <!--레시피 대표 이미지-->
                                    <img class="home-viewRecipe_image" src="레시피대표이미지경로"> 
                                    
                                    <!--제목/작성자wrap-->
                                    <div class="home-viewRecipe_content">
                                        
                                        <!-- 레시피 제목 -->
                                        <div class="home-viewRecipe_content-title">
                                        요즘 유행하는 로제 떡볶이? <br>
                                        로제 스파게티 소스로 충분해!
                                        </div>

                                        <!-- 레시피 작성자-->
                                        <div class="home-viewRecipe_content-user">
                                            
                                            <!-- 프로필사진 -->
                                            <img class="home-viewRecipe_content-user_img" src="유저프로필이미지경로">

                                            <!-- 작성자 닉네임 -->
                                            <span class="home-viewRecipe_content-user_name">
                                                유저닉네임~~
                                            </span>

                                        </div>

                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- 개별 레시피 (1) -->
                        <div class="home-viewRecipe"> 

                            <a class="home-viewRecipe_link" href="상세레시피경로">

                                <div>
                                    <!--레시피 대표 이미지-->
                                    <img class="home-viewRecipe_image" src="레시피대표이미지경로"> 
                                    
                                    <!--제목/작성자wrap-->
                                    <div class="home-viewRecipe_content">
                                        
                                        <!-- 레시피 제목 -->
                                        <div class="home-viewRecipe_content-title">
                                        요즘 유행하는 로제 떡볶이? <br>
                                        로제 스파게티 소스로 충분해!
                                        </div>

                                        <!-- 레시피 작성자-->
                                        <div class="home-viewRecipe_content-user">
                                            
                                            <!-- 프로필사진 -->
                                            <img class="home-viewRecipe_content-user_img" src="유저프로필이미지경로">

                                            <!-- 작성자 닉네임 -->
                                            <span class="home-viewRecipe_content-user_name">
                                                유저닉네임~~
                                            </span>

                                        </div>

                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- 개별 레시피 (1) -->
                        <div class="home-viewRecipe"> 

                            <a class="home-viewRecipe_link" href="상세레시피경로">

                                <div>
                                    <!--레시피 대표 이미지-->
                                    <img class="home-viewRecipe_image" src="레시피대표이미지경로"> 
                                    
                                    <!--제목/작성자wrap-->
                                    <div class="home-viewRecipe_content">
                                        
                                        <!-- 레시피 제목 -->
                                        <div class="home-viewRecipe_content-title">
                                        요즘 유행하는 로제 떡볶이? <br>
                                        로제 스파게티 소스로 충분해!
                                        </div>

                                        <!-- 레시피 작성자-->
                                        <div class="home-viewRecipe_content-user">
                                            
                                            <!-- 프로필사진 -->
                                            <img class="home-viewRecipe_content-user_img" src="유저프로필이미지경로">

                                            <!-- 작성자 닉네임 -->
                                            <span class="home-viewRecipe_content-user_name">
                                                유저닉네임~~
                                            </span>

                                        </div>

                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- 개별 레시피 (1) -->
                        <div class="home-viewRecipe"> 

                            <a class="home-viewRecipe_link" href="상세레시피경로">

                                <div>
                                    <!--레시피 대표 이미지-->
                                    <img class="home-viewRecipe_image" src="레시피대표이미지경로"> 
                                    
                                    <!--제목/작성자wrap-->
                                    <div class="home-viewRecipe_content">
                                        
                                        <!-- 레시피 제목 -->
                                        <div class="home-viewRecipe_content-title">
                                        요즘 유행하는 로제 떡볶이? <br>
                                        로제 스파게티 소스로 충분해!
                                        </div>

                                        <!-- 레시피 작성자-->
                                        <div class="home-viewRecipe_content-user">
                                            
                                            <!-- 프로필사진 -->
                                            <img class="home-viewRecipe_content-user_img" src="유저프로필이미지경로">

                                            <!-- 작성자 닉네임 -->
                                            <span class="home-viewRecipe_content-user_name">
                                                유저닉네임~~
                                            </span>

                                        </div>

                                    </div>
                                </div>
                            </a>
                        </div>

                        <!-- 개별 레시피 (1) -->
                        <div class="home-viewRecipe"> 

                            <a class="home-viewRecipe_link" href="상세레시피경로">

                                <div>
                                    <!--레시피 대표 이미지-->
                                    <img class="home-viewRecipe_image" src="레시피대표이미지경로"> 
                                    
                                    <!--제목/작성자wrap-->
                                    <div class="home-viewRecipe_content">
                                        
                                        <!-- 레시피 제목 -->
                                        <div class="home-viewRecipe_content-title">
                                        요즘 유행하는 로제 떡볶이? <br>
                                        로제 스파게티 소스로 충분해!
                                        </div>

                                        <!-- 레시피 작성자-->
                                        <div class="home-viewRecipe_content-user">
                                            
                                            <!-- 프로필사진 -->
                                            <img class="home-viewRecipe_content-user_img" src="유저프로필이미지경로">

                                            <!-- 작성자 닉네임 -->
                                            <span class="home-viewRecipe_content-user_name">
                                                유저닉네임~~
                                            </span>

                                        </div>

                                    </div>
                                </div>
                            </a>
                        </div>

                    </div>
                    

                </div>


            </section>

            <!-- 4. 쉐프가 선택한 레시피 == 별점 높은 레시피 -->
            <section class="home-section home-starRecipe"> 
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

            <!-- 5. 오늘의 쉐프 == 팔로우수 많은 쉐프 -->
            <section class="home-section home-chefs"> 
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
    </div>


</body>
</html>