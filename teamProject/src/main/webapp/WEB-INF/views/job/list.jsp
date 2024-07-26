<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@include file="../includes/header.jsp"%>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
        }
        .container_2 {
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .forh1 {
        	font-size: 24px;
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }
        .search-form {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }
        .search-form .form-group {
            margin-right: 10px;
        }
        .search-form .form-group,
        .search-form .input-group {
            flex: 1;
        }
        .search-form .btn {
            flex: 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        .job-title a {
            text-decoration: none;
            color: #007bff;
            font-weight: bold;
        }
        .job-title a:hover {
            text-decoration: underline;
        }
        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            list-style: none;
        }
        .pagination a {
            text-decoration: none;
            padding: 8px 16px;
            margin: 0 4px;
            color: black;
            border: 1px solid #ddd;
            border-radius: 5px;           
        }
        .pagination a.active {
            background-color: #007bff;
            color: white;
            border: 1px solid #007bff;
        }
        .pagination a:hover {
            background-color: #ddd;
        }
        .pagination .current {
            background-color: #007bff;
            color: white;
            border: 1px solid #007bff;
            border-radius: 5px;
        }
        label{
        	margin-right: 10px;
        }
        #district{
        	width: 40%;
        }
        a{
        	text-decoration: none;
        	color: black;
        	font-weight: bold;
        }
        .form-group.input-group.search {
    		display: flex;
    		margin-top: 20px;
		}

		.form-group.input-group.search select.form-control {
    		flex: 1;
    		margin-right: 10px;
		}

		.form-group.input-group.search input.form-control {
    		flex: 3;
		}
		input[type='search']{
			width: 70%;
		}
		.form-table {
        	width: 100%;
        	border-collapse: collapse;
    	}
    	.form-table th {
        	background-color: #f2f2f2;
        	text-align: left;
        	padding: 10px;
    	}
    	.form-table td {
        	padding: 10px;
    	}
    	h1{
    		margin-right: 400px;
    	}
    	h2{
    		margin-top: 50px;
    	}
    	#boardTable {
		    border-left: none;
		    border-right: none;
		}
		
		#boardTable th, #boardTable td {
		    border-left: none;
		    border-right: none;
		}
		
		.table-bordered th, .table-bordered td {
		    border: 1px solid #dee2e6;
		}
		
		.table-bordered {
		    border: 1px solid #dee2e6;
		    border-left: none;
		    border-right: none;
		}
		td a:hover{
			color: blue;
		}
    </style>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <a href="../main" class="nav-item nav-link">Home</a>
                        <a href="/policy/list" class="nav-item nav-link">정책</a>
                        <a href="/job/list" class="nav-item nav-link active">일자리 정보</a>
                        <a href="/culture/list" class="nav-item nav-link">문화·행사</a>
                        <a href="/community/list" class="nav-item nav-link">커뮤니티</a>
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
                <h3 class="text-white display-3 mb-4">일자리 정보 게시판</h3>
                <ol class="breadcrumb justify-content-center mb-0">
                    <li class="breadcrumb-item"><a href="../main">Home</a></li>
                    <li class="breadcrumb-item"><a href="/job/list">일자리 정보 게시판</a></li>
                    <li class="breadcrumb-item active text-white">About</li>
                </ol>    
            </div>
        </div>
        <!-- Header End -->
