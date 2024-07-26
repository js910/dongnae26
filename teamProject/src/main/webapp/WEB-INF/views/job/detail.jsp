<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>채용 상세 정보</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            width: 60%;
            margin: 0 auto;
            background: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h1 {
            font-size: 24px;
            margin-bottom: 20px;
            border-bottom: 2px solid #333;
            padding-bottom: 10px;
        }
        .section {
            margin-bottom: 40px;
        }
        .section-title {
            font-size: 18px;
            font-weight: bold;
            color: #007bff;
            border-bottom: 2px solid #ddd;
            padding-bottom: 5px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .section-content {
            font-size: 16px;
        }
        .detail-item {
            margin-bottom: 10px;
        }
        .detail-item span {
            font-weight: bold;
            display: inline-block;
            width: 150px;
        }
        .contact-info {
            margin-top: 20px;
            padding: 10px;
            background-color: #e9ecef;
            border-left: 4px solid #007bff;
        }
        .back-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 15px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
        .back-link:hover {
            background-color: #0056b3;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
            width: 20%;
        }
        td {
            width: 80%;
        }
        .bookmark {
            cursor: pointer;
            width: 24px;
            height: 24px;
            background-image: url('/resources/images/star.png');
            background-size: contain;
        }
        .bookmarked {
            background-image: url('/resources/images/yellow-star.png');
        }
    </style>
    
</head>
<body>
    <div class="container">
        <h1>채용 상세 정보</h1>

        <div class="section">
            <div class="section-title">
                기본 정보
                <span id="bookmark" class="bookmark" onclick="toggleBookmark('${jobDetail.joRegistNo}','${jobDetail.cmpnyNm}','${jobDetail.bsnsSumryCn}')"></span>
            </div>
            <div class="section-content">
                <table>
                    <tr>
                        <th>구인 등록 번호</th>
                        <td>${jobDetail.joRegistNo}</td>
                    </tr>
                    <tr>
                        <th>회사명</th>
                        <td>${jobDetail.cmpnyNm}</td>
                    </tr>
                    <tr>
                        <th>사업 요약</th>
                        <td>${jobDetail.bsnsSumryCn}</td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="section">
            <div class="section-title">직무 정보</div>
            <div class="section-content">
                <table>
                    <tr>
                        <th>직무 내용</th>
                        <td>${jobDetail.dtyCn}</td>
                    </tr>
                    <tr>
                        <th>직무 코드</th>
                        <td>${jobDetail.jobcodeNm}</td>
                    </tr>
                    <tr>
                        <th>모집 인원</th>
                        <td>${jobDetail.rcritNmprCo} 명</td>
                    </tr>
                    <tr>
                        <th>학력 조건</th>
                        <td>${jobDetail.acdmcrNm}</td>
                    </tr>
                    <tr>
                        <th>경력 조건</th>
                        <td>${jobDetail.careerCndNm}</td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="section">
            <div class="section-title">근무 조건</div>
            <div class="section-content">
                <table>
                    <tr>
                        <th>희망 급여</th>
                        <td>${jobDetail.hopeWage}</td>
                    </tr>
                    <tr>
                        <th>근무 시간</th>
                        <td>${jobDetail.workTimeNm}</td>
                    </tr>
                    <tr>
                        <th>근무 형태</th>
                        <td>${jobDetail.holidayNm}</td>
                    </tr>
                    <tr>
                        <th>근무지 주소</th>
                        <td>${jobDetail.workPararBassAdresCn}</td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="section">
            <div class="section-title">전형 사항</div>
            <div class="section-content">
                <table>
                    <tr>
                        <th>접수 마감일</th>
                        <td>${jobDetail.receptClosNm}</td>
                    </tr>
                    <tr>
                        <th>전형 방법</th>
                        <td>${jobDetail.receptMthNm}</td>
                    </tr>
                    <tr>
                        <th>제출 서류</th>
                        <td>${jobDetail.presentnPapersNm}</td>
                    </tr>
                </table>
                <div class="detail-item">
                    ※ 방문, 우편, 팩스 등 오프라인 접수의 경우, 채용절차의 공정화에 관한 법률 제11조에 따라 구직자는 구인자에게 채용서류 반환을 요청할 수 있으며, 구인자는 본인임을 확인한 후 채용서류를 반환하여야 합니다.
                </div>
            </div>
        </div>

        <div class="section contact-info">
            <div class="section-title">담당자 정보</div>
            <div class="section-content">
                <div class="detail-item"><span>담당자 이름:</span> ${jobDetail.mngrNm}</div>
                <div class="detail-item"><span>담당자 전화번호:</span> ${jobDetail.mngrPhonNo}</div>
                <div class="detail-item"><a href="https://job.seoul.go.kr/www/job_offer_info/JobOfferInfo.do?method=selectJobOfferInfo" class="back-link">지원하러 가기</a></div>
            </div>
        </div>

         <a href="${pageContext.request.contextPath}/job/list?pageNum=${cri.pageNum}&amount=${cri.amount}&type=${cri.type}&keyword=${cri.keyword}" class="back-link">채용 목록으로 돌아가기</a>
    </div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
    const bookmarked = ${bookmarked ? 'true' : 'false'};

    if (bookmarked) {
        $("#bookmark").addClass("bookmarked");
    }

    window.toggleBookmark = function(joRegistNo, cmpnyNm, bsnsSumryCn) {
        $.ajax({
            type: "POST",
            url: "/job/bookmark",
            dataType: "json",
            data: {
                'joRegistNo': joRegistNo,
                'cmpnyNm': cmpnyNm,
                'bsnsSumryCn': bsnsSumryCn
            },
            success: function(response) {
                console.log("AJAX success response:", response);
                if (!response.loggedIn) {
                    alert("로그인이 필요한 기능입니다");
                    return;
                }

                if (response.bookmarked) {
                    $("#bookmark").addClass("bookmarked");
                    alert("북마크 완료");
                } else {
                    $("#bookmark").removeClass("bookmarked");
                    alert("북마크 취소");
                }
            },
            error: function(xhr, status, error) {
                console.log("AJAX error response:", status, error);
                alert("북마크 처리 중 오류가 발생했습니다. 상태: " + status + ", 오류: " + error);
            }
        });
    }

    
});
</script>


</body>
</html>

