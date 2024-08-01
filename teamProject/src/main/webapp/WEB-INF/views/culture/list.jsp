<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp"%>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="fa fa-bars"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto py-0">
                <a href="../main" class="nav-item nav-link">Home</a>
                <a href="/policy/list" class="nav-item nav-link">정책</a>
                <a href="/job/list" class="nav-item nav-link">일자리 정보</a>
                <a href="/culture/list" class="nav-item nav-link active">문화·행사</a>
                <a href="/community/list" class="nav-item nav-link">커뮤니티</a>
            </div>
        </div>
    </nav>
</div>
<!-- Navbar & Hero End -->

<!-- Header Start -->
<div class="container-fluid bg-breadcrumb">
    <div class="container text-center py-5" style="max-width: 900px;">
        <h3 class="text-white display-3 mb-4">문화·행사 게시판</h3>
        <ol class="breadcrumb justify-content-center mb-0">
            <li class="breadcrumb-item"><a href="../main">Home</a></li>
            <li class="breadcrumb-item"><a href="/culture/list">문화·행사 게시판</a></li>
        </ol>    
    </div>
</div>
<!-- Header End -->

<head>
<meta charset="UTF-8">
<title>동네26 - 문화·행사게시판</title>
<link rel="stylesheet" href="">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script> 
    function submitForm() {
        fetchPage(1); // 필터 선택 시에 첫 페이지부터 다시 로드하는 기능
    }
    
    function fetchPage(pageNum) {
        var area = $('#areaSelect').val();
        var classify = $('#classifySelect').val();
        var amount = $('#amountSelect').val() || 10;  // 기본 값 설정
        var type = $('#searchType').val();
        var keyword = $('input[name="keyword"]').val();

        $.ajax({
            url: '/culture/ajaxList',
            type: 'POST',
            data: {
                pageNum: pageNum,
                amount: amount,
                area: area,
                classify: classify,
                type: type,
                keyword: keyword
            },
            dataType: "json",
            success: function(data) {
                console.log('리스트 내놔:', data);
                if(data && Array.isArray(data.list)) {
                    $('#boardTable tbody').empty();
                    data.list.forEach(function(item) {
                        $('#boardTable tbody').append(
                            '<tr>' +
                            '<td>' + item.culture_area + '</td>' +
                            '<td>' + item.culture_classify + '</td>' +
                            '<td><a href="/culture/get/' + item.culture_bno + '">' + item.culture_title + '</a></td>' +
                            '<td>' + item.culture_place + '</td>' +
                            '<td>' + item.culture_regdate + '</td>' +
                            '</tr>'
                        );
                    });
                    updatePagination(data.pageMaker);
                } else {
                    console.error('데이터 형식이 올바르지 않습니다: ', data);
                }
            },
            error: function(xhr, status, error) {
                console.error('AJAX request failed:', {
                    status: status,
                    error: error,
                    responseText: xhr.responseText,
                    statusText: xhr.statusText
                });
            }
        });
    }

    function updatePagination(pageMaker) {
        $('.pagination').empty();
        if (pageMaker.prev) {
            $('.pagination').append(
                '<li class="page-item">' +
                '<a class="page-link" href="javascript:fetchPage(' + (pageMaker.startPage - 1) + ')">이전</a>' +
                '</li>'
            );
        }
        for (var i = pageMaker.startPage; i <= pageMaker.endPage; i++) {
            $('.pagination').append(
                '<li class="page-item ' + (pageMaker.cri.pageNum == i ? 'active' : '') + '">' +
                '<a class="page-link" href="javascript:fetchPage(' + i + ')">' + i + '</a>' +
                '</li>'
            );
        }
        if (pageMaker.next) {
            $('.pagination').append(
                '<li class="page-item">' +
                '<a class="page-link" href="javascript:fetchPage(' + (pageMaker.endPage + 1) + ')">다음</a>' +
                '</li>'
            );
        }
    }

    $(document).ready(function() {
        fetchPage(1);
    });
