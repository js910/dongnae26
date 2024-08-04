<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../includes/header.jsp"%>

        
        <!-- Header Start -->
        <div class="container-fluid bg-breadcrumb">
            <div class="container text-center py-5" style="max-width: 900px;">
                <h3 class="text-white display-3 mb-4">게시글 상세보기</h3>
                <ol class="breadcrumb justify-content-center mb-0">
                </ol>    
            </div>
        </div>
        <!-- Header End -->
<head>
<style type="text/css">
body {
    font-family: Arial, sans-serif;
    line-height: 1.6;
    margin: 0;
    padding: 0;
    color: #333;
    background-color: #f4f4f4;
}

.container2 {
    width: 70%;
    margin: 0 auto;
    background: #fff;
    padding: 20px;
    border: 1px solid #ddd;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.header table {
    width: 100%;
    margin-bottom: 20px;
    border-collapse: collapse;
}

.header td {
    padding: 8px;
    padding-right: 30px;
    border-bottom: 1px solid #ddd;
    border-top: 1px solid #ddd;
}

.header .title {
    font-weight: bold;
    background-color: #f0f0f0;
    width: 15%;
}

.posting {
	border-top: 1px solid #ddd; 
	border-bottom: 1px solid #ddd;
	padding-bottom: 20px;
}

h1 {
    color: #333;
}

/* 게시글 상세 보기 */

.content{
	white-space: pre-wrap; /* 줄바꿈과 공백을 유지합니다. */
    word-wrap: break-word;
}

label {
    font-weight: bold;
    
}

.img-group img {
    max-width: 100%;
    height: auto;
    border-radius: 4px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.button-group {
    display: flex;
    align-items: center; /* 수직 정렬을 위해 */
    margin-top: 5px;
    margin-bottom: 50px;
}

.button-group a, .button-group button {
    background: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 10px 10px;
    text-decoration: none;
    font-size: 14px;
    cursor: pointer;
    margin-right: 5px;
    transition: background 0.3s ease;
}

.button-group a:hover, .button-group button:hover {
    background: #0056b3;
}

#button-group1 {
    margin-left: auto; /* 오른쪽으로 배치 */
}

/* 댓글 목록 */
#commentList {
    margin-top: 20px;
}

.comment-item {
    padding: 8px; /* 패딩 조정 */
    border-radius: 4px;
    margin-bottom: 20px; /* 아이템 간 간격 조정 */
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
    background-color: #fff; /* 배경 색상 흰색으로 설정 */
    position: relative; /* 버튼 그룹을 절대 위치로 배치하기 위한 설정 */
}

.comment-content {
    font-size: 13px; /* 폰트 사이즈 줄이기 */
    margin-top: 15px;
    margin-left:15px;
    color: #333; /* 글자 색상 */
    white-space: pre-line; 
}

.comment-item span {
    display: block;
    margin-top: 15px;
    margin-left:15px;
    margin-bottom:15px;
    font-size: 13px; /* 폰트 사이즈 줄이기 */
    color: #666; /* 글자 색상 */
     white-space: pre-line; 
}

.comment-item button {
    background: #5bc1ac; /* 버튼 배경 색상 변경 */
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 5px 10px;
    font-size: 12px; /* 폰트 사이즈 줄이기 */
    cursor: pointer;
    margin-bottom: 10px; /* 버튼 그룹 간 간격 */
    transition: background 0.3s ease;
}

.comment-item button:hover {
    background: #4a9e94; /* 호버 시 색상 변경 */
}

.comment-divider {
    border-top: 1px solid #ddd; /* 연한 구분선 */
    margin-top: 10px; /* 위쪽 간격 추가 */
}

/* 버튼 그룹을 오른쪽으로 정렬 */
.button-group {
    display: flex;
    justify-content: flex-end; /* 버튼들을 오른쪽으로 정렬 */
    gap: 5px; /* 버튼 간 간격 */
    margin-bottom: 5px; /* 버튼 그룹의 아래쪽 여백 */
}



/* 댓글 작성 및 수정 모달 */
textarea {
    width: 100%;
    padding: 8px; /* 줄여서 패딩을 조정 */
    border: 1px solid #5A6F80; /* 색상 변경 */
    border-radius: 4px;
    font-size: 12px; /* 폰트 사이즈를 줄임 */
    box-sizing: border-box;
    margin-bottom: 10px;
    white-space: pre-line; 
}

#editCommentModal {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 80%;
    max-width: 600px;
    background: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

#editCommentModal h2 {
    margin-top: 0;
    font-size: 18px; /* 헤딩 폰트 사이즈 조정 */
    color: #007bff; /* 헤딩 색상 변경 */
}

