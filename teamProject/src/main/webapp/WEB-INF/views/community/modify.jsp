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

        .form-select, .form-control, .preview {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
        }

        .content-display {
            white-space: pre-wrap;
            word-wrap: break-word;
        }

        .form-group {
            margin-bottom: 15px;
            display: flex;
        }

        .button-group {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin: 20px 0px;
        }

        .button-group button {
            width: 150px;
        }
		
		.content-display {
			white-space: pre-wrap; /* 줄바꿈과 공백을 유지합니다. */
			word-wrap: break-word; /* 긴 단어가 줄바꿈을 유지하도록 합니다. */
		}
		
        .container form{
	        width: 70%;
	    	margin: 0 auto;
	    	background: #fff;
	   		padding: 20px;
	   	    border: 1px solid #ddd;
	   		box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        /* 이미지 미리보기 */
        #preview {
            display: block;
            max-width: 200px;
            margin-top: 10px;
        }

        /* 기존 이미지 */
        img[alt="기존 이미지"] {
            max-width: 200px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <%@include file="../includes/header.jsp"%>

    <!-- Header Start -->
    <div class="bg-breadcrumb">
        <div class="container text-center py-5" style="max-width: 900px;">
            <h3 class="text-white display-3 mb-4">게시글 수정</h3>
            <ol class="breadcrumb justify-content-center mb-0">
                <li class="breadcrumb-item"><a href="../main">Home</a></li>
                <li class="breadcrumb-item"><a href="/community/list">커뮤니티 게시판</a></li>
                <li class="breadcrumb-item active text-white">게시글 수정</li>
            </ol>
        </div>
    </div>
    <!-- Header End -->

    <div class="container py-5">
        <form action="${pageContext.request.contextPath}/community/modify" method="post" enctype="multipart/form-data" onsubmit="return showAlert();">
            <input type="hidden" name="community_bno" value="${board.community_bno}">
            
            <!-- 기존 이미지 표시 -->
            <div class="form-group">
                <label></label>
                <img src="/image/${board.community_bno}/${board.community_filename}" alt="기존 이미지">
                <input type="hidden" name="existing_filename" value="${board.community_filename}">
            </div>

            <div class="form-group">
                <label for="region"></label>
                <select id="region" name="region" class="form-select" required>
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

            <div class="form-group">
                <label for="community_title"></label>
                <input type="text" id="community_title" name="community_title" class="form-control" value="${board.community_title}" required>
            </div>

            <div class="form-group content-display">
                <label for="community_content"></label>
                <textarea id="community_content" name="community_content" class="form-control" rows="10" required>${board.community_content}</textarea>
            </div>

            <div class="form-group">
                <label for="file"></label>
                <div class="preview">
                <input type="file" name="file" class="form-control-file" placeholder="이미지 첨부파일" onchange="readURL(this);">
                <img id="preview" src="#" alt="" class="mt-2"></div>
            </div>

            <div class="button-group">
                <button type="button" class="btn btn-secondary" onclick="goBack()">돌아가기</button>
                <button type="submit" class="btn btn-primary">수정하기</button>
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

        function goBack() {
            window.location.href = "${pageContext.request.contextPath}/community/list";
        }

        function showAlert() {
            if (confirm("수정 하시겠습니까?")) {
                alert("수정이 완료되었습니다.");
                return true;
            }
            return false;
        }
    </script>

    <%@include file="../includes/footer.jsp"%>
</body>
</html>