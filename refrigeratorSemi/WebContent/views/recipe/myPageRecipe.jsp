<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- 작성자 : 재원      ※ 혹여나 해당 페이지에 작업시에 작업하신부분에 주석으로 성함과 영역을 표시해주세요! (혹여나 파일이 날라갈수있으니 push전에 백업부탁드려요~)  -->

<title>마이페이지 내가 쓴 레시피</title>
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

	/* 	나중에 tr hover시 여러 td에 스타일 먹이는 스크립트 구현해둬야한다. */
	.recipe-list-table {
		width: 100%;
		border-top: none;
		text-align: center;
	}

	.recipe-list-table th{
		padding: 12px;
	}

	.recipe-list-table td{
		text-align: center;
		padding: 8px;
	}

	.recipe-list-table>tbody>tr{
		border-bottom: 1px solid #dee2e6;
		border-top: 1px solid #dee2e6;
		vertical-align: middle;
	}

	.list-box{
		display: flex;
		cursor: pointer;
	}

	.list-box img{
		object-fit: cover;
	}


	.list-box div:last-child{
		padding-left: 10px ;
		text-align: left;
	}

	.recipe-list-table td a{
		color: black;
	}

	.recipe-list-table span{
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

/* ----------------------- 삭제 모달 영역 css시작 ---------------------------------- */
	.recipe-list-table button{
		background-color: white;
		border: none;
	}

	.delete-box{
		text-align: center;
		margin-top: 250px;
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
/* ----------------------- 삭제 모달 영역 css끝 ---------------------------------- */
</style>

</head>
<body>
	<%@ include file="../common/user/tempJWHeader.jsp" %>
	<%@ include file="../common/user/myPageVerticalNav.jsp" %>
		<!-- 마이페이지 작업영역  시작-->
		<div class="outer">
			<p>내가 쓴 레시피</p> 
            <div class="division-line"></div>
			<table class="recipe-list-table" >
				<thead>
					<tr>
						<th>작성일</th>
						<th>내용</th>
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
								<img src="<%= request.getContextPath() %>/resources/image/sampleFood.jpg" alt="" width="110" height="110">
							</div>
							<div>
								<p>매운떡볶이 그만 먹엉</p>
								<span>스크랩</span> 출력식  <br>
								<span>평균별점</span> <i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i> &nbsp; 함수를활용한출력식 <br>
								<span>조회수</span> 출력식 <br>
							</div>
						</td>
						<td>user01</td>
						<td><a href=""><i class="fas fa-edit"></i></a></td>
						<td><button type="button" data-toggle="modal" data-target="#recipe-del-modal"><i class="fas fa-trash-alt"></i></button></td>
					</tr>
					<tr>
						<td>21-04-01</td>
						<td  class="list-box" onclick="">
							<div>
								<img src="<%= request.getContextPath() %>/resources/image/sampleFood.jpg" alt="" width="110" height="110">
							</div>
							<div>
								<p>매운떡볶이 그만 먹엉</p>
								<span>스크랩</span> 출력식  <br>
								<span>평균별점</span> <i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i> &nbsp; 함수를활용한출력식 <br>
								<span>조회수</span> 출력식 <br>
							</div>
						</td>
						<td>user01</td>
						<td><a href=""><i class="fas fa-edit"></i></a></td>
						<td><button type="button" data-toggle="modal" data-target="#recipe-del-modal"><i class="fas fa-trash-alt"></i></button></td>
					</tr>
					<tr>
						<td>21-04-01</td>
						<td  class="list-box" onclick="">
							<div>
								<img src="<%= request.getContextPath() %>/resources/image/sampleFood.jpg" alt="" width="110" height="110">
							</div>
							<div>
								<p>매운떡볶이 그만 먹엉</p>
								<span>스크랩</span> 출력식  <br>
								<span>평균별점</span> <i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i> &nbsp; 함수를활용한출력식 <br>
								<span>조회수</span> 출력식 <br>
							</div>
						</td>
						<td>user01</td>
						<td><a href=""><i class="fas fa-edit"></i></a></td>
						<td><button type="button" data-toggle="modal" data-target="#recipe-del-modal"><i class="fas fa-trash-alt"></i></button></td>
					</tr>
					<tr>
						<td>21-04-01</td>
						<td  class="list-box" onclick="">
							<div>
								<img src="<%= request.getContextPath() %>/resources/image/sampleFood.jpg" alt="" width="110" height="110">
							</div>
							<div>
								<p>매운떡볶이 그만 먹엉</p>
								<span>스크랩</span> 출력식  <br>
								<span>평균별점</span> <i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i> &nbsp; 함수를활용한출력식 <br>
								<span>조회수</span> 출력식 <br>
							</div>
						</td>
						<td>user01</td>
						<td><a href=""><i class="fas fa-edit"></i></a></td>
						<td><button type="button" data-toggle="modal" data-target="#recipe-del-modal"><i class="fas fa-trash-alt"></i></button></td>
					</tr>
					<tr>
						<td>21-04-01</td>
						<td  class="list-box" onclick="">
							<div>
								<img src="<%= request.getContextPath() %>/resources/image/sampleFood.jpg" alt="" width="110" height="110">
							</div>
							<div>
								<p>매운떡볶이 그만 먹엉</p>
								<span>스크랩</span> 출력식  <br>
								<span>평균별점</span> <i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i> &nbsp; 함수를활용한출력식 <br>
								<span>조회수</span> 출력식 <br>
							</div>
						</td>
						<td>user01</td>
						<td><a href=""><i class="fas fa-edit"></i></a></td>
						<td><button type="button" data-toggle="modal" data-target="#recipe-del-modal"><i class="fas fa-trash-alt"></i></button></td>
					</tr>
				</tbody>
			</table>
<!----------------------------------- 페이지바 영역 반복문 돌려줘야함 ----------------------------------------------->
			<div class="paging-bar">
				<ul class="pagination">
					<li class="page-item"><a class="page-link" href="#">&lt;</a></li>
					<li class="page-item"><a class="page-link" href="#">1</a></li>
					<li class="page-item active"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#">3</a></li>
					<li class="page-item"><a class="page-link" href="#">&gt;</a></li>
				</ul>
			</div>
		</div>
<!----------------------------------- 페이지바 영역 반복문 돌려줘야함 ----------------------------------------------->
	</div>

<!------------------------------ 삭제모달 영역임  -------------------------------------------------------------------------------------------------------------->
	<!-- The Modal -->
	<div class="modal fade" id="recipe-del-modal">
		<div class=" modal-dialog modal-sm">
			<div class="delete-box modal-content">
		
				<!-- Modal Header -->
				<div class="modal-header">
					<h5 class="modal-title">레시피 : 매운떡볶이 그만먹엉</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				
				<!-- Modal body -->
				<div class="modal-body" style="color: red;">
					작성한 레시피를 삭제하시겠습니까?
				</div>
				
				<!-- Modal footer -->
				<div class="modal-footer" style="justify-content: space-around; border-top: none;">
					<button type="button" class="btn btn-light btn-bg" data-dismiss="modal" style="background-color: #BEBEBE; color: white;">취소</button>
					<button type="button" class="btn btn-danger btn-bg" data-dismiss="modal" onclick="">삭제</button>
				</div>
			
			</div>
		</div>
	</div>
<!------------------------------ 삭제모달 영역임  -------------------------------------------------------------------------------------------------------------->
	<%@ include file="../common/user/footer.jsp" %>

</body>
</html>