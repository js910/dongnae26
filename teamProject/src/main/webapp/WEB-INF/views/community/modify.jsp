<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../includes/header.jsp"%>
<head>
<style type="text/css">
body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

.container {
    width: 70%;
    margin: 0 auto;
    padding: 20px;
    background: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

/* 폼 레이아웃 */
form {
    display: flex;
    flex-direction: column;
}

form div {
    margin-bottom: 15px;
}

label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

input[type="text"], textarea, select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    box-sizing: border-box;
}

textarea {
    resize: vertical;
    min-height: 100px;
}

input[type="file"] {
    display: block;
    margin-bottom: 10px;
}

/* 이미지 미리보기 */
#preview {
    display: block;
    max-width: 200px;
    margin-top: 10px;
}

/* 버튼 그룹 */
.button-group {
    margin-top: 20px;
}

.button-group button {
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 10px 15px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin-right: 10px;
}

.button-group button:hover {
    background-color: #0056b3;
}

.button-group button[type="button"] {
    background-color: #6c757d;
}

.button-group button[type="button"]:hover {
    background-color: #5a6268;
}

/* 기존 이미지 */
img[alt="기존 이미지"] {
    max-width: 200px;
    margin-bottom: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
}
</style>
<title>게시글 수정</title>
  
   
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
                <option value="강남구" ${board.region == '강남구' ? 'selected' : ''}>강남구</option>
                <option value="강동구" ${board.region == '강동구' ? 'selected' : ''}>강동구</option>
                <option value="강북구" ${board.region == '강북구' ? 'selected' : ''}>강북구</option>
                <option value="관악구" ${board.region == '관악구' ? 'selected' : ''}>관악구</option>
                <option value="광진구" ${board.region == '광진구' ? 'selected' : ''}>광진구</option>
                <option value="구로구" ${board.region == '구로구' ? 'selected' : ''}>구로구</option>
                <option value="금천구" ${board.region == '금천구' ? 'selected' : ''}>금천구</option>
                <option value="노원구" ${board.region == '노원구' ? 'selected' : ''}>노원구</option>
                <option value="도봉구" ${board.region == '도봉구' ? 'selected' : ''}>도봉구</option>
                <option value="동대문구" ${board.region == '동대문구' ? 'selected' : ''}>동대문구</option>
                <option value="동작구" ${board.region == '동작구' ? 'selected' : ''}>동작구</option>
                <option value="마포구" ${board.region == '마포구' ? 'selected' : ''}>마포구</option>
                <option value="서대문구" ${board.region == '서대문구' ? 'selected' : ''}>서대문구</option>
                <option value="서초구" ${board.region == '서초구' ? 'selected' : ''}>서초구</option>
                <option value="성북구" ${board.region == '성북구' ? 'selected' : ''}>성북구</option>
                <option value="송파구" ${board.region == '송파구' ? 'selected' : ''}>송파구</option>
                <option value="양천구" ${board.region == '양천구' ? 'selected' : ''}>양천구</option>
                <option value="영등포구" ${board.region == '영등포구' ? 'selected' : ''}>영등포구</option>
                <option value="용산구" ${board.region == '용산구' ? 'selected' : ''}>용산구</option>
                <option value="은평구" ${board.region == '은평구' ? 'selected' : ''}>은평구</option>
                <option value="종로구" ${board.region == '종로구' ? 'selected' : ''}>종로구</option>
                <option value="중구" ${board.region == '중구' ? 'selected' : ''}>중구</option>
                <option value="중랑구" ${board.region == '중랑구' ? 'selected' : ''}>중랑구</option>
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