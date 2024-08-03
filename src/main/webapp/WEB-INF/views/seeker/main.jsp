<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Bootstrap CSS -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/swiper/swiper-bundle.min.css">
<style>
body{
	font-size:16px;
}

.custom-card img {
    width: 100%;
    height: auto;
    cursor: pointer;
}
.custom-card .card-title {
    text-align: center;
    font-weight: bold;
    font-size: 20px;
}
.search-container {
    display: flex;
    align-items: center;
    justify-content: center;
}
.search-container input {
    height: 70px; /* 원하는 높이로 조정 */
    font-size: 22px; /* 텍스트 크기 조정 */
}
.search-container button {
    height: 70px; /* 원하는 높이로 조정 */
    font-size: 22px; /* 텍스트 크기 조정 */
}
.search-container input::placeholder {
    font-size: 22px; /* 텍스트 크기 조정 */
    text-align: center;
    font-weight: bold;
}
.swiper-preview, .swiper-view {
    height: 300px; /* 슬라이드 높이 조정 */
}
.swiper-preview .swiper-slide img, .swiper-view .swiper-slide img {
    height: 100%; /* 이미지 높이 조정 */
    object-fit: cover; /* 이미지 비율 유지 */
}
.swiper {
    height: 300px; /* 슬라이드 높이 조정 */
}
.swiper-slide img {
    width: 100%;
    height: 100%;
    object-fit: cover; /* 이미지 비율 유지 */
}
.swiper-slide {
    position: relative; /* 텍스트를 절대 위치로 배치하기 위해 상대 위치 설정 */
}
.swiper-slide .slide-text {
	font-size : 25px;
	font-weight : bold;
    position: absolute;
    top: 50px; /* 위쪽에서 10px 떨어진 위치 */
    left: 80px; /* 왼쪽에서 10px 떨어진 위치 */
    color: white; /* 텍스트 색상 */
    padding: 5px; /* 텍스트 주변 여백 */
    border-radius: 5px; /* 모서리 둥글게 */
}
.aa {
    position: absolute;
    right: 16px; /* 오른쪽에서 5px 떨어짐 */
    top: 13px; /* 상단에서 5px 떨어짐 */
    font-size: 24px; /* 아이콘 크기 */
}
.job-title {
    font-size: 16px;
    font-weight: bold;
    margin: 5px 0; /* 상하단 마진 줄이기 */
    text-align: left; /* 왼쪽 정렬 */
}
.job-info .job-title{
	height: 50px;
}

.company-name, .job-location {
    font-size: 13px;
    color: gray;
    margin: 3px 0; /* 상하단 마진 줄이기 */
    text-align: left; /* 왼쪽 정렬 */
}
/* CSS Grid for 5 columns */
.job-postings-container {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(230px, 1fr));
    gap: 30px; /* Gap between columns */
}
.job-posting {
/*     display: flex; */
    flex-direction: column;
    align-items: center;
   	/*  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */ */
    border-radius: 15px; /* 모서리를 둥글게 */
    overflow: hidden; /* 자식 요소의 넘침을 숨김 */
    transition: transform 0.2s; /* 변환 애니메이션 */
    padding-bottom:20px;
}
.job-posting:hover {
    transform: translateY(-5px); /* 호버 시 위로 이동 */
}
/* Additional styling for filter and sort buttons */
.navbar-buttons {
    display: flex;
    gap: 10px;
}
.viewAll{
     margin-right: 15px;
     font-weight: bold;
     color: gray;
     padding: 5px 10px;
     transition: background-color 0.3s;
     cursor: pointer;
     border-radius: 20px;
}
 .viewAll:hover {
     background-color: lightgray;
 }
.ntcTabs{
	font-size:18px;
	font-weight: 600;
} 
</style>

