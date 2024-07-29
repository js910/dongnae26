<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Bookmarks</title>
    <style>
        .bookmark-container {
            margin: 20px;
        }
        .bookmark {
            padding: 10px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }
        .bookmark .topic {
            font-weight: bold;
        }
        .bookmark .title {
            margin-left: 10px;
        }
        .bookmark .content {
            display: none;
            margin-top: 10px;
        }
        .bookmark .toggle-content {
            cursor: pointer;
            color: blue;
        }
    </style>
    <script>
        function toggleContent(id) {
            var content = document.getElementById('content-' + id);
            if (content.style.display === 'none') {
                content.style.display = 'block';
            } else {
                content.style.display = 'none';
            }
        }
    </script>
</head>
<body>
    <div class="bookmark-container">
        <h2>Job Bookmarks</h2>
        <c:forEach var="bookmark" items="${jobBookmarks}">
            <div class="bookmark">
                <span class="topic">${bookmark.name}</span>
                <a href="/job/detail?jobId=${bookmark.id}" class="title">${bookmark.summary}</a>
                <span class="toggle-content" onclick="toggleContent('${bookmark.id}')">More</span>
                <div class="content" id="content-${bookmark.id}">
                    <c:out value="${bookmark.summary}"/>
                </div>
            </div>
        </c:forEach>

        <h2>Policy Bookmarks</h2>
        <c:forEach var="bookmark" items="${policyBookmarks}">
            <div class="bookmark">
                <span class="topic">${bookmark.name}</span>
                <a href="/policy/detail?policyId=${bookmark.id}" class="title">${bookmark.summary}</a>
                <span class="toggle-content" onclick="toggleContent('${bookmark.id}')">More</span>
                <div class="content" id="content-${bookmark.id}">
                    <c:out value="${bookmark.summary}"/>
                </div>
            </div>
        </c:forEach>
    </div>
</body>
</html>