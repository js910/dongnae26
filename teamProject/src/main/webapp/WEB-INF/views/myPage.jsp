<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>마이 페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1, h2 {
            font-size: 24px;
            margin-bottom: 20px;
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
        }
        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
        
        .modal {
		    display: none; /* 기본적으로 모달을 숨김 */
		    position: fixed; /* 모달을 화면에 고정 */
		    z-index: 1; /* 다른 요소들 위에 표시 */
		    left: 0;
		    top: 0;
		    width: 100%; /* 전체 화면 폭 */
		    height: 100%; /* 전체 화면 높이 */
		    overflow: auto; /* 필요 시 스크롤 가능 */
		    background-color: rgba(0, 0, 0, 0.6); /* 배경 색상 */
		}
		.modal-content {
		    background-color: #fefefe;
		    margin: 5% auto; /* 화면 중앙에 모달 위치 */
		    padding: 30px; /* 패딩 추가 */
		    border: 1px solid #888;
		    width: 70%; /* 모달 너비를 조정 */
		    max-width: 800px; /* 최대 너비를 늘림 */
		    border-radius: 8px;
		    box-shadow: 0 4px 8px rgba(0,0,0,0.2); /* 그림자 추가 */
		    overflow-y: auto; /* 내용이 길어질 경우 스크롤 추가 */
		}
		textarea {
		    width: 95%; /* 너비를 100%로 설정 */
		    height: 200px; /* 높이를 200px로 설정 */
		    padding: 12px; /* 패딩을 추가하여 내용과 테두리 사이의 간격 조정 */
		    font-size: 16px; /* 폰트 크기 조정 */
		    border: 1px solid #ccc; /* 테두리 색상 */
		    resize: vertical; /* 수직으로 크기 조절 가능 */
		}
		
		label {
		    margin-bottom: 10px; /* 라벨과 라디오 버튼 사이의 간격을 설정 */
		}
		.row input[type="radio"] {
		    margin-right: 8px; /* 라디오 버튼과 텍스트 사이의 간격을 설정 */
		    vertical-align: middle; /* 라디오 버튼과 텍스트가 수직으로 정렬되도록 설정 */
		}
		.row label {
		    line-height: 2; /* 라디오 버튼과 텍스트 사이의 수직 간격을 조정 */
		}
		input[type="file"] {
		    margin: 5px 0 15px 0; /* 파일 업로드와 다음 요소 사이의 간격을 설정 */
		}
		.form-buttons {
		    display: flex; /* 버튼들을 수평으로 배치 */
		    justify-content: center; /* 버튼들을 수평 가운데로 정렬 */
		    gap: 10px; /* 버튼 사이의 간격 설정 */
		}
		.close {
		    color: #aaa;
		    float: right;
		    font-size: 28px;
		    font-weight: bold;
		}
		.close:hover,
		.close:focus {
		    color: black;
		    text-decoration: none;
		    cursor: pointer;
		}
		#openModal {
		    display: inline-block;
		    padding: 10px 20px;
		    margin-top: 10px;
		    border: none;
		    border-radius: 5px;
		    background-color: #007BFF;
		    color: white;
		    cursor: pointer;
		}
		button[type="reset"] {
		    background-color: #6c757d;
		}
		
		#openModal:hover {
		    background-color: #0056b3;
		}
		
		button[type="reset"]:hover {
		    background-color: #5a6268;
		}
		
		.loading-overlay {
		    display: none; /* 기본적으로 숨김 */
		    position: absolute; /* 모달 내용 위에 위치 */
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    background-color: rgba(255, 255, 255, 0.8); /* 반투명 흰색 배경 */
		    z-index: 10; /* 모달 내용보다 위에 표시 */
		    justify-content: center; /* 중앙 정렬 */
		    align-items: center; /* 수직 중앙 정렬 */
		    font-size: 24px; /* 텍스트 크기 */
		    color: #007BFF; /* 텍스트 색상 */
		}
    </style>