<!-- 회원가입하고 로그인 경력/신입인지 묻는 모달창 시작 -->
<div class="card custom-card" style="display:none;" id="model111">
    <div class="card-body" style="padding: 0;">
        <div class="modal fade" id="exampleModalLg" tabindex="-1" aria-labelledby="exampleModalLgLabel" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <div class="modal-header" style="justify-content: space-around; font-weight: bold; font-size: 20px;">
                        <h6 class="modal-title" id="exampleModalLgLabel">CodeWorker에 오신것을 환영합니다!</h6>
                    </div>
                    <div class="modal-body card-title" style="text-align: center; font-weight: bold; font-size: 20px;">
                        <br>
                		        경력이신가요?
                        <div class="row justify-content-center">
                            <div class="col-xl-6 col-md-6 mb-6">
                                <div class="card custom-card">
                                    <div class="card-header" style="justify-content: space-around;">
                                        <div class="card-title">
                            		                신입
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="text-center">
                                        <sec:authorize access="isAuthenticated()">
                                            <form action="/addInsert.do" method="post" id="newcomerForm">
                                                <input type="hidden" name="seekerVO.memId" value="<sec:authentication property='principal.member.memId'/>">
                                                <input type="hidden" class="addRadio" value="F" name="seekerVO.seekerStatusCode">
                                                <input type="hidden" name="seekerVO.seekerExp" id="newcomerProposal" value="new">
                                                <img src="${pageContext.request.contextPath}/resources/images/newcomer.png" alt="신입" onclick="submitForm('newcomerForm')">
                                                <sec:csrfInput/>
                                            </form>
                                         </sec:authorize>
                                        </div>
                                    </div>
                                    <div class="card-footer d-none border-top-0">
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-6 mb-6">
                                <div class="card custom-card">
                                    <div class="card-header" style="justify-content: space-around;">
                                        <div class="card-title">
                                            경력회원
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="text-center">
                                        <sec:authorize access="isAuthenticated()">
                                            <form action="/addInsert.do" method="post" id="experiencerForm">
                                                <input type="hidden" name="seekerVO.memId" value="<sec:authentication property='principal.member.memId'/>">
                                                <input type="hidden" class="addRadio" value="T" name="seekerVO.seekerStatusCode">
                                                <input type="hidden" name="seekerVO.seekerExp" id="experiencerProposal" value="exp">
                                                <img src="${pageContext.request.contextPath}/resources/images/experiencer.png" alt="경력회원" onclick="submitForm('experiencerForm')">
                                                <sec:csrfInput/>
                                            </form>
                                        </sec:authorize>
                                        </div>
                                    </div>
                                    <div class="card-footer d-none border-top-0">
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div>
                            <div class="card custom-card">
                                <div class="card-header" style="justify-content: space-around;">
                                    <div class="card-title" style="font-weight: bold; font-size: 20px;">
                                       인재 제안을 받으시겠습니까?
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input expradio" type="radio" name="seekerVO.seekerStatusCode" id="deny" value="F">
                                        <label class="form-check-label fs-15" for="deny" >
                                            아니요, 괜찮습니다.
                                        </label>
                                    </div>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input expradio" type="radio" name="seekerVO.seekerStatusCode" id="permit" value="T" checked>
                                        <label class="form-check-label  fs-15" for="permit">
                                           네, 인재제안을 받겠습니다.
                                        </label>
                                    </div>
                                </div>
                                <div class="card-footer d-none border-top-0">
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="modal-footer" style="justify-content: space-around">
                        <button type="button" class="btn btn-secondary-ghost btn-wave" data-bs-dismiss="modal" id="closeModalBtn">다음에 하기</button>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 회원가입하고 로그인 경력/신입인지 묻는 모달창 끝 -->

<!-- main 화면 시작 -->
<!-- 검색 시작-->
<div style="margin-top:60px;"></div>

<div class="custom-card">
    <div class="card-body p-5 d-flex align-items-center justify-content-center">
        <div class="container">
            <div class="p-3 mb-4 rounded currency-exchange-area">
                <div class="row gy-3 search-container">
                    <div class="col-xxl-4 col-6">
                        <div class="input-group" style="border: 1px solid #21D7FF; border-radius: 10px; overflow:hidden;"> 
                        	<input type="text" id="autoComplete"name="autoComplete"  class="form-control bg-light" style="border:none;" placeholder="기업명을 검색해주세요!" aria-describedby="button-addon2">               
                        	<input type="hidden" id="selectedCompanyId">
                        	 <button  class="btn btn-light" type="button" id="searchBtn"><i class="ri-search-line text-muted"></i></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--검색 끝 -->

