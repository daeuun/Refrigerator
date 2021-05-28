<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- 작성자 : 재원      ※ 혹여나 해당 페이지에 작업시에 작업하신부분에 주석으로 성함과 영역을 표시해주세요! (혹여나 파일이 날라갈수있으니 push전에 백업부탁드려요~)  -->

<title>관리자 이용약관 조회페이지</title>

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
    #vertical-bar{width: 150px; height: 700px; background-color: rgb(0,153,102); float: left;}
    .outer{border: 3px solid blue; width: 1000px; height: 700px; float: right; margin-right: 25px;}

    .paging-bar{
    text-align: center;
    }

	.pagination{
		margin-top: 20px ;
		justify-content: center;
	}

    .pagination li{
        margin: 5px;
    }
/* ----------------------------------------------------------------------------------------------------------- */
    .top-box a{
        color: gray;
    }

    .top-box{
    padding: 20px;
    margin-bottom: 25px;
    }

    .outer-body h2{
        padding-left: 20px;
        font-size: 36px;
        margin-bottom: 40px;
    }

    .outer-body button{
        float: right;
        margin-right: 10px;
        margin-bottom: 15px;
        background-color: rgb(22,160,133) ;
        border-radius: 5px;
        border: none;
        color: white;
        width: 120px;
    }

    .outer-body table{
        width: 99%;
        height: 385px;
        text-align: center;
    }

    .outer-body tbody tr{
        height: 35px;
        cursor: pointer;
    }

    .outer-body thead>tr{
        background-color:rgb(234,234,234) ;
        height: 42px;
    }

    .outer-body table tbody tr:hover{
        background-color: rgb(186,238,208);
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
                    <h2><b>이용약관 관리</b></h2>
                    <button type="button">이용약관 등록</button>
                    <br style="clear: both;">
                    <table border="1" style="border: rgb(204,204,204);">
                        <thead>
                            <tr>
                                <th width="60">상태</th>
                                <th>이용약관명</th>
                                <th width="150">사용될 페이지 영역</th>
                                <th width="110">게시등록일</th>
                                <th width="110">수정일자</th>
                                <th width="110">작성자</th>
                                <th width="120">비고</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr onclick="">
                                <td>사용중</td>
                                <td>회원가입 이용약관</td>
                                <td>회원가입 폼</td>
                                <td>2021-06-10</td>
                                <td>2021-05-25</td>
                                <td>보람있존</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>사용중</td>
                                <td>회원가입 이용약관</td>
                                <td>회원가입 폼</td>
                                <td>2021-06-10</td>
                                <td>2021-05-25</td>
                                <td>신재원</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>사용중</td>
                                <td>회원가입 이용약관</td>
                                <td>회원가입 폼</td>
                                <td>2021-06-10</td>
                                <td>2021-05-25</td>
                                <td>신재원</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>사용중</td>
                                <td>회원가입 이용약관</td>
                                <td>회원가입 폼</td>
                                <td>2021-06-10</td>
                                <td>2021-05-25</td>
                                <td>신재원</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>사용중</td>
                                <td>회원가입 이용약관</td>
                                <td>회원가입 폼</td>
                                <td>2021-06-10</td>
                                <td>2021-05-25</td>
                                <td>신재원</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>사용중</td>
                                <td>회원가입 이용약관</td>
                                <td>회원가입 폼</td>
                                <td>2021-06-10</td>
                                <td>2021-05-25</td>
                                <td>신재원</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>사용중</td>
                                <td>회원가입 이용약관</td>
                                <td>회원가입 폼</td>
                                <td>2021-06-10</td>
                                <td>2021-05-25</td>
                                <td>신재원</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>사용중</td>
                                <td>회원가입 이용약관</td>
                                <td>회원가입 폼</td>
                                <td>2021-06-10</td>
                                <td>2021-05-25</td>
                                <td>신재원</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>사용중</td>
                                <td>회원가입 이용약관</td>
                                <td>회원가입 폼</td>
                                <td>2021-06-10</td>
                                <td>2021-05-25</td>
                                <td>신재원</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>사용중</td>
                                <td>회원가입 이용약관</td>
                                <td>회원가입 폼</td>
                                <td>2021-06-10</td>
                                <td>2021-05-25</td>
                                <td>신재원</td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>

<!------------------------------------- 페이징바 영역 --------------------------------------------------------->
                <div class="paging-bar">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                    </ul>
                </div>

            </div>
<!----------------------------------------- 이용약관 관리 list페이지 HTML끝 ------------------------------------->
<!------------------------------------------------------------------------------------------------------------->            
        </div>
    </div>
</body>
</html>