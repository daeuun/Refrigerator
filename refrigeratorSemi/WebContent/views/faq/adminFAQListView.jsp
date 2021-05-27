<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!--윤희락 05.26 작성-->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자_FAQ</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <style>
        .outer{
            width:900px;
        }

        .table-label{
            margin-bottom: 7px;
            display: inline-block;
        }
        .enroll-btn{
            display: inline-block;
            width: 770px;
            text-align: right;
        }
        .enroll-btn>button{
            font-weight:550;
            width:60px;
            background-color: rgb(0, 153, 102);
        }

        table{
            border-top: 3px solid rgb(0, 102, 51);
        }
        .list-area{
            text-align: center;
        }
        .list-area tr{
            border-bottom: 1px solid rgb(222, 222, 222);
            height:40px;
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
    
        button{border:none;}
        #btn1, #btn2{
            background-color:rgb(222, 222, 222); 
            color: black;
            font-size:75%;
            border: none;
        }

    /*글 삭제 모달 영역*/
    
    #delete>div div{
        margin:100px 200px;   
    }
    .modal-btn{
        margin:25px 35px;
        text-align: center;
    }
    .modal-btn>a{
        width:100px;
        height:35px;
        font-size:16px;
        margin:0px 25px 0px 25px;
        text-align: center;
    }
    .btn-secondary{
        background:rgb(222, 222, 222);
        color: black;
        border:none;
    }
        


    /*--글 수정,등록 모달 영역*/
        #modify-form>div>div, #enroll-form>div>div{
            width:600px;
            height:600px;
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
        .count-area {
            color:orange;
        }
        .current-page{
                background-color:rgb(0, 102, 51);
                color: white;
        }
        .list-answer{display:none;}