<!-- 기업들 슬라이드로 홍보 (공통) -->
<div class="" style="margin-bottom:120px;">
    <div class="">
        <div class="swiper keyboard-control">
            <div class="swiper-wrapper">
                <div class="swiper-slide" onclick="location.href='/main/crpDetail?crpId=C001'" style="cursor: pointer;">
                    <img src="${pageContext.request.contextPath}/resources/images/slide1.png" alt="">
                    <div class="slide-text">90억 투자받은 AI<br> <span style="font-size: 20px;">우아한 형제들</span></div>
                </div>
                <div class="swiper-slide" onclick="location.href='/main/crpDetail?crpId=C002'" style="cursor: pointer;">
                    <img src="${pageContext.request.contextPath}/resources/images/slide2.png" alt="">
                    <div class="slide-text">인공지능 (AI) 포지션<br> <span style="font-size: 20px;">당근마켓</span></div>
                </div>
                <div class="swiper-slide" onclick="location.href='/main/crpDetail?crpId=c3'" style="cursor: pointer;">
                    <img src="${pageContext.request.contextPath}/resources/images/slide3.png" alt="">
                     <div class="slide-text">네이버 개발직군 대규모 채용<br> <span style="font-size: 20px;">24.07.22 - 24.08.11</span></div>
                </div>
            </div>
            <div class="swiper-button-next" style="margin-right:20px;"></div>
            <div class="swiper-button-prev" style="margin-left:20px;"></div>
            <div class="swiper-pagination" style="margin-bottom:10px;"></div>
        </div>
    </div>
</div>
<!-- 기업들 슬라이드로 홍보 끝-->
<!--  최신공고 (공통) -->
<div style="display: flex;  justify-content: space-between; height: 28px;">
	<p class="ntcTabs">최근 등록한 공고</p>
	<div onclick="goViewAll1()"><span style="margin-right: 15px; font-weight: bold; color: gray;" class="viewAll">전체 보기</span></div>
</div>
<br>
<div style="display: flex; justify-content: space-between; margin-bottom:80px;">
    <c:if test="${recruitmentNoticeList != null }">    
        <c:forEach items="${recruitmentNoticeList }" var="recruit" begin="0" end="3"> 
            <c:if test="${recruit.status ne '공고마감'}">      
                <div class="job-posting">
                    <div class="card-body position-relative">
                        <img src="${pageContext.request.contextPath}/resources/images/${recruit.crpLogoUrl}" class="img-fluid rounded-image" style="border-radius:5px; width: 230px; height: 175px; cursor: pointer;" onclick="addRecentView('${recruit.recNtcId}'); location.href='/recruitment/detail.do?recNtcId=${recruit.recNtcId}'">
                        <b class="aa bookMarkResult-${recruit.recNtcId}" style="padding:10px 10px 10px 10px; font-color:#E65844;"></b>
                        <input type="hidden" value="${recruit.recNtcId }" class="recId">
                    </div> 
                   <div class="job-info" style="width: 260px; cursor: pointer; padding:0px 12px 0px 20px;" onclick="addRecentView('${recruit.recNtcId}'); location.href='/recruitment/detail.do?recNtcId=${recruit.recNtcId}'">
                        <p class="job-title">${recruit.recNtcTitle }</p>
                        <p class="company-name">${recruit.crpName }</p>
                        <p class="job-location">${recruit.workingLocCode} 
                            <c:if test="${recruit.experienceCode eq '신입'}">신입</c:if>
                            <c:if test="${recruit.experienceCode eq '경력무관'}">경력무관</c:if>
                            <c:if test="${recruit.experienceCode eq '경력'}">경력 ${recruit.experienceLevelCode}</c:if>
                            <span style="color: red; float: right; font-weight: bold;">${recruit.status }</span>  
                        </p>
                    </div>
                </div>
            </c:if>
        </c:forEach>
    </c:if>
</div>		
<!-- 최신공고 끝 -->
<br><br>
<!-- 일반회원(지역별) -->
<sec:authorize access="hasRole('ROLE_SEEKER')">
<div style="display: flex;  justify-content: space-between; height: 28px;">
	<p class="ntcTabs">자신의 지역 공고(${location })</p>
	<div onclick="goViewAll2()"><span style="margin-right: 15px; font-weight: bold; color: gray;" class="viewAll">전체 보기</span></div>
