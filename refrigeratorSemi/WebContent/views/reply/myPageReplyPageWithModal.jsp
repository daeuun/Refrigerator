<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.refrigerator.common.model.vo.PageInfo, java.util.ArrayList , com.refrigerator.reply.model.vo.Reply"%>    


<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Reply> list = (ArrayList<Reply>)request.getAttribute("replyList");
	
	// 아래는 현재 페이지에서 필요한 페이징 변수들이다. 
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
		
	//※ 셈플데이터가 얼마없어서 보기 좀그랬지만 이제 다 뽑아왔다 내일 바로 
	// 1) 화면단에 뿌려주기  (조회된 댓글이 없을떄 보여줄 화면  / 조회된 것이 있을때 보여줄것 )
    // 2) 셈플데이터 추가해주고 (최소 6개는 더 만들어서 심어주자)
	// 3) 페이징 잘먹는지 확인 
    // 4) 후에 수정 해결해주고 
    // 5) 삭제 처리까지 해주자
	
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- 작성자 : 재원      ※ 혹여나 해당 페이지에 작업시에 작업하신부분에 주석으로 성함과 영역을 표시해주세요! (혹여나 파일이 날라갈수있으니 push전에 백업부탁드려요~)  -->

<title>마이페이지 내가 쓴 댓글</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<style>
	.outer{
		width: 800px;
		margin-right: 70px;
		margin-top: 20px;
		margin-bottom: 20px;
	}

	.outer > p {
        color: rgb(0,102,51);
		font-weight: 900;
		font-size: 24px;
	}

	.division-line{
		width: 800px;
		border: 1px solid rgb(0,102,51);
		margin-top: 10px;
		height: 0px;
		background-color: rgb(0,102,51);
	}
	/* 얘도 나중에 tr hover시 여러 td에 스타일 먹이는 스크립트 구현해둬야한다.  */
	.reply-list-table {
		width: 100%;
		border-top: none;
		text-align: center;
	}

	.reply-list-table th{
		padding-top: 15px;
		padding-bottom: 12px;
	}

	.reply-list-table td{
		text-align: center;
		padding: 8px;
	}

	.reply-list-table>tbody>tr{
		border-bottom: 1px solid #dee2e6;
		border-top: 1px solid #dee2e6;
		vertical-align: middle;
	}

	.list-box{
		cursor: pointer;
	}
	
	.list-box:hover{
        cursor: pointer;
        box-sizing:border;        
        background-color:rgb(219,255,207);
        border: 1px solid orange;
    }

	.list-box div{
		text-align: left;
	}

	.list-box p{
		font-size: 14px;
		font-weight: 900;
		width: 100%;
		padding-top: 5px;
		margin-bottom: 10px;
		color:orange;
	}

	.list-box pre{
		color: gray;
		font-size: 13px;
		line-height: 15px;
		width: 465px;
		white-space:pre-line; 
		text-overflow:clip;
		word-break:keep-all;
		margin: 0px;
	}
	
	.reply-list-table button:hover{
		background: rgb(219,255,207);
	}

	.reply-list-table td a{
		color: black;
	}

	.reply-list-table span{
		width: 80px;
		display: inline-block;
		text-align: center;
		height: 25px;
	}

	.paging-bar{
		text-align: center;
	}

	.pagination{
		margin-top: 20px ;
		justify-content: center;
	}
/*-------------------------페이징바 영역 ----------------------------------------------------------------------*/
    .paging-area{
   		text-align: center;
    }

	.paging-area button{
		width:40px;
		height:40px;
        margin: 5px;	
		margin-top: 30px ;
		justify-content: center;
		border-radius: 5px;
    	background-color: rgb(244,244,244);
		color: rgb(127,127,127);
    	font-size:16px;
    	font-weight: bold;		
	}    
    
    #dis-btn{
    	background-color: rgb(52,152,219);
    	color:white;
    }
