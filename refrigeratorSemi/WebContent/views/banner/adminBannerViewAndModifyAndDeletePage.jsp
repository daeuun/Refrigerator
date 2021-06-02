<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.refrigerator.common.model.vo.PageInfo, java.util.ArrayList , com.refrigerator.banner.model.vo.Banner"%>    
<%-- paging 처리와 값을 뽑아올 공간 --%>    
    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Banner> list = (ArrayList<Banner>)request.getAttribute("list");
	// 페이징바를 만들기위해서 필요한것들을!! 바로 가져다 쓸수있게 변수에 기록을해주자!!! 
	// list에 지금은 배너번호, 배너이름, 회사이름, 배너분류, 배너상태, 등록일, 수정일, 시작일, 종료일, 배너이미지(경로 + 수정명), div분류용page컬럼 모두 들어가 있는 상태이다. 
	
	// 아래는 현재 페이지에서 필요한 페이징 변수들이다. 
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();	
%>            
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- 작성자 : 재원      ※ 혹여나 해당 페이지에 작업시에 작업하신부분에 주석으로 성함과 영역을 표시해주세요! (혹여나 파일이 날라갈수있으니 push전에 백업부탁드려요~)  -->

<title>관리자 배너 페이지</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<!-- 일단은 관리자단 공통 부분을 예지님이 상단과 왼쪽을 담당했기에 !! 이같이 연동시켜줄것은 연동 시켜줘야한다.  -->
<!-- --------------------------------------------------------------------------------------------------- -->
<style>
    #for-height{height: 920px;} 
    div{box-sizing: border-box;}
    .wrap{margin: auto; width: 1200px; height: 750px;}
    .outer{width: 1000px; height: 920px; margin-right: 25px;}

    .paging-bar{
		text-align: center;
    }

	.pagination{
		margin-top: 20px ;
		justify-content: center;
	}

    .pagination li{
        margin: 5px;
    }

/* ----------------------------------------------------------------------------------------------------------- */
    .top-box a{
        color: gray;
    }

    .top-box{
        padding: 20px;
        margin-bottom: 25px;
    }

    .outer-body h2{
        padding-left: 20px;
        font-size: 36px;
        margin-bottom: 15px;
    }

    .outer-body button{
        float: right;
        margin-right: 35px;
        margin-bottom: 15px;
        background-color: rgb(22,160,133) ;
        border-radius: 5px;
        border: none;
        color: white;
        width: 120px;
    }

    .outer-table{
        width: 960px;
        height: 642px;
        margin-left: 20px;
    }

    .outer-table td{
        padding-bottom: 10px;
        height: 320px;
    }
    .outer-table .card-box{
        width: 280px;
        height: 100%;
        border: 1px solid rgb(153,153,153);
        margin: auto;
    }

    .card-box:hover{
        cursor: pointer;
        transform: scale(1.02);
        border: 2px solid tomato;
    }

    .tumbnail-box{
        height: 200px;
        position: relative;
    }

    .tumbnail-box > img{
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .tumbnail-box > div{
        position: absolute;
        bottom: 0%;
        width: 100%;
        height: 40px;
        color: white;
        font-weight: bold;
        text-align: center;
        background-color: rgba(0, 0, 0, 0.4);
    }
    
    .inner-table{
        width: 100%;
        font-size: 15px;
        margin-top: 1px;
    } 

    .inner-table th:nth-child(1){
        text-align: center;
    }

    .inner-table th:nth-child(2), .inner-table th:nth-child(5) {
        text-align: center;
        color: rgb(22,160,133);
    }

    .inner-table td{
        height: 7px;
        padding: 2px;
    }
    
/* ------------------------------------------------------------------------------------------------------------ */
/* --------------------------------------------페이징 영역 시작 -------------------------------------------- */    
   
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
/* ------------------------------------------------------------------------------------------------------------ */
/* --------------------------------------------공통 모달 css영역 시작 -------------------------------------------- */    
    .modal-header{
        border-bottom: none;
    }

    .modal-footer{
        border-top: none;
    }
    
    .modal-content{
        width: 600px;
        height: 580px;
        margin-top: 150px;
        background-color: rgb(250,250,250);
    }
    
    .modal-header, .modal-body{
        padding-left: 45px;
    }

    .modal-header>h2{
        font-weight: bold;
        color: rgb(22,160,133);
    }

    .modal-header>button{
        font-size: 40px;
        padding-top: 10px;
    }

    .modal-content table{
        width: 500px;
        height: 390px;
    }

    .modal-content table th{
        width: 130px;
    }

    .modal-content table th>div{
        height: 35px;
        background-color: rgb(0,153,102);
        border-radius: 4px;
        color: white;
        line-height: 35px;
        padding-left: 10px;
        font-size: 15px;
    }

    .modal-content table td{
        padding-left: 10px;
    }

    .modal-content table td input{
        width: 100%;
        height: 35px;
        border-radius: 4px;
        line-height: 35px;
        padding-left: 10px;
        font-size: 15px;
        border: 1px solid lightgray;
    }

    .modal-content table td select{
        width: 100%;
        height: 35px;
        border-radius: 4px;
        line-height: 35px;
        padding-left: 10px;
        font-size: 15px;
        border: 1px solid lightgray;
    }

    .text-box{
        color: red;
        font-size: 14px;
        font-weight: bold;
    }
/* --------------------------------------------공통 모달 css영역 끝   ------------------------------------------- */
/* ------------------------------------------------------------------------------------------------------------ */
/* --------------------------------------------등록 모달 css영역 시작   ------------------------------------------- */
    #banner-enroll-Modal .modal-footer{
        height: 75px;
        width: 100%;
        display: flex;
        justify-content: space-between;
        padding: 0px;
        margin-top: 2px;
    }

    #banner-enroll-Modal .modal-footer button{
        width: 50%;
        height: 100%;
        border-radius: 0px;
        border: 1px solid lightgray;
        margin: 0px;
        font-size: 24px;
        font-weight: bolder;
        line-height: 100%;
    }

    #banner-enroll-Modal .modal-footer button:nth-child(1){
        background-color: rgb(250,250,250);
        color: rgb(190,190,190);
    }

    #banner-enroll-Modal .modal-footer button:nth-child(2){
        background-color: rgb(0,102,51);
        color: white;
        border: none;
    }
