<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
<style>
    .error { color: red; }
    .textbox { margin-bottom: 15px; }
</style>
</head>
<body>
    <h1>비밀번호 찾기</h1>

    <!-- Display error message if available -->
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>

    <form class="content" action="${pageContext.request.contextPath}/YM/pw_auth.me" method="post">
        <div class="textbox">
            <input id="name" name="name" required="" type="text" />
            <label for="name">이름</label>
            <div class="error"></div>
        </div>
        <div class="textbox">
            <input id="email" name="email" required="/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)?$/i" type="email" />
            <label for="email">이메일</label>
            <div class="error"></div>
        </div><br><br>
        <input type="submit" id="check" value="비밀번호찾기">
    </form>
</body>
</html>