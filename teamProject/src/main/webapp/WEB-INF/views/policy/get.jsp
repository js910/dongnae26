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

<style>
@media (min-width: 768px) {
  #page-wrapper {
    margin: 0 100px;
  }
}
.policy-table {
    width: 100%;
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
}
.panel-heading {
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 1.1em;
    font-weight: bold;
    padding: 15px;
    border-bottom: 1px solid #ddd;
}
.cate {
	 display: inline-block;
	 padding: 5px 8px;
	 font-size: 1.2rem;
	 color: #fff;
	 background: #3E8EDE;
	 border-radius: .3rem;
	 margin-right: 1em;
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
</style>

<div id="page-wrapper">
    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header">정책 게시판</h2>
        </div>
        <!-- /.col-lg-12 -->
    </div>
    <!-- /.row -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                	<em class="cate">${policyDetail.agencyName}</em>${policyDetail.serviceName}
                	<span id="bookmark" class="bookmark" onclick="toggleBookmark(${policyDetail.serviceID}, '${user_email}')"></span>
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
const bookmarked = ${bookmarked};

if (${bookmarked}) {
    $("#bookmark").addClass("bookmarked");
}

$("#list").on("click", function() {
    location.href = "/policy";
});

function toggleBookmark(serviceID, userEmail) {
    $.ajax({
        type: "POST",
        url: "/policy/bookmark",
        dataType: "json",
        data: { 'serviceID': serviceID, 'user_email': userEmail },
        success: function(response) {
            if (response) {
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
