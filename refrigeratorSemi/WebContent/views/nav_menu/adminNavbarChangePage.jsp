<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- 작성자 : 재원      ※ 혹여나 해당 페이지에 작업시에 작업하신부분에 주석으로 성함과 영역을 표시해주세요! (혹여나 파일이 날라갈수있으니 push전에 백업부탁드려요~)  -->

<title>네비게이션바 관리 페이지</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<!-- 일단은 관리자단 공통 부분을 예지님이 상단과 왼쪽을 담당했기에 !! 이같이 연동시켜줄것은 연동 시켜줘야한다.  -->
<!-- --------------------------------------------------------------------------------------------------- -->
<style>
    div{box-sizing: border-box;}
    .wrap{margin: auto; width: 1200px; height: 750px;}
    #horizontal-bar{width: 100%; height: 50px; box-sizing: border-box; background-color: palegoldenrod;}
    #vertical-bar{width: 150px; height: 690px; background-color: rgb(0,153,102); float: left;}
    .outer{border: 3px solid blue; width: 1000px; float: right; margin-right: 25px;}
/* ----------------------------------------------------------------------------------------------------------- */
/* ------------------------------------------이용약관 관리 list페이지 CSS시작------------------------------------ */
    .top-box a{
        color: gray;
    }

    .top-box{
        margin-top: 10px;
        padding: 20px;
        margin-bottom: 20px;
        padding-left: 25px;
    }

    .outer-body h2{
        font-size: 36px;
        margin-bottom: 10px;
    }

    .outer-body{
        padding-left: 25px;
    }

    .sub-title{
        border: 1px solid rgb(46,204,113);
        width: 245px;
        font-weight: bold;
    }
    #present-list-box{
        width: 890px;
        height: 135px;
        background-color: rgb(207,243,222) ;
        display: flex;
        justify-content: space-around;
        align-items: center;
        margin-bottom: 50px;
    }

    .small-white-box{
        width: 110px;
        height: 100px;
        background-color: white;
        border: 1px solid gray;
        text-align: center;
        color: tomato;
        padding-top: 10px;
    }

    #top-div{
        width: 640px;
        height: 45px;
        margin-right:20px ;
        background-color: white;
        margin-bottom: 20px;
        display: flex;
        justify-content: space-around;
        box-sizing: border-box;
        border: 1px solid rgb(0,102,51);
    }

    #top-div>div{
        width: 100px;
        height: 45px;
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
        position: relative;
        padding-top: 10px;
        font-size: 18px;
        font-weight: bold;
    }

    .circle-box{
        width: 30px;
        height: 30px;
        border-radius: 50%;
        background-color: rgb(0,102,51);
        color: white;
        position: absolute;
        top: 50px;
        line-height: 30px;
    }

    #buttom-div{
        width: 890px;
        height: 235px;
        background-color: rgb(224,224,224);
        padding: 18px;
        padding-left: 50px;

    }

    .inner-top-box{
        width: 800px;
        height: 60px;
        display: flex;
        justify-content: space-between;
    }

    .inner-top-box > div{
        width: 150px;
        height: 60px;
        background-color: #E49992;
        display: flex;
        justify-content: center;
    }

    .big-circle-box{
        width: 55px;
        height: 55px;
        border-radius: 50%;
        background-color: #FB1C1B;
        color: white;
        font-weight: bold;
        font-size: 16px;
        text-align: center;
        line-height: 55px;
        margin-top: 2.5px;
    }

    .inner-bottom-box{
        width: 800px;
        height: 90px;
        display: flex;
        justify-content: space-between;
        background-color: white;
        padding: 10px;
    }

    .inner-bottom-box select{
        width: 130px;
        height: 40px;
        margin-top: 20px;
    }

    .btn-area{
        width: 800px;
        display: flex;
        justify-content: center;
    }

    .btn-area button{
        width: 100px;
        height: 40px;
        border-radius: 5px;
        margin: 10px;
        color: white;
        font-weight: bold;
        border: none;
    }

    .btn-area button:nth-child(1){
        background-color: rgb(230,106,93);
    }

    .btn-area button:nth-child(2){
        background-color: rgb(124,212,161);
    }
/* --------------------------------------------------------------------------------------------------------- */
    </style>
</head>
<body>
    <div class="wrap">
        <div id="horizontal-bar"></div>
        <div id="content">
            <div id="vertical-bar"></div>            
<!-------------------------------------------------------------------------------------------------------------->            
            <div class="outer">
                <div class="top-box">
                    <a href="">홈</a> >
                    <a href="">싸이트관리</a> >
                    <a href="">네비게이션바 순서변경</a>
                </div>
                <div class="outer-body">
                    <h2><b>네비게이션 바 순서변경</b></h2>
                    
                    <div class="sub-title">현재 Navigation 목록 순서</div>
                    <div id="present-list-box">
                        <div class="small-white-box">현재 <br> 네비게이션 <br> 순서</div>
                        <div id="top-div">
                                    <div>홈<div class="circle-box">1</div></div>
                                    <div>카테고리<div class="circle-box">2</div></div>
                                    <div>이벤트<div class="circle-box">3</div></div>
                                    <div>레시피<div class="circle-box">4</div></div>
                                    <div>고객센터<div class="circle-box">5</div></div>
                        </div>
                    </div>

                    <!-- 아래 영역 -->
                    <div class="sub-title">Navigation 목록 변경역역</div>
                    <div id="buttom-div">
                        <div class="inner-top-box">
                            <div>
                                <div class="big-circle-box">메뉴1</div>
                            </div>
                            <div>
                                <div class="big-circle-box">메뉴2</div>
                            </div>
                            <div>
                                <div class="big-circle-box">메뉴3</div>
                            </div>
                            <div>
                                <div class="big-circle-box">메뉴4</div>
                            </div>
                            <div>
                                <div class="big-circle-box">메뉴5</div>
                            </div>
                        </div>

                        <form action="" method="POST">
                            <div class="inner-bottom-box">
                                <select name="categort-select" id="">
                                    <option value="">홈</option>
                                    <option value="">카테고리</option>
                                    <option value="">이벤트</option>
                                    <option value="">레시피</option>
                                    <option value="">고객센터</option>
                                </select>
                                
                                <select name="categort-select" id="">
                                    <option value="">홈</option>
                                    <option value="">카테고리</option>
                                    <option value="">이벤트</option>
                                    <option value="">레시피</option>
                                    <option value="">고객센터</option>
                                </select>

                                <select name="categort-select" id="">
                                    <option value="">홈</option>
                                    <option value="">카테고리</option>
                                    <option value="">이벤트</option>
                                    <option value="">레시피</option>
                                    <option value="">고객센터</option>
                                </select>

                                <select name="categort-select" id="">
                                    <option value="">홈</option>
                                    <option value="">카테고리</option>
                                    <option value="">이벤트</option>
                                    <option value="">레시피</option>
                                    <option value="">고객센터</option>
                                </select>

                                <select name="categort-select" id="">
                                    <option value="">홈</option>
                                    <option value="">카테고리</option>
                                    <option value="">이벤트</option>
                                    <option value="">레시피</option>
                                    <option value="">고객센터</option>
                                </select>
                            </div>

                            <div class="btn-area">
                                <button type="submit">수정하기</button>
                                <button type="reset">초기화</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
<!------------------------------------------------------------------------------------------------------------->            
        </div>
    </div>
</body>
</html>