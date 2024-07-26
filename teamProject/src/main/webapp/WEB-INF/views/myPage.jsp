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
            margin: 0;
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
        .btn {
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>마이 페이지</h1>
        
        <!-- 회원 정보 수정 폼 -->
        <form id="userForm" action="${pageContext.request.contextPath}/updateProfile" method="post">
            <input type="hidden" name="user_num" value="${user_info.user_num}">
            <table>
                <tr>
                    <th>이름</th>
                    <td><input type="text" name="user_name" value="${user_info.user_name}" disabled></td>
                </tr>
                <tr>
                    <th>이메일</th>
                    <td><input type="email" name="user_email" value="${user_info.user_email}" disabled></td>
                </tr>
                <tr>
                    <th>전화번호</th>
                    <td><input type="tel" name="user_phone" value="${user_info.user_phone}" disabled></td>
                </tr>
            </table>
            <button type="button" id="editButton" class="btn">수정하기</button>
            <input type="submit" value="저장하기" class="btn" disabled>
        </form>
    </div>

    <script>
        document.getElementById('editButton').addEventListener('click', function() {
            // Enable the input fields
            var inputs = document.querySelectorAll('#userForm input[type="text"], #userForm input[type="email"], #userForm input[type="tel"]');
            inputs.forEach(function(input) {
                input.disabled = false;
            });

            // Enable the submit button
            document.querySelector('#userForm input[type="submit"]').disabled = false;
        });
    </script>
</body>
</html>
