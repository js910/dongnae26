<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../includes/header.jsp"%>
<head>
<title>게시글 수정</title>
  <style>
        body {
            font-family: Arial, sans-serif;
            line-height: 1.6;
            margin: 20px;
            padding: 0;
        }

        h1 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        form {
            max-width: 800px;
            margin: auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 8px;
            background: #f9f9f9;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }

        input[type="text"],
        textarea,
        select,
        input[type="file"] {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        textarea {
            height: 150px;
            resize: vertical;
        }

        .button-group {
            display: flex;
            justify-content: space-between;
        }

        .button-group button {
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            color: #fff;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .button-group button[type="button"] {
            background-color: #6c757d;
        }

        .button-group button[type="submit"] {
            background-color: #007bff;
        }

        .button-group button:hover {
            opacity: 0.9;
        }

        img {
            max-width: 100%;
            height: auto;
            border-radius: 4px;
            margin-top: 10px;
        }

        #preview {
            display: block;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <h1>게시글 수정</h1>
    <form action="${pageContext.request.contextPath}/community/modify" method="post" enctype="multipart/form-data">
        <input type="hidden" name="community_bno" value="${board.community_bno}">
        
        <!-- 기존 이미지 표시 -->
        <div>
            <label>기존 이미지:</label>
            <img src="/image/${board.community_bno}/${board.community_filename}" alt="기존 이미지" style="max-width: 200px;">
             <!-- 기존 파일명 전달 -->
    		<input type="hidden" name="existing_filename" value="${board.community_filename}">
        </div>

        <div>
            <label for="region">구 선택</label>
            <select id="region" name="region" required>
                <option value="">구를 선택하세요</option>
                <option value="관악구" ${board.region == '관악구' ? 'selected' : ''}>관악구</option>
                <option value="금천구" ${board.region == '금천구' ? 'selected' : ''}>금천구</option>
                <option value="동대문구" ${board.region == '동대문구' ? 'selected' : ''}>동대문구</option>
                <option value="서초구" ${board.region == '서초구' ? 'selected' : ''}>서초구</option>
            </select>
        </div>
        <div>
            <label for="community_title">제목</label>
            <input type="text" id="community_title" name="community_title" value="${board.community_title}">
        </div>
        <div>
            <label for="community_content">내용</label>
            <textarea id="community_content" name="community_content">${board.community_content}</textarea>
        </div>
        <div>
            <label for="file">이미지 첨부파일</label>
            <input type="file" name="file" onchange="readURL(this);"/>
            <img id="preview" src="#" alt="선택된 이미지가 없습니다" style="max-width: 200px;">
        </div>
        <div class="button-group">
            <button type="button" onclick="goBack()">돌아가기</button>
            <button type="submit">수정하기</button>
        </div>
    </form>

     <!-- 스크립트는 여기로 이동 -->
    <script type="text/javascript">
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('preview').src = e.target.result;
                }
                reader.readAsDataURL(input.files[0]);
            } else {
                document.getElementById('preview').src = "#";
            }
        }
        
        function goBack() {
            window.location.href = "${pageContext.request.contextPath}/community/list";
        }

        // 폼 제출 후 알림 처리
        document.querySelector('form').addEventListener('submit', function(event) {
            event.preventDefault(); // 기본 제출 방지
            if (confirm("수정 하시겠습니까?")) {
                this.submit(); // 실제 폼 제출
                alert("수정이 완료되었습니다.");
            }
        });
    </script>
<!-- Footer -->
        <%@include file="../includes/footer.jsp"%>
   </body>
</html>