<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.refrigerator.member.model.vo.Member"%>
<%
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	String errorMsg = (String)session.getAttribute("errorMsg");
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
	@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
        body { font-family: 'Noto Sans KR', sans-serif; }
        a{
            color: #333;
            text-decoration: none;

        }
        .login_outer{
            position: absolute;
            left: 50%;
            top: 50%;
            width:320px;
            margin-left:-160px;
            margin-top:-160px;
        }
        .login_inner{
            width:100%;
            height:100%;
            position:relative;
        }

        .box_login{
            border: 1px solid #ddd;
            border-radius: 8px;
            box-sizing: border-box;
            background: #f4f4f4;
            
        }
        .box_login .input_text{
            position: relative;
            width: 100%;
            box-sizing: border-box;
            padding: 15px 14px 15px;
            margin: 0;
        }
        .input_text input{
            display: block;
            width: 100%;
            height: 100%;
            font-size: 14px;
            border: none;
            outline: 0;
            background-color: transparent;
        }
        .box_login .input_text+.input_text {
            border-top: 1px solid #ddd;
        }
        .btn_changePwd{
            margin: 10px 0 0;
            width: 100%;
            height: 48px;
            border-radius: 8px;
            padding: 15 10;
            font-size: 17px;
            color: #fff;
            background: #009764;
            border: 0;
            outline: 0;
        }
		.label_text{
            color: #009764;
            font-size: 13px;
            line-height: 19px;
			margin: 10px 0;
        }
        
        
    </style>
</head>
<body>

	<script>
	
		var msg = "<%= errorMsg %>";	
		
		if(msg != "null"){
			alert(msg);
			// ????????? ?????? ????????? ????????????
			<% session.removeAttribute("alertMsg"); %>
		}
	
	</script>	
	
	<div class="login_outer">

        <div class="login_inner">

            <form action="<%= contextPath %>/changePwd.member" method="POST">

                <div class="box_login">
	                <div class="input_text">
	                	<input type="text" name="userId" placeholder="?????????" required>
	                </div>
                    <div class="input_text">
                        <input type="password" id="changePwd" name="changePwd" placeholder="????????? ????????????(4~20???)" required>
                    </div>
                    <div class="input_text">
                        <input type="password" id="ReChangePwd" name="ReChangePwd" placeholder="????????? ??????????????? ?????? ??????????????????" required>
                    </div>
					<!-- ???????????? ??????????????? -->
                </div>
				<div class="userPwd-input_pwdCheck label_text" id="pwdCheck"></div>
                <button type="submit" class="btn_changePwd">???????????? ??????</button>
            </form>

        </div>
    </div>

	<script>
		// ???????????? ???????????????
        $("#changePwd").focusout(function(){
           
		   var userPwd = $("#changePwd").val();
		   var pwdLength = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\(\\)\-_=+]).{4,16}$/;

		   if(pwdLength.test(userPwd)){
			   $("#pwdCheck").hide();
		   }else{
			   $("#pwdCheck").text("4~16??? ?????? ??? ?????????, ??????, ??????????????? ???????????????.");
		   }
	   });

	   // ???????????? ????????? ???????????? ??????
	   $("#ReChangePwd").focusout(function(){
		   var changePwd = $("#changePwd").val();
		   var rePwd = $("#ReChangePwd").val();

		   if(changePwd != '' || rePwd != ''){
			   
			   if(changePwd == rePwd){ // ??????
				   $("#rePwdCheck").hide();
			   }else{ // ?????????
				   $("#rePwdCheck").text("??????????????? ???????????? ????????????.");
			   }
		   }
	   }); 
	</script>
</body>
</html>