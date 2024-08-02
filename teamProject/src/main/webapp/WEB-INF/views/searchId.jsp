<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>동네26 - 아이디 찾기</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
//핸드폰 번호 숫자만 입력
function onlyNumber() {
	  if((event.keyCode >= 48 && event.keyCode < 57) 
	   || event.keyCode == 8 // backspace
	   || event.keyCode == 37 || event.keyCode == 39 // 방향키
	   || event.keyCode == 46 // delete키
	   || event.keyCode == 39){
	  }else{
		  event.returnValue=false;
	  }
	}

	$(document).ready(function() {
		$("#user_phone").on("keydown", onlyNumber);
		
		$("#searchId").on("click", function(event) {
			event.preventDefault();
			var user_name = $("#user_name").val();
			console.log("이름 들어오니?");
			var user_phone = $("#user_phone").val();
			console.log("번호 들어오니?");

			$.ajax({
				url: "${pageContext.request.contextPath}/basic/searchId",
				type: "post",
				data: {user_name : user_name, user_phone : user_phone},
				success: function (data) {
					if(data === "not found"){
						$("#searchIdResult").text("일치하는 아이디가 없습니다.");
					}else{
						$("#searchIdResult").text("회원님의 아이디는 "+ data +"입니다.");
					}
				},
				 error: function(xhr, status, error) {
                     console.log("AJAX error:", error);
                 }
			});
		});
	});
</script>
</head>
<body>
    <h1>아이디 찾기</h1>
    <form id="searchIdForm" action="${pageContext.request.contextPath}/basic/searchId" method="post">
        <div class="form-group">
            <input type="text" id="user_name" name="user_name" placeholder="이름" required>
        </div>
        <div class="form-group">
            <input type="text" id="user_phone" onkeydown="onlyNumber();" name="user_phone" placeholder="휴대폰 번호" required>
        </div>
        <button id="searchId">아이디 찾기</button>
        <span id="searchIdResult"></span>
    </form>
</body>
</html>