<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../includes/header.jsp"%>
<html>
<head>
<style>
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
    border: 1px solid #ddd;
    border-radius: 4px;
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
</style>
<title>글 작성</title>


</head>
<body>
	<h1>글 작성</h1>
 <form action="${pageContext.request.contextPath}/community/register" method="post" enctype="multipart/form-data" onsubmit="return validateForm() && showAlert();">
        <div>
            <label for="region">구 선택</label>
            <select id="region" name="region" required>
                <option value="">구를 선택하세요</option>
                <option value="강남구">강남구</option>
                <option value="강동구">강동구</option>
                <option value="강북구">강북구</option>
                <option value="관악구">관악구</option>
                <option value="광진구">광진구</option>
                <option value="구로구">구로구</option>
                <option value="금천구">금천구</option>
                <option value="노원구">노원구</option>
                <option value="도봉구">도봉구</option>
                <option value="동대문구">동대문구</option>
                <option value="동작구">동작구</option>
                <option value="마포구">마포구</option>
                <option value="서대문구">서대문구</option>
                <option value="서초구">서초구</option>
                <option value="성북구">성북구</option>
                <option value="송파구">송파구</option>
                <option value="양천구">양천구</option>
                <option value="영등포구">영등포구</option>
                <option value="용산구">용산구</option>
                <option value="은평구">은평구</option>
                <option value="종로구">종로구</option>
                <option value="중구">중구</option>
                <option value="중랑구">중랑구</option>
            </select>
        </div>
        <div>
            <label for="community_title">제목</label>
            <input type="text" id="community_title" name="community_title" required>
        </div>
        <div>
            <label for="community_content">내용</label>
            <textarea id="community_content" name="community_content" required></textarea>
        </div>
        <div>
            <label for="file">이미지 첨부파일</label>
            <input type="file" name="file" onchange="readURL(this);">
            <img id="preview" src="#" alt="선택된 이미지가 없습니다">
        </div>
        <div class="button-group">
            <button type="button" onclick="goBack()">돌아가기</button>
            <button type="submit">등록하기</button>
        </div>
    </form>
    
    
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

	function validateForm() {
		var region = document.getElementById("region");
		if (region.value == "") {
			alert("구를 선택해주세요.");
			return false;
		}
		return true;
	}

	function goBack() {
		window.location.href = "${pageContext.request.contextPath}/community/list";
	}
	
	 function showAlert() {
	        alert("등록이 완료되었습니다.");
	    }
</script>
<!-- Footer -->
        <%@include file="../includes/footer.jsp"%>
   </body>
</html>