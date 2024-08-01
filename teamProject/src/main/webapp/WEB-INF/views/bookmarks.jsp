<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bookmarks</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }
        .bookmark-container {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
            padding: 20px;
        }
        h2 {
            border-bottom: 2px solid #0073e6;
            padding-bottom: 10px;
            color: #0073e6;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        th, td {
            border: 1px solid #e0e0e0;
            padding: 15px;
            text-align: left;
        }
        th {
            background-color: #5bc1ac;
            color: #333;
        }
        .title {
            font-weight: bold;
            text-decoration: none;
        }
        .title:hover {
            text-decoration: underline;
        }
        .status {
            color: green;
            font-weight: bold;
        }
        button {
            background-color: #0073e6;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            cursor: pointer;
            border-radius: 4px;
            margin-top: 20px;
            display: block;
        }
        button:hover {
            background-color: #005bb5;
        }
    </style>
    <script>
        function toggleCheckboxes(source, tableId) {
            const checkboxes = document.querySelectorAll(`#${tableId} tbody input[type="checkbox"]`);
            checkboxes.forEach(checkbox => checkbox.checked = source.checked);
        }

        function removeBookmarks() {
            const selectedCheckboxes = document.querySelectorAll('tbody input[type="checkbox"]:checked');
            const selectedIds = Array.from(selectedCheckboxes).map(checkbox => checkbox.value);

            if (selectedIds.length > 0) {
                // Here you would add your logic to remove the bookmarks, e.g., sending a request to the server
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
        <h2>Job Bookmarks</h2>
        <table id="jobTable">
            <thead>
                <tr>
                    <th><input type="checkbox" onclick="toggleCheckboxes(this, 'jobTable')"></th>
                    <th>회사명</th>
                    <th>채용 제목</th>
                    <th>마감일</th>
                    <th>급여</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="bookmark" items="${jobBookmarks}">
                    <tr>
                        <td><input type="checkbox" value="${bookmark.joRegistNo}"></td>
                        <td><a class="title" href="job/detail?jobId=${bookmark.joRegistNo}">${bookmark.cmpnyNm}</a></td>
                        <td>${bookmark.bsnsSumryCn}</td>
                        <td>${bookmark.receptClosNm}</td>
                        <td>${bookmark.hopeWage}</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <h2>Culture Bookmarks</h2>
        <table id="cultureTable">
            <thead>
                <tr>
                    <th><input type="checkbox" onclick="toggleCheckboxes(this, 'cultureTable')"></th>
                    <th>분류</th>
                    <th>위치</th>
                    <th>제목</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="bookmark" items="${cultureBookmarks}">
                    <tr>
                    	<td><input type="checkbox" value="${bookmark.culture_bno}"></td>
                    	<td>${bookmark.culture_classify}</td>
                        <td>${bookmark.culture_place}</td>
                        <td><a class="title" href="/culture/get/${bookmark.culture_bno}">${bookmark.culture_title}</a></td>
                        
                        
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <h2>Policy Bookmarks</h2>
        <table id="policyTable">
            <thead>
                <tr>
                    <th><input type="checkbox" onclick="toggleCheckboxes(this, 'policyTable')"></th>
                    <th>지원 제목</th>
                    <th>지원 내용</th> 
                    <th>마감일</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="bookmark" items="${policyBookmarks}">
                    <tr>
                        <td><input type="checkbox" value="${bookmark.serviceID}"></td>
                        <td><a href="/policy/get?serviceID=${bookmark.serviceID}">${bookmark.serviceName}</a></td>
                        <td>${bookmark.serviceContent}</td>
                        <td>${bookmark.serviceDeadline }</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <button onclick="removeBookmarks()">관심스크렙 해제</button>
    </div>
</body>
</html>