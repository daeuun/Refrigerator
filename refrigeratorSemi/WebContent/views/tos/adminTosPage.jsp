<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.refrigerator.common.model.vo.PageInfo, java.util.ArrayList , com.refrigerator.tos.model.vo.Tos"%>    
<%-- paging 처리와 값을 뽑아올 공간 --%>    

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Tos> list = (ArrayList<Tos>)request.getAttribute("list");
	// 페이징바를 만들기위해서 필요한것들을!! 바로 가져다 쓸수있게 변수에 기록을해주자!!! 
	// list에 지금은 이용약관번호, 이용약관 카테고리, 이용약관 사용페이지, 게시등록일,등록일, 수정일, 비고 , 이용약관제목, 이용약관 내용 모두 들어가 있는 상태이다. 
	// 즉 나중에 이용약관 관련한 정보를 뽑아오고자 한다면 지금 만들어놓은 Service단에; selectList 메소드를 호출해주면된다는것이다.! 
	
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

<title>관리자 이용약관 조회페이지</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
<!-- 관리자단의 top nav 쪽에 예지님이 cdn으로 박아주셨다 나머지는 내 페이지에서 작업하면된다.  -->
<!-- --------------------------------------------------------------------------------------------------- -->
<style>
    #for-height{height: 720px;} 
    div{box-sizing: border-box;}
    .wrap{margin: auto; width: 1200px; height: 750px;}
    .outer{width: 1000px; height: 700px; float: right; margin-right: 25px;}

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
        margin-bottom: 40px;
    }

    .outer-body button{
        float: right;
        margin-right: 10px;
        margin-bottom: 15px;
        background-color: rgb(22,160,133) ;
        border-radius: 5px;
        border: none;
        color: white;
        width: 120px;
    }

    .outer-body table{
        width: 99%;
        height: 385px;
        text-align: center;
    }

    .outer-body tbody tr{
        height: 35px;
    }

    .outer-body thead>tr{
        background-color:rgb(234,234,234) ;        
        height: 42px;
    }

    .outer-body table tbody .exist-row:hover{
        background-color: rgba(186,238,208,0.2);
        color:tomato;
        border:1px solid orange;
    }
    
/* ------------------------------------------------------------------------------------------------------------ */
    </style>
</head>
<body>
    <%@ include file="../common/admin/adminTopNavView.jsp" %>
    <div class="wrap">
	<%@ include file="../common/admin/adminSideBarView.jsp" %>
        <div id="content">     
