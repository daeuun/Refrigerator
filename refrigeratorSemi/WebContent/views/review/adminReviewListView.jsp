<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ 
	page import = "com.refrigerator.member.model.vo.Member
				, com.refrigerator.review.model.vo.*
				,  java.util.ArrayList
				, com.refrigerator.common.model.vo.PageInfo " 
	
%>

<% 	
	Member loginUser = (Member)session.getAttribute("loginUser"); 
	ArrayList<AdmReview>list = (ArrayList<AdmReview>)request.getAttribute("list");
	String alertMsg = (String)session.getAttribute("alertMsg"); 
	
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
    .outer{
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

    .checked-delete:hover{

        cursor: pointer;

    }


    .checked-delete>tr:hover{
        cursor: pointer;
        background-color: rgb(248, 248, 248);
        opacity: 0.7;
    }

    .thead{
        background-color: rgb(224, 224, 224);
    }
</style>


</head>
<body>

<%@ include file="../common/admin/adminTopNavView.jsp" %>
<%@ include file = "../common/admin/adminSideBarView.jsp" %>

	<script>
	
		// menubar.jsp로 가져갈 구문
		var msg = "<%= alertMsg %>";
			
		if(msg != "null"){ 
			alert(msg);
			
			<% session.removeAttribute("alertMsg");%>
		}
	
	</script>
	

<div class="outer">

        <div class="select-list"  align="right" style="width: 350px;" >
            <a href="">홈</a> >
            <a href="">게시판 관리</a> >
            <a href="">요리 후기</a>
        </div>
        <br>

        <div class="search-container" align="right"style="width:1000px">

            <form action="" >
                <span id="" >회원 아이디</span>
                <input type="text" placeholder="아이디" name="">
                <button type="submit" class="btn btn-sm">조회</button>
            </form>

        </div>

        <br><br>
	
		<!-- 요리 후기 삭제 기능 -->
        <form action="<%=contextPath%>/deleteReview.admin" id="admin-delete-review" >

            <div class="btn" align="right" style="width: 440px">

                <a class="btn btn-sm btn-danger" data-toggle="modal" data-target="#review-Delete-Modal" style="margin-left: -160px;" >삭제</a>
                <br>

                  <!-- The Modal -->
                <div class="modal" id="review-Delete-Modal">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                    
                            <!-- Modal Header -->
                            <div class="modal-header">
                            <h4 class="modal-title">요리 후기 삭제</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                        
                            <!-- Modal body -->
                            <div class="modal-body">
					                            요리후기 삭제는 복구가 불가능합니다.   <br>
					                            요리후기를 삭제하시겠습니까?
					                            </div>
                            
                        
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            <button type="submit" class="btn btn-danger btn-sm">삭제하기</button>
                            
                    
                        </div>
                    </div>
                </div>

            </div>
            <br>

            
            <div class="member-list" >

                <table border="1" align="center" style="border: 1px sold black; width: 800px; margin-left: 100px;" class="reply-table"> 

                    <thead class="thead">
                        <tr align="center">
                            <th width="100">확인</th>
                            <th width="300">회원 아이디</th>
                            <th width="500">요리 후기 게시글 제목</th>
                            <th width="100">별점</th>
                            <th width="1000">후기내용</th>
                            <th width="200">작성일</th>
                        </tr>

                    </thead>
                
                    <tbody class="checked-delete">
                        
                        <%if(list.isEmpty()){ %>
                        	
                        	<tr>
                        		<td colspan="7">요리후기 조회 결과가 없습니다.</td>
                        	</tr>
                        	
                        
                        <%} else { %>
                   
                   			<%for(AdmReview a : list) { %>
                        
	                        <tr align="center" id="test" >
	                        	
	                            <td width="50"><input type="checkbox" name="reviewNo" value=<%=a.getReviewNo()%>></td>
	                            <td><%=a.getReviewWirter()%></td>
	                            <td><%=a.getRecipeTitle()%></td>
	                            <td><%=a.getStar()%></td>
	                            <td><%=a.getReviewContent()%></td>
	                            <td><%=a.getEnrollDate()%></td>
	                        </tr>
	                        
	                        <%} %>
                        <%} %>
	

                    </tbody>

                </table>

            </div>

        </form>
        

    </div>
    
    	<!-- 페이징바 -->
 		<div class="paging-area" align="center">
		
			<% if(currentPage != 1) { %>						
		          <button onclick="location.href='<%=contextPath%>/reviewlist.admin?currentPage=<%=currentPage-1%>';">&lt;</button>
			<% } %>
			
				<% for(int p=startPage; p<=endPage;p++) {%>
			
					<% if(p != currentPage) {%>
					<button onclick="location.href='<%=contextPath%>/reviewlist.admin?currentPage=<%=p%>';"><%=p%></button>
					<%} else { %>
					<button disabled><%= p %></button>
					<%} %>
				
				<%} %>
			
			<%if(currentPage != maxPage) {%>
		          <button onclick="location.href='<%=contextPath%>/reviewlist.admin?currentPage=<%=currentPage+1%>';">&gt;</button>
			<%} %>
			
			
	      </div>





</body>
</html>