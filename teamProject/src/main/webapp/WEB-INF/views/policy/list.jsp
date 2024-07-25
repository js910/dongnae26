<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<%@ include file="../includes/header.jsp"%>
<style>
/* General Page Layout */
@media (min-width: 1000px) {
  #page-wrapper {
    margin: 0 100px 0 100px;
    background-color: white;
  }
}

@media (max-width: 1000px) {
    .service-icon-container {
        flex: 0 1 calc(50% - 20px);
    }

    table th:nth-child(2), table td:nth-child(2) {
        max-width: 80px;
        min-width: 15px;
    }

    table th:nth-child(3), table td:nth-child(3) {
        min-width: 80px;
    }

    table th:nth-child(4), table td:nth-child(4) {
        min-width: 40px;
    }

	table th:nth-child(5), table td:nth-child(5) {
        min-width: 10px;
    }
    table td.summary {
        max-width: 10px;
    }
}

body {
    background-color: #f5f5f5; /* Outer div background color */
}

#page-wrapper {
    padding: 50px;
    background-color: white;
}

/* Header Styling */
.page-header {
    margin: 25px 20px;
}

/* Form Styling */
#searchForm {
    margin-bottom: 20px;
}

.icon-group {
	margin-bottom: 20px;
}

.input-group-btn .btn {
    background-color: #3E8EDE; /* Button color */
    color: white;
    border: none;
    height: 38px;
    border-radius: 0 10px 10px 0;
}

.input-group-btn .btn:hover {
    background-color: #2C6EB2; /* Button hover color */
}

/* Service Icons */
.service-icons {
    display: flex;
    justify-content: space-around;
    align-items: center;
    flex-wrap: nowrap;
    gap: 15px;
    padding: 10px;
    background-color: #f9f9f9;
}

.service-icon-container {
    flex: 0 1 calc(20% - 20px);
    text-align: center;
}

.service-icon {
    width: 100%;
    max-width: 120px;
    height: auto;
    flex-wrap: nowrap;
    background-color: #e0e0e0;
    border-radius: 10px;
    padding: 10px;
    border: 2px solid #ddd;
    transition: transform 0.2s, border-color 0.2s;
    cursor: pointer;
}

.service-icon img {
    max-width: 100%;
    max-height: 100%;
    border-radius: 10px;
}

.service-text {
    margin-top: 5px;
    font-size: 0.9em;
    color: #333;
}

.service-icon:hover {
    transform: scale(1.1);
    border-color: #3E8EDE;
}

.service-icon.selected {
    border-color: #3E8EDE;
}

/* Table Styling */
.table-container {
    width: 100%;
    overflow-x: auto;
}

.table {
    width: 100%;
    margin-bottom: 20px;
    border-collapse: collapse;
}

.table thead th {
    background-color: #3E8EDE;
    color: #ffffff;
    text-align: center;
    padding: 8px;
}

.table tbody td {
    padding: 8px;
    border-top: 1px solid #e7e7e7;
}

table th, table td.summary {
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    max-width: 200px;
}

table td.summary {
    max-width: 80px;
}

table th:nth-child(1), table td:nth-child(1) {
    min-width: 20px;
    max-width: 100px;
}

table th:nth-child(2), table td:nth-child(2) {
    min-width: 20px;
    max-width: 80px;
}

table th:nth-child(3), table td:nth-child(3) {
    min-width: 150px;
}

table th:nth-child(4), table td:nth-child(4) {
    min-width: 200px;
}

table th:nth-child(5), table td:nth-child(5) {
    min-width: 20px;
    max-width: 100px;
}

/* Pagination Styling */
.pagination {
    display: flex;
    justify-content: center;
    padding: 10px 0;
}

.pagination li {
    list-style: none;
    margin: 0 5px;
}

.pagination li a {
    text-decoration: none;
    color: #3E8EDE;
    padding: 5px 10px;
    border: 1px solid #ddd;
    border-radius: 3px;
}

.pagination li.active a {
    background-color: #3E8EDE;
    color: white;
    border: 1px solid #3E8EDE;
}

/* Entry Selection */
.dataTables_length {
    display: flex;
    align-items: center;
    gap: 10px;
    margin-bottom: 15px;
}

.dataTables_length label {
    margin-bottom: 0;
    font-weight: bold;
}

