<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.sign-up_form-wrap{width: 400px; margin:0 auto; padding: 60px 0;}
	.sign-up_form-group{margin: 0 0 30px;}
	.sign-up_form-group_input{margin: 10px 0 0;display: flex;}
	.sign-up_form-group_label{display: block; margin: 0 0 12px; font-size: 14px; font-weight: 700; line-height: 20px;}
        
	.form-control{display: block; box-sizing: border-box; height: 40px; width: 100%; padding: 0 15px; line-height: 0; border-radius: 4px; border: 1px solid #cccccc;}
	.email-input_local, .gender-input{width: 100%;}
	.email-input_separator {flex: 0 0 20px; text-align: center; line-height: 35px; color: #cccccc;}
        
	.birth-input_separator{flex: 0 0 10px; text-align: center; line-height: 35px; color: transparent;}
	.birth-input_month{width: 170px; color: #cccccc;}
	.sign-up_submit{background-color: #009764; color: #fff; 
		text-align: center; font-size: 15px; font-weight: 540; 
		width: 100%; height: 50px;
		border: none; border-radius: 4px; 
		margin: 10px 0; padding: 10px 0;
	}
    </style>
</head>
<body>
    <section class="container sign-up">

        <div class="sign-up_form-wrap">

            <form action="<%= contextPath %>/insert.me" class="sign-up_form" id="sign-up_form" method="post">

                <div class="sign-up_form-group"> <!-- 아이디 -->
                    <div class="sign-up_form-group_label"> <!-- 텍스트div -->
                        	아이디
                    </div>
                    <div class="sign-up_form-group_input"> <!-- 입력란div -->
                        <span class="email-input_local">
                            <input class="form-control" type="text" name=" " placeholder="이메일" required>
                        </span>
                    </div>
                    <!-- 에러 발생시 등장 -->
                    <div class="sign-up_form-group_error">
                        	필수 입력 항목입니다.
                    </div>
                </div>

                <div class="sign-up_form-group"> <!-- 비밀번호 -->
                    <div class="sign-up_form-group_label"> <!-- 텍스트div -->
                        	비밀번호
                    </div>
                    <div class="sign-up_form-group_description">
                        8자 이상 입력해주세요.
                    </div>
                    <div class="sign-up_form-group_input">
                        <input class="form-control" type="password" name="userPwd" placeholder="비밀번호(8자~20자)" required> 
                    </div>
                </div>

                <div class="sign-up_form-group"> <!-- 비밀번호 확인 -->
                    <div class="sign-up_form-group_label"> <!-- 텍스트div -->
                       	 비밀번호 확인
                    </div>
                    <div class="sign-up_form-group_input">
                        <input class="form-control" type="password" name="password" placeholder="비밀번호를 다시 입력해주세요." required> 
                    </div>
                </div>

                <div class="sign-up_form-group"> <!-- 이름 -->
                    <div class="sign-up_form-group_label"> <!-- 텍스트div -->
                        	이름
                    </div>
                    <div class="sign-up_form-group_input">
                        <input class="form-control" type="text" name="userName" required> 
                    </div>
                </div>

                <div class="sign-up_form-group"> <!-- 생년월일 -->
                    <div class="sign-up_form-group_label"> <!-- 텍스트div -->
                       	 생년월일
                    </div>
                    <div class="sign-up_form-group_input"> <!-- 입력란div -->
                        <span class="birth-input_year">
                            <input class="form-control" type="text" name="birthYear" placeholder="년(4자)" required maxlength="4">
                        </span>
                        <span class="birth-input_separator">::</span>
                        <span class="birth-input_month">
                            <select class="form-control" name="birthMonth" id="">
                                <option selected="" value="" disabled="">월</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                            </select>
                        </span>
                        <span class="birth-input_separator">::</span>
                        <span class="birth-input_day">
                            <input class="form-control" type="text" name="birthDay" placeholder="일" required maxlength="2">
                        </span>
                    </div>
                    <!-- 에러 발생시 등장 -->
                    <div class="sign-up_form-group_error">
                        	필수 입력 항목입니다.
                    </div>
                </div>

                <div class="sign-up_form-group"> <!-- 성별 -->
                    <div class="sign-up_form-group_label"> <!-- 텍스트div -->
                        	성별
                    </div>
                    <div class="sign-up_form-group_input"> <!-- 입력란div -->
                        <span class="gender-input">
                            <select class="form-control" name="gender" id="gender">
                                <option selected="" value="" disabled="">성별</option>
                                <option value="M">남</option>
                                <option value="F">여</option>
                                <option value="N">선택안함</option>
                                
                            </select>
                        </span>
                    </div>
                    <!-- 에러 발생시 등장 -->
                    <div class="sign-up_form-group_error">
                        	필수 입력 항목입니다.
                    </div>
                </div>

                <div class="sign-up_form-group"> <!-- 본인확인이메일 -->
                    <div class="sign-up_form-group_label"> <!-- 텍스트div -->
                        	본인 확인 이메일
                    </div>
                    <div class="sign-up_form-group_input">
                        <input class="form-control" type="email" name="email" required> 
                    </div>
                </div>

                <button class="sign-up_submit" type="submit">회원가입</button>

            </form>

        </div>

    </section>
    
</body>
</html>