#submitEditComment, #cancelEditComment {
    background: #007bff; /* 버튼 배경 색상 변경 */
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 8px 12px; /* 패딩 조정 */
    font-size: 14px; /* 폰트 사이즈 조정 */
    cursor: pointer;
    margin-right: 10px;
    transition: background 0.3s ease;
}

#submitEditComment:hover {
    background: #0056b3; /* 호버 시 색상 변경 */
}

#cancelEditComment {
    background: #5A6F80; /* 버튼 배경 색상 변경 */
}

#cancelEditComment:hover {
    background: #4a5d6e; /* 호버 시 색상 변경 */
}

/* 버튼 기본 스타일 */
.btn-info {
  	background: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 10px 10px;
    text-decoration: none;
    font-size: 14px;
    cursor: pointer;
    margin-right: 5px;
    transition: background 0.3s ease;
}

.custom-form {
    display: flex;
    flex-direction: column;
    align-items: flex-start; /* 기본적으로 왼쪽 정렬 */
}

.custom-form button {
    align-self: flex-end; /* 버튼을 오른쪽으로 정렬 */
    margin-top: 10px; /* 버튼과 위의 텍스트 영역 사이의 여백 */
}

.content {
    margin-left: 20px; /* 왼쪽 여백 20px */
}

</style>
<head>
<title>게시글 상세보기</title>
 