<!-------------------------------------------------------------------------------------------------------------->            
            <div class="outer" style="float:right;">
                <div class="top-box">
                    <a href="어드민 페이지 HOME이 있나?">홈</a> >
                    <%-- ANCHOR태그 안달아도 된다 --%>
                    <a href="#">싸이트관리</a> >
                    <a href="#">이용약관관리</a>
                </div>
                <div class="outer-body">
                    <h2><b>이용약관 관리</b></h2>
                    
                    <%-- 전제 조건이 어드민 페이지는 로그인이 되어있어야지만 들어올수가 있어서 따로 등록버튼은 안보이게 할필요가 없다!!!  --%>
                    <button type="button" onclick="moveEnroll();">이용약관 등록</button>
                    <br style="clear: both;">
                    <table border="1" style="border: rgb(204,204,204);">
                        <thead>
                            <tr>
                                <th width="60">상태</th>
                                <th>이용약관명</th>
                                <th width="150">사용될 페이지 영역</th>
                                <th width="110">게시등록일</th>
                                <th width="110">수정일자</th>
                                <th width="110">작성자</th>
                                <th width="120">비고</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%-- 각각의 TR들은 완성이 되어있어야하고 각각의 TR 자리에 뿌려줘야한다. 
                        	방법은 아주 간단하다!!!! 각각의 페이지는 !! 조건문 달고 ! 무조건 최소한 10번은 반복문 돌게 만들어주면된다! 
                        	그러고 ! 빈곳은 그냥 TR만 생성되겠끔 하면 되는것이다. 
                        --%>
    	                   	<%if(list.isEmpty()){ %>
			            		<tr>
			            			<td colspan="7">조회된 리스트가 없습니다. </td>
			            		</tr>
			            	<% } else {%> 
			            		<% if(list.size() <=10){ %>
					                <% for(Tos t : list){ %>
						                <tr class="exist-row" style="cursor: pointer;">
						                	<input type="hidden" value="<%= t.getTosNo() %>">
						                    <td><%= t.getTosCategory() %></td>
						                    <td><%= t.getTosTitle() %></td>
						                    
						                    <!-- 나중에 시간 남으면 switch문으로 처리해줘 -->
						                    <td><%= t.getTosPage() %></td>
						                    <td><% if(t.getUploadDate() !=null){%>
						                    		<%= t.getUploadDate() %>
						                    	<% }else{ %>
						                    		게시전
						                    	<% } %>
						                    </td>						                    
						                    <td><%= t.getModifyDate() %></td>
						                    <td>보람있조</td>
                						    <td><% if(t.getTosNote() !=null){%>
						                    		<%= t.getTosNote() %>
						                    	<% }else{ %>
						                    	<% } %>
						                    </td>
						                </tr>
					                <% } %>	
					                <% for(int i=0; i<(pi.getBoardLimit()-list.size()); i++){ %>
					                	<tr >
					                		<td></td>
					                		<td></td>
					                		<td></td>
					                		<td></td>
					                		<td></td>
					                		<td></td>
					                		<td></td>					                		
					                	</tr>
					                <% } %>
					                		            		
			            		<% }else{ %>
					                <% for(Tos t : list){ %>
						                <tr class="exist-row" style="cursor: pointer;">
   						                	<input type="hidden" value="<%= t.getTosNo() %>">				                
						                    <td><%= t.getTosCategory() %></td>
						                    <td><%= t.getTosTitle() %></td>
						                    <td><%= t.getTosPage() %></td>
						                    <td><% if(t.getUploadDate() !=null){%>
						                    		<%= t.getUploadDate() %>
						                    	<% }else{ %>
						                    		게시전
						                    	<% } %>
						                    </td>		
						                    <td><%= t.getModifyDate() %></td>
						                    <td>보람있조</td>
                						    <td><% if(t.getTosNote() !=null){%>
						                    		<%= t.getTosNote() %>
						                    	<% }else{ %>
						                    	<% } %>
						                    </td>
						                </tr>
					                <% } %>			            				            		
			            		<% }%>
				            <%} %>    				            
	                    	<script>
	                    		// 이용약관 등록페이지로 넘어가는 servlet요청
	                    		function moveEnroll(){
	                    			$(this).click(function(){
					          	        location.href="<%= request.getContextPath() %>/enrollForm.tos"	                    				
	                    			})
	                    		};
	                    	
	                    		//detail 쪽 servlet으로 넘어가는 servlet 이때 ! 해당 이용약관 번호 넘김 
					          	$(function(){
					          	      $(".outer-body tbody>tr").click(function(){
					          	          location.href="<%= request.getContextPath() %>/detail.tos?bno=" + $(this).children().eq(0).val()
					          	      })
					          	});
					            // url에 해당 이용약관 번호 값이 잘넘어간다! 
					       </script>    
                        </tbody>
                    </table>
                </div>

<!------------------------------------- 페이징바 영역 --------------------------------------------------------->

		        <div align="center" class="paging-area">
		
					<!-- 현재 보고있는 페이지가 1일 떄 버튼 안보이게 하려면 아래와같이 -->
					<% if(currentPage != 1){ %>
		            	<button onclick="location.href='<%= request.getContextPath() %>/list.tos?currentPage=<%= currentPage-1 %>';">&lt;</button>
		            <%} %>
		            
		            <% for(int p=startPage; p<=endPage; p++){ %>
		            	<% if(p != currentPage) {%>	
		            		<button onclick="location.href='<%= request.getContextPath()%>/list.tos?currentPage=<%= p %>';"><%= p %></button>
		            	<%}else{ %>
		         	    	<button id="dis-btn" disabled><%= p %></button>
		    	    	    <!-- 현제 페이지수는 다시 클릭이 불가능하게 만들어주자! -->
		            	<%}%>
		            <%}%>
			
					<!-- 현재 보고있는 페이지가 마지막페이지일 떄 버튼 안보이게 하려면 아래와같이 -->
					<% if(currentPage != maxPage){ %>                        
		            	<button onclick="location.href='<%= request.getContextPath() %>/list.tos?currentPage=<%= currentPage+1 %>';">&gt;</button>
		            <%} %>
		        </div>
				

            </div>
<!----------------------------------------- 이용약관 관리 list페이지 HTML끝 ------------------------------------->
<!------------------------------------------------------------------------------------------------------------->            
        </div>
    </div>
</body>
</html>