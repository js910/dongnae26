<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Header -->
<%@include file="includes/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bookmarks</title>
    <style>
        body {
            background-color: #f0f4f8;
            margin: 0;
            padding: 0;
            color: #333;
        }
        .bookmark-container {
            width: 80%;
            margin: 40px auto;
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            padding-top: 100px;
            padding-left: 100px;
            padding-right: 100px;
        }
        h3 {
            border-bottom: 2px solid #5A6F80;
            padding-bottom: 10px;
            color: #5A6F80;
            margin-top: 0;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            table-layout: fixed;
            margin-bottom: 100px;
            border-radius: 10px; /* 추가된 border-radius 속성 */
            overflow: hidden; /* 테두리가 둥글게 보이도록 설정 */
        }

        th, td {
            border: 1px solid #e0e0e0;
            padding: 12px 15px;
            text-align: left;
            word-wrap: break-word;
        }
        th {
            background-color: #5bc1ac;
            color: #ffffff;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .title {
            font-weight: bold;
            text-decoration: none;
            color: #5A6F80;
        }
        .title:hover {
            text-decoration: underline;
        }
        .checkbox-cell {
            width: 50px;
            text-align: center;
        }
        button {
            background-color: #5A6F80;
            color: white;
            border: none;
            padding: 12px 25px;
            font-size: 16px;
            cursor: pointer;
            border-radius: 4px;
            margin-top: 20px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: 20px;
        }
        button:hover {
            background-color: #4a5d70;
        }
    </style>
    <script>
        function toggleCheckboxes(source, tableId) {
            const checkboxes = document.querySelectorAll(`#${tableId} tbody input[type="checkbox"]`);
            checkboxes.forEach(checkbox => checkbox.checked = source.checked);
        }

        function removeBookmarks() {
            const tables = ['jobTable', 'cultureTable', 'policyTable'];
            let selectedIds = [];

            tables.forEach(tableId => {
                const table = document.getElementById(tableId);
                const checkboxes = table.querySelectorAll('tbody input[type="checkbox"]:checked');
                checkboxes.forEach(checkbox => {
                    selectedIds.push(checkbox.value);
                    const row = checkbox.closest('tr');
                    row.parentNode.removeChild(row);
                });
            });

            if (selectedIds.length > 0) {
                // 서버에 선택된 북마크 ID를 전송하는 로직 추가 가능
                console.log('Removing bookmarks with IDs:', selectedIds);
                alert('Removing bookmarks with IDs: ' + selectedIds.join(', '));
            } else {
                alert('No bookmarks selected for removal.');
            }
        }
    </script>
</head>
<body>
    <div class="bookmark-container">
        <h3>일자리 북마크</h3>
        <table id="jobTable">
            <thead>
                <tr>
                    <th class="checkbox-cell"><input type="checkbox" onclick="toggleCheckboxes(this, 'jobTable')"></th>
                    <th>회사명</th>
                    <th>채용 제목</th>
                    <th>급여</th>
                    <th>마감일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="bookmark" items="${jobBookmarks}">
                    <tr>
                        <td class="checkbox-cell"><input type="checkbox" value="${bookmark.joRegistNo}"></td>
                        <td><a class="title" href="job/detail?jobId=${bookmark.joRegistNo}">${bookmark.cmpnyNm}</a></td>
                        <td>${bookmark.bsnsSumryCn}</td>
                        <td>${bookmark.hopeWage}</td>
                        <td>${bookmark.receptClosNm}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <h3>문화행사 북마크</h3>
        <table id="cultureTable">
            <thead>
                <tr>
                    <th class="checkbox-cell"><input type="checkbox" onclick="toggleCheckboxes(this, 'cultureTable')"></th>
                    <th>행사명</th>
                    <th>행사 분류</th>                   
                    <th>위치</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="bookmark" items="${cultureBookmarks}">
                    <tr>
                        <td class="checkbox-cell"><input type="checkbox" value="${bookmark.culture_bno}"></td>
                        <td><a class="title" href="/culture/get/${bookmark.culture_bno}">${bookmark.culture_title}</a></td>
                        <td>${bookmark.culture_classify}</td>                        
                        <td>${bookmark.culture_place}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <h3>정책 북마크</h3>
        <table id="policyTable">
            <thead>
                <tr>
                    <th class="checkbox-cell"><input type="checkbox" onclick="toggleCheckboxes(this, 'policyTable')"></th>
                    <th>정책명</th>
                    <th>지원 내용</th>
                    <th>마감일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="bookmark" items="${policyBookmarks}">
                    <tr>
                        <td class="checkbox-cell"><input type="checkbox" value="${bookmark.serviceID}"></td>
                        <td><a class="title" href="/policy/get?serviceID=${bookmark.serviceID}">${bookmark.serviceName}</a></td>
                        <td>${bookmark.serviceContent}</td>
                        <td>${bookmark.serviceDeadline}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <button onclick="removeBookmarks()">관심스크랩 해제</button>
    </div>
    <!-- Footer -->
    <%@include file="includes/footer.jsp"%>