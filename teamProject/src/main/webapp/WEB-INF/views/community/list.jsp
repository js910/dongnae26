<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    <meta charset="UTF-8">
    <title>게시판 목록</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style type="text/css">
body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.container {
    width: 80%;
    margin: 0 auto;
    padding: 20px;
    background: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

/* 검색 폼 및 지역 선택 */
#searchForm, #areaSelect, #select1 {
    margin-bottom: 20px;
}

#searchForm label, #searchForm select, #searchForm input {
    font-size: 16px;
    margin-right: 10px;
}

#searchForm input[type="text"], #searchForm select {
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
}

#searchForm button {
    background: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 10px 15px;
    cursor: pointer;
    font-size: 16px;
    transition: background 0.3s ease;
}

#searchForm button:hover {
    background: #0056b3;
}

/* 테이블 스타일 */
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

table th, table td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: left;
}

table th {
    background-color: #007bff;
    color: #fff;
}

table tr:nth-child(even) {
    background-color: #f2f2f2;
}

table tr:hover {
    background-color: #e9ecef;
}

/* 페이지네이션 */
.pagination {
    text-align: center;
    margin: 20px 0;
}

.pagination a {
    background: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 5px 10px;
    text-decoration: none;
    font-size: 16px;
    margin: 0 5px;
    cursor: pointer;
    transition: background 0.3s ease;
}

.pagination a:hover {
    background: #0056b3;
}

/* 글 작성 버튼 */
.write-link {
    display: inline-block;
    background: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 10px 15px;
    text-decoration: none;
    font-size: 16px;
    transition: background 0.3s ease;
}

