<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../includes/header.jsp"%>
<html>
<head>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
        background-color: #f4f4f4;
    }

    h1 {
        text-align: center;
        color: #333;
    }

    form {
        background: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 600px;
        margin: auto;
    }

    div {
        margin-bottom: 15px;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
        color: #555;
    }

    input[type="text"], textarea, select {
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
    }

    textarea {
        height: 150px;
        resize: vertical;
    }

    .button-group {
        text-align: center;
    }

    button {
        background-color: #007bff;
        border: none;
        color: white;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin: 5px;
        cursor: pointer;
        border-radius: 4px;
    }

    button:hover {
        background-color: #0056b3;
    }

    #preview {
        display: block;
        margin-top: 10px;
        max-width: 100%;
        height: auto;
        border: 1px solid #ddd;
        border-radius: 4px;
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
                <option value="관악구">관악구</option>
                <option value="금천구">금천구</option>
                <option value="동대문구">동대문구</option>
                <option value="서초구">서초구</option>
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