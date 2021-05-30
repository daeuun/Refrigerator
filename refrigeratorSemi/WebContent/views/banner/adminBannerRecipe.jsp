<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="./jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="./bootstrapt/css/bootstrap.min.css" />
<script src="./bootstrapt/js/bootstrap.min.js"></script>
<title>Document</title>
<style>
    /* 사이드바 영역 */
    .side-nav{
        width: 150px;
        height: 900px;
        background: rgb(0, 153, 102);
        float: left;
    }
    .side-title button{
        text-align: left;
        color: white;
        font-size: 20px;
        padding-top: 10px;
        padding-left: 10px;
        font-weight: bold;
    }
    .side-title:hover{
        color: black;
        cursor: pointer;
    }
    #side-sub{
        margin-top: 3px;
        margin-left: 10px;
        background: white;
        width: 130px;
        border-radius: 5px;
        text-align: center;
        padding-bottom: 3px;
        display: none;
    }
    #side-sub a{
        font-size: 13px;
        color: black;
        text-decoration: none;
        display: inline-block;
    }
    #side-sub a:hover{
        color: rgb(0, 120, 51);
        font-weight: bold;
    }

    /* 본문 영역 */
    /* 상단 메뉴바 */
    .outer{
            width: 900px;
            height: 1000px;
            font-size: 16px;
    }
    .path-area{
            font-size:16px;
            
            color:rgb(155, 155, 155);  
    }
    .path-area>span{
            text-decoration: underline;  
            font-weight:500;
            color: black;  
    }
    /* 관리자 페이지 내부 - 레시피 목록 영역 */
    .banner-recipe-wrap{
        display: inline-block;
        width: 300px;
        height: 300px;
        margin: 20px 0 30px 45px;
    }
    .recipe_image-wrap{
        display: inline-block;
        width: 300px;
        height: 200px;
        background-color: sandybrown;
    }
    .recipe_content{
        width: 300px;
        margin: 5px 0;
    }
    .banner-recipe{
        margin: 0 0 0 150px;
        width: 1100px;
    }

    /* 관리자 페이지 내부 - 검색 영역 */
    .recipe-top-area{
        display: flex;
        height: 40px;
        padding: 4px 60px 4px 680px;
    }
    .recipe-search{
        width: 270px;
    }
    .recipe-search_input{
        float: left;
        box-sizing: border-box; 
        height: 35px; 
        width: 200px; 
        padding: 0 10px;
        line-height: 0; 
        border-radius: 4px 0 0 4px; 
        border: 1px solid #cccccc;
    }
    .recipe-search_input-icon{
        display: inline-block; 
        box-sizing: border-box; 
        border-radius: 0 4px 4px 0;
        height: 35px; 
        width: 40px;
        line-height: 0; 
        border: 0;
        background-color: rgb(0, 153, 102);
    }
    .recipe-search_btn{
        display: inline-block; 
        border: 0;
        border-radius: 4px;
        width: 80px;
        height: 35px;
        background-color: rgb(0, 153, 102);
        color: #fff;
        font-weight: 600px;
    }
    /*모달*/
    .modal_enroll, .modal_update { 
        display: inline-block;
        position: fixed; 
        left: 0; 
        top: 0; 
        width: 100%; 
        height: 100%; 
        background-color: rgba(0, 0, 0, 0.5); 
        opacity: 0; 
        visibility: hidden; 
        transform: scale(1.1); 
        transition: visibility 0s linear 0.25s, opacity 0.25s 0s, transform 0.25s; 
     } 
    .modal-content { 
        position: absolute; 
        top: 50%; 
        left: 50%; 
        transform: translate(-50%, -50%); 
        background-color: white; 
        padding: 10px 15px; 
        width: 600px; 
        height: 500px; 
        border-radius: 5px; 
     } 
    .show-modal { 
        display: inline-block;
        opacity: 1; 
        visibility: visible; 
        transform: scale(1.0); 
        transition: visibility 0s linear 0s, opacity 0.25s 0s, transform 0.25s; 
    }
    .close-btn { 
        float: right; 
        width: 25px;
        height: 25px;
        line-height: 20px; 
        text-align: center; 
        cursor: pointer; 
        border-radius: 3px; 
        background-color: lightgray; 
     }  
    .close-btn:hover { 
        background-color: darkgray; 
    }
    .modal-title{
        width: 100%;
        height: 60px;
        font-size: 25px;
        font-weight : 800;
        text-align: center;
    }
    .form-control, .modal select{ 
        display: block; 
        box-sizing: border-box; 
        width: 100%; 
        padding: 20px 10px; 
        line-height: 0; 
        border-radius: 4px; 
        border: 1px solid #cccccc;
    }
    .modal label, .modal select {
        margin: 5px 0;
    }
    .recipe_content_label{
        display: inline-block;
        width: 55px;
        background-color: rgb(0, 153, 102);
        text-align: center;
        border-radius: 2px;
        color: #fff;
        line-height: 2; 
    }
    .recipe_content_area-title,.recipe_content_area-userId,.recipe_content_area-status{
        display: inline-block;
        width: 240px;
    }
