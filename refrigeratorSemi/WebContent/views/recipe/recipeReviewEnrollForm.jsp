<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 

	String contextPath = request.getContextPath(); 
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

   <style>

    .outer{
        margin:auto;
        margin-top:20px;
        width: 500px;
        height: 700px;
        border: 1px solid ;
        border-color:rgb(0, 153, 102);
    }

    .outer {
        font-size: 12px;
    }

    .input-type {
        width: 300px;
        height: 30px;
        margin: 20px;
    }

    *{margin:0; padding:0;}


	
    .star{
    display:inline-block;
    width: 30px;
    height: 60px;
    cursor: pointer;
    }

    .star_left{
    background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat 0 0; 
    background-size: 60px; 
    margin-right: -3px;
    }

    .star_right{
    background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat -30px 0; 
    background-size: 60px; 
    margin-left: -3px;
    }

    .star.on{
    background-image: url(http://gahyun.wooga.kr/main/img/testImg/star_on.png);
    }

	


    </style>
    
     <!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<!-- Popper JS -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    

	
	</head>
	<body>
		
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>


    
	    	<form action="<%=contextPath%>/insertReview.recipe" method="post" id="enroll-form" enctype="multipart/form-data">
	        <div class="outer">
	            <button type="button" class="close" data-dismiss="modal">&times;</button>
	            <br><br> <br>
	            <h5 align="center">후기를 남겨볼까요?</h5>
	            
	            <br>
	
	            <hr>
	            <br>
	            <div  align="center">
	                <img src="" alt="" width="150px" height="150px">
	            </div>
	            <br>
	            
	            <div align="center">
	
	                <h5>이 요리의 별점은?</h5>
	
	               
	            		
	                    <div class="star-box" name="star">
	                        <span class="star star_left">
								<input type="hidden" name="star" value="0.5">
							</span>
	                        <span class="star star_right">
	                        	<input type="hidden" name="star" value="1">
	                        </span>
	                    
	                        <span class="star star_left">
	                        	<input type="hidden" name="star" value="1.5">
	                        </span>
	                        <span class="star star_right">
	                        	<input type="hidden" name="star" value="2">
	                        </span>
	                    
	                        <span class="star star_left" >
	                        	<input type="hidden" name="star" value="2.5">
	                        </span>
	                        <span class="star star_right">
	                        	<input type="hidden" name="star" value="3">
	                        </span>
	                    
	                        <span class="star star_left" >
	                        	<input type="hidden" name="star" value="3.5">
	                        </span>
	                        <span class="star star_right">
	                        	<input type="hidden" name="star" value="4">
	                        </span>
	                        
	                        <span class="star star_left">
	                        	<input type="hidden" name="star" value="4.5">
	                        </span>
	                        <span class="star star_right">
	                        	<input type="hidden" name="star" value="5">
	                        </span>
	                    </div>
					

							
	                    <!--별점 관련 스크립트-->
	                    <script>
							
							
	                        $(".star").on('click',function(){
								

	                            var idx = $(this).index();
	                            $(".star").removeClass("on");
	                                for(var i=0; i<=idx; i++){
	                                    $(".star").eq(i).addClass("on");
	                            }
								
	                               
		                        });

	                    </script>
						
	
					<br>
	                <p>
				                    한 장이라도 좋아요 <br>
				                    완성된 요리를 자랑해주세요
	                </p>
					<br>
	                
	                <!--명시적으로 7번 회원이  4번 레시피에 작성했다는 가정하에  기술했습니다.-->
	                
					<input type="hidden" name="userNo" value="7">
					
					<input type="hidden" name="recipeNo" value="4">
	                <div class="input-type">
	                    <input type="file" class="form-control-file border" name="reviewUpfile" required>
	                </div>
	
	                <div class="input-type">
						<textarea cols="55" rows="3" placeholder="자세한 리뷰는 다른 쉐프님들께 큰 도움이 될 거예요" style="font-size: 11px; resize: none; "  class="form-control form-control-sm" name="content" required></textarea>
	                </div>
					<br>
	                <div class="input-type">
	                    <button type="submit" class="btn btn-block" style="background-color: rgb(0, 153, 102); color:white" >완료</button>
	                </div>
	
	                <!--파일 선택후 div 화면에 미리보기-->
	                <script>
	                
	
	                </script>
	
	                <!--완료 버튼 클릭시 DB로 insert-->
	
	
	
	            </div>
	
	
	        </div>
	    </form> 





</body>
</html>