</head>
<body>
    <div class="container_2">
        <h1 class="forh1">채용정보 상세검색</h1>       
        <div class="search-form">
            <form id="searchForm" action="/job/list" method="get">
            	<table class="form-table">
			        <tr>
			            <th>근무지</th>
			            <td>
			                <select id="district" class="form-control" name="district">
			                    <option value="" ${pageMaker.cri.district == null ? "selected" : ""}>서울시 전체</option>
			                    <option value="강남구" ${pageMaker.cri.district == "강남구" ? "selected" : ""}>강남구</option>
			                    <option value="강동구" ${pageMaker.cri.district == "강동구" ? "selected" : ""}>강동구</option>
			                    <option value="강북구" ${pageMaker.cri.district == "강북구" ? "selected" : ""}>강북구</option>
			                    <option value="강서구" ${pageMaker.cri.district == "강서구" ? "selected" : ""}>강서구</option>
			                    <option value="관악구" ${pageMaker.cri.district == "관악구" ? "selected" : ""}>관악구</option>
			                    <option value="광진구" ${pageMaker.cri.district == "광진구" ? "selected" : ""}>광진구</option>
			                    <option value="구로구" ${pageMaker.cri.district == "구로구" ? "selected" : ""}>구로구</option>
			                    <option value="금천구" ${pageMaker.cri.district == "금천구" ? "selected" : ""}>금천구</option>
			                    <option value="노원구" ${pageMaker.cri.district == "노원구" ? "selected" : ""}>노원구</option>
			                    <option value="도봉구" ${pageMaker.cri.district == "도봉구" ? "selected" : ""}>도봉구</option>
			                    <option value="동대문구" ${pageMaker.cri.district == "동대문구" ? "selected" : ""}>동대문구</option>
			                    <option value="동작구" ${pageMaker.cri.district == "동작구" ? "selected" : ""}>동작구</option>
			                    <option value="마포구" ${pageMaker.cri.district == "마포구" ? "selected" : ""}>마포구</option>
			                    <option value="서대문구" ${pageMaker.cri.district == "서대문구" ? "selected" : ""}>서대문구</option>
			                    <option value="서초구" ${pageMaker.cri.district == "서초구" ? "selected" : ""}>서초구</option>
			                    <option value="성동구" ${pageMaker.cri.district == "성동구" ? "selected" : ""}>성동구</option>
			                    <option value="성북구" ${pageMaker.cri.district == "성북구" ? "selected" : ""}>성북구</option>
			                    <option value="송파구" ${pageMaker.cri.district == "송파구" ? "selected" : ""}>송파구</option>
			                    <option value="양천구" ${pageMaker.cri.district == "양천구" ? "selected" : ""}>양천구</option>
			                    <option value="영등포구" ${pageMaker.cri.district == "영등포구" ? "selected" : ""}>영등포구</option>
			                    <option value="용산구" ${pageMaker.cri.district == "용산구" ? "selected" : ""}>용산구</option>
			                    <option value="은평구" ${pageMaker.cri.district == "은평구" ? "selected" : ""}>은평구</option>
			                    <option value="종로구" ${pageMaker.cri.district == "종로구" ? "selected" : ""}>종로구</option>
			                    <option value="중구" ${pageMaker.cri.district == "중구" ? "selected" : ""}>중구</option>
			                    <option value="중랑구" ${pageMaker.cri.district == "중랑구" ? "selected" : ""}>중랑구</option>
			                </select>
			            </td>
			        </tr>
			        <tr>
			            <th>급여</th>
			            <td>
			                <label><input type="radio" name="wageType" value="all" ${pageMaker.cri.wageType == "all" ? "checked" : ""}> 전체</label>
			                <label><input type="radio" name="wageType" value="hourly" ${pageMaker.cri.wageType == "hourly" ? "checked" : ""}> 시급</label>
			                <label><input type="radio" name="wageType" value="monthly" ${pageMaker.cri.wageType == "monthly" ? "checked" : ""}> 월급</label>
			                <label><input type="radio" name="wageType" value="annual" ${pageMaker.cri.wageType == "annual" ? "checked" : ""}> 연봉</label>
			            </td>
			        </tr>
			        <tr>
			            <th>학력</th>
			            <td>
			                <label><input type="radio" name="education" value="all" ${pageMaker.cri.education == "all" ? "checked" : ""}> 전체</label>
			                <label><input type="radio" name="education" value="high" ${pageMaker.cri.education == "high" ? "checked" : ""}> 고등학교</label>
			                <label><input type="radio" name="education" value="college" ${pageMaker.cri.education == "college" ? "checked" : ""}> 전문대학</label>
			                <label><input type="radio" name="education" value="univ" ${pageMaker.cri.education == "univ" ? "checked" : ""}> 대학_대학교</label>
			                <label><input type="radio" name="education" value="noEdu" ${pageMaker.cri.education == "noEdu" ? "checked" : ""}> 관계없음</label>
			            </td>
			        </tr>
			        <tr>
			            <th>경력</th>
			            <td>
			                <label><input type="radio" name="career" value="all" ${pageMaker.cri.career == "all" ? "checked" : ""}> 전체</label>
			                <label><input type="radio" name="career" value="entryLevel" ${pageMaker.cri.career == "entryLevel" ? "checked" : ""}> 신입</label>
			                <label><input type="radio" name="career" value="experienced" ${pageMaker.cri.career == "experienced" ? "checked" : ""}> 경력</label>
			                <label><input type="radio" name="career" value="noExperienceRequired" ${pageMaker.cri.career == "noExperienceRequired" ? "checked" : ""}> 무관</label>
			            </td>
			        </tr>
			        <tr>
			            <th>근무</th>
			            <td>
			                <label><input type="radio" name="workDay" value="all" ${pageMaker.cri.workDay == "all" ? "checked" : ""}> 전체</label>
			                <label><input type="radio" name="workDay" value="three" ${pageMaker.cri.workDay == "three" ? "checked" : ""}> 주3일</label>
			                <label><input type="radio" name="workDay" value="four" ${pageMaker.cri.workDay == "four" ? "checked" : ""}> 주4일</label>
			                <label><input type="radio" name="workDay" value="five" ${pageMaker.cri.workDay == "five" ? "checked" : ""}> 주5일</label>
			                <label><input type="radio" name="workDay" value="six" ${pageMaker.cri.workDay == "six" ? "checked" : ""}> 주6일</label>
			                <label><input type="radio" name="workDay" value="etc" ${pageMaker.cri.workDay == "etc" ? "checked" : ""}> 기타</label>
			            </td>
			        </tr>
			        <tr>
			            <th>키워드 검색</th>
			            <td>
			                <select id="searchType" class="form-control" name="type">
						        <option value="all" ${pageMaker.cri.type == "all" ? "selected" : ""}>전체</option>
						        <option value="cmpnyNm" ${pageMaker.cri.type == "cmpnyNm" ? "selected" : ""}>회사명</option>
						        <option value="joSj" ${pageMaker.cri.type == "joSj" ? "selected" : ""}>채용공고명</option>
						        <option value="dtyCn" ${pageMaker.cri.type == "dtyCn" ? "selected" : ""}>직무내용</option>
						    </select>
						    <input type="search" class="form-control" name="keyword" value="${pageMaker.cri.keyword}">
						    <span class="input-group-btn">
						        <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i> 검색</button>
						    </span>
			            </td>
			        </tr>
			    </table>           
                <!--  <div class="form-group input-group search">
				    <select id="searchType" class="form-control" name="type">
				        <option value="all" ${pageMaker.cri.type == "all" ? "selected" : ""}>전체</option>
				        <option value="joSj" ${pageMaker.cri.type == "joSj" ? "selected" : ""}>구인 제목</option>
				        <option value="dtyCn" ${pageMaker.cri.type == "dtyCn" ? "selected" : ""}>직무 내용</option>
				    </select>
				    <input type="search" class="form-control" name="keyword" value="${pageMaker.cri.keyword}">
				    <span class="input-group-btn">
				        <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i> 검색</button>
				    </span>
				</div>-->
                
            </form>
        </div>
        <!-- <h2>채용정보</h2> -->
        <div class="form-group input-group">
            <label for="amount">게시글 갯수:</label>
            <select id="amount" name="amount" class="form-control">
                <option value="10" ${pageMaker.cri.amount == 10 ? "selected" : ""}>10</option>
                <option value="20" ${pageMaker.cri.amount == 20 ? "selected" : ""}>20</option>
                <option value="50" ${pageMaker.cri.amount == 50 ? "selected" : ""}>50</option>
            </select>
        </div>
        <table id="boardTable" class="table table-striped table-bordered">
            <thead>
                <tr>
                    <th>자치구</th>
                    <th>회사명</th>
                    <th>채용공고명/모집요강</th>
                    <th>근무시간</th>
                    <th>등록일</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
        <div>
            <ul class="pagination">
                <c:if test="${pageMaker.prev}">
                    <li class="paginate_button previous">
                        <a href="${pageMaker.startPage - 1}">Previous</a>
                    </li>
                </c:if>
                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                    <li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''}">
                        <a href="${num}" class="${pageMaker.cri.pageNum == num ? 'current' : ''}">${num}</a>
                    </li>
                </c:forEach>
                <c:if test="${pageMaker.next}">
                    <li class="paginate_button next">
                        <a href="${pageMaker.endPage + 1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </div>
        <form id="pageForm" action="/job/list" method="get">
            <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
            <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
            <input type="hidden" name="type" value="${pageMaker.cri.type}">
            <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
            <input type="hidden" name="district" value="${pageMaker.cri.district}">
            <input type="hidden" name="wageType" value="${pageMaker.cri.wageType}">
            <input type="hidden" name="career" value="${pageMaker.cri.career}">
            <input type="hidden" name="education" value="${pageMaker.cri.education}">
            <input type="hidden" name="workDay" value="${pageMaker.cri.workDay}">
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            loadTable();
            console.log("전체 게시글 화면으로 이동");
            let result = '<c:out value="${result}"/>';
            console.log(result);
            
            $('#amount').on('change', function() {
                $('#pageForm').find("input[name='amount']").val($(this).val());
                $('#pageForm').find("input[name='pageNum']").val(1); // 페이지 번호를 1로 초기화
                loadTable();
                $('#pageForm').submit(); // 페이지 폼 제출
            });
            
            function formatDate(dateString) {
                var date = new Date(dateString);
                var year = date.getFullYear();
                var month = ('0' + (date.getMonth() + 1)).slice(-2);
                var day = ('0' + date.getDate()).slice(-2);
                return year + '-' + month + '-' + day;
            }

            function loadTable() {
                $.ajax({
                    url: "/job/getList",
                    type: "POST",
                    data: {
                        pageNum: $("#pageForm").find("input[name='pageNum']").val(),
                        amount: $("#pageForm").find("input[name='amount']").val(),
                        type: $("#searchType").val(),
                        keyword: $("#searchForm").find("input[type='search']").val(),
                        district: $("#pageForm").find("input[name='district']").val(),
                        wageType: $("#pageForm").find("input[name='wageType']").val(),
                        career: $("#pageForm").find("input[name='career']").val(),
                        education: $("#pageForm").find("input[name='education']").val(),
                        workDay: $("#pageForm").find("input[name='workDay']").val(),
                    },
                    dataType: "json",
                    success: function(data) {
                        var boardTbody = $("#boardTable tbody"); // 테이블 본문(tbody) 요소 저장
                        boardTbody.empty(); // 테이블 본문을 비워서 기존 데이터를 삭제

                        $.each(data, function(index, jobBoard) {
                            var row = $("<tr>"); // tr태그 생성

                            row.append($("<td>").text(jobBoard.mngrInsttNm)); // 자치구 추가
                            var companyName = $("<td>").text(jobBoard.cmpnyNm); // 기업명 추가
                            row.append(companyName);

                            var jobTitle = $("<td>");
                            var titleLink = $("<a>").attr("href", "/job/detail?jobId=" + jobBoard.joRegistNo + "&pageNum=" + $("#pageForm").find("input[name='pageNum']").val() + "&amount=" + $("#pageForm").find("input[name='amount']").val() + "&type=" + $("#pageForm").find("input[name='type']").val() + "&keyword=" + $("#pageForm").find("input[name='keyword']").val() + "&district=" + $("#pageForm").find("input[name='district']").val()).text(jobBoard.joSj);

                            jobTitle.append(titleLink);
                            jobTitle.append($("<div>").addClass("wage").text(jobBoard.hopeWage)); // 구인제목/모집요강 추가
                            row.append(jobTitle);

                            var holidayAndWorkTime = $("<td>").text(jobBoard.holidayNm + '(' + jobBoard.workTimeNm + ')');
                            row.append(holidayAndWorkTime);
                            
                            boardTbody.append(row); // 생성한 tr 요소를 테이블 본문에 추가
                            
                            var regDate = $("<td>").text(formatDate(jobBoard.joRegDt)); // 등록일/마감일 추가
                            row.append(regDate);

                            boardTbody.append(row); // 생성한 tr 요소를 테이블 본문에 추가
                        });
                    },
                    error: function(e) {
                        console.log(e);
                    }
                });

                let pageForm = $("#pageForm");

                $(".paginate_button a").on("click", function(e) {
                    e.preventDefault(); // a태그의 기본 기능인 링크를 삭제하기 위해서..

                    // pageNum값을 사용자가 클릭한 a태그의 href 속성값으로 변경
                    pageForm.find("input[name='pageNum']").val($(this).attr("href"));
                    pageForm.submit();
                });

                // 자치구 선택 변경 시
                $("#district").on("change", function() {
                    pageForm.find("input[name='district']").val($(this).val());
                    pageForm.find("input[name='pageNum']").val(1); // 페이지 번호를 1로 설정
                    pageForm.submit();
                });
                
             	// 희망급여 유형 선택 변경 시
                $("input[name='wageType']").on("change", function() {
                    pageForm.find("input[name='wageType']").val($(this).val());
                    pageForm.find("input[name='pageNum']").val(1);
                    pageForm.submit();
                });
             	
             	// 경력 유형 선택 변경 시
                $("input[name='career']").on("change", function() {
                    pageForm.find("input[name='career']").val($(this).val());
                    pageForm.find("input[name='pageNum']").val(1);
                    pageForm.submit();
                });
             	
             	// 학력 유형 선택 변경 시
                $("input[name='education']").on("change", function() {
                    pageForm.find("input[name='education']").val($(this).val());
                    pageForm.find("input[name='pageNum']").val(1);
                    pageForm.submit();
                });
             	
             // 학력 유형 선택 변경 시
                $("input[name='workDay']").on("change", function() {
                    pageForm.find("input[name='workDay']").val($(this).val());
                    pageForm.find("input[name='pageNum']").val(1);
                    pageForm.submit();
                });              
            }
        });
    </script>
<!-- Footer -->
<%@include file="../includes/footer.jsp"%>