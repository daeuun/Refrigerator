<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.refrigerator.recipe.model.vo.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

    .outer{
        margin:auto;
        margin-top:20px;
        width: 1200px;

    }
    #main-img{
        margin: auto;
        width: 600px; 
        height:500px;
        box-sizing: border-box;
    }

    #main-img:hover{
        cursor: pointer;
        opacity:0.7;
    }


    * {margin:0;padding:0;}
    .bannner {position:relative;display:inline-block;}
    .bannner img {max-width:100%;}
    .bannner span.text {
        position:absolute;
        top:95%;
        left:5px;
        transform:translateY(-50%);
        display:none;
        width:100%;
        font-size:11px;
        color:#fff;
        font-weight:800;
        }


    .bannner::before, .bannner::after{content:'';position:absolute;top:50%;left:50%;transform:translate(-50%,-50%);transition:all .8s;-webkit-transition:all .8s;}
    .bannner::before {width:97%;height:95%;border-top:2px solid #fff;border-bottom:2px solid #fff;width:0;} 
    .bannner::after {width:97%;height:95%;border-left:2px solid #fff;border-right:2px solid #fff;height:0;} 

    /* 마우스가 올라가면 반응하는 소스 */
    .bannner:hover span.text {display:block;}
    .bannner:hover::before {width:calc(97% + 4px);}
    .bannner:hover::after {height:calc(95% + 4px);} 
 


    /*레시피 소개 영역*/
    .recipe-main-info {

        text-align: center;
        margin-bottom: 10px;
        

    }

    .recipe-sub-info{
        background-color: rgb(248, 248, 248);
        border: 1px solid rgb(248, 248, 248);
        width: 600px;
        height: 60px;
        margin: auto;
        margin-top: 10px;
        text-align: center;
        font-size: 12px;
        line-height: 60px;
    }


    .icon,.recipe-sub-info>img{
        width: 30px;
    }

    /*이미지 슬라이드*/
    .slider {
        width: 700px;
        height: 550px;
        position: relative;
        margin: auto;
    }
    .slide {
        width: 600px;
        height: 600px;
        background-size: cover;
        border-radius: 10px;
        animation: fade 2s;
        display: none;
        margin: auto;
    }


    .cooking-order-img {
        width: 600px;
        height: 600px;
    }

        
    .prev,.next {
        cursor: pointer;
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        font-size: 2rem;
        transition: 0.6s ease;
        border-radius: 5px;
        color:rgb(0, 153, 102);
    }

    .next {
        right: 0;
    }
    .prev:hover,
    .next:hover {
        background-color: rgba(190, 190, 190, 0.5);
    }

    @keyframes fade {
        from {
            opacity: 0.4;
    }
        to {
            opacity: 1;
    }
    }

        

    .recipe-sub-info>div{
        display: inline-table;
    }

    .recipe-sub-info>div>span{
        color:rgb(0, 153, 102);
    }

    .report-user-btn, .reply-enroll-btn{
        color : rgb(190, 190, 190);
        text-decoration: none;
        font-size: 12px;
        padding-right: 200px;
    }

    .ingredients-info>div{
        text-align: center;
        font-size: 15px;
        margin-bottom: 20px;

    }

    /*재료 관련 영역*/
    .ingre-info-main, .ingre-info-add{
        display: inline-table;
    }
    
    .ingre-info-main , .ingre-info-add {
        font-size: 15px;
        margin-left: 30px;
    }

    .igre-calculator>div{
        padding: 10px;
        font-size: 12px;
        cursor: pointer;
    }



    .select-view>div{
        display:inline-table;
    }

    .select-view a{
        color : black;
        text-decoration: none;
        font-size: 11px;
    }



     /*재료 검색 버튼*/
    .ingredients-search{
        text-align: center;
        margin-top: 50px;
    }

    .ingredients-search>button{
        border-radius: 40px;
    }

     /*요리 후기 관련 영역*/

    #review-enroll-btn{
       font-size: 12px;
       margin-left: 650px;
    }

    
    .recipe-review-header>div{
        display: inline-table;

    }

    #review-detail:hover{
       cursor: pointer;
    }


    .review-detail-img{
        width: 100px;
        height: 100px;
    }



    /*댓글 관련 영역*/

        /*프로필*/
        
    .box {
        width: 40px;
        height: 40px; 
        border-radius: 70%;
        overflow: hidden;
    }
    .profile {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
        
    .reply-detail{
        font-size: 12px;
    }

    .reply-deatil-content, #review-detail{
        font-size: 11px;
    }

    .area-header,.recipe-review-header{
        padding-left: 200px;
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

	
    <!--전체 감싸는 div-->
    <div class="outer">

        
        <div align="center">
            <div class="bannner">
                <img src="../../resources/images/recipe-main-img.jpg" id="main-img">
                <span class="text" align="right" style="width: 580px;">
                    <span> <img src="../../resources/images/icon-star.png" alt="">130</span>
                    <span><img src="../../resources/images/icon-bookmark.png" alt="">200</span>
                    <span></spn><img src="../../resources/images/icon-view.png" alt="">253</span>
                </span>
            </div>
        </div>



        <br><br>

        <div class="recipe-main-info">
            <div><h3>요리제목</h3></div>
            <br>
            <div>요리설명 </div>
        </div>
        <br>
        <div class="recipe-sub-info">
            <img src="../../resources/images/icon-servings.png">
            <div> 
                <span class="recipe-sub-info-servings"><b>2</b></span>명이서 먹을 수 있어요 
            </div>

            <img src="../../resources/images/icon-cooking-time.png">
            <div>
                <span class="recipe-sub-info-cooking-time"><b>10</b></span>분정도 걸려요 
            </div>
        </div>

        <div class="recipe-scrape" align="center">
            <br><br>
            <button type="button" class="btn btn-outline-success btn-sm">이 레시피를 찜할래요</button>
        </div>



        <br>

        <div align="right" class="report-user">
            <!--로그인한 사용자만 신고할 수 있도록-->
            <a href="" class="report-user-btn">신고하기</a>
        </div>


        
        <hr>

        <br><br>

        <div class="ingredients-info"  align="center">

            <!--필수 재료 -->
            <div class="ingre-info-main" >
                	준비해주세요

                <table class="ingredients-detail">


                    <tr>
                        <th>필수재료1</th>
                        <td id="la0">100</td>
                        <td>g</td>
 
                    </tr>
                    <hr width="100px">
                    <tr>
                        <th>필수재료2</th>
                        <td id="la1">100</td>
                        <td>g</td>
                        
                    </tr>          
                          
                    <tr>
                        <th>필수재료3</th>
                        <td id="la2">1</td>
                        <td>개</td>
                    </tr>
                    <tr>
                        <th>필수재료4</th>
                        <td id="la3">2</td>
                        <td>T</td>
                    </tr>
                             
                </table>
            
            </div>

            <!--부가재료 영역-->
            <div class="ingre-info-add">
                	있으면 좋아요
                <hr width="100px">
                <table align="center">

                    <tr>
                        <th>부가재료1</th>
                        <td id="la10">2</td>
                        <td>장</td>
                    </tr>
                    <tr>
                        <th>부가재료2</th>
                        <td id="la11">50</td>
                        <td>g</td>
                    </tr>

                </table>

            </div>

        
            <br><br>
            <!--재료 계산기 클릭시 모달창 출력되기-->
            <div class="igre-calculator">
                <div align="right" style="width: 900px">
                    <b>2</b>인 기준 | 
                    <a data-toggle="tooltip" title=" 재료 계산해드릴게요 !">
                        <img src="../../resources/images/icon-cal.png" class="icon"  data-toggle="modal" data-target="#calculatorModal" >
                    </a>
                    <script>
                        $(document).ready(function(){
                          $('[data-toggle="tooltip"]').tooltip();
                        });
                    </script>
                </div>
     
            </div>

            <!--모달창-->
            <!-- The Modal -->
            <form action="">
                <div class="modal" id="calculatorModal">
                    <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                
                        <!-- Modal Header -->
                        <div class="modal-header" >
                            <h6 class="modal-title" style="text-align: center;">
                                <br>
                                이 요리는 몇 명이 먹나요?
                            </h6>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>
                
                        <!-- Modal body -->
                        <div class="modal-body">
                            <select name="" id="select-servings">

                                <option value="1" selected>1명</option>
                                <option value="2">2명</option>
                                <option value="3">3명</option>
                                <option value="4">4명</option>
                                <option value="5">5명</option>
                            
                            </select>

                            <button type="submit" class="btn btn-success btn-sm" >확인</button>
                            
                            <!--모달창 클릭시 재료의 내용 변경-->
                            <!--ajax이용해서 값 변경하기-->
                            <!--
                            <script>

                                function calculator(){
                                    console.log($("#select-servings").children("option:selected").val());
                                };

                            </script>
                            -->


                        </div>
                    </div>
                </div>
            </form>

            </div>
            <br>
            <hr>

        </div>



            
            <div class="cooking-order" align="center">
                
                <br>
                <h3>만들어 볼까요</h3>
                <br><br>
                
                <!--이미지 크게보기 | 텍스트 크게 보기 -->
                <div class="select-view">

                    <div class="select-view-img">
                        <img src=""  class="icon"><br>
                        <a href="" >사진 크게보기</a> 
                    </div>

                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                    <div class="select-view-text" >
                        
                    <img src="" class="icon"><br>
                    <a href="">텍스트 크게보기</a>


                    </div>
                    

                    
                </div>
                
                <br><br>
                <!--다음 페이지로 이동시에 보여지는 버튼이며, 첫 화면시에는 보이지 않다가. currentPage = 2일 때 보이게끔 노출한다.-->

                <!--처음에는 재료 이미지가 먼저 보여지고, 그 다음에 요리 과정 이미지가 보여지게 출력한다.-->


         

            </div>

                   <!--이미지 슬라이드 -->

                   <div class="slider">
                        <div class="slide" style="background-image: url(./1.jpg);">
                            <img src="" class="cooking-order-img">
                            <br><br>
                            <p>재료 이미지입니다</p>
                        </div>
                        <div class="slide" style="background-image: url(./2.jpg);">
                            <img src="" class="cooking-order-img">
                            <br><br>
                            <div class="cooking-order-text">

                                <p>1)요리 순서 1</p>
                                
                            </div>

                        </div>
                        <div class="slide" style="background-image: url(./3.jpg);">
                            <img src="" class="cooking-order-img">
                            <br><br>                         
                            <div class="cooking-order-text">

                                <p>2) 요리 순서 2</p>
                                
                            </div>
                    </div>
                    <a class="prev" onclick="button_click(-1)">&#10094</a>
                    <a class="next" onclick="button_click(1)">&#10095</a>
                  </div>

              
                    <script>
                    let currSlide = 1;
                    showSlide(currSlide);
                    
                    function button_click(num){
                        showSlide((currSlide += num));
                    }
                    function showSlide(num){
                        const slides = document.querySelectorAll(".slide");
                        if(num>slides.length){
                        currSlide =1;
                        }if(num<1){
                        currSlide = slides.length;
                        }
                        for(let i=0; i<slides.length; i++){
                        slides[i].style.display="none";
                        }slides[currSlide -1].style.display="block";
                    }
                    </script>


                    <br><br><br><Br>
           
            <div class="ingredients-search">
                <button type="button" class="btn btn-sm btn-success">재료1</button>
                <button type="button" class="btn btn-sm btn-success">재료2</button>
                <button type="button" class="btn btn-sm btn-success">재료3</button>
            </div>
            <br><br>

            <!---->
            <div align="center">
                <div style="background-color: rgb(0, 102, 51); color: white; width: 300px; border-radius: 10px;">이 레시피는 저에게</div> <br><br>
                <button type="button" class="btn btn-outline-success btn-sm">도움이 됐어요</button>
                <button type="button" class="btn btn-outline-dark btn-sm">잘모르겠어요</button>
            </div>
            <br><br>

            <!--요리 후기 영역 -->

            <div class="recipe-review-area">

                <div class="recipe-review-header">
                    <!--요리 후기 추가 및 삭제시 숫자 증감-->
                    <div><h5>요리 후기 <b>2</b></h5></div>
                    <!--로그인한 회원만 보여지는 버튼 ! -->
                    <div class="recipe-review-body" >
                        <a href="" style="text-decoration: none; color: rgb(0, 153, 102);" id="review-enroll-btn">
                            
                            작성하기
                        
                        </a>
                    </div>
                </div>

                <hr>
                <br>
                
                <div id="review-detail" align="center">
                    
                    <table style="width: 500px;">
                        

                        <tr>
                            <td rowspan="3">
                                
                                <div class="box" style="background: #BDBDBD;">
                                    <img class="profile" src="">
                                </div>

                            </td>
                            <td><b>아자아자파이팅</b></td>
                            <td>2021-05-05 오후 04:46</td>
                            <td rowspan="3" >
                                <img src="" class="review-detail-img">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"> 간단하게 해먹기 좋은 것 같아요</td>
                        </tr>
                        <tr>
                            <td colspan="2">★★★★★</td>
                        </tr>

                    </table>

     
                </div>


                


            </div>


            <br><br>
            <div class="reply-area" >

                <!--댓글 추가 및 삭제시 댓글 숫자 증감-->
                <div class="area-header"><h5>댓글 <b>2</b></h5></div>
                

                <hr>
                <br>
                <!--댓글 입력하는 영역-->
                
                    <div align="center">
                        
                            <table style="width: 500px;">
                                <tr>
                                    <td rowspan="2">
                                        <!--프로필 사진이 들어오는 영역-->
                                        <div class="box" style="background: #BDBDBD;">
                                            <img class="profile" src="">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 80%;">
                                        <div class="form-group">
                                        <label for="usr"></label>
                                        <input type="text" class="form-control" id="usr" placeholder="소중한 레시피에 쉐프님의 멋진 댓글을 남겨주세요 :) "  style="height: 30px;">
                                        </div>
                                    </td>
                                    <td><button class="btn btn-sm btn-success" onclick="insertReply();">등록</button></td>
                                </tr>
                            
                            </table>
                            
                            
                    
                    </div>
                

                <br>
                <!--댓글 조회하는 전체 영역-->

                <div id="reply-list-area">
                    
                    <!--댓글 한개의 div 영역 -->
                    <div class="reply-detail" align="center" id="reply-content-area">
                        <table style="width: 500px;">

                            <tbody>
					             <tr>
                                    <td rowspan="3" style="width: 30px;">
                                        <div class="box" style="background: #BDBDBD;">
                                            <img class="profile" src="">
                                        </div>
                                    </td>


                            </tbody>
                        </table>
                    </div>

                    <script>

                   	
                       $(function(){
                       	selectReplyList();
                           setInterval(selectReplylist,1000);
                       })
                       
             			/*댓글 작성*/
                       function insertReply(){
                       	$.ajax({
                       		url : "rinsert.recipe"
                       		,data : {
                        			content : $("#usr").val()
                        			,recipeNo : 4
                        			}
                       		,type : "post"
                       		,success : function(result){
                       		
                       				console.log(result);
                       		
	                        		if(result>0){
	                        			
	                        			selectReplyList();
	                        			$("#usr").val("");
	                        		}
                       		
                       		},error : function(){
                       			console.log("괜찮아.. 다시 하면 돼..ㅎ")
                       		}, complete : function(){
                       			console.log("감정은 사라지고 결과는 남는다")
                       		}
                        	
                        	
                        	})
                        }
                        
                        /*댓글 조회 */
                        function selectReplyList(){
                        	
                        	$.ajax({
                        		
                        	 	url : "rlist.recipe",
                        	 	/*레시피 숫자는 레시피 조회에서 숫자 받아오기, 지금은 명시적으로 4번 레시피로 하였음*/
                            	data : {recipeNo: "4"},
                            	success : function(list){
                            		
                            		console.log(list);
                            		var result = "";
                            		
                            		for(var i in list){
                            			result += 
                            				
                            			"<br>"	+	
                            				"<tr>" +
	                                        "<td style='width: 20%;'>" + "<b>" + list[i].replyWriter + "</b>" + "</td>" +
	                                        "<td style='width: 10%;'>" + list[i].enrollDate + "</td>" + 
	                                        "<td style='color: gray;'>" + "<a href='' class='report-user-btn'>" + "신고하기" + "</a>" + "</td>" + 
		                                    "</tr>" + 
		                                    
		                                  	 "<tr class='reply-deatil-content'>" + 
		                                        "<td colspan='3'>" + list[i].replyContent  + "</td>" + 
		                                    "</tr>" +
		                                    
		                                "</tr>" + "<br>"
		                                    
	                            				
                            			
                            		} 
	
									$("#reply-content-area tbody").html(result);	
                            			
                            		
                            	}, error : function(){
                            		console.log("댓글 조회 실패")
                            	},complete:function(){
                            		console.log("화이팅:)")
                            	}
                            	
                            	
                        	})
                       
                        }

                    </script>

                

                </div>


            </div>


            <br><br>

            

    </div>

    <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
	



</body>
</html>