/* --------------------------------------------등록 모달 css영역 끝   ------------------------------------------- */
/* ------------------------------------------------------------------------------------------------------------ */
/* --------------------------------------------수정 삭제 모달 css영역 시작 -------------------------------------- */
    #banner-modify-Modal .modal-footer{
        height: 75px;
        width: 100%;
        padding: 0px;
        margin-top: 2px;
        position: relative;
    }

    #banner-modify-Modal .modal-footer button{
        border-radius: 5px;
        font-size: 20px;
        font-weight: bolder;
        line-height: 100%;
        border: none;
    }

    #banner-modify-Modal .modal-footer button:nth-child(1){
        position: absolute;
        left: 50%;
        transform: translateX(-55%);
        width: 220px;
        height: 55px;
        background-color: rgb(0,102,51);
    }

    #banner-modify-Modal .modal-footer button:nth-child(2){
        position: absolute;
        right: 10px;
        width: 100px;
        height: 35px;
        background-color: rgb(231,76,60);
    }
/* --------------------------------------------수정 삭제 모달 css영역 끝   -------------------------------------- */
/* ------------------------------------------------------------------------------------------------------------ */
    </style>
</head>
<body>
    <div class="wrap">
    <%@ include file="../common/admin/adminTopNavView.jsp" %>
        <div id="content">
       	<%@ include file="../common/admin/adminSideBarView.jsp" %>
