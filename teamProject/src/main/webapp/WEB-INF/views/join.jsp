<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f4f7f6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: #fff;
            padding: 50px;
            border-radius: 15px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            width: 600px; /* Consistent width for both registration and login windows */
            margin: 20px;
        }

        h1 {
            margin-bottom: 20px;
            font-size: 26px;
            color: #333;
            text-align: center;
        }
        
        .form-group {
            margin-bottom: 20px;
            display: flex;
            flex-direction: column;
        }

        .form-group input {
            border-radius: 4px;
            border: 1px solid #ddd;
            padding: 10px;
            width: 100%;
            box-sizing: border-box;
        }

        .form-group input:focus {
            border-color: #69DFC7;
            outline: none;
            box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
        }

        .form-group button {
            background-color: #69DFC7;
            color: white;
            border: none;
            border-radius: 4px;
            padding: 12px; /* Increased padding for larger button */
            width: 100%;
            cursor: pointer;
            box-sizing: border-box;
            font-size: 16px; /* Increased font size for larger button */
            transition: background-color 0.3s, transform 0.3s;
            margin-top: 10px;
        }

        .form-group button:hover {
            background-color: #5bc1ac;
            transform: scale(1.05); /* Slightly enlarge the button on hover */
        }

        .form-group span {
            display: block;
            margin-top: 5px;
            font-size: 14px;
        }

        .form-group .success {
            color: #28a745;
        }

        .form-group .error {
            color: #dc3545;
        }

        /* Centering the submit button within the container */
        #submitBtn {
            margin-top: 20px; /* Space between the last input and the button */
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function(){
            var emailChecked = false;
            var phoneChecked = false;
            var PattenrnEmail = /^[a-zA-Z0-9.-_]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
            var PatternPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}$/;
            var PatternPhone = /^01(0|1|[6-9])[0-9]{4}[0-9]{4}$/;
            
            $("#checkIdBtn").on("click", function(event) {
                event.preventDefault();
                var user_email = $("#user_email").val().trim();
                if(user_email === ""){
                    $("#idCheckResult").text("이메일을 입력해주세요.").removeClass("success").addClass("error");
                    return;
                }
                if(!PattenrnEmail.test(user_email)){
                    $("#idCheckResult").text("유효하지 않은 이메일 형식입니다.").removeClass("success").addClass("error");
                    return;
                }

                $.ajax({
                    url: "/basic/checkId",
                    type:"post",
                    data:{user_email : user_email},
                    success:function(data){
                        if(data == "duplicate"){
                            $("#idCheckResult").text("이미 사용 중인 아이디입니다.").removeClass("success").addClass("error");
                        } else{
                            $("#idCheckResult").text("사용 가능한 아이디입니다.").removeClass("error").addClass("success");
                            emailChecked = true;
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log("AJAX error:", error);
                    }
                });
            });
            
            $("#phoneNum").on("input", function() {
                var user_phone = $(this).val().trim();
                var onlyNumbers = user_phone.replace(/[^0-9]/g, '');
                if (user_phone !== onlyNumbers) {
                    $(this).val(onlyNumbers);
                    user_phone = onlyNumbers;
                }

                if (user_phone === "") {
                    $("#phoneCheckResult").text("전화번호를 입력해주세요.").removeClass("success").addClass("error");
                    phoneChecked = false;
                    return;
                } else if (!PatternPhone.test(user_phone)) {
                    $("#phoneCheckResult").text("유효하지 않은 전화번호 형식입니다.").removeClass("success").addClass("error");
                    phoneChecked = false;
                    return;
                } else {
                    $("#phoneCheckResult").text("사용 가능한 전화번호입니다.").removeClass("error").addClass("success");
                    phoneChecked = true;
                }

                $.ajax({
                    url: "/basic/checkPhoneNum",
                    type: "post",
                    data: { user_phone: user_phone },
                    success: function(data) {
                        if (data === "exists") {
                            $("#phoneCheckResult").text("같은 번호가 존재합니다. 다시 입력해 주세요.").removeClass("success").addClass("error");
                            phoneChecked = false;
                        } else {
                            $("#phoneCheckResult").text("사용 가능한 전화번호입니다.").removeClass("error").addClass("success");
                            phoneChecked = true;
                        }
                    },
                    error: function() {
                        $("#phoneCheckResult").text("전화번호 확인 중 오류가 발생했습니다.").removeClass("success").addClass("error");
                        phoneChecked = false;
                    }
                });
            });
            
            $("#password").on("input", function() {
                var password = $(this).val().trim();
                if(PatternPw.test(password)){
                    $("#passwordMessage").text("사용가능한 비밀번호입니다.").removeClass("error").addClass("success");
                } else {
                    $("#passwordMessage").text("비밀번호는 8자 이상, 대문자, 소문자, 숫자, 특수문자를 포함해야 합니다.").removeClass("success").addClass("error");
                }
            });

            $("#password, #passwordCheck").on("input", function() {
                var password = $("#password").val().trim();
                var passwordCheck = $("#passwordCheck").val().trim();
                if(password === passwordCheck){
                    $("#passwordCheckMessage").text("비밀번호가 일치합니다.").removeClass("error").addClass("success");
                } else {
                    $("#passwordCheckMessage").text("비밀번호가 일치하지 않습니다.").removeClass("success").addClass("error");
                }
            });

            $("#registerForm").on("submit", function(event) {
                event.preventDefault();

                var password = $("#password").val().trim();
                var passwordCheck = $("#passwordCheck").val().trim();

                if(!PatternPw.test(password)){
                    alert("비밀번호는 8자 이상, 대문자, 소문자, 숫자, 특수문자를 포함해야 합니다.");
                    return;
                }

                if(password !== passwordCheck){
                    alert("비밀번호가 일치하지 않습니다.");
                    return;
                }
                
                if(!emailChecked){
                    alert("이메일 중복확인 버튼을 눌러주세요.");
                    return; 
                }
                
                if(!phoneChecked) {
                    alert("올바른 번호를 입력해 주세요.");
                    return;
                }

                $.ajax({
                    url: "${pageContext.request.contextPath}/basic/join",
                    type: "post",
                    data: $("#registerForm").serialize(),
                    success: function(data) {
                        alert("회원가입이 완료되었습니다.");
                        window.location.href = "${pageContext.request.contextPath}/login";
                    },
                    error: function(xhr, status, error) {
                        alert("회원가입 중 오류가 발생했습니다. 다시 시도해주세요.");
                    }
                });
            });
        
        
        });

    </script>
</head>

<body>
<div class="container">
    <h1><b>회원가입</b></h1>
    <form id="registerForm" action="${pageContext.request.contextPath}/basic/join" method="post">
       <div class="form-group">
            <input type="email" name="user_email" id="user_email" placeholder="이메일 입력" required>
            <button id="checkIdBtn" type="button">중복 확인</button>
            <span id="idCheckResult"></span>
        </div>
        <div class="form-group">
            <input type="password" id="password" name="user_pw" placeholder="비밀번호" required>
            <span id="passwordMessage"></span>
        </div>
        <div class="form-group">
            <input type="password" id="passwordCheck" name="user_pw1" placeholder="비밀번호 확인" required>
            <span id="passwordCheckMessage"></span>
        </div>
        <div class="form-group">
            <input type="text" name="user_name" placeholder="이름" required>
        </div>
        <div class="form-group">
            <input type="text" id="phoneNum" name="user_phone" placeholder="휴대폰 번호" required>
            <span id="phoneCheckResult"></span>
        </div>
        <div class="form-group" style="text-align: center;">
            <button id="submitBtn" type="submit">회원가입</button>
        </div>
    </form>
</div>
</body>
</html>