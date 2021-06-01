<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.refrigerator.member.model.vo.Member
				 , com.refrigerator.common.model.vo.PageInfo" %>
<!-- @author leeyeji -->
<%
	//String contextPath = request.getContextPath();
	ArrayList<Member> pageList = (ArrayList<Member>)request.getAttribute("pageList");
	Member spcMem = (Member)request.getAttribute("spcMem");
	
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
    .total-outer{
        width: 1200px;
        margin: auto;
    }
    .admin-container{
        width: 100%;
        display: block;
        float: right;
    }/*
    .mem-content{
        width: 1050px;
        height: 900px;
        margin-top: 15px;
        margin-left: 150px;
        display: block;
    }*/
    .select-list{margin-left: 50px;}
    .select-list>a{
        text-decoration: none;
        color: black;
    }
    .select-list a:hover{color: rgb(0, 120, 51);text-decoration: none;}
    .search-container button{
        background-color: rgb(0, 120, 51);
        color: white;
    }
    .modi-delete{margin-left: 50px;}
    .member-btn a{background: rgb(0, 120, 51);}
    .checked-memberList>tr:hover{
        cursor: pointer;
        background-color: rgb(248, 248, 248);
        opacity: 0.7;
    }
    .thead{
        background-color: rgb(224, 224, 224);
    }
    .modal-body-list div{
        width: 200px;
        height: 30px;
        color: rgb(0, 120, 51);
        font-weight: bold;
        border-radius: 5px;
        text-align: center;
        margin: 10px;  
        font-size: 15px;
        line-height: 30px;
    }
    .modal-header, .modal-content, .modal-footer{border: 0px;}