</div>
<br>
<div style="display: flex; justify-content: space-between; margin-bottom:80px;">
		<c:if test="${recruitmentNoticeList != null }">    
		    <c:forEach items="${recruitmentNoticeList2 }" var="recruit" begin="0" end="3">       
		       <c:if test="${recruit.status ne '공고마감'}">
		        <div class="job-posting" >
		            <div class="card-body position-relative">
		               <img src="${pageContext.request.contextPath}/resources/images/${recruit.crpLogoUrl}" class="img-fluid rounded-image" style="border-radius:5px; width: 230px; height: 175px; cursor: pointer;" onclick="addRecentView('${recruit.recNtcId}'); location.href='/recruitment/detail.do?recNtcId=${recruit.recNtcId}'">
   							<b class="aa bookMarkResult-${recruit.recNtcId}"  style="padding:10px 10px 10px 10px" ></b>
          			        <input type="hidden" value="${recruit.recNtcId }" class="recId">
		            </div>
					<div class="job-info" style="width: 260px; cursor: pointer; padding: 0px 12px 0px 20px;" onclick="addRecentView('${recruit.recNtcId}'); location.href='/recruitment/detail.do?recNtcId=${recruit.recNtcId}'">
		                <p class="job-title">${recruit.recNtcTitle }</p>
		                <p class="company-name">${recruit.crpName }</p>
		                <p class="job-location">${recruit.workingLocCode} 
		                    <c:if test="${recruit.experienceCode eq '신입'}">신입</c:if>
		                    <c:if test="${recruit.experienceCode eq '경력무관'}">경력무관</c:if>
		                    <c:if test="${recruit.experienceCode eq '경력'}">경력 ${recruit.experienceLevelCode}</c:if>
		                	 <span style="color: red; float: right; font-weight: bold;">${recruit.status }</span>  
		                </p>
		            </div>
		        </div>
		        </c:if>
		    </c:forEach>
		</c:if>
</div>
</sec:authorize>
<!-- 일반회원(지역별)끝 -->

<!-- 일반회원(최근본순) -->
<sec:authorize access="hasRole('ROLE_SEEKER')">
<div style="display: flex;  justify-content: space-between; height: 28px;">
	<p class="ntcTabs">최근 본 공고</p>
	<div onclick="goViewAll3()"><span style="margin-right: 15px; font-weight: bold; color: gray;" class="viewAll">전체 보기</span></div>
</div>
<br>
		<div style="display: flex; justify-content: space-between; margin-bottom:80px;">
				<c:if test="${recruitmentNoticeList != null }">    
				    <c:forEach items="${recruitmentNoticeList3 }" var="recruit" begin="0" end="3">       
				       <c:if test="${recruit.status ne '공고마감'}">
				        <div class="job-posting" >
				            <div class="card-body position-relative">
				               <img src="${pageContext.request.contextPath}/resources/images/${recruit.crpLogoUrl}" class="img-fluid rounded-image" style="border-radius:5px; width: 230px; height: 175px; cursor: pointer;" onclick="addRecentView('${recruit.recNtcId}'); location.href='/recruitment/detail.do?recNtcId=${recruit.recNtcId}'">
     							<b class="aa bookMarkResult-${recruit.recNtcId}" style="padding:10px 10px 10px 10px" ></b>
            			        <input type="hidden" value="${recruit.recNtcId }" class="recId">
				            </div>
							<div class="job-info" style="width: 260px; cursor: pointer; padding:0px 12px 0px 20px;" onclick="addRecentView('${recruit.recNtcId}'); location.href='/recruitment/detail.do?recNtcId=${recruit.recNtcId}'">
				                <p class="job-title">${recruit.recNtcTitle }</p>
				                <p class="company-name">${recruit.crpName }</p>
				                <p class="job-location">${recruit.workingLocCode} 
				                    <c:if test="${recruit.experienceCode eq '신입'}">신입</c:if>
				                    <c:if test="${recruit.experienceCode eq '경력무관'}">경력무관</c:if>
				                    <c:if test="${recruit.experienceCode eq '경력'}">경력 ${recruit.experienceLevelCode}</c:if>
				                	 <span style="color: red; float: right; font-weight: bold;">${recruit.status }</span>  
				                </p>
				            </div>
				        </div>
				        </c:if>
				    </c:forEach>
				</c:if>
		</div>
</sec:authorize>
<!-- 일반회원(최근본순) 끝-->
<!-- main 화면 끝 -->

    <!-- Swiper JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/libs/swiper/swiper-bundle.min.js"></script>

    <!-- Internal Swiper JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/swiper.js"></script>
    
