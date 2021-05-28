<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- 작성자 : 재원      ※ 혹여나 해당 페이지에 작업시에 작업하신부분에 주석으로 성함과 영역을 표시해주세요! (혹여나 파일이 날라갈수있으니 push전에 백업부탁드려요~)  -->

<title>관리자 카테고리 페이지</title>
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

/* ----------------------------------------------------------------------------------------------------------- */
    .outer{
        margin-right: 10px;
    }
    
    .top-box a{
        color: gray;
    }

    .top-box{
    padding: 25px;
    margin-top: 20px;
    margin-bottom: 10px;
    }

    .outer-body h2{
        padding-left: 20px;
        font-size: 36px;
        margin-bottom: 20px;
    }

    .for-seperate{
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        padding: 10px;
    }

    .class-box{
        height: 420px;
        overflow-y: scroll;
    }

    .for-seperate table{
        width: 450px;
    }

    .for-seperate table tr{
        height: 30px;
    }
    
    .for-seperate table thead tr:nth-child(1){
        height: 50px;
    }

    .for-seperate button{
        border: none ;
        border-radius: 5px ;
        height: 32px;
        padding: 0px 15px 0px 15px;
        color: white;
        font-weight: bold;
    }

    .for-seperate button:nth-child(1){
        background-color: rgb(231,76,60);
        margin-left: 5px;
    }

    .for-seperate button:nth-child(2){
        background-color: rgb(52,152,219);
        margin-right: 120px;
    }
    .for-seperate button:nth-child(3){
        background-color: rgb(0,153,102);
    }

    .majorclass-box{
        border: 3px solid tomato;
    }

    .minorclass-box{
        border: 3px solid turquoise;
    }

    .for-seperate label{
        width: 100%;
        height: 100%;
    }

    .for-seperate td, .for-seperate th{
        text-align: center;
    }

    .custom-check{
        display: none;   
    }
/* ------------------------------------------------------------------------------------------------------------ */
/* ----------------------- 삭제 모달 영역임 -------------------------------------------------------------------- */
    .delete-box{
		text-align: center;
		margin-top: 350px;
        width: 400px;
	}

	.modal-title{
		text-overflow:ellipsis;
		white-space:nowrap; 
		overflow:hidden;
		font-weight: bold;
	}

	.modal-footer button{
		width: 45%;
		margin: 0px;		
	}
/* ----------------------- 삭제 모달 영역임 --------------------------------------------------------------------- */
/* ----------------------- 수정 모달 영역임 --------------------------------------------------------------------- */
    #major-modify-modal, #minor-modify-modal{
		width: 100%;  
	}

	#major-modify-modal>div, #minor-modify-modal>div{
		width: 500px;  
		position: absolute; 
		top: 50%; 
		left: 50%; 
		transform: translate(-50%,-50%); 
	}

	#major-modify-modal h2 , #minor-modify-modal h2{
		color: rgb(22,160,133);
	}

	#major-modify-modal .modal-header, #minor-modify-modal .modal-header{
		margin-left: 5px;
		padding-bottom: 10px;
	}

	#major-modify-modal .modal-body span, #minor-modify-modal .modal-body span{
		margin-bottom: 10px;
		color: rgb(22,160,133);
        margin-right: 10px ;
        font-size: 18px;
	}

	#major-modify-modal .modal-body input, #minor-modify-modal .modal-body input{
        width: 65%;
        border: 2px solid gray;
        font-size: 18px;
	}

	#major-modify-modal .modal-footer, #minor-modify-modal .modal-footer{
		display: flex;
		justify-content: space-between;
		padding: 0px;
		height: 60px;
	}

	#major-modify-modal .modal-footer button, #minor-modify-modal .modal-footer button{
		width: 50%;
		height: 100%;
		border-radius:0px ;
		border: 1px solid white;
		font-size: 18px;
		font-weight: 900;
	}

	#major-modify-modal .modal-footer button:nth-child(1), #minor-modify-modal .modal-footer button:nth-child(1){
		background-color: #BEBEBE;
	}

	#major-modify-modal .modal-footer button:nth-child(2), #minor-modify-modal .modal-footer button:nth-child(2){
		background-color: rgb(0,102,51);
	}
