<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
  <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 360px;
        }
        .container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #03c75a;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group input, .form-group button {
            width: calc(100% - 22px);
            padding: 10px;
            margin-left: 10px;
            margin-right: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
        }
        .form-group button {
            background-color: #03c75a;
            color: white;
            border: none;
            cursor: pointer;
        }
        .form-group button:hover {
            background-color: #02a74a;
        }
        .form-group span {
            display: block;
            margin-left: 10px;
            margin-right: 10px;
            margin-top: 5px;
            font-size: 14px;
        }
        #idCheckResult {
            font-size: 14px;
        }
        #checkIdBtn {
            background-color: #03c75a;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px;
            width: calc(100% - 22px);
            border-radius: 4px;
            font-size: 16px;
            display: block;
            margin: 10px auto 0;
        }
        #submitBtn{
         background-color: #03c75a;
            color: white;
            border: none;
            cursor: pointer;
            padding: 10px;
            width: calc(100% - 22px);
            border-radius: 4px;
            font-size: 16px;
            display: block;
            margin: 10px auto 0;
        }
    </style>

    <meta charset="UTF-8">
    <title>회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
    	
    	// 이메일 유효성 검사
    	$(document).ready(function(){
    		// 이메일 중복확인 여부
        	var emailChecked = false;
    		// 전화번호 중복 확인
    		var phoneChecked = false;
    		// 이메일 형식 정규화
        	var PattenrnEmail = /^[a-zA-Z0-9.-_]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
    		// 비밀번호 정규화
        	var PatternPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}$/;
        	
	    	$("#checkIdBtn").on("click", function(event) {
    			//console.log("키키");
    			event.preventDefault(); // 폼 제출 방지
				var user_email = $("#user_email").val().trim();
				if(user_email === ""){
					$("#idCheckResult").text("이메일을 입력해주세요.").css("color","red");
					return;
				}
				if(!PattenrnEmail.test(user_email)){
					$("#idCheckResult").text("유효하지 않은 이메일 형식입니다.").css("color","red");
					return;
				}

				$.ajax({
					url: "/basic/checkId",
					type:"post",
					data:{user_email : user_email},
					success:function(data){
						 if(data == "duplicate"){
	                            $("#idCheckResult").text("이미 사용 중인 아이디입니다.");
	                            $("#idCheckResult").css("color", "red");
	                            return;
	                        } else{
	                            $("#idCheckResult").text("사용 가능한 아이디입니다.");
	                            $("#idCheckResult").css("color", "blue");
	                            return emailChecked = true;
	                        }
						 if (user_email.trim() === "") {
			                    $("#idCheckResult").text("이메일을 입력해주세요.");
			                    $("#idCheckResult").css("color", "red");
						 }
					},
					error: function(xhr, status, error) {
                        console.log("AJAX error:", error);
                    }
				});
			});
	    	
	    	 $("#phoneNum").on("input", function() {
	                var user_phone = $(this).val().trim();
	                if (user_phone === "") {
	                    $("#phoneCheckResult").text("전화번호를 입력해주세요.").css("color", "red");
	                    phoneChecked = false;
	                    return;
	                }

	                $.ajax({
	                    url: "/basic/checkPhoneNum",
	                    type: "post",
	                    data: { user_phone: user_phone },
	                    success: function(data) {
	                        if (data === "exists") {
	                            $("#phoneCheckResult").text("같은 번호가 존재합니다. 다시 입력해 주세요.").css("color", "red");
	                            phoneChecked = false;
	                        } else {
	                            $("#phoneCheckResult").text("사용 가능한 전화번호입니다.").css("color", "blue");
	                            phoneChecked = true;
	                        }
	                    },
	                    error: function() {
	                        $("#phoneCheckResult").text("전화번호 확인 중 오류가 발생했습니다.").css("color", "red");
	                        phoneChecked = false;
	                    }
	                });
	            });
	    	
	    	$("#password").on("input", function() {
                var password = $(this).val().trim();
                if(PatternPw.test(password)){
                    $("#passwordMessage").text("비밀번호가 유효합니다.").css("color", "blue");
                } else {
                    $("#passwordMessage").text("비밀번호는 8자 이상, 대문자, 소문자, 숫자, 특수문자를 포함해야 합니다.").css("color", "red");
                }
            });

            // 비밀번호 일치 검사
            $("#password, #passwordCheck").on("input", function() {
                var password = $("#password").val().trim();
                var passwordCheck = $("#passwordCheck").val().trim();
                if(password === passwordCheck){
                    $("#passwordCheckMessage").text("비밀번호가 일치합니다.").css("color", "blue");
                } else {
                    $("#passwordCheckMessage").text("비밀번호가 일치하지 않습니다.").css("color", "red");
                }
            });

            // 폼 제출 시 최종 유효성 검사
            $("#registerForm").on("submit", function(event) {
                var password = $("#password").val().trim();
                var passwordCheck = $("#passwordCheck").val().trim();
             

                if(!PatternPw.test(password)){
                    alert("비밀번호는 8자 이상, 대문자, 소문자, 숫자, 특수문자를 포함해야 합니다.");
                    event.preventDefault();
                    return;
                }

                if(password !== passwordCheck){
                    alert("비밀번호가 일치하지 않습니다.");
                    event.preventDefault();
                    return;
                }
                
                if(!emailChecked){
                	alert("이메일 중복확인 버튼을 눌러주세요.");
                	event.preventDefault();
                	return; 
                }
                
                if(!phoneChecked) {
                    alert("올바른 번호를 입력해 주세요.");
                    event.preventDefault();
                    return;
                }
            });
    	});
    	
    	
    	// 핸드폰 번호 숫자만 입력
    	function onlyNumber() {
    		  if((event.keyCode >= 48 && event.keyCode < 57) 
    		   || event.keyCode == 8 // backspace
    		   || event.keyCode == 37 || event.keyCode == 39 // 방향키
    		   || event.keyCode == 46 // delete키
    		   || event.keyCode == 39){
    		  }else{
    			  event.returnValue=false;
    		  }
    		}

    </script>
</head>

<body>
<div class="container">
    <h1>회원가입 페이지</h1>
    <form id="registerForm" action="${pageContext.request.contextPath}/basic/register" method="post">
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
            <span class="successPwChk"></span>
        </div>
        <div class="form-group">
            <input type="text" name="user_name" placeholder="이름" required>
        </div>
        <div class="form-group">
            <input type="text" id="phoneNum" onkeydown="onlyNumber();" name="user_phone" placeholder="휴대폰 번호" required>
            <span id="phoneCheckResult"></span>
        </div>
        <button id="submitBtn" type="submit">회원가입</button>
        <span id=""></span>
    </form>
    </div>
 
</body>
</html>