</head>
<body>
    <div class="container">
        <h1>마이 페이지</h1>
        
        <!-- 회원 정보 수정 폼 -->
        <form id="userForm" action="${pageContext.request.contextPath}/user/updateProfile" method="post">
            <input type="hidden" id="user_num" name="user_num" value="${user_info.user_num}">
            <h3>회원정보 수정</h3>
            <table>
                <tr>
                    <th>이름</th>
                    <td><input type="text" name="user_name" value="${user_info.user_name}" disabled></td>
                </tr>
                <tr>
				    <th>이메일</th>
				    <td>
				        <c:choose>
				            <c:when test="${not empty user_info.user_email}">
				                <input type="email" value="${user_info.user_email}" disabled>
				                <input type="hidden" name="user_email" value="${user_info.user_email}">
				            </c:when>
				            <c:otherwise>
				                <input type="email" value="${user_info.social_user_email}" disabled>
				                <input type="hidden" name="user_email" value="${user_info.social_user_email}">
				            </c:otherwise>
				        </c:choose>
				    </td>
				</tr>
                <tr>
                    <th>전화번호</th>
                    <td><input type="tel" name="user_phone" value="${user_info.user_phone}" disabled></td>
                </tr>
                <tr>
                    <th>관심 키워드</th>
                    <td><input type="text" name="user_interest" value="${user_info.user_interest}" disabled></td>
                </tr>
            </table>
            <button type="button" id="editButton" class="btn">수정하기</button>
            <input type="submit" value="저장하기" class="btn" disabled>
        </form>
		
		<br/><br/>
		<h3>문의 내역</h3>
		<table id="inquiryTable">
		    <thead>
		        <tr>
		            <th>종류</th>
		            <th>내용</th>
		            <th>등록일</th>
		            <th>진행상태</th>
		        </tr>
		    </thead>
		    <tbody>
		    <!-- 테이블 목록 -->
		    </tbody>
		</table>
		<button id="openModal">문의하기</button>
	</div>

	<div id="myModal" class="modal">
	    <div class="modal-content">
	        <span class="close">&times;</span>
	        <form id="useForm" action="${pageContext.request.contextPath}/user/formSubmit" method="post" enctype="multipart/form-data">
	            <label for="purpose">문의종류 *</label>
	            <div class="row">
	                <label><input type="radio" name="purpose" value="건의사항" required> 건의합니다</label>
	                <label><input type="radio" name="purpose" value="칭찬사항" required> 칭찬합니다</label>
	                <label><input type="radio" name="purpose" value="기타" required> 기타</label>
	            </div>
	            <br>
	            <textarea name="details" placeholder="내용을 입력하세요" maxlength="250" required></textarea>
	            <br>
	            <input type="file" name="attachment">
	            <br>
	            <div class="form-buttons">
	                <button id="submitBtn" type="submit">제출</button>
	                <button type="reset">취소</button>
	            </div>
	        </form>
	        <div id="loadingOverlay" class="loading-overlay">Loading...</div>
	    </div>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
	    document.getElementById('editButton').addEventListener('click', function() {
	        // Enable the input fields except email
	        var inputs = document.querySelectorAll('#userForm input[type="text"], #userForm input[type="tel"]');
	        inputs.forEach(function(input) {
	            input.disabled = false;
	        });
	
	        // Enable the submit button
	        document.querySelector('#userForm input[type="submit"]').disabled = false;
	    });
        
     	// 문의 테이블 로드
    	function loadInquiries() {
    	    $.ajax({
    	        url: `${pageContext.request.contextPath}/user/inquiries`,
    	        type: 'GET',
    	        dataType: 'json',
    	        data: { userNum: ${user_info.user_num} },
    	        success: function(data) {
    	        	console.log('Data received:', data);
    	            const tableBody = $('#inquiryTable tbody');
    	            tableBody.empty(); // 비우기
    	            
    	         	// 날짜 포맷팅 옵션
    	            const options = { year: "numeric", month: "2-digit", day: "2-digit", hour: "2-digit", minute: "2-digit" };
    	         	// 데이터가 올바르게 받았는지 확인
                    if (Array.isArray(data) && data.length) {
                        data.forEach(inquiry => {
                            // inquiry 객체의 값을 제대로 가져오는지 확인
                            console.log('Processing inquiry:', inquiry);
                         	// 날짜 문자열을 Date 객체로 변환
                            const date = new Date(inquiry.inquiry_regdate);
                            // 한국 시간 형식으로 포맷
                            const formattedDate = date.toLocaleString("ko-KR", options);
                            
                            const row = $('<tr></tr>');
                            $('<td></td>').text(inquiry.inquiry_purpose || 'N/A').appendTo(row);
                            $('<td></td>').text(inquiry.inquiry_details || 'N/A').appendTo(row);
                            $('<td></td>').text(formattedDate || 'N/A').appendTo(row);
                            $('<td></td>').text(inquiry.inquiry_progress || 'N/A').appendTo(row);
                            tableBody.append(row);
                        });
                    } else {
                        console.log('No inquiries to display');
                        tableBody.append('<tr><td colspan="4">문의 내역이 없습니다.</td></tr>');
                    }
    	        },
    	        error: function(xhr, status, error) {
    	            console.error('Error loading inquiries:', error);
    	        }
    	    });
    	}
    	$(document).ready(function() {
    	    loadInquiries();
    	});
    	
    	// 모달 열기 버튼과 모달 요소
    	var modal = $('#myModal');
    	var btn = $('#openModal');
    	var span = $('.close');
    	var submitBtn = $('#submitBtn');
    	var loadingOverlay = $('#loadingOverlay');
    	
    	// 버튼 클릭 시 모달 열고 닫기
    	$("#openModal").click(function() {
            $("#myModal").show();
        });

        $(".close").click(function() {
            $("#myModal").hide();
        });
    	
    	// 폼 제출 시 Ajax로 처리
    	$('#useForm').on('submit', function(event) {
    	    event.preventDefault(); // 폼 제출을 방지
    	    const form = $(this);
    	    
    	    // 로딩 상태로 변경
    	    submitBtn.prop('disabled', true); // 버튼 비활성화
    	    loadingOverlay.show(); // 로딩 오버레이 표시
    	    loadingOverlay.css('display', 'flex'); // 로딩 오버레이 표시
    	
    	    var formData = new FormData(form[0]);
    	    $.ajax({
    	        url: form.attr('action'),
    	        type: 'POST',
    	        data: formData,
    	        processData: false,
    	        contentType: false,
    	        success: function(data) {
    	            alert('문의가 성공적으로 제출되었습니다'); // 서버로부터 받은 메시지를 alert로 표시
    	            form[0].reset(); // 폼 내용 초기화
    	            submitBtn.prop('disabled', false); // 버튼 활성화
    	            loadingOverlay.css('display', 'none');
    	            loadingOverlay.hide(); // 로딩 오버레이 숨기기
    	            modal.hide(); // 폼 제출 후 모달 닫기
    	            loadInquiries(); // 문의 내역 새로 로드
    	        },
    	        error: function(xhr, status, error) {
    	            console.error('Error:', error);
    	            alert('문의 제출 중 오류가 발생했습니다.');
    	            submitBtn.text('제출'); // 버튼 텍스트 원상복구
    	            submitBtn.prop('disabled', false); // 버튼 활성화
    	            loadingOverlay.css('display', 'none');
    	            loadingOverlay.hide(); // 로딩 오버레이 숨기기
    	        }
    	    });
    	});
    </script>
</body>
</html>
