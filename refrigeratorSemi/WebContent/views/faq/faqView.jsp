<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.refrigerator.faq.model.vo.Faq" %>
<!-- @author leeyeji -->
<%
	String contextPath = request.getContextPath();
	ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list");
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
        background: white;
        color: black;
        width: 1200px;
        margin: auto;
        margin-top: 50px;
    }
    #userSideNav-area{
        border: 1px solid lightgray;
        width: 200px;
        height: 150px;
        text-align: center;
        margin-top: 50px;
        margin-left: 20px;
    }
    #userSideNav-area a{
        display: block;
        height: 100%;
        line-height: 75px;
        color: black;
        font-size: 20px;
    }
    #userSideNav-area a:hover{
        text-decoration: none;
        background: rgba(211, 211, 211, 0.5);
        color: rgb(0, 120, 51);
    }
    .FAQ-list-area>thead>tr{
        border-bottom: 2px solid rgb(0, 120, 51);
        border-top: 2px solid rgb(0, 120, 51);
        font-weight: bold;
        text-align: center;
        height: 50px;
    }
    .FAQ-list-area>tbody>tr:hover{
        color: rgb(0, 120, 51);
        font-weight: bold;
        cursor: pointer;
    }
    .FAQ-list-area>tbody>tr{
        height: 45px;
        text-align: center;
        border-bottom: 1px solid darkgray;
    }
    .FAQ-answer{
        color: rgb(0, 120, 51);
        font-weight: bold;
        display: none;
    }
    #btn-noticeWrite{
        background: rgb(0, 120, 51);
        color: white;
    }
    #btn-noticeWrite:hover{
        background: white;
        color: rgb(0, 120, 51);
        border: 1px solid rgb(0, 120, 51);
        font-weight: bold;
        cursor: pointer;
    }
</style>
</head>
<body>

	<div class="outer">

        <br>
        <h2 align="center" style="font-weight:bold;">FAQ</h2>
        <br>

        <div id="user-side-nav">
            <table id="userSideNav-area" align="left" border="1px">

                <tr>
                    <th><a href="">공지사항</a></th>
                </tr>
                <tr>
                    <th><a href="">FAQ</a></th>
                </tr>
                <tr>
                    <th><a href="">1:1문의</a></th>
                </tr>

            </table> 
        </div>

	    <div align="right" style="width: 1050px;">
	        <a href="" class="btn btn-sm" id="btn-noticeWrite">글작성</a>
	        <br><br>
	    </div>


        <!-- 게시판 틀-->
        <div id="FAQ-list">
            <table class="FAQ-list-area" align="center">

                <thead>
                    <tr id="headline">
                        <th width="70">글번호</th>
                        <th width="400">글제목</th>
                        <th width="100">작성자</th>
                        <th width="100">작성일</th>
                        <th width="70">조회수</th>
                    </tr>
                </thead>
                <tbody>
                    <%if(list.isEmpty()) {%>
                    	<tr>
	                		<td colspan="5"> 존재하는 FAQ가 없습니다.</td>
	                	</tr>
                    <%} else{%>
                    	<%for(Faq f : list) { %>
	                        <tr class="FAQ-question">
	                            <td><%=f.getFaqNo()%></td>
	                            <td><%=f.getQuesContent() %></td>
	                            <td>관리자</td>
	                            <td><%=f.getModifyDate() %></td>
	                            <td><%=f.getCount() %></td>
	                        </tr>
	                        <tr class="FAQ-answer">
	                            <td colspan="5" align="left" style="padding-left: 20px;"><%=f.getAnswerContent() %></td>
	                        </tr>
                        <%} %>
                    <%} %>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        
    	$(function(){
    		$(".FAQ-question").click(function(){

                var $answer = $(this).next()

                if($answer.css("display") == ("none")){
                    $(this).siblings(".FAQ-answer").hide();
                    $answer.show();
                    $(this).css("background","rgb(0, 120, 51, 0.1)");
                    $(this).css("color", "black");
                }else{
                    $answer.hide();
                    $(this).css("background", "white");
                    $(this).css("color","black");
                }

    		})
    		
    	})
        
    </script>
    

</body>
</html>