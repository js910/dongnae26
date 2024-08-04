<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동네26 - 커뮤니티 게시판</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
.bg-breadcrumb {
	background-color: #6c757d;
	color: white;
	padding: 20px 0;
}

.form-select, .form-control, .form-control-file {
	width: 100%;
	max-width: 400px;
	margin: 0 auto;
}

.content-display {
	white-space: pre-wrap;
	word-wrap: break-word;
}

.form-group {
	margin-bottom: 15px;
}

.button-group {
	display: flex;
	justify-content: center;
	gap: 10px;
}

.button-group button {
	width: 150px;
}

.content-display {
	white-space: pre-wrap; /* 줄바꿈과 공백을 유지합니다. */
	word-wrap: break-word; /* 긴 단어가 줄바꿈을 유지하도록 합니다. */
}
</style>
</head>
<body>
    <%@include file="../includes/header.jsp"%>

    <!-- Header Start -->
     <div class="bg-breadcrumb">
        <div class="container text-center py-5" style="max-width: 900px;">
            <h3 class="text-white display-3 mb-4">글 작성</h3>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="../main">Home</a></li>
                <li class="breadcrumb-item"><a href="/community/list">커뮤니티 게시판</a></li>
                <li class="breadcrumb-item active text-white"></li>
            </ol>
        </div>
    </div>
    <!-- Header End -->

    <div class="container py-5">

        <form action="${pageContext.request.contextPath}/community/register" method="post" enctype="multipart/form-data" onsubmit="return validateForm() && showAlert();">
            <div class="form-group">
            
                <select id="region" name="region" class="form-select" required>
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
            <div class="form-group">
                <label for="community_title"></label>
                <input type="text" id="community_title" name="community_title" class="form-control" placeholder="제목을 입력하세요" required>
            </div>
            <div class="form-group content-display">
                <label for="community_content"></label>
                <textarea id="community_content" name="community_content" class="form-control" rows="10" placeholder="내용을 입력하세요" required></textarea>
            </div>
           <div class="form-group">
                <label for="file"></label>
                <input type="file" name="file" class="form-control-file" placeholder="이미지 첨부파일" onchange="readURL(this);">
                <img id="preview" src="#" alt="" class="mt-2" style="max-width: 20%; height: auto;">
            </div>
            <div class="button-group">
                <button type="button" class="btn btn-secondary" onclick="goBack()">돌아가기</button>
                <button type="submit" class="btn btn-primary">등록하기</button>
            </div>
            
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            return true;
        }
    </script>
    <%@include file="../includes/footer.jsp"%>
</body>
</html>