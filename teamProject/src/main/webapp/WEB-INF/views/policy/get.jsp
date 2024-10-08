<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>

<%@include file="../includes/header.jsp"%>


<%
    List<String> policyDetailKeys = Arrays.asList("servicePurpose", "selectionCriteria", "supportContent",
            "supportTarget", "supportType", "applicationDeadline", "applicationMethod",
            "requiredDocuments", "onlineApplicationSiteURL", "contactPoint",
            "agencyName", "receivingAgencyName");
    Map<String, String> tableHeaders = new HashMap<>();
    tableHeaders.put("servicePurpose", "서비스목적");
    tableHeaders.put("selectionCriteria", "선정기준");
    tableHeaders.put("supportContent", "지원내용");
    tableHeaders.put("supportTarget", "지원대상");
    tableHeaders.put("supportType", "지원유형");
    tableHeaders.put("applicationDeadline", "신청기한");
    tableHeaders.put("applicationMethod", "신청방법");
    tableHeaders.put("requiredDocuments", "구비서류");
    tableHeaders.put("onlineApplicationSiteURL", "온라인신청사이트URL");
    tableHeaders.put("contactPoint", "문의처");
    tableHeaders.put("agencyName", "소관기관명");
    tableHeaders.put("receivingAgencyName", "접수기관명");
    
    pageContext.setAttribute("policyDetailKeys", policyDetailKeys);
    pageContext.setAttribute("tableHeaders", tableHeaders);
%>

<title>정책 상세 정보</title>
<style>
@media (min-width: 1000px) {
  #page-wrapper {
    margin: 0 150px;
    background-color: white;
  }
}
body {
    background-color: #f5f5f5; /* Outer div background color */
}
#page-wrapper {
    padding: 50px;
    background-color: white;
}
.page-header {
    margin: 20px;
    color: var(--secondary-color);
}
.policy-table {
    width: 100%;
    margin-bottom: 20px;
    border-collapse: collapse;
    white-space: pre-line;
}
.policy-table th, .policy-table td {
    border: 1px solid #ddd;
    padding: 15px;
    vertical-align: middle;
}
.policy-table th {
    background-color: #f2f2f2;
    text-align: center;
	font-weight: bold;
	white-space: nowrap;
}
.panel {
	border: 1px solid #ddd;
	border-radius: 5px;
}
.panel-heading {
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 1.1em;
    font-weight: bold;
    padding: 15px;
    background-color: #f2f2f2;
    border-bottom: 1px solid #ddd;
}
.panel-header-content {
    display: flex;
    align-items: center;
    flex: 1;
    justify-content: space-between;
}
.panel-body {
    padding: 15px;
}
.cate {
	 display: inline-block;
	 padding: 5px 8px;
	 font-size: 0.8rem;
	 color: #fff;
	 background: #5bc1ac;
	 border-radius: .3rem;
	 margin-right: 1em;
}
.service-name {
    flex: 1;
    text-align: center;
    font-weight: bold;
}
.bookmark {
    cursor: pointer;
    width: 24px;
    height: 24px;
    background-image: url('/resources/images/star.png');
    background-size: contain;
}
.bookmarked {
    background-image: url('/resources/images/yellow-star.png');
}
#list {
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    background-color: #5bc1ac;
    color: white;
    cursor: pointer;
    font-size: 14px;
    font-weight: bold;
    transition: background-color 0.3s ease, color 0.3s ease;
}

#list:hover {
    background-color: #4a9d8c; /* hover 색상 */
    color: white; /* hover 시 텍스트 색상 유지 */
}

</style>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header">정책 상세 정보</h3>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <em class="cate">${policyDetail.agencyName}</em>
                    <span class="service-name">${policyDetail.serviceName}</span>
                    <span id="bookmark" class="bookmark"
                          data-service-id="${policyDetail.serviceID}"
                          data-service-name="${policyDetail.serviceName}"
                          data-service-content="${policyDetail.supportContent}"
                          data-service-deadline="${policyDetail.applicationDeadline}"
                          data-user-num="${user_num}"
                          onclick="toggleBookmark(this)"></span>
                </div>
                <!-- /.panel-heading -->
                <div class="panel-body">
                     <table class="table policy-table" id="policyTable">
                        <tbody>
                        <c:forEach var="key" items="${policyDetailKeys}">
			                <c:set var="value" value="${policyDetail[key]}" />
			                <c:if test="${not empty value}">
			                    <tr>
			                        <th><c:out value="${tableHeaders[key]}"/></th>
			                        <td><c:choose><c:when test="${key eq 'onlineApplicationSiteURL'}"><a href="${value}" target="_blank"><c:out value="${fn:trim(value)}"/></a></c:when><c:otherwise><c:out value="${fn:trim(value)}"/></c:otherwise></c:choose></td>
			                    </tr>
			                </c:if>
			            </c:forEach>
                        </tbody>
                    </table>
                    <button id="list" type="button" class="btn btn-primary">List</button>
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
    // Add 'bookmarked' class based on the server-side state
    const bookmarked = ${bookmarked};
    if (bookmarked) {
        $("#bookmark").addClass("bookmarked");
    }

    $("#list").on("click", function() {
        location.href = "${pageContext.request.contextPath}/policy/list?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}&district=${cri.district}";
    });
});

function toggleBookmark(element) {
    const serviceID = $(element).data('service-id');
    const serviceName = $(element).data('service-name');
    const serviceContent = $(element).data('service-content');
    const serviceDeadline = $(element).data('service-deadline');
    const userNum = $(element).data('user-num');
    
    $.ajax({
        type: "POST",
        url: "/policy/bookmark",
        dataType: "json",
        contentType: "application/json; charset=UTF-8",
        data: JSON.stringify({
        	serviceID: serviceID,
            serviceName: serviceName,
            serviceContent: serviceContent,
            serviceDeadline: serviceDeadline,
            userNum: userNum
        }),
        success: function(response) {
            if (!response.loggedIn) {
                alert("로그인이 필요한 기능입니다");
                return;
            }
            
            if (response.bookmarked) {
                $("#bookmark").addClass("bookmarked");
                alert("북마크 완료");
            } else {
                $("#bookmark").removeClass("bookmarked");
                alert("북마크 취소");
            }
        },
        error: function() {
            alert("북마크 처리 중 오류가 발생했습니다.");
        }
    });
}
</script>

<%@include file="../includes/footer.jsp"%>