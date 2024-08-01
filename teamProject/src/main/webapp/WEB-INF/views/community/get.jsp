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
    background-color: #f4f4f4;
}

h1 {
    color: #333;
}

/* 게시글 상세 보기 */

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
    margin-top: 20px;
}

.button-group a, .button-group button {
    background: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 10px 15px;
    text-decoration: none;
    font-size: 16px;
    cursor: pointer;
    margin-right: 10px;
    transition: background 0.3s ease;
}

.button-group a:hover, .button-group button:hover {
    background: #0056b3;
}

/* 댓글 목록 */
#commentList {
    margin-top: 20px;
}

.comment-item {
    background: #fafafa;
    padding: 10px;
    border-radius: 4px;
    margin-bottom: 10px;
    box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
}

.comment-content {
    font-size: 14px;
    margin-bottom: 5px;
}

.comment-item span {
    display: block;
    color: #666;
}

.comment-item button {
    background: #dc3545;
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 5px 10px;
    font-size: 14px;
    cursor: pointer;
    margin-right: 5px;
    transition: background 0.3s ease;
}

.comment-item button:hover {
    background: #c82333;
}

/* 댓글 작성 및 수정 모달 */
textarea {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 14px;
    box-sizing: border-box;
    margin-bottom: 10px;
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
}

#submitEditComment, #cancelEditComment {
    background: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    padding: 10px 15px;
    font-size: 16px;
    cursor: pointer;
    margin-right: 10px;
    transition: background 0.3s ease;
}

#submitEditComment:hover, #cancelEditComment:hover {
    background: #0056b3;
}

#cancelEditComment {
    background: #6c757d;
}

#cancelEditComment:hover {
    background: #5a6268;
}
</style>
<head>
    <title>게시글 상세보기</title>
 
</head>
<body>
    <h1>게시글 상세보기</h1>
    <div>
        <label>글 번호:</label> <span>${board.community_bno}</span>
    </div>
    <div>
        <label>제목:</label> <span>${board.community_title}</span>
    </div>
    <div>
        <label>내용:</label> <span>${board.community_content}</span>
    </div>
    <div class="img-group">
        <c:if test="${not empty board.community_filename}">
            <img src="/image/${board.community_bno}/${board.community_filename}" alt="게시글 이미지" />
        </c:if>
    </div>
    <div>
        <label>작성일:</label> <span>${board.community_regdate}</span>
    </div>
    <div>
        <label>작성자:</label> <span>${board.writer}</span>
    </div>
    <div>
        <label>조회수:</label> <span>${board.community_viewcnt}</span>
    </div>

    <div class="button-group">
		<a href="${pageContext.request.contextPath}/community/list?pageNum=${param.pageNum}&amount=${param.amount}&type=${param.type}&keyword=${param.keyword}&area=${param.area}">목록으로</a>
        <c:if test="${board.user_num eq sessionScope.user_info.user_num}">
            <a href="${pageContext.request.contextPath}/community/modify?community_bno=${board.community_bno}">수정하기</a>
            <form id="deleteForm" action="${pageContext.request.contextPath}/community/remove" method="post" style="display: inline;">
                <input type="hidden" name="community_bno" value="${board.community_bno}" />
                <button type="button" id="deleteButton">삭제하기</button>
            </form>
        </c:if>
    </div>

   <!-- 댓글 목록 -->
   <div id="commentList">
      <c:forEach var="comment" items="${comments}">
        <div class="comment-item">
            <p class="comment-content">${comment.community_com_content}</p>
            <span>작성자: ${comment.comment_writer}&nbsp</span>
            <span>작성일: ${comment.community_com_regdate}</span>
            <c:if test="${comment.user_num == sessionScope.user_info.user_num}">
                <button class="edit-comment-btn" data-comment-id="${comment.community_cno}">수정</button>
                <button class="delete-comment-btn" data-comment-id="${comment.community_cno}">삭제</button>
            </c:if>
        </div>
    </c:forEach>
</div>
    <!-- 댓글 작성 폼 -->
    <div>
   	 <c:if test="${not empty user_email }">
   	         <h3>댓글 작성하기</h3>
        <textarea id="newCommentContent" rows="4" placeholder="댓글을 입력하세요"></textarea>
        <button id="submitComment">댓글 등록</button>
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
            var commentListHtml = "";
            $.each(comments, function(index, comment) {
                var date = new Date(comment.community_com_regdate);
                var formattedDate = date.toLocaleDateString() + ' ' + date.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });

                commentListHtml += "<div class='comment-item'>" +
                    "<p class='comment-content'>" + comment.community_com_content + "</p>" +
                    "<span>작성자: " + (comment.comment_writer ? comment.comment_writer : 'Unknown') + "</span>" +
                    "<span>작성일: " + formattedDate + "</span>";

                if (comment.user_num == userNum) {
                    commentListHtml += "<button class='edit-comment-btn' data-comment-id='" + comment.community_cno + "'>수정</button>" +
                        "<button class='delete-comment-btn' data-comment-id='" + comment.community_cno + "'>삭제</button>";
                }

                commentListHtml += "</div>";
            });
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