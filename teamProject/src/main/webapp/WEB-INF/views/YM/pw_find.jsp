<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
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
    .textbox {
        margin-bottom: 20px;
    }
    .textbox label {
        display: block;
        margin-bottom: 5px;
        color: #333;
    }
    .textbox input {
        width: calc(100% - 20px);
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }
    .error {
        color: red;
        font-size: 14px;
    }
    #check {
        width: 100%;
        padding: 10px;
        background-color: #69DFC7;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 16px;
        cursor: pointer;
    }
    #check:hover {
        background-color: #5bc1ac;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>비밀번호 찾기</h1>

        <!-- Display error message if available -->
        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/YM/pw_auth.me" method="post">
            <div class="textbox">
                <label for="name">이름</label>
                <input id="name" name="name" required="" type="text" />
                <div class="error"></div>
            </div>
            <div class="textbox">
                <label for="email">이메일</label>
                <input id="email" name="email" required type="email" />
                <div class="error"></div>
            </div>
            <input type="submit" id="check" value="비밀번호 찾기">
        </form>
    </div>
</body>
</html>