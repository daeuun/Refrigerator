<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.refrigerator.member.model.vo.Member
				 , com.refrigerator.common.model.vo.PageInfo" %>
<!-- @author leeyeji -->
<%
	//String contextPath = request.getContextPath();
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("pageList");
	ArrayList<Member> sList = (ArrayList<Member>)request.getAttribute("searchList");
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
    .select-list{margin-left: 180px;}
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
                    <a href="">?????? ??????</a> >
                    <a href="">?????? ??????</a>
                </div>
                <br>
    
                <div class="search-container" align="right" style="width:1000px">
    
                    <form action="">
                        <span id="">?????? ??????</span>
                        <input type="text" placeholder="?????????" name="">
                        <button type="submit" class="btn btn-sm">??????</button>
                    </form>
    
                </div>
    
                <br><br>
    
                 
    
                    <div class="btn" align="right" style="width: 350px;">
    
                        <div class="modi-delete" align="left" width="1000px">
                            <!-- <a class="btn btn-sm btn-success" data-toggle="modal" data-target="#member-modify-Modal">????????????</a> -->
                            <!-- <a class="btn btn-sm btn-danger" data-toggle="modal" data-target="#member-delete-Modal">????????????</a> -->
                        </div>
    
                        <!-- ?????? ?????? modal -->
                        <form action="<%=contextPath %>/adUpdate.me" method="post">
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
	                                                    	<input type="hidden" name="userNo" id="userNo-modify">
	                                                        <div class="modal-event-title">?????????
	                                                        </div>
	                                                    </td>
	                                                    <td>
	                                                        <input type="text" name="exstnNickname" id="exstnNickname">
	                                                    </td>
	                                                </tr>
	                                                <tr>
	                                                    <td>
	                                                        <div>?????????</div>
	                                                    </td>
	                                                    <td>
	                                                        <input type="email" name="exstnEmail" id="exstnEmail">
	                                                    </td>
	                                                </tr>
	    
	                                                <tr>
	                                                    <td>
	                                                        <div>????????????</div>
	                                                    </td>
	                                                    <td><input type="text" name="exstnPhone" id="exstnPhone"></td>
	                                                </tr>
	    
	                                                <tr>
	                                                    <td>
	                                                        <div>??????</div>
	                                                    </td>
	                                                    <td>
	                                                        <input type="radio" name="gender" value="N"> ????????????
	                                                        <input type="radio" name="gender" value="M"> ???
	                                                        <input type="radio" name="gender" value="F"> ???
	                                                    </td>
	                                                </tr>
	                                                <tr>
	                                                    <td>
	                                                        <div>????????????</div>
	                                                    </td>
	                                                    <td>
	                                                        <select name="grade" id="grade">
	                                                            <option value="2">?????? ??????</option>
	                                                            <option value="1">???????????? ??????</option>
	                                                        </select>
	                                                    </td>
	                                                </tr>
	                                            </table>
	                                        </div>
	    
	                                    </div>
	    
	                                    <!-- Modal footer -->
	                                    <div class="modal-footer">
	                                        <button type="submit" class="btn btn-success">??????</button>
	                                    </div>
	    
	                                </div>
	                            </div>
	                        </div>
    					</form>
    					
						
    					
                        <!-- ?????? ?????? modal -->
	                        <!-- 
	                        	form ??????!!!!!!!!
	                         -->
                        <form action="<%=contextPath %>/adDelete.me" method="post">
	                        <div class="modal" id="member-delete-Modal">
	                        	
	                                    <input type="hidden" name="userNo" id="userNo-delete">
	                            <div class="modal-dialog modal-dialog-centered">
	                                <div class="modal-content">
	    
	                                    <!-- Modal body -->
	                                    <div class="modal-body">
	                                        ????????? ?????????????????????????
	                                    </div>
	    
	                                    <!-- Modal footer -->
	                                    <div class="modal-footer" align="center">
	                                        <button type="button" class="btn btn-secondary btn-sm"
	                                            data-dismiss="modal">??????</button>
	                                        <button type="submit" class="btn btn-danger btn-sm">??????</button>
	                                    </div>
	    
	                                </div>
	                            </div>
	                        </div>
						</form>
						
                    </div>
                    <br>
    
    				<!-- ?????? ?????? ?????? -->
                    <div class="member-list" width="900px">
    
                        <table border="1" align="center">
    
                            <thead class="thead">
                                <tr align="center">
                                    <th width="120">?????????</th>
                                    <th width="100">?????????</th>
                                    <th width="70">??????</th>
                                    <th width="150">????????????</th>
                                    <th width="250">?????????</th>
                                    <th width="120">????????????</th>
                                    <th width="70">??????</th>
                                   	<th width="100">??????</th>
                                </tr>
    
                            </thead>
    
                            <tbody class="checked-memberList">
                            	<%for(Member m : list) {%>
	                                <tr align="center">
	                            		<input type="hidden" value="<%= m.getUserNo() %>">
	                                    <td><%= m.getUserId() %></td>
	                                    <td><%= m.getNickname()%></td>
	                                    <td><%= m.getUserName() %></td>
	                                    <td><%= m.getPhone() %></td>
	                                    <td><%= m.getEmail() %></td>
	                                    <%if(m.getGrade().equals("1")){ %>
	                                    	<td>??????????????????</td>
	                                    <%} else{%>
	                                    	<td>????????????</td>
	                                    <%} %>
	                                    <td><%=m.getStatus() %></td>
	                                    <td>
	                                    	<a class="btn btn-sm btn-success" data-toggle="modal" data-target="#member-modify-Modal" onclick="modifyMember();">??????</a>
	                                    	<a class="btn btn-sm btn-danger" data-toggle="modal" data-target="#member-delete-Modal" onclick="deleteMember();">??????</a>
	                                    </td>
	                                </tr>
    							<%} %>
    
                            </tbody>
    
                        </table>
    
                    </div>
                    <!--mem list-->
                   
					<script>
	                   		// ???????????? ??? ?????? ?????? ?????? ?????????..
	                   		function modifyMember(){
	                   			
	                   			//$("#userNo-modify").val($(event.target).parent().siblings("input[type=hidden]").val());
	                   			
	                   			var userNo = $(event.target).parent().siblings("input[type=hidden]").val();
	                            //console.log(userNo);
	                            $("#userNo-modify").val(userNo);
	                            
	                            <% for(Member m : list) {%>
	                            	
	                            	if(userNo == <%= m.getUserNo()%>){
	                            		
	                            		$("#exstnNickname").val("<%=m.getNickname()%>");
	                            		$("#exstnEmail").val("<%=m.getEmail()%>");
	                            		$("#exstnPwd").val("<%=m.getUserPwd()%>")
	                            		$("#exstnPhone").val("<%=m.getPhone()%>");
	                            		$("#grade").val("<%=m.getGrade()%>");
	                            		
	                            	}
	                            <% }%>
	                   			
	                   		}
	                   		
	                   		function deleteMember(){
	                   			$("#userNo-delete").val($(event.target).parent().siblings("input[type=hidden]").val());
	                   		}
	                   		
					</script>
    
               
               	<br>
               	
	            <!-- ???????????? ?????? -->
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