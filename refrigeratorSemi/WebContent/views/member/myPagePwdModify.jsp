<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="author" content="jaewon.s">
<!-- 작성자 : 재원      ※ 혹여나 해당 페이지에 작업시에 작업하신부분에 주석으로 성함과 영역을 표시해주세요! (혹여나 파일이 날라갈수있으니 push전에 백업부탁드려요~)  -->

<title>마이페이지 비밀번호 변경</title>
<style>
    .logo-area{
        margin-top: 10px;
    }

    .outer{
        width: 1200px;
        height: 640px;
        text-align: center;
        margin: auto;
        position: relative;
        z-index: 1000000;
        background-color: white;
        transform: translateY(-110px);
    }

    #pswModifyForm{
        width: 500px;
        height: 640px;
        margin: auto;
        padding-top: 90px;
    }
    
    #pswModifyForm h3{
        font-weight: 600;
        margin-bottom: 50px;
    }

    #pswModifyForm input{
        width: 100%;
        height: 55px;
        font-size: 19px;
        border: 1px solid rgb(190,190,190);
        border-radius: 5px;
        padding-left: 20px;
        margin-bottom: 12px;
    }

    #pswModifyForm input:hover{
        transform: scale(1.02);
        border: 1px solid orange;
    }

    #pswModifyForm span{
        height: 60px;
        float: left;
        font-size: 18px;
        font-weight: 500;
        line-height: 82px;
    }

    #pswModifyForm button{
        width: 100%;
        height: 60px;
        font-size: 20px;
        font-weight: 700;
        margin-top: 15px;
        border-radius: 5px;
        background-color: white;
        border: 1px solid rgb(220,220,220);
    }

    #pswModifyForm button:hover{
        color: pink;
        border: 2px solid pink;
    }

    #pswModifyForm button[type="submit"]{
        color: white;
        background-color: rgb(0,153,102) ;
    }
</style>

</head>
<body>
	<%@ include file="../common/user/tempJWHeader.jsp" %>

    <div class="outer">   
        <!-- action 에 서블릿 호출 ~ -->
        <form action="~~~~.do" method="post" id="pswModifyForm">
            <h3>비밀번호 변경</h3>
            <input type="text" name="userPwd" placeholder="현재 비밀번호" required><br>
            <!-- 이 아래의 span이 AJAX가 적용될 예정이다. -->
            <span>8자 이상 입력해주세요.</span><br>
            <input type="text" name="newUserPwd" placeholder="새 비밀번호" required><br>
            <input type="text" placeholder="새 비밀 번호를 확인합니다" required><br>
            <br>
            <button type="submit">확인</button><br>
            <button type="button" onclick="history.back()">취소</button>
        </form>
    </div>

	<%@ include file="../common/user/footer.jsp" %>
</body>
</html>