/* ----------------------- 수정 모달 영역 css 시작 ----------------------------------------- */
	#reply-modify-modal{
		width: 100%;  
	}

	#reply-modify-modal>div{
		width: 500px;  
		position: absolute; 
		top: 50%; 
		left: 50%; 
		transform: translate(-50%,-50%); 
	}

	#reply-modify-modal h2{
		color: rgb(22,160,133);
	}

	#reply-modify-modal .modal-header{
		margin-left: 5px;
		padding-bottom: 10px;
	}

	#reply-modify-modal .modal-body textarea{
		border: 2px solid green;
	}

	#reply-modify-modal .modal-body span{
		display: block;
		margin-bottom: 10px;
		color: rgb(22,160,133);
	}

	#reply-modify-modal .modal-footer{
		display: flex;
		justify-content: space-between;
		padding: 0px;
		height: 60px;
	}

	#reply-modify-modal .modal-footer button{
		width: 50%;
		height: 100%;
		border-radius:0px ;
		border: 1px solid white;
		font-size: 18px;
		font-weight: 900;
	}

	#passedTtile{
		width:100%; 
		white-space:nowrap; 
		overflow:hidden;
		text-overflow: ellipsis;
		margin-top: 10px;
	}

	#reply-modify-modal .modal-footer button:nth-child(1){
		background-color: #BEBEBE;
	}

	#reply-modify-modal .modal-footer button:nth-child(2){
		background-color: rgb(0,102,51);
	}
/* -----------------------  수정 모달 영역 css 끝  ----------------------------------------------------------------------------- */
/* ----------------------- 삭제 모달 영역 css 시작 ---------------------------------------------------------------------------- */
	.reply-list-table button{
		background-color: white;
		border: none;
	}

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
/* ----------------------- 삭제 모달 영역 css 끝----------------------------------------------- ---------------------------------- */
</style>
</head>

<body>
	<%@ include file="../common/user/menubar.jsp" %>
	<%@ include file="../common/user/myPageVerticalNav.jsp" %>
		<!-- 마이페이지 작업영역  시작-->
		<div class="outer">
			<p>내 댓글 관리</p> 
			<span style="color:blue; font-size:14px; margin-left:200px;"> ※  내용을 클릭시에 해당 레시피페이지로 이동합니다</span>
            <div class="division-line"></div>
			<table class="reply-list-table" >
				<thead>
					<tr>
						<th>작성일</th>
						<th width="250" >내용</th>
						<th>작성자</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<!-- 조회해와서 반복문으로 돌려줘야한다. -->
					
					<% if(list.size() < 5){ %>
						<%for(Reply r : list){%>
							<tr>
								<input type="hidden" value="<%= r.getReplyNo() %>">
								<td><%= r.getModifyDate() %></td>
								<td  class="list-box" onclick="location.href='<%= request.getContextPath() %>/detail.recipe?rno='+ <%= r.getReplyNo() %>">
									<div>
										<p><%= r.getRecipeTitle() %></p>
										<pre><%= r.getReplyContent() %></pre>
									</div>
								</td>
								<td><%= loginUser.getUserId() %></td>
								<td><button onclick="modifyReply(this);" type="button" data-toggle="modal" data-target="#reply-modify-modal"><i class="fas fa-edit"></i></button></td>
								<td><button onclick="deleteReply(this);" type="button" data-toggle="modal" data-target="#reply-del-modal"><i class="fas fa-trash-alt"></i></button></td>
							</tr>
						<%}; %>
						<% for(int i=0; i<5-list.size(); i++){ %>
							<tr>
								<td colspan="5" style="color:gray; font-size:14px;"> 더 적성하신 댓글이 없습니다. 냉장고에 뭐있지?에는 좋은 레시피가 많아요 댓글 작성 해주세요^^ </td>
							</tr>
						<%} %>
					<% }else{ %>
						<%for(Reply r : list){%>
							<tr>
								<input type="hidden" value="<%= r.getReplyNo() %>">
								<td><%= r.getModifyDate() %></td>
								<td  class="list-box" onclick="location.href='<%= request.getContextPath() %>/detail.recipe?rno='+ <%= r.getReplyNo() %>">
									<div>
										<p><%= r.getRecipeTitle() %></p>
										<pre><%= r.getReplyContent() %></pre>
									</div>
								</td>
								<td><%= loginUser.getUserId() %></td>
								<td><button type="button" data-toggle="modal" data-target="#reply-modify-modal"><i class="fas fa-edit"></i></button></td>
								<td><button type="button" data-toggle="modal" data-target="#reply-del-modal"><i class="fas fa-trash-alt"></i></button></td>
							</tr>
						<%}%>
					<% } %>					
				</tbody>
			</table>
			<script>
	
				function modifyReply(standard){
					// 기준점이 되는 tr을 선정함 
					var standard = $(standard).parent().parent(); // 전역 변수로 쓸수가 없다.
					var passReplyNo = $(standard).children("input").val();// 댓글번호
					var passRecipeTitle = $(standard).children(".list-box").children().children("p").html();// 레시피 제목
					var passReplyContent = $(standard).children(".list-box").children().children("pre").html();// 레시피 제목
					
					$("#passedTtile").text("레시피 : " + passRecipeTitle);
					$("#passedMReplyNo").val(passReplyNo);
					$("#passedConente").text(passReplyContent);
				}
				
				function deleteReply(standard){
					var standard = $(standard).parent().parent(); // 전역 변수로 쓸수가 없다.
					var passReplyNo = $(standard).children("input").val();// 댓글번호
					var passRecipeTitle = $(standard).children(".list-box").children().children("p").html();// 레시피 제목
					$("#passedDReplyNo").val(passReplyNo);
					$("#passedDRecipeTitle").text(passRecipeTitle);
				}

			</script>

