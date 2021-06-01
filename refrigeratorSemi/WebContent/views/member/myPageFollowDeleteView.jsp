<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        div, img{box-sizing: border-box;}
        .user-img{
            border:1px solid wheat;
        }

        /*공통*/
        .outer{
            width:750px;
            margin:20px 20px;
        }
        label{
            margin-bottom:0px;
        }

        /* 페이지 최상단 path*/
        .menu-path>label{
            text-decoration: underline;
        }
        /*팔로우 조회 박스 상단 css*/
        .menu-title{
            border-bottom: 5px solid rgb(0, 102, 51);
        }

        .menu-title>span{
            color: gold;
        }

        .menu-title>label{
            font-weight: 600;
            color: rgb(0, 102, 51);
        }

        /* 팔로우 박스 왼쪽, 오른쪽 영역잡기*/
        .following-box{
            width:100%;
            height:230px;
            border-bottom: 2px solid rgb(150,150, 150);
        }

        .following-box>div{
            float:left;
            height:100%;
        }
        
        .left-content{
            width:25%;
        }
        .right-content{
            width:75%;
        }

        /* 왼쪽 박스 유저 이미지+ 닉네임 + 버튼*/
        .user-img{
            width:120px;
            height:120px;
            margin:auto;
            margin-top:28px;
            margin-bottom:10px;
            border-radius:60px;
        }
        .nickname-area{
            font-size: 14px;
        }

        .ufBtn-area>button{
            width:80px;
            height:26px;
            font-size:12px;
            color: white;
            background: rgb(0, 102, 51);
            border:none;
            border-radius:3px;
        }
        .ufBtn-area>button:hover{
            opacity: 0.92;
        }

        .stats-area{
            margin-top:28px;
            margin-bottom:20px;
        }
        .stats-area>span{
            font-size:85%;
        }

        .recipeImg-area>img{
            border: 1px solid wheat;
            width:110px;
            height:120px;
            margin-right:10px;
        }


</style>
</head>
<body>

    
	<div class="outer">

    <div class="menu-path" style="font-size:12px;">
        마이페이지 > <label>후기&별점관리</label> 
    </div>
    
    <br><br>
    
    <div class="menu-title">
        <label>팔로우 중</label><span> 4</span>
    </div>

    <div class="follow-content">
        <!-- 한 행 단위-->
        <div class="following-box">

            <div class="left-content">

                <div class="user-img">
                    <img src="">
                </div>
                
                <div class="nickname-area" align="center">
                    nickname
                </div>
                
                <div class="ufBtn-area" align="center">
                    <button>- 언팔로우</button>
                </div>

            </div>

            <div class="right-content">

                <div class="stats-area">
                    <b>레시피</b>&nbsp;<span>1204</span>&nbsp;&nbsp;&nbsp;<b>찜하기</b>&nbsp;<span>3021</span>&nbsp;&nbsp;&nbsp;
                    <b>팔로워</b><span>1492</span>&nbsp;&nbsp;&nbsp;<b>평균별점</b>&nbsp;<span>4.32</span>
                </div>

                <div class="recipeImg-area">
                    <img src="" class="recipeImg">
                    <img src="" class="recipeImg">
                    <img src="" class="recipeImg">
                    <img src="" class="recipeImg">
                </div>
            </div>    
        </div>

        <div class="following-box">

            <div class="left-content">

                <div class="user-img">
                    <img src="">
                </div>
                
                <div class="nickname-area" align="center">
                    nickname
                </div>
                
                <div class="ufBtn-area" align="center">
                    <button>- 언팔로우</button>
                </div>

            </div>

            <div class="right-content">

                <div class="stats-area">
                    <b>레시피</b>&nbsp;<span>1204</span>&nbsp;&nbsp;&nbsp;<b>찜하기</b>&nbsp;<span>3021</span>&nbsp;&nbsp;&nbsp;
                    <b>팔로워</b><span>1492</span>&nbsp;&nbsp;&nbsp;<b>평균별점</b>&nbsp;<span>4.32</span>
                </div>

                <div class="recipeImg-area">
                    <img src="" class="recipeImg">
                    <img src="" class="recipeImg">
                    <img src="" class="recipeImg">
                    <img src="" class="recipeImg">
                </div>
            </div>    
        </div>
        <div class="following-box">

            <div class="left-content">

                <div class="user-img">
                    <img src="">
                </div>
                
                <div class="nickname-area" align="center">
                    nickname
                </div>
                
                <div class="ufBtn-area" align="center">
                    <button>- 언팔로우</button>
                </div>

            </div>

            <div class="right-content">

                <div class="stats-area">
                    <b>레시피</b>&nbsp;<span>1204</span>&nbsp;&nbsp;&nbsp;<b>찜하기</b>&nbsp;<span>3021</span>&nbsp;&nbsp;&nbsp;
                    <b>팔로워</b><span>1492</span>&nbsp;&nbsp;&nbsp;<b>평균별점</b>&nbsp;<span>4.32</span>
                </div>

                <div class="recipeImg-area">
                    <img src="" class="recipeImg">
                    <img src="" class="recipeImg">
                    <img src="" class="recipeImg">
                    <img src="" class="recipeImg">
                </div>
            </div>    
        </div>

    </div>
    
    

    <br>
    <div align="center">
        <button>&lt;</button>
        <button>1</button>
        <button>2</button>
        <button>3</button>
        <button>4</button>
        <button>5</button>
        <button>&gt;</button>
    </div>
    
    <br>

</body>
</html>