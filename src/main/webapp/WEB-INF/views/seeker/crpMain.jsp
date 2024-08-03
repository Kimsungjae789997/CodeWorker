<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    .col-sm-5 {
        margin: 10px; /* 채용공고 간의 간격 */
    }
    
       .non-clickable {
       pointer-events: none;
       opacity: 0.6;
   }
   
   
</style>


        <!-- Start::app-content -->

                <div class="container" >

                    <!-- Start::row-1 -->
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="card custom-card">
                                <div class="card-body">
                                    <div class="d-flex flex-wrap align-items-top justify-content-between gap-2">
                                        <div>
                                            <div class="d-flex flex-wrap gap-2">
	                                            <div class="image-container" style="position: relative;">
												    <img src="${pageContext.request.contextPath}/resources/images/${corporationVO.crpInfoUrl}" style="display: block;  border-radius: 3%;">
												    <img src="${pageContext.request.contextPath}/resources/images/${corporationVO.crpLogoUrl}" style="width: 150px; border-radius: 20%; position: absolute; bottom: -70px; left: 0; border: 3px solid white;" class="img-thumbnail" alt="...">
												</div>
                                            </div>
												<br><br><br><br>
                                             <div>
                                                    <h2 style="font-weight: bold;">${corporationVO.crpName }<input type="hidden" value="${corporationVO.crpId }" id="crpId"><span id="crpId2"></span></h2> 
                                                  <div style="display: flex;">
                                                    <h4><i class="bx bx-receipt"></i>${corporationVO.crpTypeCode }</h4> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <h4><i class="bi bi-geo-alt me-1"></i>${corporationVO.crpAddress1 }</h4> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <h4><i class="bi bi-briefcase me-1"></i>${corporationVO.crpIndustryCode }</h4>
                                                  </div>       
                                             </div><br>
                                                     <h5>${corporationVO.crpInfo }</h5>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End::row-1 -->

                    <!-- Start::row-2 -->
                    <div class="row">
                        <div class="col-xl-12">
                        
                          <!--  채용중인 포지션 시작 -->    
                            <div class="card custom-card">
                                <div class="card-header">
                                    <div class="card-title"><h4 style="font-weight: bold;">채용중인 포지션</h4></div>
                                </div>
                                <div class="card-body">
                                    <div class="row" id="recruitmentData">	        

										<!--  채용공고 데이터 들어가는 곳 -->
											
                                    </div>
                                    <div  id="addBtn">
                                    	<!-- <button id="loadMore" class="btn btn-light btn-wave" style="display: none; width: 85%;">더보기</button> -->
                                	</div>
                                </div>
                            </div>
                            <!--  채용중인 포지션 끝 -->       
                            
                            <!--  위치 시작 -->                        
                            <div class="card custom-card">                           
                                <div class="card-header">
                                     <div class="card-title"><h4 style="font-weight: bold;">위치</h4></div>
                                </div>
                                 <div class="card-body">
									<div id="map" style="width:100%; height: 400px;"></div>																
								</div>
									<h5> &nbsp;&nbsp;&nbsp;${corporationVO.crpAddress1  } &nbsp;&nbsp;${corporationVO.crpAddress2  }</h5>
								<div>
								</div>
                            </div>
							<!--  위치 끝 -->       
							<!--  기업 정보 시작 -->
							<div class="card custom-card overflow-hidden">
                                <div class="card-header">
                                    <div class="card-title">
                                      <h4 style="font-weight: bold;">기업 정보</h4>
                                    </div>
                                </div>
                                <div class="card-body p-2">
                                    <div class="table-responsive">
                                        <table class="table table-responsive table-borderless">
                                            <tbody>
                                                <tr>
                                                    <td class="w-50">
                                                        <h5 style="font-weight: bold;">대표자 이름</h5>
                                                    </td>
                                                    <td><h5 style="font-weight: bold;">:&nbsp;${corporationVO.crpRepresentative }</h5></td>
                                                </tr>
                                                <tr>
                                                    <td class="w-50">
                                                         <h5 style="font-weight: bold;">회사 전화번호</h5>
                                                    </td>
                                                    <td><h5 style="font-weight: bold;">:&nbsp;${corporationVO.crpTel }</h5></td>
                                                </tr>
                                                <tr>
                                                    <td class="w-50">
                                                        <h5 style="font-weight: bold;">회사 메일</h5> 
                                                    </td>
                                                    <td><h5 style="font-weight: bold;">:&nbsp;${corporationVO.crpEmail }</h5></td>
                                                </tr>
                                                <tr>
                                                    <td class="w-50">
                                                       <h5 style="font-weight: bold;">회사 자본금</h5> 
                                                    </td>
                                                    <td><h5 style="font-weight: bold;"> :&nbsp;${corporationVO.crpCapitalstock }</h5></td>
                                                </tr>
                                                <tr>
                                                    <td class="w-50">
                                                        <h5 style="font-weight: bold;">재직자 수</h5> 
                                                    </td>
                                                    <td><h5 style="font-weight: bold;">:&nbsp; ${corporationVO.crpEmpNumber }</h5></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>					
							<!--  기업 정보 끝 -->
                        </div>
                    </div>
                    <!-- End::row-2 -->
                </div>