</style>
</head>
<body>

	<div class="side-nav" align="left">
        <!--회원관리-->
        <div class="side-title">
            <button type="button" data-toggle="collapse1" data-target="#side-sub" class="btn side-btn">
                회원 관리
            </button>
            <div id="side-sub" class="collapse1">
                <a href="">회원 목록</a><br>
                <a href="">신고 내역</a>
            </div>
        </div>

        <!--문의 관리-->
        <div class="side-title">
            <button type="button" data-toggle="collapse2" data-target="#side-sub" class="btn side-btn">
                문의 관리
            </button>
            <div id="side-sub" class="collapse2">
                <a href="">공지사항</a><br>
                <a href="">FAQ</a><br>
                <a href="">문의/답변</a><br>
            </div>
        </div>

        <!--사이트 관리-->
        <div class="side-title">
            <button type="button" data-toggle="collapse3" data-target="#side-sub" class="btn side-btn">
                사이트 관리
            </button>
            <div id="side-sub" class="collapse3">
                <a href="">이용약관</a><br>
                <a href="">카테고리</a><br>
                <a href="">네비게이션바</a><br>
                <a href="">배너</a>
            </div>
        </div>

        <!--게시판 관리-->
        <div class="side-title">
            <button type="button" data-toggle="collapse4" data-target="#side-sub" class="btn side-btn">
                게시판 관리
            </button>
            <div id="side-sub" class="collapse3">
                <a href="">요리 후기</a><br>
                <a href="">댓글</a><br>
                <a href="">이벤트</a><br>
            </div>
        </div>

        <!--통계 관리-->
        <div class="side-title">
            <button type="button" data-toggle="collapse4" data-target="#side-sub" class="btn side-btn">
                통계 관리
            </button>
            <div id="side-sub" class="collapse4">
                <a href="">레시피</a>
            </div>
        </div>

        <!--레시피 관리-->
        <div class="side-title">
            <button type="button" class="btn side-btn">
                레시피 관리
            </button>
            <div id="side-sub" class="collapse5">
                <a href="">레시피 삭제</a><br>
                <a href="">메인 노출 레시피</a><br>
                <a href="">메인 레시피 목록</a><br>
            </div>
        </div>

    </div>

    
    <script>
        
        $(function(){

            $(".side-btn").click(function(){

                var $side = $(this).next();

                if($side.css("display") == "none"){
                    $(this).siblings("div").show(200);
                }else{
                    $side.hide(200);
                }

            })
        })

    </script>

    <!-- 본문 내용 area -->
    <div class="outer">
        <div class="path-area"> 
            홈 > 사이트관리 > <span class="current-menu">배너</span> 
        </div>

        <br>
        <h2 style="height: 10px;">메인레시피 등록</h2>
        <br>

        <!-- 레시피 목록 전체 영역 -->
        <div class="banner-recipe">

            <div class="recipe-top-area">

                <div class="recipe-search">
                    <input class="recipe-search_input" type="text" value="글번호를 입력하세요">
                    <button class="recipe-search_input-icon"><img style="width: 15px;" src="../../resources/image/searchicon.png" alt=""></button>
                </div>
                
                <button class="recipe-search_btn" type="submit">등록</button>

            </div>
            

            <!-- 레시피 개별 영역 -->
            <div class="banner-recipe-wrap">

                <!-- 레시피 이미지 영역 -->
                <div class="recipe_image-wrap">
                    <a class="recipe_image" href="레시피 대표이미지 경로제시"></a>
                </div>

                <!-- 제목/작성자/상태 -->
                <div class="recipe_content-wrap">

                    <div class="recipe_content">
                        <!-- 레시피 제목 -->
                        <div class="recipe_content_label">
                            제목
                        </div>
                        <div class="recipe_content_area-title">
                            초간단 돼지고기 김치찌개 - 입맛 없을 땐 딱!!
                        </div>
                    </div>

                    <div class="recipe_content">
                        <!-- 레시피 작성자 -->
                        <div class="recipe_content_label">
                            작성자
                        </div>
                        <div class="recipe_content_area-userId">
                            user01
                        </div>
                    </div>

                    <div class="recipe_content">
                        <!-- 레시피 상태 -->
                        <div class="recipe_content_label">
                            상태
                        </div>
                        <div class="recipe_content_area-status">
                            게시중
                        </div>
                    </div>
                    
                    
                </div>

            </div>

        </div>
        
        <!-- 등록시 팝업 될 모달영역 --> 
        <div class="modal_enroll"> 
            <div class="modal-content"> 

                <span class="close-btn">&times;</span> 

                <div class="modal-title">메인 레시피 등록</div> 

                <form action="#post.php" method="POST"> 

                    <label for="recipe-no">글번호</label> 
                    <div class="form-control">
                        글번호
                    </div>

                    <label for="recipe-no">글제목</label> 
                    <div class="form-control">
                        초간단 돼지고기 김치찌개 - 입맛 없을 땐 딱!!
                    </div>

                    <label for="recipe-no">작성자</label> 
                    <div class="form-control">
                        작성자
                    </div>

                    <label for="recipe-status">상태</label> 
                    <select name="status" id="">
                        <option value="Y">게시중</option>
                        <option value="N">게시안함</option>
                    </select>

                    <input type="submit" id="submit" value="등록"> 
                </form> 

            </div> 
        </div>

        <!-- 수정시 팝업 될 모달영역 --> 
        <div class="modal_update"> 
            <div class="modal-content"> 

                <span class="close-btn">&times;</span> 

                <div class="modal-title">메인 레시피 수정</div> 

                <form action="#post.php" method="POST"> 

                    <label for="recipe-no">글번호</label> 
                    <div class="form-control">
                        글번호
                    </div>

                    <label for="recipe-no">글제목</label> 
                    <div class="form-control">
                        초간단 돼지고기 김치찌개 - 입맛 없을 땐 딱!!
                    </div>

                    <label for="recipe-no">작성자</label> 
                    <div class="form-control">
                        작성자
                    </div>

                    <label for="recipe-status">상태</label> 
                    <select name="status" id="">
                        <option value="Y">게시중</option>
                        <option value="N">게시안함</option>
                    </select>

                    <input type="submit" id="submit" value="수정"> 
                </form> 

            </div> 
        </div>

    </div>

    
    


    <script>
        
        var modal = document.querySelector(".modal_enroll"); 
        var recipe_search_btn = document.querySelector(".recipe-search_btn");
        var banner_recipe_wrap = document.querySelector(".banner-recipe-wrap");
        var closeButton = document.querySelector(".close-btn"); 
        var cancelButton = document.querySelector("#cancel");

        function toggleModal() { 
             modal.classList.toggle("show-modal"); 
        }

        function windowOnClick(event) { 
             if (event.target === modal) { 
                 toggleModal(); 
            } 
        }

        recipe_search_btn.addEventListener("click", toggleModal); 
        banner_recipe_wrap.addEventListener("click", toggleModal); 
        closeButton.addEventListener("click", toggleModal); 
        window.addEventListener("click", windowOnClick); 

        
        

    </script>
    

</body>
</html>