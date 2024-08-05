<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html><html><head><meta charset="UTF-8"><title>로그인 페이지</title><style>
    @import url('https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap');

    body {
        background-color: #f5f5f5;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        font-family: 'Roboto', sans-serif;
    }

    .container2 {
        background-color: #fff;
        padding: 2rem;
        border-radius: 15px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        width: 100%;
        text-align: center;
        position: relative;
    }

    .logo {
        width: 50px;
        height: auto;
        position: absolute;
        top: 80px;
        left: 140px;
        cursor: pointer;
    }

    h1 {
        color: #5bc1ac;
        font-size: 24px;
        margin-top: 60px;
        margin-bottom: 1rem;
    }
    
    h1:hover {
        color: #333; 
    }

    form {
        display: flex;
        flex-direction: column;
        align-items: center;
        width: 100%;
    }

    form input {
        width: calc(100% - 50px); /* Reduces size by 20px total (10px on each side) */
        padding: 0.5rem;
        margin: 0.5rem 10px; /* Adds 10px margin on each side */
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 16px;
    }

    form button, .container2 button {
        width: calc(100% - 20px); /* Reduces size by 20px total (10px on each side) */
        padding: 0.75rem;
        margin: 0.5rem 10px; /* Adds 10px margin on each side */
        border: none;
        border-radius: 4px;
        background-color: #69DFC7;
        color: white;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    form button:hover, .container2 button:hover {
        background-color: #5bc1ac;
    }

    .container2 button.secondary {
        background-color: #e0e0e0;
        color: #333;
    }

    .container2 button.secondary:hover {
        background-color: #d5d5d5;
    }

    .message {
        margin: 1rem 0;
        color: green;
    }

    .error {
        margin: 1rem 0;
        color: red;
    }

    .social-login {
        display: flex;
        justify-content: center;
        gap: 10px;
        margin-top: 10px;
    }

    .social-login img {
        width: 60px;
        height: 60px;
        cursor: pointer;
    }

    @media (max-width: 400px) {
        .container2 {
            padding: 1rem;
        }

        .social-login img {
            width: 50px;
            height: 50px;
        }
    }

    .link {
        color: #1976d2;
        text-decoration: none;
        font-size: 14px;
        display: block;
        margin-top: 1rem;
    }

    #deco {
        text-decoration: none;
    }
</style></head><body>
    <div class="container2">
        <a href="${pageContext.request.contextPath}/main">
            <img src="${pageContext.request.contextPath}/resources/images/logo.png" alt="Logo" class="logo">
        </a>
        <a id="deco" href="${pageContext.request.contextPath}/main">
            <h1>동네26</h1>
        </a>

        <!-- Display success message if available -->
        <c:if test="${not empty message}">
            <p class="message">${message}</p>
        </c:if>

        <!-- Display error message if available -->
        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>

        <c:choose>
            <c:when test="${not empty loginUserID}">
                <h3>로그인 성공</h3>
                <h2>메인으로 이동 <a class="link" href="${pageContext.request.contextPath}/user">이동</a></h2>
                <c:choose>
                    <c:when test="${loginType == 'google'}">
                        <a class="link" href="${pageContext.request.contextPath}/social/logout">구글 로그아웃</a>
                    </c:when>
                    <c:when test="${loginType == 'naver'}">
                        <a class="link" href='http://localhost:8090/callback/performLogout'>네이버 로그아웃</a>
                    </c:when>
                    <c:when test="${loginType == 'basic'}">
                        <a class="link" href="${pageContext.request.contextPath}/basic/logout">로그아웃</a>
                    </c:when>
                    <c:when test="${loginType == 'kakao'}">
                        <a class="link" href='https://kauth.kakao.com/oauth/logout?client_id=57d63923a77bfe9b2640845383c5ee17&logout_redirect_uri=http://localhost:8090/kakao/logout'>
                            <img src="/resources/images/logout_btn.png" alt="카카오 로그아웃">
                        </a>
                    </c:when>
                </c:choose>
            </c:when>
            <c:otherwise>
                <form action="${pageContext.request.contextPath}/basic/login" method="post">
                    <input type="text" name="user_email" placeholder="아이디 입력" required="required">
                    <input type="password" name="user_pw" placeholder="비밀번호 입력" required="required">
                    <button type="submit">로그인</button>
                </form>
                <button class="secondary" onclick="location.href='${pageContext.request.contextPath}/basic/join'">회원가입</button>
                <button class="secondary" onclick="location.href='${pageContext.request.contextPath}/basic/searchId'">아이디 찾기</button>
                <button class="secondary" onclick="location.href='${pageContext.request.contextPath}/YM/pw_find'">비밀번호 찾기</button>
                <div class="social-login">
                    <a href="${pageContext.request.contextPath}/social/login">
                        <img src="${pageContext.request.contextPath}/resources/images/google_login_button.png" alt="Google 로그인">
                    </a>
                    <a href='http://localhost:8090/naverlogin'>
                        <img src="/resources/images/naver_login_button.png" alt="Naver 로그인">
                    </a>
		            <a href='https://kauth.kakao.com/oauth/authorize?client_id=133dcac119e004b792bceaf4bca84d93&redirect_uri=http://localhost:8090/kakao/oauth&response_type=code'>
		                <img width="230" src="/resources/images/kakao_login_button.png">
		            </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <script>
        window.onload = function() {
            var alertMessage = '${alertMessage}';
            if (alertMessage) {
                alert(alertMessage);
            }
        };
    </script></body></html>