/* ----------------------- 수정 모달 영역임 ----------------------------------------------------------------------------- */
/* ----------------------- 등록 모달 영역임 ----------------------------------------------------------------------------- */
    #major-enroll, #minor-enroll-modal{
		width: 100%;  
	}

	#major-enroll-modal>div, #minor-enroll-modal>div{
		width: 500px;  
		position: absolute; 
		top: 50%; 
		left: 50%; 
		transform: translate(-50%,-50%); 
	}

	#major-enroll-modal h2 , #minor-enroll-modal h2{
		color: rgb(22,160,133);
	}

	#major-enroll-modal .modal-header, #minor-enroll-modal .modal-header{
		margin-left: 5px;
		padding-bottom: 10px;
	}

	#major-enroll-modal table , #minor-enroll-modal table{
        width: 400px;
        margin: 20px;
	}

    #major-enroll-modal table tr, #minor-enroll-modal table tr{
        margin: 10px;
    }

	#major-enroll-modal table th, #minor-enroll-modal table th{
        text-align: center;
    }
    #major-enroll-modal table td, #minor-enroll-modal table td{
        padding-left: 15px;
    }

	#major-enroll-modal input, #minor-enroll-modal input{
        width: 100%;
        border: 2px solid gray;
        box-sizing: border-box;
	}

	#major-enroll-modal .modal-footer, #minor-enroll-modal .modal-footer{
		display: flex;
		justify-content: space-between;
		padding: 0px;
		height: 60px;
	}

	#major-enroll-modal .modal-footer button, #minor-enroll-modal .modal-footer button{
		width: 50%;
		height: 100%;
		border-radius:0px ;
		border: 1px solid white;
		font-size: 18px;
		font-weight: 900;
	}

	#major-enroll-modal .modal-footer button:nth-child(1), #minor-enroll-modal .modal-footer button:nth-child(1){
		background-color: #BEBEBE;
	}

	#major-enroll-modal .modal-footer button:nth-child(2), #minor-enroll-modal .modal-footer button:nth-child(2){
		background-color: rgb(0,102,51);
	}
/* ----------------------- 등록 모달 영역임 ----------------------------------------------------------------------------- */

    </style>
</head>
<body>
    <div class="wrap">
        <div id="horizontal-bar"></div>
        <div id="content">
            <div id="vertical-bar"></div>            
<!---------------------------------------------------------------------------------------------------------------------->            
            <script>
                $(document).ready(function() {
                    //라디오 요소처럼 동작시킬 체크박스 그룹 셀렉터
                    $('input[type="checkbox"][name="major"]').click(function(){
                        //클릭 이벤트 발생한 요소가 체크 상태인 경우
                        if ($(this).prop('checked')) {
                            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
                            $('input[type="checkbox"][name="major"]').prop('checked', false);
                            $(this).prop('checked', true);
                        }
                    });
                    $('input[type="checkbox"][name="minor"]').click(function(){
                        //클릭 이벤트 발생한 요소가 체크 상태인 경우
                        if ($(this).prop('checked')) {
                            //체크박스 그룹의 요소 전체를 체크 해제후 클릭한 요소 체크 상태지정
                            $('input[type="checkbox"][name="minor"]').prop('checked', false);
                            $(this).prop('checked', true);
                        }
                    });
                });
            </script>