.write-link:hover {
    background: #0056b3;
}
</style>
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
            <input type="text" name="keyword" value="${cri.keyword}" placeholder="검색어 입력">
            <input type="hidden" name="pageNum" value="${cri.pageNum}">
            <input type="hidden" name="amount" value="${cri.amount}">
            <input type="hidden" name="area" id="selectedArea" value="${cri.area}"> <!-- 선택된 구를 전송하기 위한 hidden 필드 -->
            <button type="submit">검색</button>
        </form>
    </div>
    <label for="area">지역:</label>
       <select id="areaSelect" name="area">
        <option value="" ${selectedArea == '' ? 'selected' : ''}>지역 전체</option>
        <option value="강남구" ${selectedArea == '강남구' ? 'selected' : ''}>강남구</option>
        <option value="강동구" ${selectedArea == '강동구' ? 'selected' : ''}>강동구</option>
        <option value="강북구" ${selectedArea == '강북구' ? 'selected' : ''}>강북구</option>
        <option value="강서구" ${selectedArea == '강서구' ? 'selected' : ''}>강서구</option>
        <option value="관악구" ${selectedArea == '관악구' ? 'selected' : ''}>관악구</option>
        <option value="광진구" ${selectedArea == '광진구' ? 'selected' : ''}>광진구</option>
        <option value="구로구" ${selectedArea == '구로구' ? 'selected' : ''}>구로구</option>
        <option value="금천구" ${selectedArea == '금천구' ? 'selected' : ''}>금천구</option>
        <option value="노원구" ${selectedArea == '노원구' ? 'selected' : ''}>노원구</option>
        <option value="도봉구" ${selectedArea == '도봉구' ? 'selected' : ''}>도봉구</option>
        <option value="동대문구" ${selectedArea == '동대문구' ? 'selected' : ''}>동대문구</option>
        <option value="동작구" ${selectedArea == '동작구' ? 'selected' : ''}>동작구</option>
        <option value="마포구" ${selectedArea == '마포구' ? 'selected' : ''}>마포구</option>
        <option value="서대문구" ${selectedArea == '서대문구' ? 'selected' : ''}>서대문구</option>
        <option value="서초구" ${selectedArea == '서초구' ? 'selected' : ''}>서초구</option>
        <option value="성북구" ${selectedArea == '성북구' ? 'selected' : ''}>성북구</option>
        <option value="송파구" ${selectedArea == '송파구' ? 'selected' : ''}>송파구</option>
        <option value="양천구" ${selectedArea == '양천구' ? 'selected' : ''}>양천구</option>
        <option value="영등포구" ${selectedArea == '영등포구' ? 'selected' : ''}>영등포구</option>
        <option value="용산구" ${selectedArea == '용산구' ? 'selected' : ''}>용산구</option>
        <option value="은평구" ${selectedArea == '은평구' ? 'selected' : ''}>은평구</option>
        <option value="종로구" ${selectedArea == '종로구' ? 'selected' : ''}>종로구</option>
        <option value="중구" ${selectedArea == '중구' ? 'selected' : ''}>중구</option>
        <option value="중랑구" ${selectedArea == '중랑구' ? 'selected' : ''}>중랑구</option>
    </select>
    </select>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        loadBoardList();

        $("#searchForm").submit(function(event) {
            event.preventDefault();
            $("#searchForm input[name='pageNum']").val(1);
            loadBoardList();
        });

        $("#select1").change(function() {
            $("#searchForm input[name='amount']").val($(this).val());
            $("#searchForm input[name='pageNum']").val(1);
            loadBoardList();
        });

        $("#areaSelect").change(function() {
            $("#searchForm input[name='area']").val($(this).val());
            $("#searchForm input[name='pageNum']").val(1);
            loadBoardList();
        });
    });

    function loadBoardList() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/community/getList",
            data: $("#searchForm").serialize(),
            dataType: "json",
            success: function(response) {
                var boardList = response.boardlist;
                var pageMaker = response.pageMaker;
                var pageNum = $("#searchForm").find("input[name='pageNum']").val();
                var amount = $("#searchForm").find("input[name='amount']").val();
                var keyword = $("#searchForm").find("input[name='keyword']").val();
                var area = $("#searchForm").find("input[name='area']").val();

                var boardListHtml = "";
                $.each(boardList, function(index, board) {
                    boardListHtml += "<tr>";
                    boardListHtml += "<td>" + board.community_bno + "</td>";
                    boardListHtml += "<td>" + board.region + "</td>";
                    boardListHtml += "<td><a href='" + "${pageContext.request.contextPath}/community/get?community_bno=" + board.community_bno + "&pageNum=" + pageNum + "&amount=" + amount + "&keyword=" + keyword + "&area=" + area + "'>" + board.community_title + "</a></td>";
                    boardListHtml += "<td>" + board.community_content + "</td>";
                    boardListHtml += "<td>" + board.writer + "</td>";
                    boardListHtml += "<td>" + board.community_viewcnt + "</td>";
                    boardListHtml += "<td>" + board.formattedRegdate + "</td>";
                    boardListHtml += "</tr>";
                });
                if (boardList.length === 0) {
                    boardListHtml = "<tr><td colspan='7' class='text-center'>검색 결과가 없습니다.</td></tr>";
                } else {
                    $.each(boardList, function(index, board) {
                        boardListHtml += "<tr>";
                        boardListHtml += "<td>" + board.community_bno + "</td>";
                        boardListHtml += "<td>" + board.region + "</td>";
                        boardListHtml += "<td><a href='" + "${pageContext.request.contextPath}/community/get?community_bno=" + board.community_bno + "&pageNum=" + pageNum + "&amount=" + amount + "&keyword=" + keyword + "&area=" + area + "'>" + board.community_title + "</a></td>";
                        boardListHtml += "<td>" + board.community_content + "</td>";
                        boardListHtml += "<td>" + board.writer + "</td>";
                        boardListHtml += "<td>" + board.community_viewcnt + "</td>";
                        boardListHtml += "<td>" + board.formattedRegdate + "</td>";
                        boardListHtml += "</tr>";
                    });
                }
                $("#boardList").html(boardListHtml);

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
            },
            error: function() {
                console.log("error");
            }
        });
    }

    function loadPage(pageNum) {
        $("#searchForm input[name='pageNum']").val(pageNum);
        loadBoardList();
    }
    </script>
    <%@include file="../includes/footer.jsp"%>
</body>
</html>