</script>
</head>
<body>
    <div class="container">
        <h1></h1>
        <form id="filterForm" method="GET" action="javascript:submitForm();">
            <div class="row">
                <div class="col-3">
                    <select class="form-select form-control" id="areaSelect" name="area" onchange="fetchPage(1)">
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
                        <option value="성동구" ${selectedArea == '성동구' ? 'selected' : ''}>성동구</option>
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
                </div>
                <div class="col-3">
                    <select class="form-select form-control" id="classifySelect" name="classify" onchange="fetchPage(1)">
                        <option value="" ${selectedClassify == '' ? 'selected' : ''}>분류 전체</option>
                        <option value="교육/체험" ${selectedClassify == '교육/체험' ? 'selected' : ''}>교육/체험</option>
                        <option value="국악" ${selectedClassify == '국악' ? 'selected' : ''}>국악</option>
                        <option value="독주/독창회" ${selectedClassify == '독주/독창회' ? 'selected' : ''}>독주/독창회</option>
                        <option value="무용" ${selectedClassify == '무용' ? 'selected' : ''}>무용</option>
                        <option value="뮤지컬/오페라" ${selectedClassify == '뮤지컬/오페라' ? 'selected' : ''}>뮤지컬/오페라</option>
                        <option value="연극" ${selectedClassify == '연극' ? 'selected' : ''}>연극</option>
                        <option value="영화" ${selectedClassify == '영화' ? 'selected' : ''}>영화</option>
                        <option value="전시/미술" ${selectedClassify == '전시/미술' ? 'selected' : ''}>전시/미술</option>
                        <option value="콘서트" ${selectedClassify == '콘서트' ? 'selected' : ''}>콘서트</option>
                        <option value="클래식" ${selectedClassify == '클래식' ? 'selected' : ''}>클래식</option>
                        <option value="축제-문화/예술" ${selectedClassify == '축제-문화/예술' ? 'selected' : ''}>축제-문화/예술</option>
                        <option value="축제-전통/역사" ${selectedClassify == '축제-전통/역사' ? 'selected' : ''}>축제-전통/역사</option>
                        <option value="축제-자연/경관" ${selectedClassify == '축제-자연/경관' ? 'selected' : ''}>축제-자연/경관</option>
                        <option value="축제-시민화합" ${selectedClassify == '축제-시민화합' ? 'selected' : ''}>축제-시민화합</option>
                        <option value="축제-기타" ${selectedClassify == '축제-기타' ? 'selected' : ''}>축제-기타</option>
                        <option value="기타" ${selectedClassify == '기타' ? 'selected' : ''}>기타</option>
                    </select>
                </div>
            </div>
        </form>
        <div class="row">
            <form id="searchForm" action="javascript:submitForm();" method="get" class="d-flex">
                <div class="col-lg-4">
                    <select id="searchType" class="form-select form-control" name="type">
                        <option value="all" ${pageMaker.cri.type == "all" ? "selected":"" }>전체</option>
                        <option value="culture_title" ${pageMaker.cri.type == "culture_title" ? "selected":"" }>행사 제목</option>
                        <option value="culture_place" ${pageMaker.cri.type == "culture_place" ? "selected":"" }>장소</option>
                    </select>
                </div>
                <div class="col-lg-6">
                    <div class="input-group">
                        <input type="search" class="form-control" name="keyword" value="${pageMaker.cri.keyword }">
                        <button type="submit" class="btn btn-primary"><i class="fa fa-search"></i></button>
                    </div>
                </div>
            </form>
        </div>

        <!-- 게시물 목록 테이블 -->
        <table id="boardTable" class="table table-bordered">
            <thead>
                <tr>
                    <th>지역</th>
                    <th>분류</th>
                    <th>행사 제목</th>
                    <th>장소</th>
                    <th>진행 기간</th>
                </tr>
            </thead>
            <tbody>
            </tbody>
        </table>

        <!-- 페이지 네비게이션 -->
        <div class="d-flex justify-content-center">
            <ul class="pagination">
            </ul>
        </div>
    </div>
</body>
<%@include file="../includes/footer.jsp"%>
