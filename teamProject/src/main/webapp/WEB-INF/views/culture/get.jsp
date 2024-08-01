<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="../includes/header.jsp"%>

	<style>
		.bookmark {
		    cursor: pointer;
		    width: 40px;
		    height: 40px;
		    background-image: url('/resources/images/star.png');
		    background-size: contain;
		    display: block;
		}
		.bookmarked {
		    background-image: url('/resources/images/yellow-star.png');
		}
	</style>


        <!-- About Start -->
        <div class="container-fluid about py-5">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-lg-5">
                        <div class="h-100" style="border: 50px solid; border-color: transparent #063604 transparent #063604;">
                            <img src="${dto.culture_img }" class="img-fluid w-100 h-100" alt="">
                        </div>
                    </div>
                    <div class="col-lg-7" style="background: linear-gradient(rgba(255, 255, 255, .8), rgba(255, 255, 255, .8)), url(#);">
                    	<div style="block;">
						 	<span id="bookmark" class="bookmark" onclick="toggleBookmark('${dto.culture_bno}', '${dto.culture_classify}','${dto.culture_title}','${dto.culture_place}')"></span>
						</div>
                        <h5 class="section-about-title pe-3">About Us</h5>
                        <h1 class="mb-4"><span class="text-primary"><c:out value="${dto.culture_title }"/></span></h1>
                        <div class="row gy-2 gx-4 mb-4">
                            <div>
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"><span class="text-primary"> 지역구: </span></i><c:out value="${dto.culture_area }"/></p>
                            </div>
                            <div>
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"><span class="text-primary"> 분류: </span></i><c:out value="${dto.culture_classify }"/></p>
                            </div>
                            <div>
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"><span class="text-primary"> 이용대상: </span></i><c:out value="${dto.culture_target }"/></p>
                            </div>
                            <div>
                                <p class="mb-0"><i class="fa fa-arrow-right text-primary me-2"><span class="text-primary"> 이용요금 여부: </span></i><c:out value="${dto.culture_booleanfee }"/></p>
                            </div>
                        </div>
                        <a class="btn btn-primary rounded-pill py-3 px-5 mt-2" href="${dto.culture_sitelink }">홈페이지 링크 바로가기</a>
                    </div>
                </div>
                <div>
                	<p class="mb-0" style="padding-top: 10px; padding-bottom: 10px;"><span class="text-primary">상세 위치 </span> <i class="fa fa-arrow-right text-primary me-2"></i></p>
                	<div id="map" style="width: 100%; height: 400px;"></div>
                </div>
                <a href="${pageContext.request.contextPath}/culture/list?pageNum=${cri.pageNum}&amount=${cri.amount}&keyword=${cri.keyword}&type=${cri.type}&area=${cri.area}&classify=${cri.classify}" class="btn btn-primary rounded-pill py-2 px-4 mt-4 float-end">go back to list</a>
            </div>
        </div>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=50c5816205d710d59a41cf8115b05655"></script>
	    <script type="text/javascript">
	        var mapContainer = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	        var mapOption = { //지도를 생성할 때 필요한 기본 옵션
	            center: new kakao.maps.LatLng(${dto.culture_lati_x}, ${dto.culture_longi_y}), //지도의 중심좌표.
	            level: 3 //지도의 레벨(확대, 축소 정도)
	        };
	
	        var map = new kakao.maps.Map(mapContainer, mapOption); //지도 생성 및 객체 리턴
	     
	     	// 마커가 표시될 위치입니다 
	        var markerPosition  = new kakao.maps.LatLng(${dto.culture_lati_x}, ${dto.culture_longi_y}); 

	        // 마커를 생성합니다
	        var marker = new kakao.maps.Marker({
	            position: markerPosition
	        });

	        // 마커가 지도 위에 표시되도록 설정합니다
	        marker.setMap(map);
	        
	        var mapLink = "https://map.kakao.com/link/map/${dto.culture_place}," + ${dto.culture_lati_x} + "," + ${dto.culture_longi_y};
	        var directionLink = "https://map.kakao.com/link/to/${dto.culture_place}," + ${dto.culture_lati_x} + "," + ${dto.culture_longi_y};

	        var iwContent = "<div class='info-content' style='padding:5px;max-width: 200px; overflow: auto; white-space: normal;'><c:out value="${dto.culture_place}"/><br><a href='" + mapLink + "' style='color:blue' target='_blank'>큰지도보기</a> " +
	            "<a href='" + directionLink + "' style='color:blue' target='_blank'>길찾기</a></div>";
	        iwPosition = new kakao.maps.LatLng(${dto.culture_lati_x}, ${dto.culture_longi_y}); //인포윈도우 표시 위치입니다

		    // 인포윈도우를 생성합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        position : iwPosition, 
		        content : iwContent,
		    });
		      
		    // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		    infowindow.open(map, marker); 
		    
	            var infoWindowContainer = document.querySelector('.info-content'); // Replace with actual class or selector

	            if (infoWindowContainer) {
	                var grandparentElement = infoWindowContainer.parentElement.parentElement; // Adjust as necessary
	                if (grandparentElement) {
	                    grandparentElement.style.boxSizing = 'content-box';
	                }
	            }
	            
	            $(document).ready(function() {
	                const bookmarked = ${bookmarked ? 'true' : 'false'};

	                if (bookmarked) {
	                    $("#bookmark").addClass("bookmarked");
	                }

	                window.toggleBookmark = function(culture_bno, culture_classify, culture_title, culture_place) {
	                    $.ajax({
	                        type: "POST",
	                        url: "/culture/bookmark",
	                        dataType: "json",
	                        data: {
	                            'culture_bno': culture_bno,
	                            'culture_classify': culture_classify,
	                            'culture_title': culture_title,
	                            'culture_place': culture_place
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
	   
        <%@include file="../includes/footer.jsp"%>