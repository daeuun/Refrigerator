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
<style>
    .outer{
        background: white;
        color: black;
        width: 1200px;
        margin: auto;
        margin-top: 50px;
    }
    #userSideNav-area{
        border: 1px solid lightgray;
        width: 200px;
        height: 100px;
        text-align: center;
        margin-top: 50px;
        margin-left: 20px;
    }
    #userSideNav-area a{
        display: block;
        height: 100%;
        line-height: 75px;
        color: black;
        font-size: 20px;
    }
    #userSideNav-area a:hover{
        text-decoration: none;
        background: rgba(211, 211, 211, 0.5);
        color: rgb(0, 120, 51);
    }
    .contact-list-area>thead>tr{
        border-bottom: 2px solid rgb(0, 120, 51);
        border-top: 2px solid rgb(0, 120, 51);
        font-weight: bold;
        text-align: center;
        height: 50px;
    }
    .contact-list-area>tbody>tr:hover{
        color: rgb(0, 120, 51);
        font-weight: bold;
        cursor: pointer;
    }
    .contact-list-area>tbody>tr{
        height: 45px;
        text-align: center;
        border-bottom: 1px solid darkgray;
    }
    #btn-noticeWrite{
        background: rgb(0, 120, 51);
        color: white;
    }
    #btn-noticeWrite:hover{
        background: white;
        color: rgb(0, 120, 51);
        border: 1px solid rgb(0, 120, 51);
        font-weight: bold;
        cursor: pointer;
    }
</style>
</head>
<body>
	
	<div class="outer">

        <br>
        <h2 align="center" style="font-weight:bold;">1:1문의</h2>
        <br>

        <div class="user-side-nav">
            <table id="userSideNav-area" align="left" border="1px">

                <tr>
                    <th><a href="">공지사항</a></th>
                </tr>
                <tr>
                    <th><a href="">FAQ</a></th>
                </tr>
                <tr>
                    <th><a href="">1:1문의</a></th>
                </tr>

            </table>
        </div>

	    <div align="right" style="width: 1050px;">
	        <a href="" class="btn btn-sm" id="btn-noticeWrite">글작성</a>
	        <br><br>
	    </div>

        <!-- 게시판 틀-->

        <div class="contact-list">
            <table class="contact-list-area" align="center">

                <thead>
                    <tr id="headline">
                        <th width="70">글번호</th>
                        <th width="400">글제목</th>
                        <th width="100">작성자</th>
                        <th width="150">작성일</th>
                    </tr>
                </thead>
                <tbody>
                            <tr>
                                <td>4</td>
                                <td>글제목입니다.</td>
                                <td>관리자</td>
                                <td>2020-07-01</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>글제목입니다.</td>
                                <td>관리자</td>
                                <td>2020-07-01</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>글제목입니다.</td>
                                <td>관리자</td>
                                <td>2020-07-01</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>글제목입니다.</td>
                                <td>관리자</td>
                                <td>2020-07-01</td>
                            </tr>
                        
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>