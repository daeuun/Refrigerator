<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String errorTitleMsg = (String)request.getAttribute("errorTitleMsg");
	String errorMsg = (String)request.getAttribute("errorMsg"); 
%>   
<%-- errorMsg 담을때 br 태그를 넣어서 줄바꿈 생각해서 넘기기 아니면. css로 해결해야하는데 css로 해결하면 팀원이 원하는 형태로 진행되지 않을것이다. --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- 작성자 : 재원      ※ 혹여나 해당 페이지에 작업시에 작업하신부분에 주석으로 성함과 영역을 표시해주세요! (혹여나 파일이 날라갈수있으니 push전에 백업부탁드려요~)  -->
<title>냉뭐? Error Page</title>
    <style>
        #logo-area{width: 800px; height: 180px; margin: auto; text-align: center;}
        #logo-area > img{width: 180px; padding-top: 25px;}
        #err-info-area{width: 800px; height: 350px; margin: auto;}
        #err-info-area > table{width: 100%; height: 100%;}
        #err-info-area th{font-size: 42px; text-align: left; padding-left: 2px;}
        tr:nth-child(2){font-size: 17px; border-bottom: 2px solid darkgray;}
        tr:nth-child(2) > td{line-height: 25px; padding-top: 22px; padding-bottom: 12px;}
        button{width: 190px; height: 60px; border: none; border-radius: 3px; color: white; font-size: 21px; font-weight: bolder; line-height: 22px; margin-left: 105px; cursor: pointer; background-color: rgb(46,204,113);}
        button:hover{transform: scale(1.05); border: 1px solid orange;}
    </style>
</head>
<body>
    <%-- 단순한 에러페이지이기에 로그인 정보같은것을 넘겨받을 필요가 없다. 단순히 에러페이지 제목과 세부 문구를 전달해주면된다. 
        servlet에서 requset에 attribute에 담아서 이페이지에서 받아주고 그리고 뿌려주기만 하면 된다. --%>
    <div id="logo-area"><img src="../../resources/images/logo.png"></div>
    <%-- 팀프로젝트로 옮길때! 이미지 위치 다시 잡아줘야한다. --%>
    <div id="err-info-area">
        <table align="center">
            <tr>
                <td rowspan="3" width=220><img src="../../resources/images/exclamationmark.png" width="215"><br><br><br><br><br><br> </td>
                <%-- 팀프로젝트로 옮길때! 이미지 위치 다시 잡아줘야한다. --%>
                <th height=70>페이지를 찾을 수 없습니다.</th><%-- <%errorTitleMsg%> 출력식으로 대체해주면된다 --%>
            </tr>
            <tr> 
                <td height=100>방문하시려는 페이지의 주소가 잘못 입력되었거나,<br> 페이지의 주소가 변경 혹은 삭제되어 요청하신 페이지를 찾을 수 없습니다. <br>입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.</td>
                    <%-- <%errorMsg%> 출력식으로 대체해주면된다 --%>
            </tr>
            <tr>
                <td><button onclick="history.back()">이전 페이지로</button></td> 
            </tr>
        </table>
    </div>

    <%-- 기능구현 끝 팀프로젝트로 옮겼을시에 조금 손봐주면 된다. --%>

</body>
</html>