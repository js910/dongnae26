<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../includes/header.jsp"%>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="fa fa-bars"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        <a href="../main" class="nav-item nav-link">Home</a>
                        <a href="/policy/list" class="nav-item nav-link">정책</a>
                        <a href="/job/list" class="nav-item nav-link">일자리 정보</a>
                        <a href="/culture/list" class="nav-item nav-link">문화·행사</a>
                        <a href="/community/list" class="nav-item nav-link active">커뮤니티</a>
                        <!-- 
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu m-0">
                                <a href="destination.html" class="dropdown-item">Destination</a>
                                <a href="tour.html" class="dropdown-item">Explore Tour</a>
                                <a href="booking.html" class="dropdown-item">Travel Booking</a>
                                <a href="gallery.html" class="dropdown-item">Our Gallery</a>
                                <a href="guides.html" class="dropdown-item">Travel Guides</a>
                                <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                                <a href="404.html" class="dropdown-item">404 Page</a>
                            </div>
                        </div>
                         -->
                        <!-- <a href="contact.html" class="nav-item nav-link">Contact</a> -->
                    </div>
                    <!-- <a href="" class="btn btn-primary rounded-pill py-2 px-4 ms-lg-4">Book Now</a> -->
                </div>
            </nav>
        <!-- Navbar & Hero End -->
        
        <!-- Header Start -->
        <div class="container-fluid bg-breadcrumb">
            <div class="container text-center py-5" style="max-width: 900px;">
                <h3 class="text-white display-3 mb-4">커뮤니티 게시판</h3>
                <ol class="breadcrumb justify-content-center mb-0">
                </ol>    
            </div>
        </div>
        <!-- Header End -->
<head>
    <title>게시글 상세보기</title>
 <style>
        .comment-item {
            border-bottom: 1px solid #ccc;
            padding: 10px 0;
            margin-bottom: 10px;
        }

        #editCommentModal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background: white;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            width: 90%;
            max-width: 600px;
            box-sizing: border-box;
        }

        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

        .img-group img {
            max-width: 25%;
            height: auto;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
        }

        .button-group {
            margin-top: 20px;
        }

        .button-group a, .button-group button {
            margin-right: 10px;
            padding: 10px 15px;
            text-decoration: none;
            color: #fff;
            background-color: #007BFF;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .button-group button {
            background-color: #dc3545;
        }

        #newCommentContent {
            width: calc(100% - 22px);
            height: 100px;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        #submitComment, #submitEditComment, #cancelEditComment {
            margin-top: 10px;
        }

        #submitComment {
            background-color: #28a745;
        }

        #submitEditComment {
            background-color: #007bff;
        }

        #cancelEditComment {
            background-color: #6c757d;
        }
    </style>
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
        <a href="${pageContext.request.contextPath}/community/list">목록으로</a>
        <a href="${pageContext.request.contextPath}/community/modify?community_bno=${board.community_bno}">수정하기</a>
        <form action="${pageContext.request.contextPath}/community/remove" method="post" style="display: inline;">
            <input type="hidden" name="community_bno" value="${board.community_bno}" />
            <button type="submit">삭제하기</button>
        </form>
    </div>

   <!-- 댓글 목록 -->
   <div id="commentList">
      <c:forEach var="comment" items="${comments}">
        <div class="comment-item">
            <p class="comment-content">댓글내용 : ${comment.community_com_content}</p>
            <span>작성자: ${comment.comment_writer}&nbsp</span>
            <span>작성일: ${comment.community_com_regdate}</span>
            <c:if test="${comment.user_num == sessionScope.user_info.user_num}">
                <button class="edit-comment-btn" data-comment-id="${comment.community_cno}">수정</button>
                <button class="delete-comment-btn" data-comment-id="${comment.community_cno}">삭제</button>
            </c:if>
        </div>
      </c:forEach>
	</div>

    <!-- 댓글 등록 -->
    <div>
        <h2>댓글 작성</h2>
        <textarea id="newCommentContent" placeholder="댓글을 작성하세요" required="required"></textarea>
        <button id="submitComment">댓글 등록</button>
    </div>

    <!-- 댓글 수정 모달 -->
    <div id="editCommentModal">
        <h2>댓글 수정</h2>
        <input type="hidden" id="editCommentCno">
        <textarea id="editCommentContent"></textarea>
        <button id="submitEditComment">수정 완료</button>
        <button id="cancelEditComment">취소</button>
    </div>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
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
                    type: "GET",
                    url: "${pageContext.request.contextPath}/community/removeComment",
                    data: { community_cno: commentId },
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
    });

    function submitEditComment() {
        var formData = {
            community_com_content: $("#editCommentContent").val(),
            community_cno: $("#editCommentCno").val(),
            community_bno: ${board.community_bno},
            user_num: ${sessionScope.user_info.user_num}
        };

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/community/modifyComment",
            data: JSON.stringify(formData),
            contentType: "application/json; charset=utf-8",
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
        var formData = {
            community_com_content: $("#newCommentContent").val(),
            community_bno: ${board.community_bno},
            user_num: ${sessionScope.user_info.user_num}
        };

        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/community/registerComment",
            data: JSON.stringify(formData),
            contentType: "application/json; charset=utf-8",
            success: function(response) {
                updateCommentList(response);
                $("#newCommentContent").val(""); // 등록 후 입력 필드 비우기
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
            if (comment.user_num == ${sessionScope.user_info.user_num}) {
                commentListHtml += "<button class='edit-comment-btn' data-comment-id='" + comment.community_cno + "'>수정</button>" +
                    "<button class='delete-comment-btn' data-comment-id='" + comment.community_cno + "'>삭제</button>";
            }
            commentListHtml += "</div>";
        });
        $("#commentList").html(commentListHtml);
    }
    </script>
<!-- Footer -->
        <%@include file="../includes/footer.jsp"%>
   </body>
</html>