<!---------------------------------------------------------------------------------------------------------------------->            
            <div class="outer">
                <div class="top-box">
                    <a href="">홈</a> >
                    <a href="">싸이트관리</a> >
                    <a href="">카테고리 관리</a>
                </div>
                <div class="outer-body">
                    <h2><b>카테고리 관리(<span style="color: tomato;">대분류</span>/<span style="color: turquoise;">소분류</span>)</b></h2>
                    <br style="clear: both;">
                    <div class="for-seperate">
                        <div class="majorclass-box class-box">
                            <table border="1" id="majorClass-table" style="border: rgb(204,204,204);">
                                <thead>
                                    <tr>
                                        <td colspan="3">
                                            <button data-toggle="modal" data-target="#major-del-modal">삭제</button>
                                            <button data-toggle="modal" data-target="#major-modify-modal">수정</button>
                                            <button  data-toggle="modal" data-target="#major-enroll-modal"> 대분류 카테고리 등록</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>선택</th>
                                        <th  width="160">대분류 카테고리 번호</th>
                                        <th>대분류 카테고리명</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox" name="major" id="majorClass1" value="1"><span ></span></td>
                                        <td>
                                            <label for="majorClass1">1</label>
                                        </td>   
                                        <td>
                                            <label for="majorClass1">육류</label>
                                        </td>   
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="major" id="majorClass2" value="2"></td>
                                        <td>
                                            <label for="majorClass2">2</label>
                                        </td>   
                                        <td>
                                            <label for="majorClass2">채소류</label>
                                        </td>   
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="major" id="majorClass3" value="3"></td>
                                        <td>
                                            <label for="majorClass3">3</label>
                                        </td>   
                                        <td>
                                            <label for="majorClass3">해산물</label>
                                        </td>   
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="major" id="majorClass4" value="4"></td>
                                        <td>
                                            <label for="majorClass4">4</label>
                                        </td>   
                                        <td>
                                            <label for="majorClass4">달걀/유제품</label>
                                        </td>   
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="major" id="majorClass5" value="5"></td>
                                        <td>
                                            <label for="majorClass5">5</label>
                                        </td>   
                                        <td>
                                            <label for="majorClass5">가공식품류</label>
                                        </td>   
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="major" id="majorClass6" value="6"></td>
                                        <td>
                                            <label for="majorClass6">6</label>
                                        </td>   
                                        <td>
                                            <label for="majorClass6">쌀</label>
                                        </td>   
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="major" id="majorClass7" value="7"></td>
                                        <td>
                                            <label for="majorClass7">7</label>
                                        </td>   
                                        <td>
                                            <label for="majorClass7">밀가루</label>
                                        </td>   
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <!-- 아래는 소분류 -->
                        <div class="minorclass-box class-box">
                            <table border="1" id="minorClass-table" style="border: rgb(204,204,204);">
                                <thead>
                                    <tr>
                                        <td colspan="6">
                                            <button  data-toggle="modal" data-target="#minor-del-modal">삭제</button>
                                            <button  data-toggle="modal" data-target="#minor-modify-modal">수정</button>
                                            <button  data-toggle="modal" data-target="#minor-enroll-modal"> 소분류 카테고리 등록</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>선택</th>
                                        <th width="160">소분류 카테고리 번호</th>
                                        <th>소분류 카테고리명</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><input type="checkbox" name="minor" id="minorClass1"></td>
                                        <td>
                                            <label for="minorClass1">1</label>
                                        </td>   
                                        <td>
                                            <label for="minorClass1">소고시</label>
                                        </td>   
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="minor" id="minorClass2"></td>
                                        <td>
                                            <label for="minorClass2">2</label>
                                        </td>   
                                        <td>
                                            <label for="minorClass2">돼지고기</label>
                                        </td>   
                                    </tr>
                                    <tr>
                                        <td><input type="checkbox" name="minor" id="minorClass3"></td>
                                        <td>
                                            <label for="minorClass3">3</label>
                                        </td>   
                                        <td>
                                            <label for="minorClass3">닭고기</label>
                                        </td>   
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>

            </div>
<!------------------------------------------------------------------------------------------------------------->            
<!------------------------------대분류 삭제모달 영역임  --------------------------------------------------------->
			<!-- The Modal -->
			<div class="modal fade" id="major-del-modal">
				<div class=" modal-dialog modal-sm">
					<div class="delete-box modal-content">
				
						<!-- Modal Header -->
						<div class="modal-header">
							<h5 class="modal-title">대분류 카테고리</h5>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						
						<!-- Modal body -->
						<div class="modal-body" style="color: red;">
							선택하신 ???? <br>대분류 카테고리를 삭제하시겠습니까?
						</div>
						
						<!-- Modal footer -->
						<div class="modal-footer" style="justify-content: space-around; border-top: none;">
							<button type="button" class="btn btn-light btn-bg" data-dismiss="modal" style="background-color: #BEBEBE; color: white;">취소</button>
							<button type="button" class="btn btn-danger btn-bg" data-dismiss="modal" onclick="">삭제</button>
						</div>
					
					</div>
				</div>
			</div>
