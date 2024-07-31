<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

	 <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css">
    <style>
    	a{
        text-decoration: none;
        color: black;
        font-weight: bold;
    }
    
        .navv-link.active {
            color: #5bc1ac !important;
        }
        
        .navbar-nav .nav-item {
            margin-right: 15px; /* 원하는 간격으로 조절 */
        }
        .navbar-nav .nav-item:last-child {
            margin-right: 0; /* 마지막 항목에는 간격을 적용하지 않음 */
        }
    </style>

    <meta name="description" content="">
    <meta name="author" content="">

    

    <!-- CSS FILES -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

    <link href="/resources/css/bootstrap-icons.css" rel="stylesheet">

    <link href="/resources/css/templatemo-kind-heart-charity.css" rel="stylesheet">
    <!--

TemplateMo 581 Kind Heart Charity

https://templatemo.com/tm-581-kind-heart-charity

-->

</head>

<body>

	<header class="site-header">
        <div class="container">
            <div class="row">

                <div class="col-lg-8 col-12 d-flex flex-wrap" style="float: right;">
                    
                    <c:choose>            
				        <c:when test="${not empty loginUserID}">
				        <a href="http://localhost:8090/myPage"><small class="me-3 text-light"><i class="fa fa-user me-2"></i>마이페이지</small></a>
				            <c:choose>
				                <c:when test="${loginType == 'google'}">
				                    <a href="${pageContext.request.contextPath}/social/logout"><small class="me-3 text-light"><i class="fa fa-sign-in-alt me-2"></i>로그아웃</small></a>
				                </c:when>
				                <c:when test="${loginType == 'naver'}">
				                    <a href='http://localhost:8090/callback/performLogout'><small class="me-3 text-light"><i class="fa fa-sign-in-alt me-2"></i>로그아웃</small></a>
				                </c:when>
				                <c:when test="${loginType == 'basic'}">
				                    <a href="${pageContext.request.contextPath}/basic/logout"><small class="me-3 text-light"><i class="fa fa-sign-in-alt me-2"></i>로그아웃</small></a>
				                </c:when>
				            </c:choose>
				        </c:when>
				        <c:otherwise>
				        <a href="http://localhost:8090/basic/join"><small class="me-3 text-light"><i class="fa fa-user me-2"></i>회원가입</small></a>
				        <a href="http://localhost:8090/login"><small class="me-3 text-light"><i class="fa fa-sign-in-alt me-2"></i>로그인</small></a>
				        </c:otherwise>
				    </c:choose>
                </div>

            </div>
        </div>
    </header>

        <!-- Topbar Start -->
        <div class="container-fluid bg-primary px-5 d-none d-lg-block">
            <div class="row gx-0">
                <div class="col-lg-8 text-center text-lg-start mb-2 mb-lg-0">
                    <div class="d-inline-flex align-items-center" style="height: 45px;">
                        <!-- 
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-twitter fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-facebook-f fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-linkedin-in fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-instagram fw-normal"></i></a>
                        <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle" href=""><i class="fab fa-youtube fw-normal"></i></a>
                         -->
                    </div>
                </div>  
                <div class="col-lg-4 text-center text-lg-end">
                    <div class="d-inline-flex align-items-center" style="height: 45px;">
                        
                        <!--<a href="http://localhost:8090/login"><small class="me-3 text-light"><i class="fa fa-sign-in-alt me-2"></i>Login</small></a>-->
        <c:choose>            
	        <c:when test="${not empty loginUserID}">
	        	<a href="http://localhost:8090/user/myPage"><small class="me-3 text-light"><i class="fa fa-user me-2"></i>마이페이지</small></a>
	            <c:choose>
	                <c:when test="${loginType == 'google'}">
	                    <a href="${pageContext.request.contextPath}/social/logout"><small class="me-3 text-light"><i class="fa fa-sign-in-alt me-2"></i>로그아웃</small></a>
	                </c:when>
	                <c:when test="${loginType == 'naver'}">
	                    <a href='http://localhost:8090/callback/performLogout'><small class="me-3 text-light"><i class="fa fa-sign-in-alt me-2"></i>로그아웃</small></a>
	                </c:when>
	                <c:when test="${loginType == 'basic'}">
	                    <a href="${pageContext.request.contextPath}/basic/logout"><small class="me-3 text-light"><i class="fa fa-sign-in-alt me-2"></i>로그아웃</small></a>
	                </c:when>
	                <c:when test="${loginType == 'kakao'}">
                	 	<a href='https://kauth.kakao.com/oauth/logout?client_id=57d63923a77bfe9b2640845383c5ee17&logout_redirect_uri=http://localhost:8090/kakao/logout'>
                	 	<small class="me-3 text-light"><i class="fa fa-sign-in-alt me-2"></i>로그아웃</small></a>
                	</c:when>
	            </c:choose>
	        </c:when>
	        <c:otherwise>
	        	<a href="http://localhost:8090/basic/join"><small class="me-3 text-light"><i class="fa fa-user me-2"></i>회원가입</small></a>
	        	<a href="http://localhost:8090/login"><small class="me-3 text-light"><i class="fa fa-sign-in-alt me-2"></i>로그인</small></a>
	        </c:otherwise>
	    </c:choose>
                        
                        <div class="dropdown">
                            <a href="#" class="dropdown-toggle text-light" data-bs-toggle="dropdown"><small><i class="fa fa-home me-2"></i></small></a>
                            <div class="dropdown-menu rounded">
                                <a href="#" class="dropdown-item"><i class="fas fa-user-alt me-2"></i> My Profile</a>
                                <a href="#" class="dropdown-item"><i class="fas fa-comment-alt me-2"></i> Inbox</a>
                                <a href="#" class="dropdown-item"><i class="fas fa-bell me-2"></i> Notifications</a>
                                <a href="#" class="dropdown-item"><i class="fas fa-cog me-2"></i> Account Settings</a>
                                <a href="#" class="dropdown-item"><i class="fas fa-power-off me-2"></i> Log Out</a>
                            </div>
                        </div>
                    </div>
    <div id="sticky-wrapper" class="sticky-wrapper" style="height: 64px;">
        <nav class="navbar navbar-expand-lg bg-light shadow-lg">
            <div class="container">
                <a class="navbar-brand" href="../main">
                    <img src="/resources/images/logo.png" class="logo img-fluid" alt="Kind Heart Charity">
                    <span>
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
                            <a class="navv-link" href="http://localhost:8090/main">main</a>
                        </li>
                        <li class="nav-item">
                            <a class="navv-link" href="/policy/list">정책</a>
                        </li>
                        <li class="nav-item">
                            <a class="navv-link" href="/job/list">일자리 정보</a>
                        </li>
                        <li class="nav-item">
                            <a class="navv-link" href="/culture/list">문화·행사</a>
                        </li>
                        <li class="nav-item">
                            <a class="navv-link" href="/community/list">커뮤니티</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

     <script>
        document.addEventListener('DOMContentLoaded', function () {
            var navLinks = document.querySelectorAll('.navv-link');
            
            // 메뉴바 동적 설정
            var activeLink = localStorage.getItem('activeNavLink');
            if (activeLink) {
                var activeElement = document.querySelector('.navv-link[href="' + activeLink + '"]');
                if (activeElement) {
                    activeElement.classList.add('active');
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
    