<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
$(function(){
    // 로그인한 사용자만 모달을 표시
    <sec:authorize access="isAuthenticated()">
        // 페이지가 로드될 때 모달 창을 자동으로 띄웁니다.
        if (!getCookie('modalShown')) {
            $('#model111').css('display', 'block');
            $('#exampleModalLg').modal('show');
        }

        // "다음에 하기" 버튼 클릭 시 쿠키 설정
        $('#closeModalBtn').on('click', function() {
            setCookie('modalShown', 'true', null); // 영구적으로 유지, 필요시 기간 조정
            $('#exampleModalLg').css('display', 'none');
            $('#exampleModalLg').modal('hide');
        });
        
        // 이미지 클릭 시 모달 창 숨기고 쿠키 설정
        $('.card.custom-card img').on('click', function() {
            setCookie('modalShown', 'true', null); // 영구적으로 유지하도록 null 설정
            $('#exampleModalLg').css('display', 'none');
            $('#exampleModalLg').modal('hide');
        });
    </sec:authorize>
    
    console.log($.fn.autocomplete);
    
    // 자동 검색어 완성
 	var arr = [];
    var companyIdMap = {};
    $.ajax({
		type : 'get',
		url : "/main/autoComplete",
		dataType : "json",
		success : function(data){
			console.log(data);
//			for(var i=0; i< data.length; i++) arr[i] = data[i].crpName;
//			console.log(arr);	
			$.each(data, function(i,v){
				arr.push(v.crpName);
				companyIdMap[v.crpName] = v.crpId  // 객체로 회사이름과 회사아이디를 매칭함
			});
			console.log(arr);
			console.log(companyIdMap);
		}
	}); 
    
    $("#autoComplete").autocomplete({  //오토 컴플릿트 시작
        source : arr,    // source 는 자동 완성 대상
        select : function(event, ui) {    //아이템 선택시
            console.log(ui.item);
            $("#selectedCompanyId").val(companyIdMap[ui.item.value]); // 선택한 회사의 ID 저장     	
        },
        focus : function(event, ui) {    //포커스 가면
            return false;//한글 에러 잡기용도로 사용됨
        },
        minLength: 1,// 최소 글자수
        autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
        classes: {    
            "ui-autocomplete": "highlight"
        },
        delay: 500,    //검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
//        disabled: true, //자동완성 기능 끄기
        position: { my : "right top", at: "right bottom" },   
        close : function(event){    //자동완성창 닫아질때 호출 -> 누를때마다 각각의 경로로 가게해줌
            console.log("close : " + event);
        }
    });
    // 자동완성 끝
    
    
     // 검색 버튼 클릭 이벤트
    $("#searchBtn").on("click", function() {
        var crpId = $("#selectedCompanyId").val();
        if (crpId) {
            window.location.href = "/main/crpDetail?crpId=" + crpId; // 회사 상세 페이지로 이동
        } else {
            alert("회사를 선택해주세요.");
        }
    });
    
    
  
    // 각 공고의 북마크 상태를 확인
    $('.recId').each(function() {
        var recId = $(this).val();
        console.log("recId: ", recId);
        updateBookmarkStatus(recId);
    });
    
    
});
// 쿠키 설정 함수 
function setCookie(name, value, days) {
    var expires = "";
    if (days) {
        var date = new Date();
        date.setTime(date.getTime() + (days*24*60*60*1000));
        expires = "; expires=" + date.toUTCString();
    }
    document.cookie = name + "=" + (value || "")  + expires + "; path=/";
}

// 쿠키 가져오기 함수
function getCookie(name) {
    var nameEQ = name + "=";
    var ca = document.cookie.split(';');
    for(var i=0;i < ca.length;i++) {
        var c = ca[i];
        while (c.charAt(0)==' ') c = c.substring(1,c.length);
        if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
    }
    return null;
}

// 모달창 이미지 클릭 시 경력, 신입여부와 인재제안여부 전송
function submitForm(formId) {
    var status = $('input[name="seekerVO.seekerStatusCode"]:checked').val();
    $('.addRadio').val(status);
    $('#' + formId).submit();
}
//북마크 모양 띄우기
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


// 북마크 
function like_func(recId){
	var data = { recNtcId: recId };
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
				updateBookmarkStatus(recId);
			}
		}
	});
	
}

// 최근 본 공고
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

// 최근 등록한 공고 - 전체보기
function goViewAll1(){
	location.href = "/recruitment/main.do";
}

// 자신의 지역 공고 
function goViewAll2(){
	location.href = "/main/locationAllSelect";
}

// 최근 본 공고 - 전체보기
function goViewAll3(){
	location.href = "/main/recViewAllSelect";
}
</script>