.dataTables_length select {
    padding: 5px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

</style>

<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h2 class="page-header">정책 게시판</h2>
		</div>
		<!-- /.col-lg-12 -->
	</div>

	<div class="row">
        <form id="searchForm" action="/policy/list" method="post">
        <div class="row">
            <div class="col-lg-6">
                <div class="form-group">
                    <select id="searchDistrict" class="form-control" name="district">
                    </select>
                </div>
            </div>
			<div class="col-lg-6">
				<div class="form-group input-group">
					<input type="search" class="form-control" name="keyword" value="${pageMaker.cri.keyword}">
                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit">
                            <i class="fa fa-search"></i>
						</button>
					</span>
				</div>
			</div>
			<input type="hidden" id="searchType" name="type" value="${pageMaker.cri.type}">
		</div>
		</form>
	</div>

	<div class="row">
    <!-- Icons for service categories -->
    	<div class="col-lg-12">
        	<div class="form-group icon-group">
            	<label>Select Service Category:</label>
	            <div class="service-icons">
                <div class="service-icon-container" data-type="생활안정">
                    <div class="service-icon">
                        <img src="/resources/images/independent.png" alt="Living">
                    </div>
                    <div class="service-text">생활안정</div>
                </div>
                <div class="service-icon-container" data-type="주거·자립">
                    <div class="service-icon">
                        <img src="/resources/images/house.png" alt="Residental">
                    </div>
                    <div class="service-text">주거·자립</div>
                </div>
                <div class="service-icon-container" data-type="보육·교육">
                    <div class="service-icon">
                        <img src="/resources/images/education.png" alt="Education">
                    </div>
                    <div class="service-text">보육·교육</div>
                </div>
                <div class="service-icon-container" data-type="고용·창업">
                    <div class="service-icon">
                        <img src="/resources/images/headhunting.png" alt="Employment">
                    </div>
                    <div class="service-text">고용·창업</div>
                </div>
                <div class="service-icon-container" data-type="보건·의료">
                    <div class="service-icon">
                        <img src="/resources/images/healthcare.png" alt="Health">
                    </div>
                    <div class="service-text">보건·의료</div>
                </div>
                <div class="service-icon-container" data-type="행정·안전">
                    <div class="service-icon">
                        <img src="/resources/images/briefcase.png" alt="Administration">
                    </div>
                    <div class="service-text">행정·안전</div>
                </div>
                <div class="service-icon-container" data-type="임신·출산">
                    <div class="service-icon">
                        <img src="/resources/images/foster-family.png" alt="Childbirth">
                    </div>
                    <div class="service-text">임신·출산</div>
                </div>
                <div class="service-icon-container" data-type="보호·돌봄">
                    <div class="service-icon">
                        <img src="/resources/images/shield.png" alt="Care">
                    </div>
                    <div class="service-text">보호·돌봄</div>
                </div>
                <div class="service-icon-container" data-type="문화·환경">
                    <div class="service-icon">
                        <img src="/resources/images/worldwide.png" alt="Culture">
                    </div>
                    <div class="service-text">문화·환경</div>
                </div>
                <div class="service-icon-container" data-type="농림축산어업">
                    <div class="service-icon">
                        <img src="/resources/images/shovel.png" alt="Primary Industry">
                    </div>
                    <div class="service-text">농림축산어업</div>
                </div>
	         	</div>
	       </div>
        </div>
    </div>
    
	<!-- /.row -->
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<!-- /.panel-heading -->
				<div class="panel-body">
					<table id="boardTable" width="100%" class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>소관기관명</th>
								<th>서비스분야</th>
								<th>서비스명</th>
								<th>서비스목적요약</th>
								<th>신청기한</th>
							</tr>
						</thead>
						<tbody></tbody>
					</table>
					<!-- /.table-responsive -->

					<div>
						<ul class="pagination">
							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous">
								<a href="${pageMaker.startPage - 1}">Previous</a></li>
							</c:if>
							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="paginate_button ${pageMaker.cri.pageNum == num ? 'active' : ''}">
								<a href="${num}">${num}</a></li>
							</c:forEach>
							<c:if test="${pageMaker.next}">
								<li class="paginate_button next">
								<a href="${pageMaker.endPage + 1}">Next</a></li>
							</c:if>
						</ul>
					</div>

					<form id="pageForm" action="/policy/list" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="district" value="${pageMaker.cri.district}">
						<input type="hidden" name="type" value="${pageMaker.cri.type}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					</form>
				</div>
				<!-- /.panel-body -->
			</div>
			<!-- /.panel -->
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
</div>
<!-- /#page-wrapper -->

<script type="text/javascript">
$(document).ready(function() {
    // Initialize district select options
    const districts = [
        "서울특별시", "강남구", "강동구", "강북구", "강서구", "관악구", "광진구",
        "구로구", "금천구", "노원구", "도봉구", "동대문구", "동작구", "마포구",
        "서대문구", "서초구", "성동구", "성북구", "송파구", "양천구", "영등포구",
        "용산구", "은평구", "종로구", "중구", "중랑구"
    ];

    const searchDistrict = $("#searchDistrict");
    districts.forEach(district => {
        const option = $("<option>").val(district).text(district);
        if (district === "${pageMaker.cri.district}") {
            option.prop("selected", true);
        }
        searchDistrict.append(option);
    });

    // Handle service icon clicks
    $('.service-icon-container').on('click', function(event) {
        event.preventDefault();
        const clickedIcon = $(this).find('.service-icon');
        const isSelected = clickedIcon.hasClass('selected');
        
        $('.service-icon').removeClass('selected');

        if (!isSelected) {
            clickedIcon.addClass('selected');
            const selectedType = $(this).data('type');
            $('#searchType').val(selectedType);
        } else {
            $('#searchType').val("");
        }
        $("#pageForm input[name='pageNum']").val(1);
        loadTable();
    });

    // Bind form submit event
    $("#searchForm").on("submit", function(event) {
        event.preventDefault();
        $("#pageForm input[name='district']").val($("#searchDistrict").val());
        $("#pageForm input[name='keyword']").val($("#searchForm input[name='keyword']").val());
        $("#pageForm input[name='type']").val($("#searchType").val());
        $("#pageForm input[name='pageNum']").val(1);
        loadTable();
    });

	$("select[name='dataTables-example_length']").change(function() {
	    var selectedValue = $(this).val();
	    $("#pageForm").find("input[name='amount']").val($(this).val());
	    $("#pageForm").submit();
	    loadTable();
	});

    // Bind pagination click event
    $(document).on("click", ".pagination a", function(event) {
        event.preventDefault();
        $("#pageForm input[name='pageNum']").val($(this).attr("href"));
        loadTable();
    });

    // Load initial table data
    loadTable();

    function loadTable() {
        $.ajax({
            url : "/policy/ajaxList",
            type : "POST",
            data: JSON.stringify({
                pageNum: $("#pageForm").find("input[name='pageNum']").val(),
                amount: $("#pageForm").find("input[name='amount']").val(),
                type: $("#searchType").val(),
                district: $("#searchDistrict").val(),
                keyword: $("#searchForm").find("input[name='keyword']").val(),
            }),
            contentType: "application/json; charset=UTF-8",
            dataType : "json",
            success : function(response) {
            	console.log("Response:", response);
            	var data = response.policyapi.data;
                var boardTbody = $("#boardTable tbody");
                boardTbody.empty();
                
                $.each(data, function(index, item) {
                    var row = $("<tr>");
                    row.append($("<td>").text(item.소관기관명).addClass('summary'));
                    row.append($("<td>").text(item.서비스분야).addClass('summary'));
                    var titleLink = $("<a>").attr("href", "/policy/get?serviceID=" + item.서비스ID).text(item.서비스명);
                    var titleTd = $("<td>").append(titleLink);
                    row.append(titleTd.addClass('summary'));
                    row.append($("<td>").text(item.서비스목적요약).addClass('summary'));
                    row.append($("<td>").text(item.신청기한).addClass('summary'));
                    boardTbody.append(row);
                });
                updatePagination(response.pageMaker);
            },
            error: function() {
                alert("Failed to load data.");
            }
        });
    }
});

function updatePagination(pageMaker) {
    const pagination = $(".pagination");
    pagination.empty();
    if (pageMaker.prev) {
        pagination.append('<li class="paginate_button previous"><a href="' + (pageMaker.startPage - 1) + '">Previous</a></li>');
    }
    for (let num = pageMaker.startPage; num <= pageMaker.endPage; num++) {
        pagination.append('<li class="paginate_button ' + (pageMaker.cri.pageNum == num ? 'active' : '') + '"><a href="' + num + '">' + num + '</a></li>');
    }
    if (pageMaker.next) {
        pagination.append('<li class="paginate_button next"><a href="' + (pageMaker.endPage + 1) + '">Next</a></li>');
    }
}
</script>

<%@ include file="../includes/footer.jsp"%>