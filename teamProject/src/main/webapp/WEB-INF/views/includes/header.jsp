<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        a {
            text-decoration: none;
            color: black;
            font-weight: bold;
        }

        .navv-link.active {
            color: #5bc1ac !important;
        }

        .navbar-nav .nav-item {
            margin-right: 15px;
        }

        .navbar-nav .nav-item:last-child {
            margin-right: 0;
        }
    </style>

    <meta name="description" content="">
    <meta name="author" content="">
    
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">

    <!-- CSS FILES -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">
    <link href="/resources/css/bootstrap-icons.css" rel="stylesheet">
    <link href="/resources/css/templatemo-kind-heart-charity.css" rel="stylesheet">
    <!-- TemplateMo 581 Kind Heart Charity https://templatemo.com/tm-581-kind-heart-charity -->

</head>

<body>

    <header class="site-header">
        <div class="container">
            <div class="row">

                <div class="col-lg-8 col-12 ms-auto d-lg-block d-none" style="text-align: right;">
				    <c:choose>
				        <c:when test="${not empty loginUserID}">
				            <a href="http://localhost:8090/user/myPage">
				                <small class="me-3 text-light"><i class="bi bi-person me-2"></i>마이페이지</small>
				            </a>
				            <a href="http://localhost:8090/bookmark">
				                <small class="me-3 text-light"><i class="bi bi-bookmark me-2"></i>북마크</small>
				            </a>
				            <c:choose>
				                <c:when test="${loginType == 'google'}">
				                    <a href="${pageContext.request.contextPath}/social/logout">
				                        <small class="me-3 text-light"><i class="bi bi-box-arrow-right me-2"></i>로그아웃</small>
				                    </a>
				                </c:when>
				                <c:when test="${loginType == 'naver'}">
				                    <a href='http://localhost:8090/callback/performLogout'>
				                        <small class="me-3 text-light"><i class="bi bi-box-arrow-right me-2"></i>로그아웃</small>
				                    </a>
				                </c:when>
				                <c:when test="${loginType == 'basic'}">
				                    <a href="${pageContext.request.contextPath}/basic/logout">
				                        <small class="me-3 text-light"><i class="bi bi-box-arrow-right me-2"></i>로그아웃</small>
				                    </a>
				                </c:when>
				            </c:choose>
				        </c:when>
				        <c:otherwise>
				            <a href="http://localhost:8090/basic/join">
				                <small class="me-3 text-light"><i class="bi bi-person-plus me-2"></i>회원가입</small>
				            </a>
				            <a href="http://localhost:8090/login">
				                <small class="me-3 text-light"><i class="bi bi-box-arrow-in-right me-2"></i>로그인</small>
				            </a>
				        </c:otherwise>
				    </c:choose>
				</div>

            </div>
        </div>
    </header>

    <div id="sticky-wrapper" class="sticky-wrapper" style="height: 150px;">
        <nav class="navbar navbar-expand-lg bg-light shadow-lg">
            <div class="container">

                <a class="navbar-brand" href="/main">
                    <img src="/resources/images/logo.png" class="logo img-fluid" alt="Kind Heart Charity" style="width:60px; margin:5px;">
                    <span style="margin-left: 15px; font-size: 1.8rem;">
                        동네26
                        <small>- made by E1I4</small>
                    </span>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                    	<li class="nav-item">
                            <a class="navv-link" href="http://localhost:8090/main" style="font-size: 1.2rem;">main</a>
                        </li>
                        <li class="nav-item">
                            <a class="navv-link" href="/policy/list" style="font-size: 1.1rem;">정책</a>
                        </li>
                        <li class="nav-item">
                            <a class="navv-link" href="/job/list" style="font-size: 1.1rem;">일자리 정보</a>
                        </li>
                        <li class="nav-item">
                            <a class="navv-link" href="/culture/list" style="font-size: 1.1rem;">문화·행사</a>
                        </li>
                        <li class="nav-item">
                            <a class="navv-link" href="/community/list" style="font-size: 1.1rem;">커뮤니티</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var navLinks = document.querySelectorAll('.navv-link');
            var currentUrl = window.location.href;

            // 메뉴바 동적 설정
            var activeLink = localStorage.getItem('activeNavLink');
            var activeElement = document.querySelector('.navv-link[href="' + currentUrl + '"]');
            
            if (activeElement) {
                activeElement.classList.add('active');
                localStorage.setItem('activeNavLink', currentUrl);
            } else if (activeLink) {
                var storedActiveElement = document.querySelector('.navv-link[href="' + activeLink + '"]');
                if (storedActiveElement) {
                    storedActiveElement.classList.add('active');
                }
            } else {
                // 기본적으로 main에 색칠이 되어있도록 설정
                var mainLink = document.querySelector('.navv-link[href="http://localhost:8090/main"]');
                if (mainLink) {
                    mainLink.classList.add('active');
                    localStorage.setItem('activeNavLink', mainLink.getAttribute('href'));
                }
            }

            navLinks.forEach(function (link) {
                link.addEventListener('click', function () {
                    navLinks.forEach(function (link) {
                        link.classList.remove('active');
                    });
                    this.classList.add('active');
                    // 선택된 메뉴 색 유지
                    localStorage.setItem('activeNavLink', this.getAttribute('href'));
                });
            });

            
        });
    </script>
</body>

</html>