</style>
</head>
<body>

        
	<div class="total-outer">
		<%@ include file="../common/admin/adminTopNavView.jsp" %>
			
            <div class="mem-content">
            
            <%@ include file="../common/admin/adminSideBarView.jsp" %>
			    
                <div class="select-list" align="left" style="width: 300px;">
                    <a href="">회원 관리</a> >
                    <a href="">회원 목록</a>
                </div>
                <br>
    
                <div class="search-container" align="right" style="width:1000px">
    
                    <form action="">
                        <span id="">회원 검색</span>
                        <input type="text" placeholder="아이디" name="">
                        <button type="submit" class="btn btn-sm">조회</button>
                    </form>
    
                </div>
    
                <br><br>
    
                 <form action="" method="GET">
    
                    <div class="btn" align="right" style="width: 350px;">
    
                        <div class="modi-delete" align="left" width="1000px">
                            <a class="btn btn-sm btn-success" data-toggle="modal" data-target="#member-modify-Modal" onclick="">회원수정</a>
                            <a class="btn btn-sm btn-danger" data-toggle="modal" data-target="#member-delete-Modal">회원삭제</a>
                        </div>
    
                        <!-- 회원 수정 modal -->
                        <form action="/refrigerator/adUpdate.me" method="get">
	                        <div class="modal" id="member-modify-Modal">
	                            <div class="modal-dialog modal-dialog-centered ">
	                                <div class="modal-content">
	    
	                                    <!-- Modal Header -->
	                                    <div class="modal-header">
	                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
	                                    </div>
	    
	                                    <!-- Modal body -->
	                                    <div class="modal-body">
	                                        <div class="modal-body-list">
	    
	                                            <table>
	                                                <tr>
	                                                    <td>
	                                                        <div class="modal-event-title">닉네임
	                                                        </div>
	                                                    </td>
	                                                    <td>
	                                                        <input type="text" name="mem-nickname" id="" value="<%=spcMem.getNickname()%>">
	                                                    </td>
	                                                </tr>
	                                                <tr>
	                                                    <td>
	                                                        <div>이메일</div>
	                                                    </td>
	                                                    <td>
	                                                        <input type="email" name="mem-email" id="">
	                                                    </td>
	                                                </tr>
	    
	                                                <tr>
	                                                    <td>
	                                                        <div>비밀번호</div>
	                                                    </td>
	                                                    <td><input type="text"></td>
	                                                </tr>
	    
	                                                <tr>
	                                                    <td>
	                                                        <div>전화번호</div>
	                                                    </td>
	                                                    <td><input type="text"></td>
	                                                </tr>
	    
	                                                <tr>
	                                                    <td>
	                                                        <div>성별</div>
	                                                    </td>
	                                                    <td>
	                                                        <input type="radio"> 선택안함
	                                                        <input type="radio"> 남
	                                                        <input type="radio"> 여
	                                                    </td>
	                                                </tr>
	                                                <tr>
	                                                    <td>
	                                                        <div>회원등급</div>
	                                                    </td>
	                                                    <td>
	                                                        <select name="memberLevel" id="">
	                                                            <option value="">일반 쉐프</option>
	                                                            <option value="">프리미엄 쉐프</option>
	                                                        </select>
	                                                    </td>
	                                                </tr>
	                                            </table>
	                                        </div>
	    
	                                    </div>
	    
	                                    <!-- Modal footer -->
	                                    <div class="modal-footer">
	                                        <button type="submit" class="btn btn-success">수정</button>
	                                    </div>
	    
	                                </div>
	                            </div>
	                        </div>
    					</form>
    					
						
    					
                        <!-- 회원 삭제 modal -->
	                        <!-- 
	                        	form 수정!!!!!!!!
	                         -->
                        <form action="/refrigerator/adDelete.me" method="post">
	                        <div class="modal" id="member-delete-Modal">
	                        	<input type="hidden" name="userNo" value="">
	                            <div class="modal-dialog modal-dialog-centered">
	                                <div class="modal-content">
	    
	                                    <!-- Modal body -->
	                                    <div class="modal-body">
	                                        <Strong>홍길동</Strong> 회원을 삭제하시겠습니까?
	                                    </div>
	    
	                                    <!-- Modal footer -->
	                                    <div class="modal-footer" align="center">
	                                        <button type="button" class="btn btn-secondary btn-sm"
	                                            data-dismiss="modal">취소</button>
	                                        <button type="submit" class="btn btn-danger btn-sm">삭제</button>
	                                    </div>
	    
	                                </div>
	                            </div>
	                        </div>
						</form>
						
                    </div>
                    <br>
    
    				<!-- 회원 목록 영역 -->
                    <div class="member-list" width="900px">
    
                        <table border="1" align="center">
    
                            <thead class="thead">
                                <tr align="center">
                                    <th width="50"></th>
                                    <th width="50">번호</th>
                                    <th colspan="2" width="120">아아디</th>
                                    <th width="100">이름</th>
                                    <th width="150">전화번호</th>
                                    <th width="250">이메일</th>
                                    <th width="150">회원등급</th>
                                    <th width="100">회원상태</th>
                                </tr>
    
                            </thead>
    
                            <tbody class="checked-memberList">
                            	<%for(Member m : pageList) {%>
	                                <tr align="center">
	                            		<input type="hidden" name="userNo" value="<%= m.getUserNo() %>">
	                                    <td><input type="checkbox" name="userCheck" value="checked"></td>
	                                    <td><%= m.getUserNo()%></td>
	                                    <td colspan="2"><%= m.getUserId() %></td>
	                                    <td><%= m.getUserName() %></td>
	                                    <td><%= m.getPhone() %></td>
	                                    <td><%= m.getEmail() %></td>
	                                    <%if(m.getGrade().equals("1")){ %>
	                                    	<td>프리미엄쉐프</td>
	                                    <%} else{%>
	                                    	<td>일반쉐프</td>
	                                    <%} %>
	                                    <td><%=m.getStatus() %></td>
	                                </tr>
    							<%} %>
    
                            </tbody>
    
                        </table>
    
                    </div>
                    <!--mem list-->
                   
                   <script>
	                   		// 조회되는 한 행의 회원 번호 넘기기..
	                   		
	                   		//$(".checked-memberList>tr").click(function(){
	                   		//	var mno = $(this).children("input").text();
	                   		
	                   		//})
	                   		function test(){
	                   			var checked = $("input[name='userCheck']:checked");
	                   			
	                   			if(ckecked.length != 0){ //td - tr - td
	                   				var userNo = checked.parant().children("input").eq(0).val();
	                   				console.log(userNo);
	                   				location.href = '<%=contextPath%>adDetail.me?mno' + mno;
	                   			}
	                   		}
						</script>
    
                </form> 
               	<br>
               	
	            <!-- 페이징바 영역 -->
	            <div align="center" class="paging-area">
	        
					<% if(currentPage != 1) { %>
		            <button onclick="location.href='<%= contextPath%>/adList.me?currentPage=<%=currentPage-1%>';"> &lt; </button>
					<% } %>
					
		            <% for(int p=startPage; p<=endPage; p++) {%>
		            	
		            	<% if(p != currentPage){ %>
			            	<button onclick="location.href='<%= contextPath%>/adList.me?currentPage=<%=p%>';"><%= p %></button>
			            <% }else{ %>
			            	<button disabled><%= p %></button>
		            	<%} %>
		            	
		            <% } %>
		
					<% if(currentPage != maxPage) { %>
		            <button onclick="location.href='<%= contextPath%>/adList.me?currentPage=<%=currentPage+1%>'"> &gt; </button>
					<% } %>
				
	       		</div>
    
            </div>
            <!--mem content-->
            
    </div>
    <!--total-outer-->

</body>
</html>