<!-------------------------------------------------------------------------------------------------------------->            
            <div class="outer" style="float:right;">
                <div class="top-box">
                    <a href="">홈</a> >
                    <a href="">싸이트관리</a> >
                    <a href="">배너관리</a>
                </div>
                <div class="outer-body">
                    <h2><b>배너관리</b></h2>
                    <button type="button" data-toggle="modal" data-target="#banner-enroll-Modal">배너 등록</button>
                    <br clear="both">
                    <table class="outer-table">
                        <tr>
							<%for(int i=0; i<3 ; i++){%>                        
	                            <td>
	                                <div class="card-box" data-toggle="modal" data-target="#banner-modify-Modal">
	                                    <div class="tumbnail-box" >
	                                        <img src="<%= list.get(i).getBannerImg() %>">
	                                        <div class="title-box"><%= list.get(i).getBannerName() %></div>
	                                        <table class="inner-table">
	                                            <tr>
	                                                <th><i class="fas fa-clipboard-list fa-lg"></i></th>
	                                                <th>분류</th>
	                                                <td><%= list.get(i).getBannerCategory() %></td>
	                                                <th><i class="far fa-check-circle fa-lg"></i></th>
	                                                <th>상태</th>
	                                                <td><%= (list.get(i).getBannerStatus().equals("Y"))? "게시중" : "보류중" %></td>
	                                            </tr>
	                                            <tr>
	                                                <th><i class="far fa-calendar-alt fa-lg"></i></th>
	                                                <th>시작일</th>
	                                                <td colspan="4"><%= (list.get(i).getStartDate() == null)? "미정" : list.get(i).getStartDate()%></td>
	                                            </tr>
	                                            <tr>
	                                                <th><i class="far fa-calendar-check fa-lg"></i></th>
	                                                <th>종료일</th>
	                                                <td colspan="4"><%= (list.get(i).getEndDate() == null)? "미정" : list.get(i).getEndDate()%></td>
	                                            </tr>
	                                            <tr>
	                                                <th><i class="fas fa-city"></i></th>
	                                                <th>담당업체</th>
	                                                <td colspan="4"><%= list.get(i).getCompanyName() %></td>
	                                            </tr>
	                                        </table>
	                                    </div>
	                                </div>
	                            </td>
                    		<%} %>                        
                        </tr>
                        <tr>
                			<%for(int i=3; i<5 ; i++){%>                        
	                            <td>
	                                <div class="card-box" data-toggle="modal" data-target="#banner-modify-Modal">
	                                    <div class="tumbnail-box" >
	                                        <img src="<%= list.get(i).getBannerImg() %>">
	                                        <div class="title-box"><%= list.get(i).getBannerName() %></div>
	                                        <table class="inner-table">
	                                            <tr>
	                                                <th><i class="fas fa-clipboard-list fa-lg"></i></th>
	                                                <th>분류</th>
	                                                <td><%= list.get(i).getBannerCategory() %></td>
	                                                <th><i class="far fa-check-circle fa-lg"></i></th>
	                                                <th>상태</th>
	                                                <td><%= (list.get(i).getBannerStatus().equals("Y"))? "게시중" : "보류중" %></td>
	                                            </tr>
	                                            <tr>
	                                                <th><i class="far fa-calendar-alt fa-lg"></i></th>
	                                                <th>시작일</th>
	                                                <td colspan="4"><%= (list.get(i).getStartDate() == null)? "미정" : list.get(i).getStartDate()%></td>
	                                            </tr>
	                                            <tr>
	                                                <th><i class="far fa-calendar-check fa-lg"></i></th>
	                                                <th>종료일</th>
	                                                <td colspan="4"><%= (list.get(i).getEndDate() == null)? "미정" : list.get(i).getEndDate()%></td>
	                                            </tr>
	                                            <tr>
	                                                <th><i class="fas fa-city"></i></th>
	                                                <th>담당업체</th>
	                                                <td colspan="4"><%= list.get(i).getCompanyName() %></td>
	                                            </tr>
	                                        </table>
	                                    </div>
	                                </div>
	                            </td>
                    		<%} %>                               
                        </tr>
                    </table>
                </div>

<!------------------------------------- 페이징바 영역 -------------------------------------------------------->
		        <div align="center" class="paging-area">
		
					<!-- 현재 보고있는 페이지가 1일 떄 버튼 안보이게 하려면 아래와같이 -->
					<% if(currentPage != 1){ %>
		            	<button onclick="location.href='<%= request.getContextPath() %>/adlist.ba?currentPage=<%= currentPage-1 %>';">&lt;</button>
		            <%} %>
		            
		            <% for(int p=startPage; p<=endPage; p++){ %>
		            	<% if(p != currentPage) {%>	
		            		<button onclick="location.href='<%= request.getContextPath()%>/adlist.ba?currentPage=<%= p %>';"><%= p %></button>
		            	<%}else{ %>
		         	    	<button id="dis-btn" disabled><%= p %></button>
		    	    	    <!-- 현제 페이지수는 다시 클릭이 불가능하게 만들어주자! -->
		            	<%}%>
		            <%}%>
			
					<!-- 현재 보고있는 페이지가 마지막페이지일 떄 버튼 안보이게 하려면 아래와같이 -->
					<% if(currentPage != maxPage){ %>                        
		            	<button onclick="location.href='<%= request.getContextPath() %>/adlist.ba?currentPage=<%= currentPage+1 %>';">&gt;</button>
		            <%} %>
		        </div>


            </div>
