<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.refrigerator.event.model.vo.AdmEvent,com.refrigerator.common.model.vo.PageInfo "%>




		<!-- @Author seong 5/31 -->
	
<%

	ArrayList<AdmEvent>list = (ArrayList<AdmEvent>)request.getAttribute("list");

	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>
    .total_outer{
        color: black;
        width: 1200px;
        margin: auto;
        margin-top: 50px;
    }

    .select-list>a{
        text-decoration: none;
        color: black;
    }
    .search-container button{
        background-color: rgb(0, 120, 51);
        color: white;
    }
    .member-btn a{
        background: rgb(0, 120, 51);
    }


    .checked-eventList>tr:hover{

    cursor: pointer;
    background-color: rgb(248, 248, 248);
    opacity: 0.7;
    }

    .thead{
        background-color: rgb(224, 224, 224);
    }

    .modal-body-list div{
        width: 100px;
        height: 30px;
        background-color: rgb(0, 120, 51);
        border-radius: 5px;
        color:white;
        text-align: center;
        margin: 10px;  
        font-size: 11px;
        line-height: 30px;
    }
</style>

</head>
<body>



	
    <div class="total_outer">
        <%@ include file="../common/admin/adminTopNavView.jsp" %>


        <div> 	
	        <%@ include file="../common/admin/adminSideBarView.jsp" %>
        </div>  
        
        
        <div class="select-list"  align="right" style="width: 350px;" >
            <a href="">홈</a> >
            <a href="">게시판 관리</a> >
            <a href="">이벤트</a>
        </div>
        <br>


        <br><br>

     
      
      

            <div class="btn" align="right" style="width: 400px;">

                <a class="btn btn-sm btn-success" data-toggle="modal" data-target="#event-enroll-Modal">등록</a>
                <a class="btn btn-sm btn-primary" data-toggle="modal" data-target="#event-status-Modal">게시</a>
                <a class="btn btn-sm btn-danger" data-toggle="modal" data-target="#event-delete-Modal">삭제</a>
            </div>  

            <!--이벤트 목록 테이블 영역-->
			<table border="1" align="center">

                    <thead class="thead">
                        <tr align="center" >
                            <th width="50">확인</th>
                            <th>분류</th> 
                            <th colspan="2" width="300">이벤트 제목</th>
                            <th width="150">이벤트 시작일</th>
                            <th width="150">이벤트 종료일</th>
                            <th width="50">상태</th>    
                            <th>이벤트 이미지 수정</th>
                        </tr>

                    </thead>
                    <tbody class="checked-eventList">
                        <%if(list.isEmpty()) { %>
                        
                            <tr>
                                <td colspan="8" style="text-align: center;">등록된 이벤트가 없습니다.</td>
                            </tr>
                        
                            <% } else {%>
                    
                                <% for(AdmEvent a : list) { %>
                            
                            
                                    <tr align="center">
                                        <td><input type="checkbox"></td>
                                        <td><%=a.getEventCategory() %></td>
                                        <td colspan="2"><%=a.getEventTitle()%></td>
                                        <td><%=a.getStartDate() %></td>
                                        <td><%=a.getEndDate() %></td>
                                        <td><%=a.getStatus() %></td>
                                        <td>
                                            <a class="btn btn-sm btn-secondary" data-toggle="modal" data-target="#event-modify-Modal">
                                                수정하기</a>
                                        </td>
            
                                    </tr>

                                <%} %>
					    <%} %>
                 </tbody>
                    

            </table>
      
                    <!--이벤트 등록 영역-->
                	<form action="<%=contextPath%>/insertEvent.admin" method="post" id="enroll-form" enctype="multipart/form-data">
                  	    <!-- The Modal -->
                        <div class="modal" id="event-enroll-Modal" >
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content" style="background-color: rgb(224, 224, 224);" align="center">
                    
                        
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title"><b>이벤트 등록</b></h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            
                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="modal-body-list">
                                    
                                    <table>

                                        <tr>
                                            <td>
                                                <div class="modal-event-title">이벤트 제목
                                                </div>
                                            </td>
                                            <td>
                                                <input type="text" name="eventTitle" placeholder="제목을 입력해주세요" required>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <div>분류</div>
                                            </td>
                                            <td>
                                                <select name="eventCategory" required>
                                                    <option value="이벤트">이벤트</option>
                                                    <option value="공모전">공모전</option>
                                                </select>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td><div>이벤트 시작일</div></td>
                                            <td><input type="date" name="startDate" required></td>
                                        </tr>
                                        
                                        <tr>
                                            <td> <div>이벤트 종료일</div></td>
                                            <td><input type="date" name="endDate" required></td>
                                        </tr>

                                        <tr>
                                            <td><div>첨부파일</div></td>
                                            <td>
                                                <input type="file" name="eventUpfile" required>
                                            </td> 
                                        </tr>

                                    </table>
                                

                                </div>
    
                            </div>
                        
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            <button type="submit" class="btn btn-success">등록</button>
                            </div>
                    
                        </div>
                        </div>
                        </div>
                    <form >

                    <!--이벤트 삭제 영역-->
                    
                     <!-- The Modal -->
                        <div class="modal" id="event-delete-Modal">
                        <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">

                            <div class="modal-header">
                                <h4 class="modal-title"><b>이벤트 삭제</b></h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                    
                            <!-- Modal body -->
                            <div class="modal-body">
                            삭제 후 복구가 불가능합니다. <br>
                            이벤트를 삭제하시겠습니까?
                            </div>
                    
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">취소</button>
                                <button type="submit" class="btn btn-danger btn-sm">삭제</button>
                            </div>
                    
                        </div>
                        </div>
                        </div>
                    



                    <!--이벤트 수정 영역-->
                    <form>
                        <!-- The Modal -->
                        <div class="modal" id="event-modify-Modal" >
                        <div class="modal-dialog modal-dialog-centered modal-lg">
                        <div class="modal-content" style="background-color: rgb(224, 224, 224);" align="center">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title"><b>이벤트 수정</b></h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            
                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="modal-body-list">
                                    
                                    <table>

                                        <tr>
                                            <td>
                                                <div class="modal-event-title">이벤트 제목
                                                </div>
                                            </td>
                                            <td>
                                                <input type="text" name="" id="" placeholder="제목을 입력해주세요">
                                            </td>
                                        </tr>

                                        <tr>
                                            <td>
                                                <div>
                                                    분류
                                                </div>
                                            </td>
                                            <td>
                                                <select name="" id="" value="">
                                                    <option value="이벤트">이벤트</option>
                                                    <option value="공모전">공모전</option>
                                                </select>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td><div>이벤트 시작일</div></td>
                                            <td><input type="date"></td>
                                        </tr>
                                        
                                        <tr>
                                            <td> <div>이벤트 종료일</div></td>
                                            <td><input type="date"></td>
                                        </tr>

                                        <tr>
                                            <td><div>첨부파일</div></td>
                                            <td>
                                                <input type="file">
                                            </td> 
                                        </tr>

                                    </table>


                                </div>
        
                            </div>
                    
                            <!-- Modal footer -->
                            <div class="modal-footer" align="center">
                            <button type="submit" class="btn btn-success">수정</button>
                            </div>
                                                                
                        </div>
                        </div>
                        </div>
                </form>


                
            </div>
            <br>

            

       

        
    </div>


    <div class="paging-area" align="center">

        <% if(currentPage != 1) { %>
        <button onclick="location.href='<%=contextPath%>/selectEvent.admin?currentPage=<%=currentPage-1%>';">&lt;</button>
        <% } %>
        
        <% for(int p=startPage; p<=endPage;p++) {%>
    
            <% if(p != currentPage) {%>
            <button onclick="location.href='<%=contextPath%>/selectEvent.admin?currentPage=<%=p%>';"><%=p%></button>
            <%} else { %>
            <button disabled><%= p %></button>
            <%} %>
        
        <%} %>
        
        <%if(currentPage != maxPage) {%>
        <button onclick="location.href='<%=contextPath%>/selectEvent.admin?currentPage=<%=currentPage+1%>';">&gt;</button>
        <%} %>
        
        
    </div>


    


</body>
</html>