<input type="hidden" id="crpId" value="${corporationVO.crpId }">
<input type="hidden" id="crpAddress1" value="${corporationVO.crpAddress1  }">
<input type="hidden" id="crpAddress2" value="${corporationVO.crpAddress2  }">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8ad9ab9f536d30c70467e58473ff09a&libraries=services"></script>
<script>
$(function(){
	
 	
		// 카카오지도 시작
		var crpAddress1 = $("#crpAddress1").val();	// 일반주소 데이터
		var crpAddress2 = $("#crpAddress2").val();	// 상세주소 데이터
		
		// 일반주소 데이터가 존재하지 않는 경우, 지도를 띄울수 없기 때문에 데이터 유무의 기준을 address1으로 설정
		if(crpAddress1 != null || crpAddress2 != ""){
			var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
			mapContainer.style.display = "block";
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
	
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
	
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(crpAddress1 + " " + crpAddress2, function(result, status) {
	
			    // 정상적으로 검색이 완료됐으면 
			     if (status === kakao.maps.services.Status.OK) {
	
			        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
			        // 결과값으로 받은 위치를 마커로 표시합니다
			        var marker = new kakao.maps.Marker({
			            map: map,
			            position: coords
			        });
	
			        // 인포윈도우로 장소에 대한 설명을 표시합니다
			        var infowindow = new kakao.maps.InfoWindow({
			            content: '<div style="width:150px;text-align:center;padding:6px 0;">HOME</div>'
			        });
			        infowindow.open(map, marker);
	
			        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			        map.setCenter(coords);
			    } 
			});  
		}
		// 카카오지도 끝
		

		// 회사의 채용공고 가져오기
		var data = {
		    crpId : $('#crpId').val()
		}
		console.log(data.crpId);

		$.ajax({
		    url : "/crp/recruitmentAllSelect",
		    data : JSON.stringify(data),
		    contentType: "application/json;charset=utf-8",
		    type : "POST",
		    beforeSend : function(xhr){  // 데이터 전송 전, 헤더에 csrf 값 설정
		        xhr.setRequestHeader(header, token);
		    },
		    success: function(res) {
		        var recruitmentData = $("#recruitmentData");
		        recruitmentData.empty();
		        var html = "";
		        var html2 = "";
		        var itemsToShow = 4;
		        var totalItems = 0;

/* 		        // "공고마감"이 아닌 채용공고만 필터링
		        var activeRecruitments = res.filter(function(item) {
		            return item.status !== "공고마감";
		        }); */

		        // 필터링된 채용공고에 대해 HTML 생성
		        res.forEach(function(item, index) {
		            console.log("index : " + index);
		            var displayStyle = index < itemsToShow ? "block" : "none"; // 초기에는 4개만 보여줌
		            html += '<div class="col-sm-5 recruitment-item" style="display: ' + displayStyle + ';">';
		            html += '<div class="d-flex align-items-top">';
		            html += '<div class="d-flex flex-fill flex-wrap gap-3">';
		            html += '<div>';
		            html += '<h6 class="mb-1 fw-semibold">' + item.positionCode + '</h6>';
		            html += '<a href="/recruitment/detail.do?recNtcId=' + item.recNtcId + '" class="mb-1 text-muted contact-mail text-truncate" style="font-size: 20px;" onclick="addRecentView(\'' + item.recNtcId + '\');">' + item.recNtcTitle + '</a>';
		            html += '<p class="fw-semibold fs-11 mb-0 text-primary" style="font-size: 15px;">';
		            html += item.workingLocCode + ' &nbsp;&nbsp;&nbsp; ' + item.experienceCode;

		            // 경력일 경우에만 experienceLevelCode 추가
		            if (item.experienceCode === '경력') {
		                html += ' &nbsp;&nbsp;&nbsp;' + item.experienceLevelCode;
		            }
		            html += '</p>';
		            html += '</div>'; 
		            html += '</div>'; 
		            html += '<div class="aa bookMarkResult-' + item.recNtcId + '" data-recntcid="' + item.recNtcId + '">';
		            html += '</div>'; 
		            html += '</div>'; 
		            html += '</div>'; 
		            
		            totalItems++;
		        });

		        if (totalItems > itemsToShow) {
		            html2 += '<button id="loadMore" class="btn btn-light btn-wave" style="display: block; width: 85%; font-size:17px; font-weight:bold; color:gray;">' + parseInt(totalItems - 4) + '개 포지션 더보기</button>';
		        }
	            		
		        recruitmentData.html(html); 
				$('#addBtn').html(html2);

	            if (totalItems > itemsToShow) {
	                $("#loadMore").show(); // 더 보기 버튼을 보여줌
	            }
		        
	            $("#loadMore").click(function() {
	                $(".recruitment-item:hidden").slice(0, 4).slideDown(); // 숨겨진 아이템 중 4개를 보여줌
	                if ($(".recruitment-item:hidden").length == 0) { // 더 이상 보여줄 아이템이 없으면
	                    $("#loadMore").fadeOut(); // 더 보기 버튼을 숨김
	                }
	            });
		        
				// 각 공고의 북마크 상태 확인
				$('.aa').each(function() {
				    var recNtcId = $(this).data('recntcid'); // 'recntcid'를 문자열로 전달
				    console.log("recNtcId : " + recNtcId);
				    updateBookmarkStatus(recNtcId);
				});
				
				
				
				
		    }
		    
		});// 채용공고 ajax끝
		

		// 관심회사 상태 확인
		var crpId = $('#crpId').val();
		console.log("crpId ==" + crpId)
		updateInterestCrp(crpId);
		
		
		
		
		
		
		
	
		
		
});//function({})끝

