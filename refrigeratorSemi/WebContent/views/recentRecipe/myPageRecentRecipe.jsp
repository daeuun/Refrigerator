<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- 작성자 : 재원      ※ 혹여나 해당 페이지에 작업시에 작업하신부분에 주석으로 성함과 영역을 표시해주세요! (혹여나 파일이 날라갈수있으니 push전에 백업부탁드려요~)  -->

<title>마이페이지 최근본레시피</title>
<style>
	.outer{
		width: 850px;
		margin-right: 55px;
		margin-top: 20px;
		padding-top: 60px;
		margin-bottom: 20px;
	}

	.outer > p {
		color: rgb(0,102,51);
		font-weight: 900;
		padding-left: 30px;
		font-size: 18px;
    }


	.division-line{
		width: 820px;
		border: 1px solid rgb(207,207,207);
		margin-bottom: 20px;
	}

	#mypage-thumbnail-table{
		width: 820px;
	}
	
	#mypage-thumbnail-table tr{
		display: flex;
		justify-content: flex-start;
		/* justify-content: space-around; 나중에 2개의 데이터 조회되었을시에   */
		margin-bottom: 20px;
	}

	#mypage-thumbnail-table td{
		width: 240px;
	}

	#mypage-thumbnail-table td:nth-child(2), #mypage-thumbnail-table td:nth-child(3){
		margin-left: 50px;
	}

	.thumbnail-box {
		height: 380px;
		width: 100%;
		text-align: center;
		margin: auto;
		box-sizing: border-box;
		border: 1px solid rgb(224,224,224);
		cursor: pointer;
	}

	.thumbnail-box:hover{
		background-color: rgba(180,0,0,0.03);
		border: 1px solid orange;
		transform: scale(1.02);
	}
	
	.thumbnail-box img:nth-child(1){
		width: 235px;
		height: 225px;
		object-fit: cover;
	}

	.thumbnail-box img:nth-child(3){
		width: 75px;
		height: 75px;
		margin-top: -60px;
		border-radius: 50%;
	}

	.thumbnail-box span{
		font-weight: 700;
	}

	.thumbnail-box p{
		font-size: 14px;
		text-align: center;
		margin: auto;
		width:220px; 
		white-space:nowrap; 
		overflow:hidden;
		text-overflow: ellipsis;
		margin-top: 10px;
	}

	.star-box{
		margin-top: 15px;
		height: 30px;
	}
	.bottom-box-parent{
		display: flex;
		justify-content: space-between;
	}

	.bottom-box{
		width: 50%;
		box-sizing: border-box;
		display: inline-block;
		border: 2px solid gray;
		height: 30px;
		margin: 0px;
	}
	.bottom-box i{
		float: left;
		line-height: 25px;
		margin-left: 3px;
	}
</style>