</head>
<body>
    <div class="container2">
    	<div class="posting">
	        <div class="header">
	            <table>
	                <tr>
	                    <td class="title">제목</td>
	                    <td>${board.community_title}</td>
	                </tr>
	            	<tr>
	            		<td class="title">작성자</td>
	            		<td>${board.writer}</td>
	            		<td class="title">작성일</td>
	            		<td>${board.formattedRegdate}</td>
	            		<td class="title">조회수</td>
	            		<td>${board.community_viewcnt}</td>
	            	</tr>
	            </table>
	        </div>
		
		    <div class="content">
	        	<span>${board.community_content}</span>
	    	</div>
	    	<div class="attachments">
	        	<c:if test="${not empty board.community_filename}">
	            <img src="/image/${board.community_bno}/${board.community_filename}" alt="게시글 이미지" />
	        	</c:if>
	    	</div>
		</div>
		
	    <div class="button-group"> 
			<a href="${pageContext.request.contextPath}/community/list?pageNum=${param.pageNum}&amount=${param.amount}&type=${param.type}&keyword=${param.keyword}&area=${param.area}">목록으로</a>    
	        <c:if test="${board.user_num eq sessionScope.user_info.user_num}">
	            <div id="button-group1">
	            <a href="${pageContext.request.contextPath}/community/modify?community_bno=${board.community_bno}">수정하기</a>
	            <form id="deleteForm" action="${pageContext.request.contextPath}/community/remove" method="post" style="display: inline;">
	                <input type="hidden" name="community_bno" value="${board.community_bno}" />
	                <a href="#" id="deleteButton">삭제하기</a>
	            </form>
	            </div>
	        </c:if>
	    </div>

   		<!-- 댓글 목록 -->
		<div id="commentList">
		<div class="comment-item">
    		<c:forEach var="comment" items="${comments}">
          		  <span><b>작성자: ${comment.comment_writer}&nbsp&nbsp작성일: ${comment.formattedRegdate}</b></span>
          		   <p class="comment-content">${comment.community_com_content}</p>
         	   <c:if test="${comment.user_num == sessionScope.user_info.user_num}">
           	   	 <div class="button-group"> 
           	   	    <button class="btn btn-info" id="edit-comment-btn" data-comment-id="${comment.community_cno}">수정</button>
            	    <button class="btn btn-info" id="delete-comment-btn" data-comment-id="${comment.community_cno}">삭제</button>
            	 </div>   
            </c:if>
      		 <div class="comment-divider"></div> <!-- 구분선 추가 -->
   			 </c:forEach>
   			 </div>
		</div>
		<!-- 댓글 작성 폼 -->
	    <div class="custom-form subscribe-form">
	   	 <c:if test="${not empty user_email }">

	        <textarea id="newCommentContent" rows="4" placeholder="댓글을 입력하세요"></textarea>
	        <button class="btn btn-info" id="submitComment">댓글 등록</button>
	     </c:if>
	    </div>

    	<!-- 댓글 수정 모달 -->
	    <div id="editCommentModal">
	        <h2>댓글 수정하기</h2>
	        <input type="hidden" id="editCommentCno" />
	        <textarea id="editCommentContent" rows="4"></textarea>
	        <button id="submitEditComment">수정 완료</button>
	        <button id="cancelEditComment">취소</button>
	    </div>
	</div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
    $(document).ready(function() {
        const boardId = ${board.community_bno};
        const userNum = '${sessionScope.user_info.user_num}';

        function submitEditComment() {
            var formData = {
                community_com_content: $("#editCommentContent").val(),
                community_cno: $("#editCommentCno").val(),
                community_bno: boardId,
                user_num: userNum
            };

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/community/modifyComment",
                data: JSON.stringify(formData),
                contentType: "application/json; charset=utf-8",
                headers: { "Accept": "application/json" },
                success: function(response) {
                    updateCommentList(response);
                    $("#editCommentModal").hide();
                    alert("댓글 수정이 완료되었습니다.");
                },
                error: function(xhr, status, error) {
                    alert("댓글 수정에 실패하였습니다.");
                }
            });
        }

        function submitComment() {
            var commentContent = $("#newCommentContent").val().trim();

            if (commentContent === "") {
                alert("내용을 입력하세요.");
                return;
            }

            var formData = {
                community_com_content: commentContent,
                community_bno: boardId,
                user_num: userNum
            };

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/community/registerComment",
                data: JSON.stringify(formData),
                contentType: "application/json; charset=utf-8",
                headers: { "Accept": "application/json" },
                success: function(response) {
                    updateCommentList(response);
                    $("#newCommentContent").val("");
                    alert("댓글이 등록되었습니다.");
                },
                error: function(xhr, status, error) {
                    alert("댓글 등록에 실패하였습니다.");
                }
            });
        }

        
        function updateCommentList(comments) {
            var commentListHtml = "<div class='comment-item'>"; // 전체 div 시작
            $.each(comments, function(index, comment) {
                var date = new Date(comment.community_com_regdate);
                var year = date.getFullYear();
                var month = ('0' + (date.getMonth() + 1)).slice(-2);
                var day = ('0' + date.getDate()).slice(-2);
                var hours = ('0' + date.getHours()).slice(-2);
                var minutes = ('0' + date.getMinutes()).slice(-2);

                var formattedDate = year + '-' + month + '-' + day + " " + hours + ':' + minutes;

                commentListHtml += 
                	 "<span><b>작성자:</b> <b>" + (comment.comment_writer ? comment.comment_writer : 'Unknown') + 
                	    "</b>&nbsp;&nbsp;<b>작성일:</b> <b>" + formattedDate + "</b></span>" +
                    "<p class='comment-content'>" + comment.community_com_content + "</p>";

                    if (comment.user_num == userNum) {
                        commentListHtml +=  
                            "<div class='button-group'>" + 
                            "<button class='btn btn-info edit-comment-btn' data-comment-id='" + comment.community_cno + "'>수정</button>" +
                            "<button class='btn btn-info delete-comment-btn' data-comment-id='" + comment.community_cno + "'>삭제</button>" +
                            "</div>" +
                            "<div class='comment-divider'></div>"; // 구분선 추가
                    }
            });
            commentListHtml += "</div>"; // 전체 div 끝
            $("#commentList").html(commentListHtml);
        }


        $("#commentList").on("click", ".edit-comment-btn", function() {
            var commentId = $(this).data("comment-id");
            var commentContent = $(this).siblings(".comment-content").text();
            $("#editCommentCno").val(commentId);
            $("#editCommentContent").val(commentContent);
            $("#editCommentModal").show();
        });

        $("#submitEditComment").click(function() {
            submitEditComment();
        });

        $("#cancelEditComment").click(function() {
            $("#editCommentModal").hide();
        });

        $("#submitComment").click(function() {
            submitComment();
        });

        $("#commentList").on("click", ".delete-comment-btn", function() {
            var commentId = $(this).data("comment-id");
            if (confirm("정말로 이 댓글을 삭제하시겠습니까?")) {
                $.ajax({
                    type: "POST",
                    url: "${pageContext.request.contextPath}/community/removeComment",
                    data: JSON.stringify({ community_cno: commentId }),
                    contentType: "application/json; charset=utf-8",
                    headers: { "Accept": "application/json" },
                    success: function(response) {
                        updateCommentList(response);
                        alert("삭제되었습니다");
                    },
                    error: function(xhr, status, error) {
                        alert("댓글 삭제에 실패하였습니다.");
                    }
                });
            }
        });

        $("#deleteButton").click(function() {
            if (confirm("정말로 이 게시글을 삭제하시겠습니까?")) {
                $("#deleteForm").submit();
            }
        });
    });
</script>
     <%@include file="../includes/footer.jsp"%>
   </body>
</html>