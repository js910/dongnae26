<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<%@include file="../includes/header.jsp"%>
        
        <!-- Header Start -->
        <div class="container-fluid bg-breadcrumb">
            <div class="container text-center py-5" style="max-width: 900px;">
                <h3 class="text-white display-3 mb-4">커뮤니티 게시판</h3>
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="../main">Home</a></li>
                    <li class="breadcrumb-item"><a href="/community/list">커뮤니티 게시판</a></li>
                </ol>    
            </div>
        </div>
        <!-- Header End -->

<head>
	<style>
		/* General Page Layout */
		@media (min-width: 1000px) {
		  #page-wrapper {
		    margin: 0 150px 0 150px;
		    background-color: white;
		  }
		}
		
		#page-wrapper {
		    padding: 50px;
		    background-color: white;
		}
		
		body {
	        background-color: #f5f5f5; /* Outer div background color */
	    }
<<<<<<< HEAD
	    
	    .pagination-wrapper {
	    	display: flex;
	    	flex-direction: column;
	    }
	    
	    .pagination {
	    	justify-content: center;
	    }
=======
>>>>>>> refs/remotes/origin/jyn
	</style>
    
    <title>동네26 - 커뮤니티 게시판</title>
</head>
<body>
    <div id="page-wrapper">
    	<div>
	        <form id="searchForm" action="${pageContext.request.contextPath}/community/getList" method="post">
	            <label for="type">검색 유형:</label>
	            <select class="form-select form-control" id="type" name="type">
	                <option value="all" ${cri.type == 'all' ? 'selected' : ''}>전체</option>
	                <option value="community_title" ${cri.type == 'community_title' ? 'selected' : ''}>제목</option>
	                <option value="community_content" ${cri.type == 'community_content' ? 'selected' : ''}>내용</option>
	                <option value="region" ${cri.type == 'region' ? 'selected' : ''}>거주지</option>
	                <option value="writer" ${cri.type == 'writer' ? 'selected' : ''}>작성자</option>
	            </select>
	            <input type="text" name="keyword" value="${cri.keyword}" placeholder="검색어 입력">
	            <input type="hidden" name="pageNum" value="${cri.pageNum}">
	            <input type="hidden" name="amount" value="${cri.amount}">
	            <input type="hidden" name="area" id="selectedArea" value="${cri.area}">
	            <button type="submit">검색</button>
	        </form>
	    </div>
	    <label for="area">지역:</label>
	    <select id="areaSelect" name="area">
	        <option value="" ${cri.area == '' ? 'selected' : ''}>지역 전체</option>
	        <option value="강남구" ${cri.area == '강남구' ? 'selected' : ''}>강남구</option>
	        <option value="강동구" ${cri.area == '강동구' ? 'selected' : ''}>강동구</option>
	        <option value="강북구" ${cri.area == '강북구' ? 'selected' : ''}>강북구</option>
	        <option value="강서구" ${cri.area == '강서구' ? 'selected' : ''}>강서구</option>
	        <option value="관악구" ${cri.area == '관악구' ? 'selected' : ''}>관악구</option>
	        <option value="광진구" ${cri.area == '광진구' ? 'selected' : ''}>광진구</option>
	        <option value="구로구" ${cri.area == '구로구' ? 'selected' : ''}>구로구</option>
	        <option value="금천구" ${cri.area == '금천구' ? 'selected' : ''}>금천구</option>
	        <option value="노원구" ${cri.area == '노원구' ? 'selected' : ''}>노원구</option>
	        <option value="도봉구" ${cri.area == '도봉구' ? 'selected' : ''}>도봉구</option>
	        <option value="동대문구" ${cri.area == '동대문구' ? 'selected' : ''}>동대문구</option>
	        <option value="동작구" ${cri.area == '동작구' ? 'selected' : ''}>동작구</option>
	        <option value="마포구" ${cri.area == '마포구' ? 'selected' : ''}>마포구</option>
	        <option value="서대문구" ${cri.area == '서대문구' ? 'selected' : ''}>서대문구</option>
	        <option value="서초구" ${cri.area == '서초구' ? 'selected' : ''}>서초구</option>
	        <option value="성북구" ${cri.area == '성북구' ? 'selected' : ''}>성북구</option>
	        <option value="송파구" ${cri.area == '송파구' ? 'selected' : ''}>송파구</option>
	        <option value="양천구" ${cri.area == '양천구' ? 'selected' : ''}>양천구</option>
	        <option value="영등포구" ${cri.area == '영등포구' ? 'selected' : ''}>영등포구</option>
	        <option value="용산구" ${cri.area == '용산구' ? 'selected' : ''}>용산구</option>
	        <option value="은평구" ${cri.area == '은평구' ? 'selected' : ''}>은평구</option>
	        <option value="종로구" ${cri.area == '종로구' ? 'selected' : ''}>종로구</option>
	        <option value="중구" ${cri.area == '중구' ? 'selected' : ''}>중구</option>
	        <option value="중랑구" ${cri.area == '중랑구' ? 'selected' : ''}>중랑구</option>
	    </select>
	    <div>
	        <label>Show 
	            <select id="select1" name="select1">
	                <option value="10" ${cri.amount == 10 ? 'selected' : ''}>10</option>
	                <option value="15" ${cri.amount == 15 ? 'selected' : ''}>15</option>
	                <option value="20" ${cri.amount == 20 ? 'selected' : ''}>20</option>
	            </select>
	        </label>
	    </div>
	    <div id="content">
	        <!-- /.row -->
	        <div class="row">
	            <div class="">
	                <div class="panel panel-default">
	                    <div class="panel-heading">
	                        Hover Rows
	                    </div>
	                    <!-- /.panel-heading -->
	                    <div class="panel-body">
	                        <div class="table-responsive">
	                            <table id="community_board" class="table table-hover">
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
	                                </tbody>
	                            </table>
	                        </div>
	                        <!-- /.table-responsive -->
	                    </div>
	                    <!-- /.panel-body -->
	                </div>
	                <!-- /.panel -->
	            </div>
	        </div>
	        <div class="pagination-wrapper">
	        	<div class="pagination" id="pagination">
		            <!-- 페이지네이션 링크를 여기에 렌더링 -->
		        </div>
	        </div>
	    </div>
	    <a href="${pageContext.request.contextPath}/community/register" class="write-link">글 작성</a>
    </div>
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
                var type = $("#searchForm").find("#type").val();

                var boardListHtml = "";
                if (boardList.length === 0) {
                    boardListHtml = "<tr><td colspan='7' class='text-center'>검색 결과가 없습니다.</td></tr>";
                } else {
                    $.each(boardList, function(index, board) {
                        boardListHtml += "<tr>";
                        boardListHtml += "<td>" + board.community_bno + "</td>";
                        boardListHtml += "<td>" + board.region + "</td>";
                        boardListHtml += "<td><a href='" + "${pageContext.request.contextPath}/community/get?community_bno=" + board.community_bno + "&pageNum=" + pageNum + "&amount=" + amount + "&type=" + type  + "&keyword=" + keyword + "&area=" + area + "'>" + board.community_title + "</a></td>";
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
                    paginationHtml += "<a href='#' class='page-link' data-page='" + (pageMaker.startPage - 1) + "'>이전</a> ";
                }
                for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
                    paginationHtml += "<a href='#' class='page-link' data-page='" + i + "'>" + i + "</a> ";
                }
                if (pageMaker.next) {
                    paginationHtml += "<a href='#' class='page-link' data-page='" + (pageMaker.endPage + 1) + "'>다음</a>";
                }
                $("#pagination").html(paginationHtml);

                // 페이지 링크에 클릭 이벤트를 바인딩합니다.
                $(".page-link").click(function(event) {
                    event.preventDefault();
                    var pageNum = $(this).data("page");
                    scrollPosition = $(window).scrollTop();  // 현재 스크롤 위치 저장
                    loadPage(pageNum);
                });

                // AJAX 요청이 완료된 후 스크롤 위치를 복원합니다.
                $(window).scrollTop(scrollPosition);
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