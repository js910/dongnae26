<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>관리자 문의 관리</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }
        h1 {
        	text-align: center;
            color: #333;
        }
        table {
        	margin: 0 auto;
            width: 60%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
            color: #333;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:nth-child(odd) {
            background-color: #ffffff;
        }
        select, button {
            padding: 5px 10px;
            font-size: 14px;
        }
        .inquiry-details {
            max-width: 300px;
            word-wrap: break-word;
        }
        .status {
            padding: 5px;
            border-radius: 5px;
            color: white;
            text-align: center;
            display: inline-block;
            min-width: 75px;
        }
        .status-received {
            background-color: gray; /* Yellow */
        }
        .status-inprogress {
            background-color: #0099ff; /* Blue */
        }
        .status-completed {
            background-color: #ffcc00; /* Green */
        }
    </style>
</head>
<body>
    <h1>문의 내역 관리</h1>
    
    <table>
        <thead>
            <tr>
                <th>문의 번호</th>
                <th>사용자 번호</th>
                <th>문의 종류</th>
                <th>문의 내용</th>
                <th>등록 날짜</th>
                <th>접수 현황</th>
                <th>상태 변경</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="inquiry" items="${inquiries}">
                <tr>
                    <td>${inquiry.inquiry_num}</td>
                    <td>${inquiry.user_num}</td>
                    <td>${inquiry.inquiry_purpose}</td>
                    <td class="inquiry-details">${inquiry.inquiry_details}</td>
                    <td>${inquiry.inquiry_regdate}</td>
                    <td>
                        <span class="status
                            <c:choose>
                                <c:when test="${inquiry.inquiry_progress == '접수'}">status-received</c:when>
                                <c:when test="${inquiry.inquiry_progress == '진행중'}">status-inprogress</c:when>
                                <c:when test="${inquiry.inquiry_progress == '처리 완료'}">status-completed</c:when>
                            </c:choose>
                        ">
                            ${inquiry.inquiry_progress}
                        </span>
                    </td>
                    <td>
                        <form action="${pageContext.request.contextPath}/admin/updateInquiryStatus" method="post">
                            <input type="hidden" name="inquiryNum" value="${inquiry.inquiry_num}">
                            <select name="inquiryProgress">
                                <option value="접수" ${inquiry.inquiry_progress == '접수' ? 'selected' : ''}>접수</option>
                                <option value="진행중" ${inquiry.inquiry_progress == '진행중' ? 'selected' : ''}>진행중</option>
                                <option value="처리 완료" ${inquiry.inquiry_progress == '처리 완료' ? 'selected' : ''}>처리 완료</option>
                            </select>
                            <button type="submit">업데이트</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