</style>
</head>
<body>

	<div class="outer">
        <div class="path-area">
            홈 > 문의관리 > <span class="current-menu">FAQ</span> 
        </div>

        <br>
        <h2>FAQ</h2>
        <br>

        <div class="table-label">
            <span>FAQ 전체목록</span><span class="count-area">32</span>
        </div>
        <div class="enroll-btn">
            <button class="btn btn-success btn-sm" data-toggle="modal" data-target="#enroll-form">등록</button>
        </div>
        

        <table class="list-area">
            <thead>
                <tr>
                    <th width="100">번호</th>
                    <th width="400">제목</th>
                    <th width="200">게시물관리</th>
                    <th width="100">등록일</th>
                    <th width="100">조회수</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>32</td>
                    <td><span class="list-qus">비밀번호를 잊어버렸어요</span></td>
                    <td>
                        <a href="" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#modify-form" id="btn1">글수정▶</a>
                        <a href="" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#delete-form" id="btn2">글삭제▶</a>
                    </td>
                    <td>2010-11-11</td>
                    <td>324</td>
                </tr>
                <tr class="list-answer">
                    <td></td>
                    <td colspan="3">저희 사이트에서는 비밀번호 찾기는 제공하지 않고 있으며 대신 비밀번호를 잊어버렸을때 이메일 인증을 통해 비밀번호인증을 제공하고 있습니다.</td>
                    <td></td>
                </tr>
                <tr>
                    <td>32</td>
                    <td><span class="list-qus">비밀번호를 잊어버렸어요</span></td>
                    <td>
                        <a href="" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#modify-form" id="btn1">글수정▶</a>
                        <a href="" class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#delete-form" id="btn2">글삭제▶</a>
                    </td>
                    <td>2010-11-11</td>
                    <td>324</td>
                </tr>
                <tr class="list-answer">
                    <td></td>
                    <td colspan="3">저희 사이트에서는 비밀번호 찾기는 제공하지 않고 있으며 대신 비밀번호를 잊어버렸을때 이메일 인증을 통해 비밀번호인증을 제공하고 있습니다.</td>
                    <td></td>
                </tr>
                
                
                <tr>
                    <td>31</td>
                    <td>비밀번호를 잊어버렸어요</td>
                    <td>
                        <a href="" class="btn btn-secondary btn-sm" id="btn1">글수정▶</a>
                        <a href="" class="btn btn-secondary btn-sm" id="btn2">글삭제▶</a>
                    </td>
                    <td>2010-11-11</td>
                    <td>324</td>
                </tr>
                <tr>
                    <td>30</td>
                    <td>비밀번호를 잊어버렸어요</td>
                    <td>
                        <a href="" class="btn btn-secondary btn-sm" id="btn1">글수정▶</a>
                        <a href="" class="btn btn-secondary btn-sm" id="btn2">글삭제▶</a>
                    </td>
                    <td>2010-11-11</td>
                    <td>324</td>
                </tr>
                <tr>
                    <td>7</td>
                    <td>비밀번호를 잊어버렸어요</td>
                    <td>
                        <a href="" class="btn btn-secondary btn-sm" id="btn1">글수정▶</a>
                        <a href="" class="btn btn-secondary btn-sm" id="btn2">글삭제▶</a>
                    </td>
                    <td>2010-11-11</td>
                    <td>324</td>
                </tr>
                <tr>
                    <td>5</td>
                    <td>비밀번호를 잊어버렸어요</td>
                    <td>
                        <a href="" class="btn btn-secondary btn-sm" id="btn1">글수정▶</a>
                        <a href="" class="btn btn-secondary btn-sm" id="btn2">글삭제▶</a>
                    </td>
                    <td>2010-11-11</td>
                    <td>324</td>
                </tr>
                <tr>
                    <td>4</td>
                    <td>비밀번호를 잊어버렸어요</td>
                    <td>
                        <a href="" class="btn btn-secondary btn-sm" id="btn1">글수정▶</a>
                        <a href="" class="btn btn-secondary btn-sm" id="btn2">글삭제▶</a>
                    </td>
                    <td>2010-11-11</td>
                    <td>324</td>
                </tr>
                <tr>
                    <td>3</td>
                    <td>비밀번호를 잊어버렸어요</td>
                    <td>
                        <a href="" class="btn btn-secondary btn-sm" id="btn1">글수정▶</a>
                        <a href="" class="btn btn-secondary btn-sm" id="btn2">글삭제▶</a>
                    </td>
                    <td>2010-11-11</td>
                    <td>324</td>
                </tr>
                <tr>
                    <td>2</td>
                    <td>비밀번호를 잊어버렸어요</td>
                    <td>
                        <a href="" class="btn btn-secondary btn-sm" id="btn1">글수정▶</a>
                        <a href="" class="btn btn-secondary btn-sm" id="btn2">글삭제▶</a>
                    </td>
                    <td>2010-11-11</td>
                    <td>324</td>
                </tr>
                <tr>
                    <td>1</td>
                    <td>비밀번호를 잊어버렸어요</td>
                    <td>
                        <a href="" class="btn btn-secondary btn-sm" id="btn1">글수정▶</a>
                        <a href="" class="btn btn-secondary btn-sm" id="btn2">글삭제▶</a>
                    </td>
                    <td>2010-11-11</td>
                    <td>324</td>
                </tr>
                <tr>
                    <td>0</td>
                    <td>비밀번호를 잊어버렸어요</td>
                    <td>
                        <a href="" class="btn btn-secondary btn-sm" id="btn1">글수정▶</a>
                        <a href="" class="btn btn-secondary btn-sm" id="btn2">글삭제▶</a>
                    </td>
                    <td>2010-11-11</td>
                    <td>324</td>
                </tr>
            </tbody>
        </table>

        <script>
            $(function(){
                $("tr").click(function(){
                    var $tr = $(this).next();

                    if($tr.css("display") == "none"){

                        $(this).siblings(".list-answer").slideUp(500);

                        // 보여주게끔
                        $tr.slideDown(1000);
                    }else{
                        $tr.slideUp(500);
                    }
                })
            })
        </script>

        <!-- 글 삭제 모달 -->
        <div class="modal fade" id="delete-form">
            <div class="modal-dialog">
                <div class="modal-content">
        
                    <!-- Modal Header -->
                    <div align="right">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="modal-body" style="margin:auto">
                        <p><span style="color:red">해당 FAQ를 삭제</span>하시겠습니까?</p>
                    </div>
                    
                    <div class="modal-btn">
                        <a href="" class="btn btn-secondary btn-sm">취소</a>
                        <a href="" class="btn btn-danger btn-sm">삭제</a>
                    </div>

                </div>                  
            </div>
        </div>

        <!-- 글 수정 모달 -->
        <div class="modal fade" id="modify-form">
            <div class="modal-dialog">
                <div class="modal-content">
        
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">관리자_FAQ 수정</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="answer-form">
                        <form action="" method="POST">
                            <div class="form-group">
                                <label for="qus">Q. 질문</label>
                                <input type="text" class="form-control" id="qus" value="레시피를 어디서 써야하는지 모르겠어요">
                            </div>
                            <div class="form-group">
                                <label for="answer">A. 답변</label>
                                <textarea name="content" class="form-control" id="answer" style="resize:none;" placeholder="답변을입력해주세요">레시피등록은...</textarea>
                            </div>
                            <div class="form-btn">
                                <a href="" class="btn btn-secondary ">취소</a>
                                <a href="" id="btn-s" class="btn btn-success">게시</a>
                            </div>
                        </form>
                    </div>

                </div>                  
            </div>
        </div>

        <!-- 글 등록모달 -->
        <div class="modal fade" id="enroll-form">
            <div class="modal-dialog">
                <div class="modal-content">
        
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">관리자_FAQ 등록</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    
                    <!-- Modal body -->
                    <div class="answer-form">
                        <form action="" method="POST">
                            <div class="form-group">
                                <label for="qus">Q. 질문</label>
                                <input type="text" class="form-control" id="qus" name="title" placeholder="FAQ 질문을 입력해주세요">
                            </div>
                            <div class="form-group">
                                <label for="answer">A. 답변</label>
                                <textarea name="content" class="form-control" name="content" id="answer" style="resize:none;" placeholder="FAQ답변을입력해주세요"></textarea>
                            </div>
                            <div class="form-btn">
                                <a href="" class="btn btn-secondary ">취소</a>
                                <a href="" id="btn-s" class="btn btn-success">게시</a>
                            </div>
                        </form>
                    </div>

                </div>                  
            </div>
        </div>
        
        
        <br>
        <div align="center">
            <button><</button>
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>4</button>
            <button>5</button>
            <button>></button>
        </div>
        
        <br>
        
       
    </div>

</body>
</html>