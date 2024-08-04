<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 인증</title>
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
    .error {
        color: red;
        font-size: 14px;
    }
    #check {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 16px;
        cursor: pointer;
    }
    #check:hover {
        background-color: #0056b3;
    }
    .message {
        color: green;
        font-size: 14px;
        text-align: center;
    }
</style>
</head>
<body>
    <div class="container">
        <h1>비밀번호 인증</h1>

        <!-- Display messages -->
        <c:if test="${not empty message}">
            <p class="message">${message}</p>
        </c:if>
        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/YM/pw_set.me" method="post">
            <input type="hidden" name="num" value="${sessionScope.num}">
            <div class="form-group">
                <label for="emailCheck">인증번호</label>
                <input type="text" id="emailCheck" name="emailCheck" placeholder="인증번호를 입력하세요" required />
            </div>
            <input type="submit" id="check" value="확인">
        </form>
    </div>
</body>
</html>