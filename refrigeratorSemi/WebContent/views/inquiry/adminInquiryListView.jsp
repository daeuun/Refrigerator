<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!--윤희락 05.26 작성-->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_문의/답변</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        .outer{
            width: 900px;
            font-size: 16px;
        }
        
        button{
            border: none;
        }
        tr>td>button{
            border-radius:5px;
            font-size: 14px;
            font-weight: 600;
            color: rgb(100, 100, 100);
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

        table{
            border-top: 3px solid rgb(0, 102, 51);
            border-bottom: 3px solid rgb(211, 211, 211);
        }
        .table-label{
            margin-bottom: 3px;
        }
        table tr{
            height:35px;
            border-bottom: 1px solid rgb(211, 211, 211);
            text-align: center;
        }
        /*답변하기 모달 영역*/
        .modal-content{
            width: 600px;
            height: 600px;
        }
        .modal-header{
            border-bottom: 5px solid rgb(0, 153, 102);
            width: 450px;
            margin-top: 0;
            margin: 35px 74px 35px 74px;
            padding: 2px;
        }
        .modal-title{
            color:rgb(0, 153, 102);
            font-weight: 550;
            font-size: 36px;
        }
        .close{
            font-size: 40px;
            color: black;
        }
        .answer-form{
            width:450px;
            height:380px;
            margin: 0px 74px 0px 74px;
        }
        .form-group{
            margin-bottom:40px;
        }
        .form-group>label{
            color:rgb(0, 153, 102);
            font-weight: 500;
        }
        .form-group>textarea{
            height: 200px;
        }
        .form-btn{
            height:60px;
        }
        .form-btn a{
            box-sizing: border-box;
            width:46%;
            height:100%;
            margin: 0% 2% 0% 2%;
            display:block;
            float: left;
            text-align: center;
            font-size:24px;
            text-decoration: none;
            line-height:50px;
            font-weight:500;
        }
        #btn-s{
            background: rgb(0, 153, 102);
            opacity:0.85;
        }
        #btn-s:hover{
            background: rgb(0, 153, 102);
            opacity:1;
        }

        .current-page{
            background-color:rgb(0, 102, 51);
            color: white;
        }
        .count-area{
            color: orange;
        }
    </style>

</head>
<body>

    <div class="outer">
        <div class="path-area">
            홈 > 문의관리 > <span class="current-menu">문의/답변</span> 
        </div>

        <br>
        <h2>문의/답변</h2>
        <br>

        <div class="table-label">
            <span><b>미해결문의</b></span> <span class="count-area">5</span>
        </div>
        <table class="unsolQ">
            <thead>
                    <tr>
                        <th width="100">문의번호</th>
                        <th width="500">문의내용</th>
                        <th width="100">문의자ID</th>
                        <th width="100">등록일</th>
                        <th width="100"></th>
                    </tr>
            </thead>
            <tbody>
                <tr>
                    <td>1</td>
                    <td>비밀번호를 잃어버렸어요?</td>
                    <td>user011111111</td>
                    <td>2010-11-11</td>
                    <td><button type="button" data-toggle="modal" data-target="#answer-modal">답변하기</button></td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>비밀번호를 잃어버렸어 요요요요요요요요?</td>
                    <td>user01</td>
                    <td>2010-11-11</td>
                    <td><button>답변하기</button></td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>비밀번호를 잃어버렸어요?</td>
                    <td>user01</td>
                    <td>2010-11-11</td>
                    <td><button>답변하기</button></td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>비밀번호를 잃어버렸어요?</td>
                    <td>user01</td>
                    <td>2010-11-11</td>
                    <td><button>답변하기</button></td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>비밀번호를 잃어버렸어요?</td>
                    <td>user01</td>
                    <td>2010-11-11</td>
                    <td><button>답변하기</button></td>
                </tr>
            </tbody>
        </table>

        <!-- The Modal -->
        <div class="modal fade" id="answer-modal">
            <div class="modal-dialog">
                <div class="modal-content">
        
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">관리자_답변</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="answer-form">
                        <form action="" method="POST">
                            <div class="form-group">
                                <label for="qus">Q. 질문</label>
                                <input type="text" class="form-control" id="qus" value="질문들어올자리" readonly>
                            </div>
                            <div class="form-group">
                                <label for="answer">A. 답변</label>
                                <textarea name="content" class="form-control" id="answer" style="resize:none;" placeholder="답변을입력해주세요"></textarea>
                            </div>
                            <div class="form-btn">
                                <a href="" class="btn btn-secondary ">취소</a>
                                <a href="" id="btn-s" class="btn btn-success">등록</a>
                            </div>
                        </form>
                    </div>

                </div>                  
            </div>
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

        <div class="table-label">
            <span><b>해결문의내역</b></span>
        </div>
        <table class="solQ">
            <thead>
                <tr>
                    <th width="100">문의번호</th>
                    <th width="450">문의내용</th>
                    <th width="150">문의자ID</th>
                    <th width="150">등록일</th>
                    <th width="150">답변일</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>51</td>
                    <td>비밀번호를 잃어버렸어요</td>
                    <td>user02</td>
                    <td>2021-05-13</td>
                    <td>2021-05-14</td>
                </tr>
                <tr>
                    <td>50</td>
                    <td>비밀번호를 잃어버렸어요</td>
                    <td>user02</td>
                    <td>2021-05-13</td>
                    <td>2021-05-14</td>
                </tr>
                <tr>
                    <td>49</td>
                    <td>비밀번호를 잃어버렸어요</td>
                    <td>user02</td>
                    <td>2021-05-13</td>
                    <td>2021-05-14</td>
                </tr>
                <tr>
                    <td>48</td>
                    <td>비밀번호를 잃어버렸어요</td>
                    <td>user02</td>
                    <td>2021-05-13</td>
                    <td>2021-05-14</td>
                </tr>
                <tr>
                    <td>47</td>
                    <td>비밀번호를 잃어버렸어요</td>
                    <td>user02</td>
                    <td>2021-05-13</td>
                    <td>2021-05-14</td>
                </tr>
            </tbody>
        </table>

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