<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="com.refrigerator.tos.model.vo.Tos"%>   

<%
	Tos t = (Tos)request.getAttribute("tos");
%>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- 작성자 : 재원      ※ 혹여나 해당 페이지에 작업시에 작업하신부분에 주석으로 성함과 영역을 표시해주세요! (혹여나 파일이 날라갈수있으니 push전에 백업부탁드려요~)  -->

<title>관리자 이용약관 수정페이지</title>
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
    #for-height{height: 1170px;} 
    div{box-sizing: border-box;}
    .wrap{margin: auto; width: 1200px; height: 750px;}
    .outer{ width: 1000px; float: right; margin-right: 5px;}
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

    #tos_cnt{
    	float:right;
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
/* ----------------------- 삭제 모달 영역임 ---------------------------------- */
	.delete-box{
		text-align: center;
		margin-top: 300px;
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
/* ----------------------- 삭제 모달 영역임 ---------------------------------- */
    </style>
</head>
<body>
    <%@ include file="../common/admin/adminTopNavView.jsp" %>
    <div class="wrap">
   	<%@ include file="../common/admin/adminSideBarView.jsp" %> 
        <div id="content">
<!-------------------------------------------------------------------------------------------------------------->            
            <div class="outer">
                <div class="top-box">
                    <a href="">홈</a> >
                    <a href="">싸이트관리</a> >
                    <a href="">이용약관관리</a>
                </div>
                <div class="outer-body">
                    <h2><b>이용약관 수정 및 삭제</b></h2>
                    <form action="update.tos" method="POST">
                    	<input type="hidden" name="tosNo" value="<%= t.getTosNo() %>">
                        <table border="1" style="border: rgb(204,204,204);">
                            <tr>
                                <th>이용약관명</th>
                                <td>
                                    <input type="text" name="tosTitle" placeholder="이용약관 제목을 입력하세요" required value="<%= t.getTosTitle() %>">
                                </td>
                            </tr>
                            <tr>
                                <th>상태</th>
                                <td>
                                     <select id="tosStatus" name="tosCategory" style="width: 150px;">
                                        <option value="작성중">작성중</option>
                                        <option value="보류중">보류중</option>
                                        <option value="게시중">게시중</option>                                        
                                    </select>
                                 	<span style="color:red; font-size:12px"><b>※ 게시중 선택시 곧바로 게시됩니다. 신중하게 선택해주세요</b></span>
                                    
               						<script>
										$('#tosStatus').val('<%= t.getTosCategory()%>').prop("selected",true);
									</script>
                                    
                                </td>
                            </tr>
                            <tr>
                                <th>작성자</th>
                                <td><b>냉장고에 뭐있지?</b></td>
                            </tr>
                            <tr>
                                <th>사용될 페이지 영역</th>
                                <td>
                                   <select id="needOptionCheck" name="tosPage" style="width: 300px;" >
                                        <option value="FOOTER_1" >푸터 이용약관 </option>
                                        <option value="FOOTER_2">푸터 개인정보취급방침</option>
                                        <option value="MEMBER_ENROLL_1">회원가입 이용약관</option>
                                        <option value="MEMBER_ENROLL_2">회원가입 개인정보취급방침</option>
                                        <option value="undecided_1">테스트용01</option>                                        
                                        <option value="undecided_2">테스트용02</option>                                        
                                        <option value="undecided_3">테스트용03</option>                                        
                                        <option value="undecided_4">테스트용04</option>                                        
                                        <option value="undecided_5">테스트용05</option>                                        
                                        <option value="undecided_6">테스트용06</option>                                        
                                        <option value="undecided_7">테스트용07</option>                                        
                                    </select>
									<span style="color:red; font-size:12px"><b>※ 페이지 변경시 기존에 지정하지 않은 페이지를 선택해야합니다.</b></span>
                                    
									<script>
										$('#needOptionCheck').val('<%= t.getTosPage() %>').prop("selected",true);
									</script>
                                </td>
                            </tr>
                            <tr class="tos-area">
                                <td colspan="2" style="padding: 15px 0px 15px 0px; border: none; resize: none;">
                                    <textarea name="tosContent" id="tos-write" style="resize: none;" placeholder="1300자 이내로 작성해주세요" required><%= t.getTosContent() %></textarea>
									<div id="tos_cnt">(0 / 1300)</div>
                                </td>                            
                            </tr>
                            <tr>
                                <th style="height: 38px;">비고</th>
                                <td>
                                    <input type="text" name="tosNote" placeholder="내용을 입력해주세요" value="<% if(t.getTosNote() !=null){%><%= t.getTosNote() %><%}else{} %>">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="btn-area" style="padding: 0px; border: none;">
                                    <button type="submit">수정하기</button>
                                    <button type="button" style="float: right; width: 60px; background-color: rgb(231,76,60);" data-toggle="modal" data-target="#tos-del-modal">삭제</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
            <!-- 글자수 제한 스크립트  -->
            <script type="text/javascript">
             $(document).ready(function() {
                 $('#tos-write').on('keyup', function() {
                     $('#tos_cnt').html("("+$(this).val().length+" / 1300)");
              
                     if($(this).val().length > 1300) {
                         $(this).val($(this).val().substring(0, 1300));
                         $('#test_cnt').html("(1300 / 1300)");
                     }
                 });
             });
             
             $(function(){
                 $('#tos_cnt').html("("+$("#tos-write").val().length+" / 1300)");
             })
            </script>
           
<!------------------------------------------------------------------------------------------------------------->    
<!------------------------------ 삭제모달 영역임  -------------------------------------------------------------------------------------------------------------->
			<!-- The Modal -->
			<div class="modal fade" id="tos-del-modal">
				<div class=" modal-dialog modal-sm">
					<div class="delete-box modal-content" style="width: 400px;">
				
						<!-- Modal Header -->
						<div class="modal-header">
							<h5 class="modal-title">이용약관 : <%= t.getTosTitle() %></h5>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						
						<!-- Modal body -->
						<div class="modal-body" style="color: red;">
							한번 삭제하시면 되돌릴 수 없습니다.<br>
							작성한 이용약관을 삭제하시겠습니까? 
						</div>
						
						<!-- Modal footer -->
						<div class="modal-footer" style="justify-content: space-around; border-top: none;">
							<button type="button" class="btn btn-light btn-bg" data-dismiss="modal" style="background-color: #BEBEBE; color: white;">취소</button>
							<button type="button" class="btn btn-danger btn-bg" data-dismiss="modal" onclick="location.href='<%= request.getContextPath() %>/delete.tos?bno=<%= t.getTosNo() %>';">삭제</button>
						</div>
					
					</div>
				</div>
			</div>
<!------------------------------ 삭제모달 영역임  -------------------------------------------------------------------------------------------------------------->
        </div>
    </div>
</body>
</html>