//북마크 모양 띄우기       onclick="like_func(\'' + recId + '\')"
function updateBookmarkStatus(recNtcId) {
    var data = { recNtcId: recNtcId };
    console.log("recNtcId :   =======" + recNtcId)
    $.ajax({
        url: "/main/bookmarkSelect.do",
        type: "post",
        cache: false,
        beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(data),
        success: function(data) {
            console.log("Bookmark status response: ", data); 
            var bookmarkElement = $('.bookMarkResult-' + recNtcId);
            if(data == 'FAILED') {
                bookmarkElement.html('<i   onclick="like_func(\'' + recNtcId + '\')" class="bi bi-bookmark bookMarkResult-' + recNtcId + '"  style="font-size: 24px;  cursor: pointer;"></i>');
            }
            if(data == 'EXIST') {
                bookmarkElement.html('<i   onclick="like_func(\'' + recNtcId + '\')" class="bi bi-bookmark-fill bookMarkResult-' + recNtcId + '"  style="font-size: 24px;  cursor: pointer;"></i>');
            }
        }
    });
}

//북마크 
function like_func(recNtcId){
	var data = { recNtcId: recNtcId };
	$.ajax({
		url:"/main/bookmark.do",
		type:"post",
		cache : false,
		beforeSend : function(xhr){	// 데이터 전송 전, 헤더에 csrf 값 설정
			xhr.setRequestHeader(header, token);
		},
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(data),
		success : function(data){
			
			console.log(data);
			if(data == "FAILED"){
				location.href = "/login";
			}
			if(data == "EXIST"){
				updateBookmarkStatus(recNtcId);
			}
		}
	});
	
}
// 체크박스 상태에 따라 공고를 필터링하는 함수
function filterPositions() {
    var showClosed = $('#showClosedPositions').is(':checked');
    $('.recruitment-item').each(function() {
        var isClosed = $(this).data('status') === '공고마감';
        if (isClosed && !showClosed) {
            $(this).hide();
        } else {
            $(this).show();
        }
    });
}


