<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- 작성자 : 재원      ※ 혹여나 해당 페이지에 작업시에 작업하신부분에 주석으로 성함과 영역을 표시해주세요! (혹여나 파일이 날라갈수있으니 push전에 백업부탁드려요~)  -->

<title>관리자 이용약관 등록 페이지</title>
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
    #vertical-bar{width: 150px; height: 1200px; background-color: rgb(0,153,102); float: left;}
    .outer{border: 3px solid blue; width: 1000px; float: right; margin-right: 25px;}
/* ----------------------------------------------------------------------------------------------------------- */
    .top-box a{
        color: gray;
    }

    .top-box{
        margin-top: 20px;
        padding: 20px;
        margin-bottom: 25px;
        padding-left: 25px;
    }

    .outer-body h2{
        padding-left: 25px;
        font-size: 36px;
        margin-bottom: 20px;
    }

    .outer-body table{
        width: 945px;
        margin-left: 15px;
    }

    .outer-body table th{
        width: 200px;
        background-color: rgb(234,234,234);
        height: 50px;
        text-align: center;
        font-size: 15px;
        font-weight: bold;
    }

    .outer-body table td{
        padding-left: 15px ;
    }

    .outer-body tr:nth-child(1) input, .outer-body tr:nth-child(6) input{
        width: 450px;
    }

    .outer-body tr:nth-child(3) input{
        width: 300px;
    }

    .outer-body table input, .outer-body table select{
        height: 35px;
    }

    .outer-body table textarea{
        padding: 10px;
    }

    .tos-area>td{
        padding-left: 0px;
    }


    .tos-area textarea{
        width: 100%;
        height: 635px;
    }

    .btn-area{
        height: 80px;
        text-align: center;
    }

    .btn-area button{
        width: 110px;
        height: 45px;
        background-color: rgb(52,152,219);
        color: white;
        font-weight: 500;
        border-radius: 5px;
        border: none;
    }
/* ------------------------------------------------------------------------------------------------------------ */
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
                    <a href="">이용약관관리</a>
                </div>
                <div class="outer-body">
                    <h2><b>이용약관 등록</b></h2>
                    <form action="" method="POST">
                        <table border="1" style="border: rgb(204,204,204);">
                            <tr>
                                <th>이용약관명</th>
                                <td>
                                    <input type="text" name="" id="" value="냉장고에뭐있지? 서비스 이용약관">
                                </td>
                            </tr>
                            <tr>
                                <th>상태</th>
                                <td>
                                    <select name="" id="" style="width: 150px;">
                                        <option value="" selected>작성중</option>
                                        <option value="">보류</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td>
                                    <input type="text" name="" id="" value="신재원">
                                </td>
                            </tr>
                            <tr>
                                <th>사용될 페이지 영역</th>
                                <td>
                                    <select name="" id="" style="width: 300px;">
                                        <!-- value값은 다다르게 들어가야한다.  -->
                                        <option value="">채워줘야함</option>
                                        <option value="">채워줘야함</option>
                                        <option value="">채워줘야함</option>
                                        <option value="">채워줘야함</option>
                                        <option value="">채워줘야함</option>
                                        <option value="">채워줘야함</option>
                                    </select>
                                </td>
                            </tr>
                            <tr class="tos-area">
                                <td colspan="2" style="padding: 15px 0px 15px 0px; border: none; resize: none;">
                                    <textarea name="" id="" style="resize: none;">서비스 이용약관
냉장고에 뭐있지? 약관은 "요리하는 보람있조"팀이 운영하는 인터넷사이트 이용에 대한 “레시피 조회 서비스”, “냉장고에 뭐있지 회원포인트 서비스”, “회원가입 서비스” "개인정보 이용" 약관 으로 구성 됩니다.

제 1 장
(냉장고에 뭐있지? 웹사이트 서비스)
제 1 절 총칙
제 1 조 (목적)
이 약관은 "요리하는 보람있조" 팀이 제공하는 서비스(이하 "서비스") 의 이용 조건 및 절차에 관한 기본적인 사항 등을 규정하는 데 그 목적이 있습니다.

제 2 조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.

① 회원
서비스를 제공 받기 위하여 회사와 이용계약을 체결하거나 이용자 아이디(ID)를 부여 받은 자를 말합니다.

② 아이디(ID)
회원의 식별과 서비스를 이용을 위하여 회원이 정하고 회사가 승인하는 문자와 숫자의 조합을 말합니다.

③ 비밀번호
회원이 부여 받은 아이디(ID)와 일치된 회원임을 확인하고 회원 자신의 비밀을 보호하기 위하여 회원이 정한 문자와 숫자의 조합을 말합니다.

④ 해지
회사 또는 회원이 서비스를 개통 후 이용계약을 해약 하는 것을 말합니다.
</textarea>

                                </td>
                            </tr>
                            <tr>
                                <th style="height: 38px;">비고</th>
                                <td>
                                    <input type="text" name="" id="" placeholder="내용을 입력해주세요">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="btn-area" style="padding: 0px; border: none;"><button type="submit">등록하기</button></td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
<!------------------------------------------------------------------------------------------------------------->            
        </div>
    </div>
</body>
</html>