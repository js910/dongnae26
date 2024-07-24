<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		$("#checkIdBtn").on("click", function(event) {
    			console.log("키키");
    			event.preventDefault(); // 폼 제출 방지
				var user_email = $("#user_email").val();
				//console.log(this);
				$.ajax({
					url: "/basic/checkId",
					type:"post",
					data:{user_email : user_email},
					success:function(data){
						if(data == "duplicate"){
							$("#idCheckResult").text("이미 사용 중인 아이디입니다.");
							return;
						} else{
							$("#idCheckResult").text("사용 가능한 아이디입니다.");
						}
					},
					error: function(xhr, status, error) {
                        console.log("AJAX error:", error);
                    }
				})
			});
    	});
    </script>
</head>

<body>
    <h1>회원가입 페이지</h1>
    <form action="${pageContext.request.contextPath}/basic/join" method="post">
       <div class="form-group">
            <input type="text" name="user_email" id="user_email" placeholder="아이디" required>
            <button id="checkIdBtn" type="button">중복 확인</button>
            <span id="idCheckResult"></span>
        </div>
        <div class="form-group">
            <input type="password" name="user_pw" placeholder="비밀번호" required>
        </div>
        <div class="form-group">
            <input type="text" name="user_name" placeholder="이름" required>
        </div>
        <div class="form-group">
            <input type="text" name="user_phone" placeholder="휴대폰 번호" required>
        </div>
        <button type="submit">회원가입</button>
    </form>
</body>
</html>