<!------------------------------------------------------------------------------------------------------------->  
<!-----------------------------------------  등록 모달 영역임 -------------------------------------------------->
            <!-- The Modal -->
            <div class="modal fade" id="banner-enroll-Modal">
                <div class="modal-dialog">
                    <div class="modal-content" style="width:600px" >

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h2 class="modal-title">배너등록</h2>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <form action="" method="post">
                            <!-- Modal body -->
                            <div class="modal-body">
                                <table>
                                    <tr>
                                        <th>
                                            <div>배너명</div>
                                        </th>
                                        <td>
                                            <input type="text" name="" id="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>담당 업체명</div>
                                        </th>
                                        <td>
                                            <input type="text" name="" id="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>분류</div>
                                        </th>
                                        <td>
                                            <select name="" id="">
                                                <option value="">이벤트</option>
                                                <option value="">공모전</option>
                                                <option value="">광고</option>
                                                <option value="">메인배너</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>배너 위치</div>
                                        </th>
                                        <td>
                                            <select name="" id="">
                                                <option value="none">선택안함</option>
                                                <option value="banner1">배너1</option>
                                                <option value="banner2">배너2</option>
                                                <option value="banner3">배너3 </option>
                                                <option value="main1">메인배너1</option>
                                                <option value="main2">메인배너2</option>
                                                <option value="main3">메인배너3</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>시작일</div>
                                        </th>
                                        <td>
                                            <input type="text" name="" id="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>종료일</div>
                                        </th>
                                        <td>
                                            <input type="text" name="" id="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-box" colspan="2">※ 이미지 비율은 배너사이즈에 맞는 이미지를 첨부하세요</td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>이미지 첨부파일</div>
                                        </th>
                                        <td>
                                            <input type="file" name="" id="" required>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" data-dismiss="modal">취소</button>
                                <button type="button">등록</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
<!----------------------------------------- 등록 모달 영역임 -------------- ------------------------------------->
<!------------------------------------------------------------------------------------------------------------->  
<!-----------------------------------------  수정 모달 영역임 -------------------------------------------------->
            <!-- The Modal -->
            <div class="modal fade" id="banner-modify-Modal">
                <div class="modal-dialog">
                    <div class="modal-content" style="width:600px">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h2 class="modal-title">배너 수정 및 삭제</h2>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <form action="" method="post">
                            <!-- Modal body -->
                            <div class="modal-body">
                                <table>
                                    <tr>
                                        <th>
                                            <div>배너명</div>
                                        </th>
                                        <td>
                                            <input type="text" name="" id="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>담당 업체명</div>
                                        </th>
                                        <td>
                                            <input type="text" name="" id="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>분류</div>
                                        </th>
                                        <td>
                                            <select name="" id="">
                                                <option value="">이벤트</option>
                                                <option value="">공모전</option>
                                                <option value="">광고</option>
                                                <option value="">메인배너</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>배너 위치</div>
                                        </th>
                                        <td>
                                            <select name="" id="">
                                                <option value="none">선택안함</option>
                                                <option value="banner1">배너1</option>
                                                <option value="banner2">배너2</option>
                                                <option value="banner3">배너3 </option>
                                                <option value="main1">메인배너1</option>
                                                <option value="main2">메인배너2</option>
                                                <option value="main3">메인배너3</option>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>시작일</div>
                                        </th>
                                        <td>
                                            <input type="text" name="" id="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>종료일</div>
                                        </th>
                                        <td>
                                            <input type="text" name="" id="">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text-box" colspan="2">※ 이미지 비율은 배너사이즈에 맞는 이미지를 첨부하세요</td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div>이미지 첨부파일</div>
                                        </th>
                                        <td>
                                            <input type="file" name="" id="" required>
                                        </td>
                                    </tr>
                                </table>
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger">수정</button>
                                <button type="button" class="btn btn-danger">삭제</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
           
<!----------------------------------------- 수정 모달 영역임 --------------------------------------------------->
        </div>
    </div>
</body>
</html>