</head>
<body>
	<%@ include file="../common/tempJWHeader.jsp" %>
	<%@ include file="../common/myPageVerticalNav.jsp" %>
		<!-- 마이페이지 작업영역  시작-->
		<div class="outer">
			<p>최근본레시피</p> 
            <div class="division-line"></div>
			<table id="mypage-thumbnail-table">
				<!-- tr요소부터 반복문으로 돌려야한다. 2중 중첩문이다. -->
				<tr>
					<td>
						<div class="thumbnail-box" onclick="">
							<img src="../../resources/images/sampleFood.jpg"> <br>
							<img src="../../resources/images/user.png"><br>
							<span>프로필명 01</span>
							<p>위치잡으려면 어쩔수 없이 ...으로 표기를 해줘야한다.</p>
							<div class="star-box">
								<!-- 여기도 반복문 돌려야한다! 조건문과 같이 -->
								<i class="fas fa-star fa-lg"></i> 
								<i class="fas fa-star fa-lg"></i> 
								<i class="fas fa-star fa-lg"></i> 
								<i class="fas fa-star-half-alt fa-lg"></i>
								<i class="far fa-star fa-lg"></i>
							</div>
							<div class="bottom-box-parent">
								<div class="bottom-box">
									<i class="far fa-clock"></i>
									<span>60분</span>
								</div>
								<div class="bottom-box">
									<i class="fas fa-thumbs-up"></i>
									<span>10</span>
								</div>
							</div>
						</div>
					</td>
					<td>
						<div class="thumbnail-box" onclick="">
							<img src="../../resources/images/sampleFood.jpg"> <br>
							<img src="../../resources/images/user.png"><br>
							<span>프로필명 01</span>
							<p>위치잡으려면 어쩔수 없이 ...으로 표기를 해줘야한다.</p>
							<div class="star-box">
								<!-- 여기도 반복문 돌려야한다! 조건문과 같이 -->
								<i class="fas fa-star fa-lg"></i> 
								<i class="fas fa-star fa-lg"></i> 
								<i class="fas fa-star fa-lg"></i> 
								<i class="fas fa-star-half-alt fa-lg"></i>
								<i class="far fa-star fa-lg"></i>
							</div>
							<div class="bottom-box-parent">
								<div class="bottom-box">
									<i class="far fa-clock"></i>
									<span>60분</span>
								</div>
								<div class="bottom-box">
									<i class="fas fa-thumbs-up"></i>
									<span>10</span>
								</div>
							</div>
						</div>
					</td>
					<td>
						<div class="thumbnail-box" onclick="">
							<img src="../../resources/images/sampleFood.jpg"> <br>
							<img src="../../resources/images/user.png"><br>
							<span>프로필명 01</span>
							<p>위치잡으려면 어쩔수 없이 ...으로 표기를 해줘야한다.</p>
							<div class="star-box">
								<!-- 여기도 반복문 돌려야한다! 조건문과 같이 -->
								<i class="fas fa-star fa-lg"></i> 
								<i class="fas fa-star fa-lg"></i> 
								<i class="fas fa-star fa-lg"></i> 
								<i class="fas fa-star-half-alt fa-lg"></i>
								<i class="far fa-star fa-lg"></i>
							</div>
							<div class="bottom-box-parent">
								<div class="bottom-box">
									<i class="far fa-clock"></i>
									<span>60분</span>
								</div>
								<div class="bottom-box">
									<i class="fas fa-thumbs-up"></i>
									<span>10</span>
								</div>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>
						<div class="thumbnail-box" onclick="">
							<img src="../../resources/images/sampleFood.jpg"> <br>
							<img src="../../resources/images/user.png"><br>
							<span>프로필명 01</span>
							<p>위치잡으려면 어쩔수 없이 ...으로 표기를 해줘야한다.</p>
							<div class="star-box">
								<!-- 여기도 반복문 돌려야한다! 조건문과 같이 -->
								<i class="fas fa-star fa-lg"></i> 
								<i class="fas fa-star fa-lg"></i> 
								<i class="fas fa-star fa-lg"></i> 
								<i class="fas fa-star-half-alt fa-lg"></i>
								<i class="far fa-star fa-lg"></i>
							</div>
							<div class="bottom-box-parent">
								<div class="bottom-box">
									<i class="far fa-clock"></i>
									<span>60분</span>
								</div>
								<div class="bottom-box">
									<i class="fas fa-thumbs-up"></i>
									<span>10</span>
								</div>
							</div>
						</div>
					</td>
					<td>
						<div class="thumbnail-box" onclick="">
							<img src="../../resources/images/sampleFood.jpg"> <br>
							<img src="../../resources/images/user.png"><br>
							<span>프로필명 01</span>
							<p>위치잡으려면 어쩔수 없이 ...으로 표기를 해줘야한다.</p>
							<div class="star-box">
								<!-- 여기도 반복문 돌려야한다! 조건문과 같이 -->
								<i class="fas fa-star fa-lg"></i> 
								<i class="fas fa-star fa-lg"></i> 
								<i class="fas fa-star fa-lg"></i> 
								<i class="fas fa-star-half-alt fa-lg"></i>
								<i class="far fa-star fa-lg"></i>
							</div>
							<div class="bottom-box-parent">
								<div class="bottom-box">
									<i class="far fa-clock"></i>
									<span>60분</span>
								</div>
								<div class="bottom-box">
									<i class="fas fa-thumbs-up"></i>
									<span>10</span>
								</div>
							</div>
						</div>
					</td>
					<td>
						<div class="thumbnail-box" onclick="">
							<img src="../../resources/images/sampleFood.jpg"> <br>
							<img src="../../resources/images/user.png"><br>
							<span>프로필명 01</span>
							<p>위치잡으려면 어쩔수 없이 ...으로 표기를 해줘야한다.</p>
							<div class="star-box">
								<!-- 여기도 반복문 돌려야한다! 조건문과 같이 -->
								<i class="fas fa-star fa-lg"></i> 
								<i class="fas fa-star fa-lg"></i> 
								<i class="fas fa-star fa-lg"></i> 
								<i class="fas fa-star-half-alt fa-lg"></i>
								<i class="far fa-star fa-lg"></i>
							</div>
							<div class="bottom-box-parent">
								<div class="bottom-box">
									<i class="far fa-clock"></i>
									<span>60분</span>
								</div>
								<div class="bottom-box">
									<i class="fas fa-thumbs-up"></i>
									<span>10</span>
								</div>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<!-- 마이페이지 작업영역  끝-->
	</div>
	<%@ include file="../common/footer.jsp" %>

</body>
</html>