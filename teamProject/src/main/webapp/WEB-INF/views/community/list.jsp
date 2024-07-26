<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<%@include file="../includes/header.jsp"%>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <a href="../main" class="nav-item nav-link">Home</a>
                        <a href="/policy/list" class="nav-item nav-link">정책</a>
                        <a href="/job/list" class="nav-item nav-link">일자리 정보</a>
                        <a href="/culture/list" class="nav-item nav-link">문화·행사</a>
                        <a href="/community/list" class="nav-item nav-link active">커뮤니티</a>
                        <!-- 
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu m-0">
                                <a href="destination.html" class="dropdown-item">Destination</a>
                                <a href="tour.html" class="dropdown-item">Explore Tour</a>
                                <a href="booking.html" class="dropdown-item">Travel Booking</a>
                                <a href="gallery.html" class="dropdown-item">Our Gallery</a>
                                <a href="guides.html" class="dropdown-item">Travel Guides</a>
                                <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                                <a href="404.html" class="dropdown-item">404 Page</a>
                            </div>
                        </div>
                         -->
                        <!-- <a href="contact.html" class="nav-item nav-link">Contact</a> -->
                    </div>
                    <!-- <a href="" class="btn btn-primary rounded-pill py-2 px-4 ms-lg-4">Book Now</a> -->
                </div>
            </nav>
        <!-- Navbar & Hero End -->
        
        <!-- Header Start -->
        <div class="container-fluid bg-breadcrumb">
            <div class="container text-center py-5" style="max-width: 900px;">
                <h3 class="text-white display-3 mb-4">커뮤니티 게시판</h3>
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="../main">Home</a></li>
                    <li class="breadcrumb-item"><a href="/community/list">커뮤니티 게시판</a></li>
                    <li class="breadcrumb-item active text-white">About</li>
                </ol>    
            </div>
        </div>
        <!-- Header End -->

<head>
    <title>게시판 목록</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        // 초기 페이지 로딩 시 데이터 표시
        loadBoardList();
        
        // 검색 폼 제출
        $("#searchForm").submit(function(event) {
            event.preventDefault(); // 폼 제출 방지
            $("#searchForm input[name='pageNum']").val(1); // 검색 시 페이지 번호 초기화
            loadBoardList();
        });

        // Show 변경 시 데이터 갱신
        $("#select1").change(function() {
            $("#searchForm input[name='amount']").val($(this).val()); // 선택한 amount 값을 폼에 설정
            $("#searchForm input[name='pageNum']").val(1); // 페이지 번호 초기화
            loadBoardList();
        });
    });

    function loadBoardList() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/community/getList",
            data: $("#searchForm").serialize(), // 폼 데이터 직렬화
            dataType: "json",
            success: function(response) {
                var boardList = response.boardlist;
                var pageMaker = response.pageMaker;

                // 게시물 목록 업데이트
                var boardListHtml = "";
                $.each(boardList, function(index, board) {
                    boardListHtml += "<tr>";
                    boardListHtml += "<td>" + board.community_bno + "</td>";
                    boardListHtml += "<td>" + board.region + "</td>";
                    boardListHtml += "<td><a href='${pageContext.request.contextPath}/community/get?community_bno=" + board.community_bno + "'>" + board.community_title + "</a></td>";
                    boardListHtml += "<td>" + board.community_content + "</td>";
                    boardListHtml += "<td>" + board.writer + "</td>";
                    boardListHtml += "<td>" + board.community_viewcnt + "</td>";
                    boardListHtml += "<td>" + board.formattedRegdate + "</td>";
                    boardListHtml += "</tr>";
                });
                $("#boardList").html(boardListHtml);

                // 페이지네이션 업데이트
                var paginationHtml = "";
                if (pageMaker.prev) {
                    paginationHtml += "<a href='#' onclick='loadPage(" + (pageMaker.startPage - 1) + ")'>이전</a> ";
                }
                for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
                    paginationHtml += "<a href='#' onclick='loadPage(" + i + ")'>" + i + "</a> ";
                }
                if (pageMaker.next) {
                    paginationHtml += "<a href='#' onclick='loadPage(" + (pageMaker.endPage + 1) + ")'>다음</a>";
                }
                $("#pagination").html(paginationHtml);
            }
        });
    }

    function loadPage(pageNum) {
        $("#searchForm input[name='pageNum']").val(pageNum);
        loadBoardList();
    }
   </script>
</head>
<body>
   <div>
    <form id="searchForm" action="${pageContext.request.contextPath}/community/getList" method="post">
        <label for="type">검색 유형:</label>
        <select id="type" name="type">
            <option value="all">전체</option>
            <option value="community_title">제목</option>
            <option value="community_content">내용</option>
            <option value="region">거주지</option>
            <option value="writer">작성자</option>
        </select>
        <input type="text" name="keyword" placeholder="검색어 입력">
        <input type="hidden" name="amount" value="10"> <!-- 초기값 10으로 설정 -->
        <input type="hidden" name="pageNum" value="1"> <!-- 초기값 1로 설정 -->
        <button type="submit">검색</button>
    </form>
</div>

<div>
    <label>Show 
        <select id="select1" name="select1">
            <option value="10">10</option>
            <option value="15">15</option>
            <option value="20">20</option>
        </select>
    </label>
</div>

<div id="content">
    <table id="community_board">
        <thead>
            <tr>
                <th>글번호</th>
                <th>구</th>
                <th>제목</th>
                <th>내용</th>
                <th>작성자</th>
                <th>조회수</th>
                <th>작성일</th>
            </tr>
        </thead>
        <tbody id="boardList">
            <!-- 게시물 목록을 여기에 렌더링 -->
            
        </tbody>
    </table>

    <div class="pagination" id="pagination">
        <!-- 페이지네이션 링크를 여기에 렌더링 -->
    </div>
</div>
<a href="${pageContext.request.contextPath}/community/register" class="write-link">글 작성</a>
</body>
 <%@include file="../includes/footer.jsp"%>
</html>