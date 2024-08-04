<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f2f2f2;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .container {
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        width: 100%;
    }
    h1 {
        text-align: center;
        color: #333;
    }
    .textbox {
        margin-bottom: 15px;
    }
    .textbox label {
        display: block;
        margin-bottom: 5px;
        color: #333;
    }
    .textbox input {
        width: calc(100% - 20px);
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 16px;
    }
    .error {
        color: red;
        font-size: 14px;
    }
    #check {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        border: none;
        border-radius: 5px;
        color: white;
        font-size: 16px;
        cursor: pointer;
    }
    #check:hover {
        background-color: #0056b3;
    }
    #pattern-error, #same {
        color: red;
        font-size: 0.875em; /* Reduce font size */
        display: block;
        margin-top: 5px;
    }
    .modal {
        display: none; 
        position: fixed; 
        z-index: 1; 
        left: 0;
        top: 0;
        width: 100%; 
        height: 100%; 
        overflow: auto; 
        background-color: rgb(0,0,0); 
        background-color: rgba(0,0,0,0.4); 
    }
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto; 
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        max-width: 300px;
        text-align: center;
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
    .modal-footer {
        margin-top: 15px;
    }
    .modal-footer button {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        border: none;
        cursor: pointer;
    }
    .modal-footer button:hover {
        background-color: #45a049;
    }
</style>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
    $(document).ready(function() {
        var PatternPw = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*(),.? ":{}|<>])[A-Za-z\d!@#$%^&*(),.?":{}|<>]{8,}$/;

        function isSame() {
            var pw1 = $('#pw').val();
            var pw2 = $('#pw2').val();
            if (pw1 !== pw2) {
                $('#same').text('비밀번호가 일치하지 않습니다.');
                return false;
            } else {
                $('#same').text('');
                return true;
            }
        }
        
        function validatePassword() {
            var pw = $('#pw').val();
            if (!PatternPw.test(pw)) {
                $('#pattern-error').text('비밀번호는 최소 8자 이상이며, 대문자, 소문자, 숫자 및 특수 문자를 포함해야 합니다.');
                return false;
            } else {
                $('#pattern-error').text('');
                return true;
            }
        }
        
        $('#pw').on('keyup', function() {
            validatePassword();
        });

        $('#pw2').on('blur', function() {
            isSame();
        });

        $('check').on('submit', function(event) {
            if (!isSame() || !validatePassword()) {
                event.preventDefault();
            } else {
                event.preventDefault(); 
                showModal("비밀번호가 성공적으로 변경되었습니다.");
            }
        });
    });

    function showModal(message) {
        $('#modalMessage').text(message);
        $('#messageModal').css("display", "block");
    }
    
    function redirectToLogin() {
        window.location.href = '<%=request.getContextPath()%>/login';
    }

    window.onclick = function(event) {
        var modal = document.getElementById('messageModal');
        if (event.target == modal) {
            modal.style.display = "none";
            redirectToLogin();
        }
    }

    document.onkeydown = function(event) {
        if (event.key === "Escape") {
            document.getElementById('messageModal').style.display = "none";
            redirectToLogin();
        }
    }

    document.addEventListener('DOMContentLoaded', function() {
        <% if (request.getAttribute("message") != null) { %>
            showModal('<%=request.getAttribute("message")%>');
        <% } %>
    });
</script>
</head>
<body>
    <div class="container">
        <h1>비밀번호 변경</h1>

        <!-- Display messages -->
        <c:if test="${not empty error}">
            <p class="error">${error}</p>
        </c:if>

        <form action="${pageContext.request.contextPath}/YM/pw_new.me" method="POST" class="content">
            <div class="textbox">
                <label for="pw">새 비밀번호</label>
                <input id="pw" name="pw" type="password" placeholder="새 비밀번호" required />
                <span id="pattern-error"></span>
            </div>
            <div class="textbox">
                <label for="pw2">새 비밀번호 확인</label>
                <input id="pw2" name="pw2" type="password" placeholder="새 비밀번호 확인" required />
                <span id="same"></span>
            </div>
            <input type="submit" id="check" value="비밀번호변경">
            <input type="hidden" name="email" value="${email}">
        </form>

        <!-- Custom Modal -->
        <div id="messageModal" class="modal">
          <div class="modal-content">
            <span class="close" onclick="redirectToLogin()">&times;</span>
            <p id="modalMessage"></p>
            <div class="modal-footer">
                <button onclick="redirectToLogin()">OK</button>
            </div>
          </div>
        </div>
    </div>
</body>
</html>