<!------------------------------------- 페이징바 영역 --------------------------------------------------------->

		        <div align="center" class="paging-area">
		
					<!-- 현재 보고있는 페이지가 1일 떄 버튼 안보이게 하려면 아래와같이 -->
					<% if(currentPage != 1){ %>
		            	<button onclick="location.href='<%= request.getContextPath() %>/mylist.rpl?currentPage=<%= currentPage-1 %>';">&lt;</button>
		            <%} %>
		            
		            <% for(int p=startPage; p<=endPage; p++){ %>
		            	<% if(p != currentPage) {%>	
		            		<button onclick="location.href='<%= request.getContextPath()%>/mylist.rpl?currentPage=<%= p %>';"><%= p %></button>
		            	<%}else{ %>
		         	    	<button id="dis-btn" disabled><%= p %></button>
		    	    	    <!-- 현제 페이지수는 다시 클릭이 불가능하게 만들어주자! -->
		            	<%}%>
		            <%}%>
			
					<!-- 현재 보고있는 페이지가 마지막페이지일 떄 버튼 안보이게 하려면 아래와같이 -->
					<% if(currentPage != maxPage){ %>                        
		            	<button onclick="location.href='<%= request.getContextPath() %>/mylist.rpl?currentPage=<%= currentPage+1 %>';">&gt;</button>
		            <%} %>
		        </div>
				

            </div>
<!------------------------------ 수정모달 영역 시작  -------------------------------------------------------------------------------------------------------------->

			<!-- The Modal -->
			<div class="modal fade" id="reply-modify-modal">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
					
						<!-- Modal Header -->
						<div class="modal-header" style="border-bottom: none;">
							<h2 class="modal-title">댓글수정</h2>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						<span id="passedTtile" style="font-weight:bold; margin-left:18px; color:orange"></span>
						
						<form action="myReplyUpdate.rpl" method="POST"> 
							<!-- Modal body -->
							<div class="modal-body" > 
								<input type="hidden" id="passedMReplyNo" name="replyNo">
								<span>댓글내용</span>
								<textarea name="replyContent" id="passedConente" cols="60" rows="8" style="resize: none;"></textarea> 
							</div>
							<!-- Modal footer -->
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
								<button type="submit" class="btn btn-secondary">등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
<!------------------------------ 수정모달 영역 끝  -------------------------------------------------------------------------------------------------------------->
<!------------------------------ 삭제모달 영역 시작 -------------------------------------------------------------------------------------------------------------->
			<!-- The Modal -->
			<div class="modal fade" id="reply-del-modal">
				<div class=" modal-dialog modal-sm">
					<div class="delete-box modal-content" style="width: 400px;">
				
						<!-- Modal Header -->
						<div class="modal-header">
							<h5 id="passedDRecipeTitle" class="modal-title">레시피 : 닭고기로 튀김을? 꿔바로우와 치킨의 그 사이...ㄴㅇㄹㄴㅇㄹㅁㄴㅇㄻㄴㅇㄹㄹㄴㅇ</h5>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						
						<form action="myReplyDelete.rpl" method="post">
							<!-- Modal body -->
							<input type="hidden" id="passedDReplyNo" name="replyNo">
							<div class="modal-body" style="color: red;">
							  해당 레시피에 작성하신	댓글을 삭제하시겠습니까?
							</div>
							
							<!-- Modal footer -->
							<div class="modal-footer" style="justify-content: space-around; border-top: none;">
								<button type="button" class="btn btn-light btn-bg" data-dismiss="modal" style="background-color: #BEBEBE; color: white;">취소</button>
								<button type="submit" class="btn btn-danger btn-bg">삭제</button>
							</div>
						</form>
					</div>
				</div>
			</div>
<!------------------------------ 삭제모달 영역 끝  -------------------------------------------------------------------------------------------------------------->
		</div>
		<!-- 마이페이지 작업영역  끝-->
	</div>
	<%@ include file="../common/user/footer.jsp" %>

</body>
</html>