// 관심회사 띄우기
function updateInterestCrp(crpId) {
    var data = { crpId : crpId };
    console.log("crpId :   =======" + crpId)
    $.ajax({
        url: "/crp/interestCrpSelect.do",
        type: "post",
        cache: false,
        beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(data),
        success: function(data) {
        	console.log("기업회원마다 관심을 가진 구직자 수 : " + data.count)
            console.log("interestCrp status response: ", data); 
            var crpElement = $('#crpId2'); // crpId는 요소의 id가 아닌 변수로서 존재함.
            if (data.count != undefined) {
                if (data.result == 'FAILED') {
                    crpElement.html('<span onclick="int_func(\'' + crpId + '\')" class="crpResult-' + crpId + '" style="font-size: 20px;">&nbsp;&nbsp;&nbsp;<button style="padding: 5px 10px; font-size: 22px; background-color: white; color:gray; border-color: gray;"><i class="bi bi-suit-heart"></i>&nbsp;' + data.count + '&nbsp;관심기업</button></span>');
                }
                if (data.result == 'EXIST') {
                    crpElement.html('<span onclick="int_func(\'' + crpId + '\')" class="crpResult-' + crpId + '" style="font-size: 20px; cursor: pointer;">&nbsp;&nbsp;&nbsp;<button style="padding: 5px 10px; font-size: 22px; background-color: white; color:gray; border-color: gray;"><i class="bi bi-suit-heart-fill"></i>&nbsp;' + data.count + '&nbsp;관심기업</button></span>');
                }
            } else {
                if (data.result == 'FAILED') {
                    crpElement.html('<span onclick="int_func(\'' + crpId + '\')" class="crpResult-' + crpId + '" style="font-size: 20px;">&nbsp;&nbsp;&nbsp;<button style="padding: 5px 10px; font-size: 22px; background-color: white; color:gray; border-color: gray;"><i class="bi bi-suit-heart"></i>관심기업</button></span>');
                }
                if (data.result == 'EXIST') {
                    crpElement.html('<span onclick="int_func(\'' + crpId + '\')" class="crpResult-' + crpId + '" style="font-size: 20px; cursor: pointer;">&nbsp;&nbsp;&nbsp;<button style="padding: 5px 10px; font-size: 22px; background-color: white; color:gray; border-color: gray;"><i class="bi bi-suit-heart-fill"></i>관심기업</button></span>');
                }
            }
            
            
        }
    });
}


//관심회사 
function int_func(crpId){
	var data = { crpId: crpId };
	$.ajax({
		url:"/crp/interestCrp.do",
		type:"post",
		cache : false,
		beforeSend : function(xhr){	// 데이터 전송 전, 헤더에 csrf 값 설정
			xhr.setRequestHeader(header, token);
		},
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(data),
		success : function(data){
			
			console.log(data);
			if(data.result == "FAILED"){
				location.href = "/login";
			}
			if(data.result == "EXIST"){
				updateInterestCrp(crpId);
			}
		}
	});
	
}

//최근 본 공고
function addRecentView(recNtcId) {
	var data = {
			recNtcId : recNtcId
	};
	
    $.ajax({
        url: '/main/addRecentView',
        type: 'POST',
		beforeSend : function(xhr){	// 데이터 전송 전, 헤더에 csrf 값 설정
			xhr.setRequestHeader(header, token);
		},
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(data),
        success: function(res) {
            console.log(res);
            
        }// success 끝
    });//ajax끝
}// addRecentView 끝
</script> 

