<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!--윤희락 05.26 작성-->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_공지사항 목록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .outer{
            width: 900px;
        }
        #notice-form{
            width: 900px;
            border: 2px solid rgb(188, 188, 188);
        }


        .head-area>h2{
            padding-bottom:20px;
            width: 900px;
            border-bottom:3px solid rgb(0, 102, 51);
        }

        button{border:none;}
        #enroll-btn{
            background: rgb(0, 102, 51);
            color: white;
            font-weight: 550;
            width:60px;
        }
        #delete-btn{
            background: rgb(231, 76, 60);
            color: white;
            font-weight: 550;
            width: 60px;
        }
        #enroll-btn:hover, #delete-btn:hover{
            opacity:0.85;
        }
        
        #btn-area{
            width:890px;
            text-align:right;
            margin:6px;
        }
        #btn-area a{
            margin-right:8px;
        }


        .notice-list-form{border:1px solid rgb(188, 188, 188);}
        .notice-list-form tr {
            height: 35px;
            text-align:center;
        }
        .notice-list-form>thead {
            background-color: rgb(222, 222, 222);
        }


        .path-area{
            font-size:16px;
            color:rgb(155, 155, 155);  
        }
        .path-area>span{
            text-decoration: underline;  
            font-weight:550;
            color: black;  
        }

        .current-page{
            background-color:rgb(0, 102, 51);
            color: white;
        }

        /*--모달 영역 */
        .modal-content{ /*모달창 위치*/
            margin:100px 200px;
        }
        .modal-btn{
            text-align:center;
            margin:25px 35px;
        }
        .modal-btn>a{
            width:100px;
            height:35px;
            font-size:16px;
            margin:0px 25px 0px 25px;
        }
        .btn-secondary{
            background:rgb(222, 222, 222);
            color: black;
            border:none;
        }
        .close{
            border: 1px solid black;
            font-size:40px;
        }

    </style>
</head>
<body>

 <div class="outer">

    <div class="path-area">
        홈 > 공지사항 > <span class="current-menu">공지사항</span> 
    </div>
    
    <br>
    <div class="head-area">
        <h2>공지사항</h2>
    </div>
    <br>
    

        <div id="notice-form">
            <div id="btn-area">
                <a href="" id="delete-btn" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#delete">삭제</a>
                <a href="" id="enroll-btn" class="btn btn-secondary btn-sm">등록</a>
            </div>
            
            <!-- The Modal -->
            <div class="modal fade" id="delete">
                <div class="modal-dialog">
                    <div class="modal-content">
            
                        <!-- Modal Header -->
                        <div align="right">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                        
                        <!-- Modal body -->
                        <div class="modal-body" style="margin:auto">
                            <p><span style="color:red">공지사항이 삭제</span>되면 되돌릴 수 없습니다.</p>
                            진행하시겠습니까?
                        </div>
                        
                        <div class="modal-btn">
                            <a href="" class="btn btn-secondary btn-sm">취소</a>
                            <a href="" class="btn btn-danger btn-sm">삭제</a>
                        </div>
  
                    </div>                  
                </div>
            </div>
            
            <table class="notice-list-form" border="1" width="100%">
                <thead>
                    <tr>
                        <th width="20"><input class="delete-check" type="checkbox"></th>
                        <th width="50">번호</th>
                        <th width="300">제목</th>
                        <th width="100">작성자</th>
                        <th width="100">작성일</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <th><input type="checkbox"></th>
                        <td>1</td>
                        <td>비밀번호를 잃어버렸어요?</td>
                        <td>user01</td>
                        <td>2010-11-11</td>
                    </tr>
                    <tr>
                        <th><input type="checkbox"></th>
                        <td>2</td>
                        <td>비밀번호를 잃어버렸어요?</td>
                        <td>user01</td>
                        <td>2010-11-11</td>
                    </tr>
                    <tr>
                        <th><input type="checkbox"></th>
                        <td>50</td>
                        <td>비밀번호를 잃어버렸어요?</td>
                        <td>user01</td>
                        <td>2010-11-11</td>
                    </tr>
                    <tr>
                        <th><input type="checkbox"></th>
                        <td>50</td>
                        <td>비밀번호를 잃어버렸어요?</td>
                        <td>user01</td>
                        <td>2010-11-11</td>
                    </tr>
                    <tr>
                        <th><input type="checkbox"></th>
                        <td>50</td>
                        <td>비밀번호를 잃어버렸어요?</td>
                        <td>user01</td>
                        <td>2010-11-11</td>
                    </tr>
                    <tr>
                        <th><input type="checkbox"></th>
                        <td>50</td>
                        <td>비밀번호를 잃어버렸어요?</td>
                        <td>user01</td>
                        <td>2010-11-11</td>
                    </tr>
                    <tr>
                        <th><input type="checkbox"></th>
                        <td>50</td>
                        <td>비밀번호를 잃어버렸어요?</td>
                        <td>user01</td>
                        <td>2010-11-11</td>
                    </tr>
                    <tr>
                        <th><input type="checkbox"></th>
                        <td>50</td>
                        <td>비밀번호를 잃어버렸어요?</td>
                        <td>user01</td>
                        <td>2010-11-11</td>
                    </tr>
                    <tr>
                        <th><input type="checkbox"></th>
                        <td>50</td>
                        <td>비밀번호를 잃어버렸어요?</td>
                        <td>user01</td>
                        <td>2010-11-11</td>
                    </tr>
                    <tr>
                        <th><input type="checkbox"></th>
                        <td>50</td>
                        <td>비밀번호를 잃어버렸어요?</td>
                        <td>user01</td>
                        <td>2010-11-11</td>
                    </tr>
                </tbody>
            </table>
    
            <br>

        </div>
      
        <br>
        <div class="page-area" align="center">
            <button>&lt;</button>
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>5</button>
            <button>&gt;</button>
        </div>
        <br>
      
    </div>

</body>
</html>