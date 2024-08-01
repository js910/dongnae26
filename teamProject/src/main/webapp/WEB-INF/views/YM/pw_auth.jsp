<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 인증</title>
<style>
    .error { color: red; }
    .textbox { margin-bottom: 15px; }
</style>
</head>
<body>
    <h1>비밀번호 인증</h1>

    <!-- Display messages -->
    <c:if test="${not empty message}">
        <p style="color: green;">${message}</p>
    </c:if>
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>

    <form action="${pageContext.request.contextPath}/YM/pw_set.me" method="post">
        <input type="hidden" name="num" value="${sessionScope.num}">
        <div class="textbox">
            <input type="text" name="emailCheck" placeholder="인증번호를 입력하세요" required />
            <label>인증번호</label>
            <div class="error"></div>
        </div><br><br>
        <input type="submit" id="check" value="확인">
    </form>
</body>
</html>