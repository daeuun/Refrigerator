<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ page import="com.refrigerator.tos.model.vo.Tos"%>  

<%
	Tos t = (Tos)request.getAttribute("tos");

	String tosTitle ="";
	String tosMsg = "";
	if(t == null){
		tosTitle = (String)request.getAttribute("tosTitleMsg");
		tosMsg = (String)request.getAttribute("tosMsg");
	}
%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- 작성자 : 재원      ※ 혹여나 해당 페이지에 작업시에 작업하신부분에 주석으로 성함과 영역을 표시해주세요! (혹여나 파일이 날라갈수있으니 push전에 백업부탁드려요~)  -->


<title>냉뭐? Terms Of Service Page</title>
<%-- 혹시나 pre태그 부분은 수정이 있을수 있다. --%>
<style>
    .outer {width: 900px; margin: auto;}
    .outer > p{width: 900px; font-size: 42px; font-weight: bolder; text-align: center; margin: auto; padding-top: 10px; padding-bottom: 15px; border-bottom: 1px solid black;}

    .outer > pre{
        width: 850px;
        margin: auto;
        padding-bottom: 20px;
        overflow:auto; 
        padding-top: 20px; 
        white-space: pre-wrap; 
        position: relative;
        /* 일단은 한글을 단어 기준 줄바꿈 */
        white-space:pre-line; 
		text-overflow:clip;
		word-break:keep-all;
    }
</style>
</head>
<body>
	<%@ include file="../../common/user/tempJWHeader.jsp" %>
    <div class="outer">
        <p><%if(t != null){%><%= t.getTosTitle() %><%}else{%><%= tosTitle %><%} %></p>
        <%-- 출력식으로 뿌려주면된다. --%>

        <%-- 아래가 문제인데 얘도 db에서 조회해 올것인데 어케해야 이쁘게 보일지는 생각을 해줘야한다. 
            아래도 출력식으로 뿌려주면된다. 
        --%>
        <pre><%if(t != null){%><%= t.getTosContent() %><%}else{%><%= tosMsg %><%} %></pre>
    </div>

	<%@ include file="../../common/user/footer.jsp" %>

</body>
</html>