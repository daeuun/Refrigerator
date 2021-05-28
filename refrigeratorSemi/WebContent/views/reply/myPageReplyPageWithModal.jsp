<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- 작성자 : 재원      ※ 혹여나 해당 페이지에 작업시에 작업하신부분에 주석으로 성함과 영역을 표시해주세요! (혹여나 파일이 날라갈수있으니 push전에 백업부탁드려요~)  -->

<title>마이페이지 내가 쓴 댓글</title>
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
		margin-top: 35px;
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

	.list-box div{
		text-align: left;
	}

	.list-box p{
		font-size: 14px;
		font-weight: 900;
		width: 100%;
		padding-top: 5px;
		margin-bottom: 10px;
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
	<%@ include file="../common/tempJWHeader.jsp" %>
	<%@ include file="../common/myPageVerticalNav.jsp" %>
		<!-- 마이페이지 작업영역  시작-->
		<div class="outer">
			<p>내 댓글 관리</p> 
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
					<tr>
						<td>21-04-01</td>
						<td  class="list-box" onclick="">
							<div>
								<p>매운떡볶이 그만먹엉</p>
								<pre>먹어보니 생각보다....

맵지는 않아요 
									
저는 비추.... 제목처럼 그만 먹어여용 ㅎㅎ</pre>
							</div>
						</td>
						<td>user01</td>
						<td><button type="button" data-toggle="modal" data-target="#reply-modify-modal"><i class="fas fa-edit"></i></button></td>
						<td><button type="button" data-toggle="modal" data-target="#reply-del-modal"><i class="fas fa-trash-alt"></i></button></td>
					</tr>
					<tr>
						<td>21-04-01</td>
						<td  class="list-box" onclick="">
							<div>
								<p>닭고기로 튀김을? 꿔바로우와 치킨의 그 사이...</p>
								<pre>이 편지는 영국에서 최초로 시작되어 일년에 한 바퀴 돌면서 받는 사람에게 행운을 주었고 지금은 당신에게로 옮겨진 이 편지는 4일 안에 당신 곁을 떠나야 합니다. 이 편지를 포함해서 7통을 행운이 필요한 사람에게 보내 주셔야 합니다. 복사를 해도 좋습니다</pre>
							</div>
						</td>
						<td>user01</td>
						<td><button type="button" data-toggle="modal" data-target="#reply-modify-modal"><i class="fas fa-edit"></i></button></td>
						<td><button type="button" data-toggle="modal" data-target="#reply-del-modal"><i class="fas fa-trash-alt"></i></button></td>
					</tr>
					<tr>
						<td>21-04-01</td>
						<td  class="list-box" onclick="">
							<div>
								<p>맛나맛나마탕</p>
								<pre>달달하구먼유
									맛있어유</pre>
							</div>
						</td>
						<td>user01</td>
						<td><button type="button" data-toggle="modal" data-target="#reply-modify-modal"><i class="fas fa-edit"></i></button></td>
						<td><button type="button" data-toggle="modal" data-target="#reply-del-modal"><i class="fas fa-trash-alt"></i></button></td>
					</tr>
					<tr>
						<td>21-04-01</td>
						<td  class="list-box" onclick="">
							<div>
								<p>간단 주먹밥</p>
								<pre>애들이 좋아해요~~</pre>
							</div>
						</td>
						<td>user01</td>
						<td><button type="button" data-toggle="modal" data-target="#reply-modify-modal"><i class="fas fa-edit"></i></button></td>
						<td><button type="button" data-toggle="modal" data-target="#reply-del-modal"><i class="fas fa-trash-alt"></i></button></td>
					</tr>
					<tr>
						<td>21-04-01</td>
						<td  class="list-box" onclick="">
							<div>
								<p>김치찌개 라면!</p>
								<pre>팔로우 하고 갑니다! </pre>
							</div>
						</td>
						<td>user01</td>
						<td><button type="button" data-toggle="modal" data-target="#reply-modify-modal"><i class="fas fa-edit"></i></button></td>
						<td><button type="button" data-toggle="modal" data-target="#reply-del-modal"><i class="fas fa-trash-alt"></i></button></td>
					</tr>
				</tbody>
			</table>

			<div class="paging-bar">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">&lt;</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item active"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">&gt;</a></li>
				</ul>
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
						
						<!-- Modal body -->
						<div class="modal-body" > 
							<span>댓글내용</span>
							<textarea name="" id="" cols="60" rows="8" style="resize: none;">뭔가 기존의 댓글 내용이 들어가 있어야한다. </textarea> 
						</div>
						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
							<button type="button" class="btn btn-secondary" data-dismiss="modal">등록</button>
						</div>
					</div>
				</div>
			</div>
<!------------------------------ 수정모달 영역 끝  -------------------------------------------------------------------------------------------------------------->
<!------------------------------ 삭제모달 영역 시작 -------------------------------------------------------------------------------------------------------------->
			<!-- The Modal -->
			<div class="modal fade" id="reply-del-modal">
				<div class=" modal-dialog modal-sm">
					<div class="delete-box modal-content">
				
						<!-- Modal Header -->
						<div class="modal-header">
							<h5 class="modal-title">레시피 : 닭고기로 튀김을? 꿔바로우와 치킨의 그 사이...ㄴㅇㄹㄴㅇㄹㅁㄴㅇㄻㄴㅇㄹㄹㄴㅇ</h5>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
						</div>
						
						<!-- Modal body -->
						<div class="modal-body" style="color: red;">
							댓글을 삭제하시겠습니까?
						</div>
						
						<!-- Modal footer -->
						<div class="modal-footer" style="justify-content: space-around; border-top: none;">
							<button type="button" class="btn btn-light btn-bg" data-dismiss="modal" style="background-color: #BEBEBE; color: white;">취소</button>
							<button type="button" class="btn btn-danger btn-bg" data-dismiss="modal" onclick="">삭제</button>
						</div>
					
					</div>
				</div>
			</div>
<!------------------------------ 삭제모달 영역 끝  -------------------------------------------------------------------------------------------------------------->
		</div>
		<!-- 마이페이지 작업영역  끝-->
	</div>
	<%@ include file="../common/footer.jsp" %>

</body>
</html>