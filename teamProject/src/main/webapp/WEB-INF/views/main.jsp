<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<!-- Header -->
	<%@include file="includes/header.jsp"%>
	<title> E1I4 - 동네26 </title>
    
    <main>

        <section class="hero-section hero-section-full-height">
            <div class="container-fluid">
                <div class="row">

                    <div class="col-lg-12 col-12 p-0">
                        <div id="hero-slide" class="carousel carousel-fade slide" data-bs-ride="carousel">
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <img src=#
                                        class="carousel-image img-fluid" alt="...">

                                    <div class="carousel-caption d-flex flex-column justify-content-end">
                                        <h1>be a Kind Heart</h1>

                                        <p>Professional charity theme based on Bootstrap 5.2.2</p>
                                    </div>
                                </div>

                                <div class="carousel-item">
                                    <img src=#
                                        class="carousel-image img-fluid" alt="...">

                                    <div class="carousel-caption d-flex flex-column justify-content-end">
                                        <h1>Non-profit</h1>

                                        <p>You can support us to grow more</p>
                                    </div>
                                </div>

                                <div class="carousel-item">
                                    <img src=#
                                        class="carousel-image img-fluid" alt="...">

                                    <div class="carousel-caption d-flex flex-column justify-content-end">
                                        <h1>Humanity</h1>

                                        <p>Please tell your friends about our website</p>
                                    </div>
                                </div>
                            </div>

                            <button class="carousel-control-prev" type="button" data-bs-target="#hero-slide"
                                data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>

                            <button class="carousel-control-next" type="button" data-bs-target="#hero-slide"
                                data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <section class="section-padding section-bg" id="section_2">
            <div class="container">
                <div class="row">

                    <div class="col-lg-6 col-12 mb-5 mb-lg-0">
                        <div class="custom-text-box" style="height: 96%;">
                            <h2 class="mb-2">사이트 소개</h2>

                            <h5 class="mb-3">Kind Heart Charity, Non-Profit Organization</h5>

                            <p class="mb-0">This is a Bootstrap 5.2.2 CSS template for charity organization websites.
                                You can feel free to use it. Please tell your friends about TemplateMo website. Thank
                                you.</p>
                            <p class="mb-0">This is a Bootstrap 5.2.2 CSS template for charity organization websites.
                                You can feel free to use it. Please tell your friends about TemplateMo website. Thank
                                you.</p>
                            <p class="mb-0">This is a Bootstrap 5.2.2 CSS template for charity organization websites.
                                You can feel free to use it. Please tell your friends about TemplateMo website. Thank
                                you.</p>
                        </div>
                    </div>

                    <div class="col-lg-6 col-12 mb-5 mb-lg-0">
                        <div class="custom-text-box">
                            <h2 class="mb-2">동네 26</h2>

                            <h5 class="mb-3">Kind Heart Charity, Non-Profit Organization</h5>

                            <p class="mb-0">This is a Bootstrap 5.2.2 CSS template for charity organization websites.
                                You can feel free to use it. Please tell your friends about TemplateMo website. Thank
                                you.</p>
                        </div>
                        
                        <div class="custom-text-box">
                            <h2 class="mb-2">Thanks to</h2>

                            <p class="mb-0">This is a Bootstrap 5.2.2 CSS template for charity organization websites.
                                You can feel free to use it. Please tell your friends about TemplateMo website. Thank
                                you.</p>
                        </div>

                        
                    </div>
                </div>
            </div>
        </section>
        
        <section class="section-padding">
            <div class="container">
                <div class="row">

                    <div class="col-lg-10 col-12 text-center mx-auto">
                        <h2 class="mb-5">연관 사이트</h2>
                    </div>

                    <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-0">
                        <div class="featured-block d-flex justify-content-center align-items-center">
                            <a href="donate.html" class="d-block">
                                <img src="#" class="featured-block-image img-fluid" alt="">

                                <p class="featured-block-text"><strong>정부24</strong></p>
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-0 mb-md-4">
                        <div class="featured-block d-flex justify-content-center align-items-center">
                            <a href="donate.html" class="d-block">
                                <img src="#" class="featured-block-image img-fluid" alt="">

                                <p class="featured-block-text"><strong>국민신문고</strong></p>
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-0 mb-md-4">
                        <div class="featured-block d-flex justify-content-center align-items-center">
                            <a href="donate.html" class="d-block">
                                <img src="#" class="featured-block-image img-fluid" alt="">

                                <p class="featured-block-text"><strong>힘겨울때129</strong></p>
                            </a>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-6 col-12 mb-4 mb-lg-0">
                        <div class="featured-block d-flex justify-content-center align-items-center">
                            <a href=# class="d-block">
                                <img src="#" class="featured-block-image img-fluid" alt="">

                                <p class="featured-block-text"><strong>다산콜센터</strong></p>
                            </a>
                        </div>
                    </div>

                </div>
            </div>
        </section>
    </main>

	<script>
	document.addEventListener("DOMContentLoaded", function() {
	    const navLinks = document.querySelectorAll(".nav-link");
	
	    navLinks.forEach(link => {
	        link.addEventListener("click", function() {
	            navLinks.forEach(nav => nav.classList.remove("active"));
	            this.classList.add("active");
	        });
	    });
	
	    // 현재 페이지의 URL과 일치하는 메뉴 항목에 active 클래스 추가
	    const currentPath = window.location.pathname;
	    navLinks.forEach(link => {
	        if (link.getAttribute("href") === currentPath) {
	            link.classList.add("active");
	        }
	    });
	});
	</script>
    <!-- Footer -->
    <%@include file="includes/footer.jsp"%>