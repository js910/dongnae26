<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        width: 100%;
    }
    h1 {
        text-align: center;
        color: #333;
    }
    .form-group {
        margin-bottom: 20px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
        color: #333;
    }
    .form-group input {
        width: calc(100% - 20px);
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }
    #searchId, #login {
        width: 100%;
        padding: 10px;
        background-color: #69DFC7;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 16px;
        cursor: pointer;
        margin-top: 10px;
    }
    #searchId:hover, #login:hover {
        background-color: #5bc1ac;
    }
    #searchIdResult {
        display: block;
        margin-top: 20px;
        font-size: 16px;
        color: red;
        text-align: center;
    }
</style>
<script type="text/javascript">
    //핸드폰 번호 숫자만 입력
    function onlyNumber() {
        if ((event.keyCode >= 48 && event.keyCode < 57) 
            || event.keyCode == 8 // backspace
            || event.keyCode == 37 || event.keyCode == 39 // 방향키
            || event.keyCode == 46 // delete키
            || event.keyCode == 39) {
        } else {
            event.returnValue = false;
        }
    }

    $(document).ready(function() {
        $("#user_phone").on("keydown", onlyNumber);
        
        $("#searchId").on("click", function(event) {
            event.preventDefault();
            var user_name = $("#user_name").val();
            var user_phone = $("#user_phone").val();

            $.ajax({
                url: "${pageContext.request.contextPath}/basic/searchId",
                type: "post",
                data: { user_name: user_name, user_phone: user_phone },
                success: function(data) {
                    if (data === "not found") {
                        $("#searchIdResult").text("일치하는 아이디가 없습니다.");
                    } else {
                        $("#searchIdResult").text("회원님의 아이디는 " + data + "입니다.");
                    }
                },
                error: function(xhr, status, error) {
                    console.log("AJAX error:", error);
                }
            });
        });
    });
</script>
</head>
<body>
    <div class="container">
        <h1>아이디 찾기</h1>
        <form id="searchIdForm" action="${pageContext.request.contextPath}/basic/searchId" method="post">
            <div class="form-group">
                <label for="user_name">이름</label>
                <input type="text" id="user_name" name="user_name" placeholder="이름" required>
            </div>
            <div class="form-group">
                <label for="user_phone">휴대폰 번호</label>
                <input type="text" id="user_phone" onkeydown="onlyNumber();" name="user_phone" placeholder="휴대폰 번호" required>
            </div>
            <button id="searchId">아이디 찾기</button>
            <span id="searchIdResult"></span>
        </form>

        <!-- Login page navigation button -->
        <form action="${pageContext.request.contextPath}/login" method="get">
            <button id="login">로그인으로 이동</button>
        </form>
    </div>
</body>
</html>