<!------------------------------대분류 삭제모달 영역임  --------------------------------------------------------->
<!------------------------------소분류 삭제모달 영역임  --------------------------------------------------------->
			<!-- The Modal -->
			<div class="modal fade" id="minor-del-modal">
				<div class=" modal-dialog modal-sm">
					<div class="delete-box modal-content">
				
						<!-- Modal Header -->
						<div class="modal-header">
							<h5 class="modal-title">소분류 카테고리</h5>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						
						<!-- Modal body -->
						<div class="modal-body" style="color: red;">
                        선택하신 ???? <br>소분류 카테고리를 삭제하시겠습니까?
						</div>
						
						<!-- Modal footer -->
						<div class="modal-footer" style="justify-content: space-around; border-top: none;">
							<button type="button" class="btn btn-light btn-bg" data-dismiss="modal" style="background-color: #BEBEBE; color: white;">취소</button>
							<button type="button" class="btn btn-danger btn-bg" data-dismiss="modal" onclick="">삭제</button>
						</div>
					
					</div>
				</div>
			</div>
<!------------------------------소분류 삭제모달 영역임  -------------------------------------------------------------->
<!------------------------------대분류 수정모달 영역임  -------------------------------------------------------------->

			<!-- The Modal -->
			<div class="modal fade" id="major-modify-modal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
					
						<!-- Modal Header -->
						<div class="modal-header" style="border-bottom: none;">
							<h2 class="modal-title">대분류 카테고리 수정</h2>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
                            
						</div>
                        <form action="" method="GET">
                            <!-- Modal body -->
                            <div class="modal-body" > 
                                <span>카테고리명 : </span>
                                <input type="text" name="" id="" value="육류"> 
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                <button type="submit" class="btn btn-secondary">수정</button>
                            </div>
                        </form>
					</div>
				</div>
			</div>
<!------------------------------대분류 수정모달 영역 끝  ------------------------------------------------------------------->
<!------------------------------소분류 수정모달 영역임  -------------------------------------------------------------------->
			<!-- The Modal -->
			<div class="modal fade" id="minor-modify-modal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
					
						<!-- Modal Header -->
						<div class="modal-header" style="border-bottom: none;">
							<h2 class="modal-title">소분류 카테고리 수정</h2>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
                            
						</div>
                        <form action="" method="GET">
                            <!-- Modal body -->
                            <div class="modal-body" > 
                                <span>카테고리명 : </span>
                                <input type="text" name="" id="" value="육류"> 
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                <button type="submit" class="btn btn-secondary">수정</button>
                            </div>
                        </form>
                    </div>
				</div>
			</div>
<!------------------------------ 소분류 수정모달 영역 끝  ----------------------------------------------------------------------->
<!-- ----------------------------대분류 카테고리 등록 영역 시작---------------------------------------------------------------- -->
			<!-- The Modal -->
			<div class="modal fade" id="major-enroll-modal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content cat-enroll-box">
					
						<!-- Modal Header -->
						<div class="modal-header" style="border-bottom: none;">
							<h2 class="modal-title">대분류 카테고리 등록하기</h2>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
                            
						</div>
                        <form action="" method="GET">
                            <!-- Modal body -->
                            <table>
                                <tr>
                                    <th>분류</th>
                                    <td><span style="color: tomato;"><b>대분류 카테고리</b></span></td>
                                </tr>
                                <tr>
                                    <th>카테고리명</th>
                                    <td><input type="text" name="" value="" placeholder="카테고리명을 입력하세요"></td>
                                </tr>
                            </table>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                <button type="submit" class="btn btn-secondary">등록</button>
                            </div>
                        </form>
                    </div>
				</div>
			</div>
<!-- ----------------------------대분류 카테고리 등록 영역 끝------------------------------------------------------------------- -->
<!-- ----------------------------소분류 카테고리 등록 영역 시작----------------------------------------------------------------- -->
			<!-- The Modal -->
			<div class="modal fade" id="minor-enroll-modal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content cat-enroll-box">
					
						<!-- Modal Header -->
						<div class="modal-header" style="border-bottom: none;">
							<h2 class="modal-title">소분류 카테고리 등록하기</h2>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
                            
						</div>
                        <form action="" method="GET">
                            <!-- Modal body -->
                            <table>
                                <tr>
                                    <th>분류</th>
                                    <td><span style="color: turquoise;"><b>소분류 카테고리</b></span></td>
                                </tr>
                                <tr>
                                    <th>카테고리명</th>
                                    <td><input type="text" name="" value="" placeholder="카테고리명을 입력하세요"></td>
                                </tr>
                            </table>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                <button type="submit" class="btn btn-secondary">등록</button>
                            </div>
                        </form>
                    </div>
				</div>
			</div>
<!-- ----------------------------소분류 카테고리 등록 영역 끝---------------------------------------------------------------------- -->
        </div>
    </div>
</body>
</html>