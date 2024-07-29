<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
</head>
<body>
	<h1>로그인 페이지</h1>

	 <c:choose>
        <c:when test="${not empty loginUserID}">
            <h3>로그인 성공</h3>
            <h2>메인으로 이동<a href="${pageContext.request.contextPath}/test">이동</a></h2>
            <c:choose>
                <c:when test="${loginType == 'google'}">
                    <a href="${pageContext.request.contextPath}/social/logout">구글 로그아웃</a>
                </c:when>
                <c:when test="${loginType == 'naver'}">
                    <a href='http://localhost:8090/callback/performLogout'>네이버 로그아웃</a>
                </c:when>
                <c:when test="${loginType == 'basic'}">
                    <a href="${pageContext.request.contextPath}/basic/logout">로그아웃</a>
                </c:when>
                <c:when test="${loginType == 'kakao'}">
                	 <a href='https://kauth.kakao.com/oauth/logout?client_id=57d63923a77bfe9b2640845383c5ee17&logout_redirect_uri=http://localhost:8090/kakao/logout'>
                	<img src="/resources/images/logout_btn.png">
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
            <button onclick="location.href='${pageContext.request.contextPath}/basic/join'">회원가입</button>
            <button onclick="location.href='${pageContext.request.contextPath}/basic/searchId'">아이디 찾기</button>
            <button onclick="location.href='${pageContext.request.contextPath}/YM/pw_find'">비밀번호 찾기</button>
            <div id="google_id_login">
                <a href="${pageContext.request.contextPath}/social/login">
                    <img width="230" src="${pageContext.request.contextPath}/resources/images/goole_login_btn.png"/>
                </a>
            </div>
            <div id="naver_id_login">
            <a href='http://localhost:8090/naverlogin'>
                <img width="230" src="/resources/images/naver_login_btn.png">
            </a>
            </div>
            <div id="kakao_id_login">
            <a href='https://kauth.kakao.com/oauth/authorize?client_id=57d63923a77bfe9b2640845383c5ee17&redirect_uri=http://localhost:8090/kakao/oauth&response_type=code'>
                <img width="230" src="/resources/images/kakao_login_btn.png">
            </a>
            </div>
             
        </c:otherwise>
    </c:choose>
    
      <script>
        // 비회원 글작성 클릭시
        window.onload = function() {
            var alertMessage = '${alertMessage}';
            if (alertMessage) {
                alert(alertMessage);
            }
        };
    </script>
</body>
</html>