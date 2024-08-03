<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
/* 기존 CSS는 유지 */
.position-relative {
    position: relative;
}

.rounded-image {
    border-radius: 15px; /* 모서리를 둥글게 */
    width: 100%; /* 너비를 부모 요소에 맞춤 */
}

.aa {
    position: absolute;
    right: 18px; /* 오른쪽에서 5px 떨어짐 */
    top: 15px; /* 상단에서 5px 떨어짐 */
    font-size: 24px; /* 아이콘 크기 */

}

/* 텍스트 스타일 및 간격 조정 */
.job-title {
    font-size: 16px;
    font-weight: bold;
    margin: 5px 0; /* 상하단 마진 줄이기 */
    text-align: left; /* 왼쪽 정렬 */
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
    gap: 16px; /* Gap between columns */
}
/* .job-posting { */
/*     display: flex; */
/*     flex-direction: column; */
/*     align-items: center; */
/*     /* box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); */ /* 그림자 효과 */ */
/*     border-radius: 10px; /* 모서리를 둥글게 */ */
/*     overflow: hidden; /* 자식 요소의 넘침을 숨김 */ */
/*     transition: transform 0.2s; /* 변환 애니메이션 */ */
/* } */

.job-posting:hover {
    transform: translateY(-5px); /* 호버 시 위로 이동 */
}
.jobImg{
	margin:15px 20px 20px 20px;
}
.job-content{
	padding: 0px 2px 10px 25px;
}
.job-content .job-title{
	height: 50px;
}
/* Additional styling for filter and sort buttons */
.navbar-buttons {
    display: flex;
    gap: 10px;
}

.sort-buttons {
    display: flex;
    align-items: center;
    gap: 15px;
    margin-left: auto;
}

.sort-buttons li {
    list-style: none;
}

.sort-buttons button {
    border: none;
    background: none;
    cursor: pointer;
    font-size: 16px;
    font-weight: bold;
    padding: 5px 10px;
    color: #666666;
    transition: color 0.2s, background-color 0.2s; /* 색상과 배경색의 변환 애니메이션 */
}

.sort-buttons button.active {
    color: black;
    background-color: #c7c5c5;;
    border-radius: 5px;
}

.sort-buttons button:hover {
    color: black;
}

/* Divider style */
.divider {
    border-left: 1px solid #ccc;
    height: 40px; /* 높이 설정 */
    margin: 0 15px; /* 좌우 간격 설정 */
}

/* Hover effect for specific buttons */
.expBtn {
    /* border-color: rgb(var(--dark-rgb)); */
    /* color: black; /* 기본 글자 색상 */
}
.expBtn.active {
    background-color: black; /* 배경색 검정 */
    color: white; /* 글자색 흰색 */
}

.expBtn.active:hover {
    background-color: #333; /* 호버 시 배경색 어두운 검정 */
    color: white; /* 글자색 흰색 유지 */
}
/* 모달 스타일 */
.modal-body {
    padding: 1.5rem;
}

.location-list {
    list-style: none;
    padding: 0;
    margin: 0;
}
.location-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 0.3rem 0; /* 간격을 줄임 */
    border-bottom: 1px solid #e9ecef;
}

.location-name {
    font-size: 18px; /* 글자 크기 증가 */
    line-height: 22px;
    font-weight: 700;
    letter-spacing: .0096em;
}

.location-item input[type="checkbox"] {
    width: 20px; /* 체크박스 크기 */
    height: 20px; /* 체크박스 크기 */
    border-radius: 50%; /* 둥근 체크박스 */
    cursor: pointer;
}

.location-item:last-child {
    border-bottom: none;
}

.modal-footer {
    display: flex;
    justify-content: space-between;
    padding: 1rem 1.5rem;
}
.location-grid {
    display: grid;
    grid-template-columns: 1fr 1fr; /* 2열 레이아웃 */
    gap: 16px; /* 열 사이의 간격 */
}
.skillBtn {
    border-color: rgb(var(--dark-rgb));
    color: black; /* 기본 글자 색상 */
    margin: 3px;
}

.skillBtn.active {
    background-color: black; /* 배경색 검정 */
    color: white; /* 글자색 흰색 */
}

.skillBtn.active:hover {
    background-color: #333; /* 호버 시 배경색 어두운 검정 */
    color: white; /* 글자색 흰색 유지 */
}
.dropdown-box {
    display: none;
    position: absolute;
    top: 215px; /* Adjust this based on your needs */
    /* left: 280px;  *//* Adjust this based on your needs */
    width: 300px; /* Adjust this based on your needs */
	/* height : 200px; */
    border: 1px solid #e6e6e6;
    border-radius: 10px;
    padding: 5px;
    background-color: white;
    z-index: 1000; /* Ensure it's above other elements */
}
.position-list > li{
	 margin-bottom:5px;
     font-size: 18px;
}  

.position-checkbox{
     border: 1px solid black;
}  
.position-item{
	display: flex;
    justify-content: space-between;
}

</style>

<div style="margin-top:120px;"></div>
<!-- main 화면 시작 -->
	<!-- 직무 필터 시작 -->
    <h3 id="toggleButton" style="cursor: pointer;">&nbsp;<span style="font-weight: bold;" id="posTitle">직무 전체</span> <i class="bi bi-caret-down-square"></i></h3> 
	
	<div class="dropdown-box" id="dropdownBox">
	  <div style="display: flex; justify-content: space-between; padding:5px 5px 5px 5px">
	    <span class="fw-semibold fs-18">개발 직군</span>
	    <button type="button" id="closeBtn3" class="btn-close"></button>
	  </div>
	  <ul class="position-list" style="border: 1px solid #e6e6e6; border-radius: 10px; margin-right:10px; margin-left:10px; padding: 10px; max-height: 300px; overflow-y: scroll;">
	    <li>
	      <label class="position-item">
	        <span class="position-name">프론트엔드</span>
	        <input type="checkbox" class="form-check-input position-checkbox" data-filter="POS0101">
	      </label>
	    </li>
	    <li>
	      <label class="position-item">
	        <span class="position-name">백엔드</span>
	        <input type="checkbox" class="form-check-input position-checkbox" data-filter="POS0102">
	      </label>
	    </li>
	    <li>
	      <label class="position-item">
	        <span class="position-name">풀스택</span>
	        <input type="checkbox" class="form-check-input position-checkbox" data-filter="POS0103">
	      </label>
	    </li>
	    <li>
	      <label class="position-item">
	        <span class="position-name">미들티어</span>
	        <input type="checkbox" class="form-check-input position-checkbox" data-filter="POS0104">
	      </label>
	    </li>
	    <li>
	      <label class="position-item">
	        <span class="position-name">웹</span>
	        <input type="checkbox" class="form-check-input position-checkbox" data-filter="POS0105">
	      </label>
	    </li>
	    <li>
	      <label class="position-item">
	        <span class="position-name">데스크톱</span>
	        <input type="checkbox" class="form-check-input position-checkbox" data-filter="POS0106">
	      </label>
	    </li>
	    <li>
	      <label class="position-item">
	        <span class="position-name">모바일</span>
	        <input type="checkbox" class="form-check-input position-checkbox" data-filter="POS0107">
	      </label>
	    </li>
	    <li>
	      <label class="position-item">
	        <span class="position-name">그래픽</span>
	        <input type="checkbox" class="form-check-input position-checkbox" data-filter="POS0108">
	      </label>
	    </li>
	    <li>
	      <label class="position-item">
	        <span class="position-name">게임</span>
	        <input type="checkbox" class="form-check-input position-checkbox" data-filter="POS0109">
	      </label>
	    </li>
	    <li>
	      <label class="position-item">
	        <span class="position-name">데이터 사이언티스트</span>
	        <input type="checkbox" class="form-check-input position-checkbox" data-filter="POS0110">
	      </label>
	    </li>
	    <li>
	      <label class="position-item">
	        <span class="position-name">빅 데이터</span>
	        <input type="checkbox" class="form-check-input position-checkbox" data-filter="POS0111">
	      </label>
	    </li>
	    <li>
	      <label class="position-item">
	        <span class="position-name">데브옵스</span>
	        <input type="checkbox" class="form-check-input position-checkbox" data-filter="POS0112">
	      </label>
	    </li>
	    <li>
	      <label class="position-item">
	        <span class="position-name">CRM</span>
	        <input type="checkbox" class="form-check-input position-checkbox" data-filter="POS0113">
	      </label>
	    </li>
	    <li>
	      <label class="position-item">
	        <span class="position-name">SDET</span>
	        <input type="checkbox" class="form-check-input position-checkbox" data-filter="POS0114">
	      </label>
	    </li>
	    <li>
	      <label class="position-item">
	        <span class="position-name">임베디드</span>
	        <input type="checkbox" class="form-check-input position-checkbox" data-filter="POS0115">
	      </label>
	    </li>
	    <li>
	      <label class="position-item">
	        <span class="position-name">보안</span>
	        <input type="checkbox" class="form-check-input position-checkbox" data-filter="POS0116">
	      </label>
	    </li>
	  </ul>
            <div id="addLocation3"></div>
            <div >
                <button type="button" class="btn btn-light btn-wave" style="font-weight: bold; border: 1px solid #e6e6e6; background-color: white;"  id="reset-filters3">초기화</button>
                <button type="button" class="btn btn-primary" id="apply-filters3" style="width: 200px;">적용</button>
            </div>
	</div>
	<!-- 직무 필터 끝 -->
	
<div class="my-4">

    <!-- Start::row-1 -->
    <div class="row">
    
        <div class="" style="margin-bottom:50px;">
            <div class="">
                <nav class="navbar navbar-expand-xxl bg-white">
                    <div class="container-fluid">
                        	<div class="navbar-buttons">
	                            <!-- Filter Buttons -->
	                            <!-- 지역별 시작 -->
	                            <button type="button" class="btn btn-outline-secondary btn-wave bi bi-caret-down-fill" style="font-size: 15px;" data-bs-target="#location" data-bs-toggle="modal">전국</button>
	                            <!-- 지역별 끝 -->
	                            <!-- 스킬 별 시작 -->
	                            <button type="button" class="btn btn-outline-secondary btn-wave bi bi-caret-down-fill" style="font-size: 15px;" data-bs-target="#skill" data-bs-toggle="modal">기술 스택</button>
	                            <!-- 스킬 별 끝 -->
	                            <!-- 학력별 시작 -->
	                            <div class="dropdown">
							    <button class="btn btn-outline-secondary btn-wave bi bi-caret-down-fill" style="font-size: 15px;" data-bs-toggle="dropdown" aria-expanded="false" id="finalEduBtn">학력</button>
							    <ul class="dropdown-menu">
							        <li><a class="dropdown-item eduBtn" href="#" style="font-size: 13px;" data-filter="defaultEduCode">학력 무관</a></li>
							        <li><a class="dropdown-item eduBtn" href="#" style="font-size: 13px;" data-filter="EDU0107">고등학교 졸업 이상</a></li>
							        <li><a class="dropdown-item eduBtn" href="#" style="font-size: 13px;" data-filter="EDU0108">대학졸업(2,3년) 이상</a></li>
							        <li><a class="dropdown-item eduBtn" href="#" style="font-size: 13px;" data-filter="EDU0109">대학교졸업(4년) 이상</a></li>
							        <li><a class="dropdown-item eduBtn" href="#" style="font-size: 13px;" data-filter="EDU0110">석사 졸업 이상</a></li>
							    </ul>
								</div>
	                            <!-- 학력별 끝 -->
	                            <!-- Divider -->
	                            <div class="divider"></div>
	                            <button type="button" class="btn btn-outline-secondary btn-wave expBtn" data-filter="EXP0101">신입</button>
	                            <button type="button" class="btn btn-outline-secondary btn-wave expBtn" data-filter="YRS0101">경력 1년차 ~ 2년차</button>
	                            <button type="button" class="btn btn-outline-secondary btn-wave expBtn" data-filter="YRS0102">경력 3년차 ~ 5년차</button>
	                            <button type="button" class="btn btn-outline-secondary btn-wave expBtn" data-filter="YRS0103">경력 5년차 ~</button>
                       		</div>
	                        <!-- Sort Buttons -->
	                        <div class="sort-buttons">
	                            <button id="latest" class="active">최신순</button>
	                            <button id="views">조회순</button>
	                        </div>
                    </div>
                </nav>
            </div>
        </div>
        
        <div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12">
            <!-- 채용공고 들어오는 곳 시작 -->
            <div class="job-postings-container" id="recruitmentView">	<!-- 채용공고 html 하는곳 -->
				<c:if test="${recruitmentNoticeList != null }">    
<%-- 				    <c:forEach items="${recruitmentNoticeList }" var="recruit">        --%>
<!-- 				        <div class="job-posting"> -->
<!-- 				            <div class="card-body position-relative"> -->
<%-- 				                <img src="${pageContext.request.contextPath}/resources/images/${recruit.crpLogoUrl}" class="img-fluid rounded-image jobImg" style="width: 210px; height: 166px;"> --%>
<!-- 				                <i class="bi bi-bookmark bookmark-icon" style="padding-right:10px;"></i> -->
<!-- 				            </div> -->
<!-- 				            <div class="job-content" style="width: 210px;"> -->
<%-- 					            <p class="job-title">${recruit.recNtcTitle }</p> --%>
<%-- 					            <p class="company-name">${recruit.crpName }</p> --%>
<%-- 				                <p class="job-location">${recruit.workingLocCode}  --%>
<%-- 				                    <c:if test="${recruit.experienceCode eq '신입'}">신입</c:if> --%>
<%-- 				                    <c:if test="${recruit.experienceCode eq '경력무관'}">경력무관</c:if> --%>
<%-- 				                    <c:if test="${recruit.experienceCode eq '경력'}">경력 ${recruit.experienceLevelCode}</c:if> --%>
<!-- 				                </p> -->
<!-- 				            </div> -->
<!-- 				        </div> -->
<%-- 				    </c:forEach> --%>
				</c:if>
                <!-- 채용공고 들어오는 곳 끝 -->
            </div>
        </div>
    </div>
    <!--End::row-1 -->
</div>


<!--  전국 모달창 시작-->
<div class="modal fade" id="location" tabindex="-1" aria-labelledby="location" data-bs-keyboard="false" aria-hidden="true">
    <!-- Scrollable modal -->
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="staticBackdropLabel2">&nbsp;지역</h4>
                <button type="button" id="closeBtn" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="location-grid" style="border: 1px solid #e6e6e6; border-radius: 10px; padding: 10px;">
                    <ul class="location-list" style="border: 1px solid #e6e6e6; border-radius: 10px; padding: 10px;">
                        <li>
                            <label class="location-item">
                                <span class="location-name">전국</span>
                                <input type="checkbox" class="form-check-input location-checkbox" data-filter="LOC0117" id="nationWide" checked="checked">
                            </label>
                        </li>
                        <li>
                            <label class="location-item">
                                <span class="location-name">서울</span>
                                <input type="checkbox" class="form-check-input location-checkbox" data-filter="LOC0101">
                            </label>
                        </li>
                        <li>
                            <label class="location-item">
                                <span class="location-name">경기</span>
                                <input type="checkbox" class="form-check-input location-checkbox" data-filter="LOC0102">
                            </label>
                        </li>
                        <li>
                            <label class="location-item">
                                <span class="location-name">광주</span>
                                <input type="checkbox" class="form-check-input location-checkbox" data-filter="LOC0103">
                            </label>
                        </li>
                        <li>
                            <label class="location-item">
                                <span class="location-name">대구</span>
                                <input type="checkbox" class="form-check-input location-checkbox" data-filter="LOC0104">
                            </label>
                        </li>
                        <li>
                            <label class="location-item">
                                <span class="location-name">대전</span>
                                <input type="checkbox" class="form-check-input location-checkbox" data-filter="LOC0105">
                            </label>
                        </li>
                        <li>
                            <label class="location-item">
                                <span class="location-name">부산</span>
                                <input type="checkbox" class="form-check-input location-checkbox" data-filter="LOC0106">
                            </label>
                        </li>
                        <li>
                            <label class="location-item">
                                <span class="location-name">울산</span>
                                <input type="checkbox" class="form-check-input location-checkbox" data-filter="LOC0107">
                            </label>
                        </li>
                        <li>
                            <label class="location-item">
                                <span class="location-name">인천</span>
                                <input type="checkbox" class="form-check-input location-checkbox" data-filter="LOC0108">
                            </label>
                        </li>
                    </ul>
                    <ul class="location-list"  style="border: 1px solid #e6e6e6; border-radius: 10px; padding: 10px;">
                        <li>
                            <label class="location-item">
                                <span class="location-name">강원도</span>
                                <input type="checkbox" class="form-check-input location-checkbox" data-filter="LOC0109">
                            </label>
                        </li>
                        <li>
                            <label class="location-item">
                                <span class="location-name">경상남도</span>
                                <input type="checkbox" class="form-check-input location-checkbox" data-filter="LOC0110">
                            </label>
                        </li>
                        <li>
                            <label class="location-item">
                                <span class="location-name">경상북도</span>
                                <input type="checkbox" class="form-check-input location-checkbox" data-filter="LOC0111">
                            </label>
                        </li>
                        <li>
                            <label class="location-item">
                                <span class="location-name">전라남도</span>
                                <input type="checkbox" class="form-check-input location-checkbox" data-filter="LOC0112">
                            </label>
                        </li>
                        <li>
                            <label class="location-item">
                                <span class="location-name">전라북도</span>
                                <input type="checkbox" class="form-check-input location-checkbox" data-filter="LOC0113">
                            </label>
                        </li>
                        <li>
                            <label class="location-item">
                                <span class="location-name">충청북도</span>
                                <input type="checkbox" class="form-check-input location-checkbox" data-filter="LOC0114">
                            </label>
                        </li>
                        <li>
                            <label class="location-item">
                                <span class="location-name">충청남도</span>
                                <input type="checkbox" class="form-check-input location-checkbox" data-filter="LOC0115">
                            </label>
                        </li>
                        <li>
                            <label class="location-item">
                                <span class="location-name">제주</span>
                                <input type="checkbox" class="form-check-input location-checkbox" data-filter="LOC0116">
                            </label>
                        </li>
                        <li>
                            <label class="location-item">
                                <span class="location-name">세종</span>
                                <input type="checkbox" class="form-check-input location-checkbox" data-filter="LOC0118">
                            </label>
                        </li>
                    </ul>
                </div>
            </div>
            <div id="addLocation"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light btn-wave" style="font-weight: bold; border: 1px solid #e6e6e6; background-color: white;"  id="reset-filters">초기화</button>
                <button type="button" class="btn btn-primary" id="apply-filters" style="width: 300px;">적용</button>
            </div>
        </div>
    </div>
</div>


<!--  전국 모달창 끝-->

<!--  기술스택 모달창 시작 -->
<div class="modal fade" id="skill" tabindex="-1" aria-labelledby="skill" data-bs-keyboard="false" aria-hidden="true">
    <!-- Scrollable modal -->
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="staticBackdropLabel2">&nbsp;기술 스택</h4>
                <button type="button" id="closeBtn2" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body ui-front">
			<!-- 검색 시작-->
            <div class="input-group ri-search-line text-muted" style="font-size:25px; border: 3px solid skyblue; border-radius: 5px;"> 
            	<input type="text" id="autoComplete" name="autoComplete"  class="form-control bg-light border-0 autoComplete" placeholder="Search"  aria-describedby="button-addon2">               
            	<input type="hidden" id="selectedSiliiStackId">
           		<!-- 	 <button  class="btn btn-light" type="button" id="searchBtn"><i class="ri-search-line text-muted"></i></button> -->
            </div>
			<!--검색 끝 -->	
			<br><br>
            <div  style="border: 1px solid #e6e6e6; border-radius: 10px; padding: 10px;">
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0101" id="SKL0101">Java</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0102" id="SKL0102">JavaScript</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0103" id="SKL0103">Spring</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0104" id="SKL0104">HTML/CSS</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0105" id="SKL0105">jQuery</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0106" id="SKL0106">JSP</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0107" id="SKL0107">Vue.js</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0108" id="SKL0108">Oracle</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0109" id="SKL0109">MySQL</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0110" id="SKL0110">React</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0111" id="SKL0111">Spring Boot</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0112" id="SKL0112">PHP</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0113" id="SKL0113">Python</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0114" id="SKL0114">Node.js</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0115" id="SKL0115">C#</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0116" id="SKL0116">Swift</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0117" id="SKL0117">전자정부프레임워크</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0118" id="SKL0118">kotlin</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0119" id="SKL0119">MYSQL</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0120" id="SKL0120">React</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0121" id="SKL0121">Figma</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0122" id="SKL0122">Notion</button>
	            <button type="button" class="btn btn-wave skillBtn" data-filter="SKL0123" id="SKL0123">Slack</button>
            </div>
            </div>
            <div id="addLocation2"></div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light btn-wave" style="font-weight: bold; border: 1px solid #e6e6e6; background-color: white;"  id="reset-filters2">초기화</button>
                <button type="button" class="btn btn-primary" id="apply-filters2" style="width: 300px;">적용</button>
            </div>
        </div>
    </div>
</div>
<!--  기술스택 모달창 끝 -->
<!-- main 화면 끝 -->

<script>
   const contextPath = "${pageContext.request.contextPath}";
   let currentFilters = []; // 현재 적용된 필터 목록
   let currentSort = 'latest'; // 현재 정렬 기준
   let selectedLocations = ['LOC0117']; // 선택된 지역 목록, 기본값은 '전국'
   let selectedSkills = []; // 선택된 기술 스택 목록
   let selectedEduCode = "";
   let selectedPosCode = []; 
//   console.log("selectedEduCode :====" + selectedEduCode)

$(function() {
 
    // 페이지 로딩 시 초기 데이터 로딩
    fetchNotices();
    // 페이지 로딩 시 버튼 레이블을 초기화
    updateButtonLabel();
    // 채용공고를 가져오는 함수
    
    
    // 경험 필터 버튼 클릭 이벤트 핸들러
    $('.expBtn').on('click', function() {
        const filter = $(this).data('filter'); // 버튼에 설정된 필터 값
        const index = currentFilters.indexOf(filter);

        if (index > -1) {
            // 필터가 이미 선택된 경우, 제거
            currentFilters.splice(index, 1);
            $(this).removeClass('active');
        } else {
            // 필터가 선택되지 않은 경우, 추가
            currentFilters.push(filter);
            $(this).addClass('active');
        }
        fetchNotices(); // 필터가 변경되었으므로 채용공고 다시 로딩
    });

    // 기술 스택 버튼 클릭 이벤트 핸들러
    $('.skillBtn').on('click', function() {
        const skillFilter = $(this).data('filter'); // 버튼에 설정된 기술 스택 값
        const index = selectedSkills.indexOf(skillFilter);

        if (index > -1) {
            // 기술 스택이 이미 선택된 경우, 제거
            selectedSkills.splice(index, 1);
            $(this).removeClass('active');
        } else {
            // 기술 스택이 선택되지 않은 경우, 추가
            selectedSkills.push(skillFilter);
            $(this).addClass('active');
        }
        updateSelectedSkill(); 
    });

    // 선택된 스킬 목록을 업데이트하여 화면에 표시
    function updateSelectedSkill() {
        const skillNames = selectedSkills.map(pos => {
            return $('.skillBtn[data-filter="' + pos + '"]').text().trim();
        }).join(' ');

        if (skillNames.length > 0) {
            $('#addLocation2').html('<p style="font-size:20px; font-weight:bold; text-align: center;">' + skillNames + '</p>');
        } else {
            $('#addLocation2').empty(); // 아무 것도 없을 때는 비우기
        }
    }
    
    // 정렬 버튼 클릭 이벤트 핸들러
    $('#latest').on('click', function() {
        currentSort = 'latest'; // 최신순 정렬로 설정
        setActiveSortButton('latest'); // 버튼 상태 업데이트
        fetchNotices(); // 정렬이 변경되었으므로 채용공고 다시 로딩
    });

    $('#views').on('click', function() {
        currentSort = 'views'; // 조회순 정렬로 설정
        setActiveSortButton('views'); // 버튼 상태 업데이트
        fetchNotices(); // 정렬이 변경되었으므로 채용공고 다시 로딩
    });

    // 정렬 버튼의 활성화 상태를 설정하는 함수
    function setActiveSortButton(buttonId) {
        $('#latest, #views').removeClass('active'); // 모든 버튼의 활성화 상태 제거
        $('#' + buttonId).addClass('active'); // 클릭된 버튼만 활성화
    }


    // 전국 모달창 체크박스 상태 변경 이벤트 핸들러
    $('.location-checkbox').on('change', function() {
        const locationFilter = $(this).data('filter'); // 체크박스에 설정된 지역 필터 값
        const index = selectedLocations.indexOf(locationFilter);

        if (locationFilter === 'LOC0117') {
            // '전국' 체크박스가 변경된 경우
            if ($(this).is(':checked')) {
                selectedLocations = ['LOC0117']; // '전국'만 선택
                $('.location-checkbox').not(this).prop('checked', false); // 다른 체크박스 비활성화
            } else {
                selectedLocations = []; // 모든 체크박스 비활성화
            }
        } else {
            // 일반 지역 체크박스가 변경된 경우
            if ($(this).is(':checked')) {
                if (index === -1) {
                    selectedLocations.push(locationFilter); // 선택된 지역 목록에 추가
                }
                $('#nationWide').prop('checked', false); // '전국' 체크박스 비활성화
                const nationwideIndex = selectedLocations.indexOf('LOC0117');
                if (nationwideIndex > -1) {
                    selectedLocations.splice(nationwideIndex, 1); // '전국' 제거
                }
            } else {
                if (index > -1) {
                    selectedLocations.splice(index, 1); // 선택 해제된 지역 목록에서 제거
                }
                if (selectedLocations.length === 0) {
                    selectedLocations.push('LOC0117'); // 선택된 지역이 없으면 '전국' 추가
                    $('#nationWide').prop('checked', true);
                }
            }
        }
        updateSelectedLocations(); // 체크박스 상태 변경 시 선택된 지역 업데이트
    });

    // 직무 체크박스 상태 변경 이벤트 핸들러
    $('.position-checkbox').on('change', function() {
        const positionFilter = $(this).data('filter'); // 체크박스에 설정된 지역 필터 값
        const index = selectedPosCode.indexOf(positionFilter);

            // 일반 지역 체크박스가 변경된 경우
            if ($(this).is(':checked')) {
                if (index === -1) {
                	selectedPosCode.push(positionFilter); // 선택된 지역 목록에 추가
                }
            } else {
                if (index > -1) {
                	selectedPosCode.splice(index, 1); // 선택 해제된 지역 목록에서 제거
                }
/*                 if (selectedPosCode.length === 0) {
                	selectedPosCode.push('LOC0117'); // 선택된 지역이 없으면 '전국' 추가
                    $('#nationWide').prop('checked', true);
                } */
            }
            console.log("selectedPosCode : " + selectedPosCode);
    });
    
 // 초기화 버튼 클릭 이벤트 핸들러
    $('#reset-filters3').on('click', function() {
        $('.position-checkbox').prop('checked', false); // 모든 체크박스 비활성화
        // selectedPosCode = [];
        // fetchNotices(); // 필터 초기화 후 채용공고 다시 로딩
        
    });

    // 적용 버튼 클릭 이벤트 핸들러
    $('#apply-filters3').on('click', function() {
        console.log("selectedPosCode: ", selectedPosCode);
        
        // 모든 체크박스가 비활성화된 경우 selectedPosCode를 빈 배열로 설정
        if ($('.position-checkbox:checked').length === 0) {
            selectedPosCode = [];
        } else {
            // 선택된 체크박스의 data-filter 값을 selectedPosCode에 추가
            selectedPosCode = $('.position-checkbox:checked').map(function() {
                return $(this).data('filter');
            }).get();
        }
        
        fetchNotices(); // 필터 적용 후 채용공고 다시 로딩
        $('#closeBtn3').click(); // 모달창 닫기
        updatePositionButtonLabel();
    });
    
    

	// 직무 버튼 레이블을 업데이트하는 함수
	function updatePositionButtonLabel() {
	    let positionNames = [];
	
	    // 체크된 모든 체크박스를 확인
	    $('.position-checkbox:checked').each(function() {
	        positionNames.push($(this).siblings('.position-name').text().trim());
	    });
	
	    if (positionNames.length === 0) {
	        // 체크된 직무가 없는 경우
	        $('#posTitle').text('직무 전체');
	    } else if (positionNames.length === 1) {
	        // 체크된 직무가 1개인 경우
	        $('#posTitle').text(positionNames[0]);
	    } else {
	        // 체크된 직무가 1개 이상인 경우
	        $('#posTitle').text(positionNames[0] + ' 외 ' + (positionNames.length - 1));
	    }
	}
    
    
    
    // 초기화 버튼 클릭 이벤트 핸들러
    $('#reset-filters').on('click', function() {
        selectedLocations = ['LOC0117']; // '전국'만 선택
        $('.location-checkbox').prop('checked', false); // 모든 체크박스 비활성화
        $('#nationWide').prop('checked', true); // '전국' 체크박스 활성화
        updateSelectedLocations(); // 선택된 지역 업데이트
       // fetchNotices(); // 필터 초기화 후 채용공고 다시 로딩
    });

    // 초기화 버튼 클릭 이벤트 핸들러 (기술 스택)
    $('#reset-filters2').on('click', function() {
        selectedSkills = []; // 선택된 기술 스택 초기화
        $('.skillBtn').removeClass('active'); // 모든 기술 스택 버튼의 활성화 상태 제거
        $('#addLocation2').html("");
        updateSkillButtonLabel(); // 버튼 레이블 업데이트
    });

    // 적용 버튼 클릭 이벤트 핸들러
    $('#apply-filters').on('click', function() {
        console.log("Selected Locations: ", selectedLocations);
        
        if ($('.location-checkbox:checked').val() == 'LOC0117') {
        	selectedLocations = ['LOC0117'];
        } else {
            // 선택된 체크박스의 data-filter 값을 selectedPosCode에 추가
            selectedLocations = $('.location-checkbox:checked').map(function() {
                return $(this).data('filter');
            }).get();
        }
        
        fetchNotices(); // 필터 적용 후 채용공고 다시 로딩
        $('#closeBtn').click(); // 모달창 닫기
        updateButtonLabel(); // 버튼 레이블 업데이트
    });

    // 적용 버튼 클릭 이벤트 핸들러 (기술 스택)
    $('#apply-filters2').on('click', function() {
        console.log("Selected Skills: ", selectedSkills);
        fetchNotices(); // 필터 적용 후 채용공고 다시 로딩
        $('#closeBtn2').click(); // 모달창 닫기
        updateSkillButtonLabel(); // 버튼 레이블 업데이트
    });
    
    // 모달창의 기술스택 선택 버튼 레이블을 업데이트하는 함수
    function updateSkillButtonLabel() {
        const $activeSkillBtns = $('.skillBtn.active');
        let skillNames = [];

        $activeSkillBtns.each(function() {
            skillNames.push($(this).text().trim());
        });

        if (skillNames.length > 1) {
            $('button[data-bs-target="#skill"]').text(skillNames[0] + ' 외 ' + (skillNames.length - 1));
        } else if (skillNames.length === 1) {
            $('button[data-bs-target="#skill"]').text(skillNames[0]);
        } else {
            $('button[data-bs-target="#skill"]').text('기술 스택');
        }
    }

    // 모달창 닫기 버튼 클릭 이벤트 핸들러
    $('#closeBtn').on('click', function() {
        $('.skillBtn').removeClass('active'); // 모든 기술 스택 버튼의 활성화 상태 제거
    });

    // 선택된 지역 목록을 업데이트하여 화면에 표시
    function updateSelectedLocations() {
        const locationNames = selectedLocations.map(loc => {
            return $('.location-checkbox[data-filter="' + loc + '"]').siblings('.location-name').text().trim();
        }).join(', ');

        if (locationNames) {
            $('#addLocation').html('<p style="font-size:20px; font-weight:bold; text-align: center;">' + locationNames + '</p>');
        } else {
            $('#addLocation').html('<p style="font-size:20px; font-weight:bold; text-align: center;">전국</p>');
        }
    }

    // 모달창의 지역 선택 버튼 레이블을 업데이트하는 함수
    function updateButtonLabel() {
        const nationwideFilter = 'LOC0117';
        const $nationwideCheckbox = $('.location-checkbox[data-filter="' + nationwideFilter + '"]');
        let locationNames = [];

        // 체크된 모든 체크박스를 확인
        $('.location-checkbox:checked').each(function() {
            const filter = $(this).data('filter');
            if (filter !== nationwideFilter) {
                locationNames.push($(this).siblings('.location-name').text().trim());
            }
        });

        const isNationwideSelected = $nationwideCheckbox.is(':checked');

        if (isNationwideSelected) {
            // '전국'만 선택된 경우
            $('button[data-bs-target="#location"]').text('전국');
        } else {
            // '전국'이 선택되지 않고 다른 지역이 선택된 경우
            if (locationNames.length > 1) {
                // 체크된 지역이 1개 이상인 경우
                $('button[data-bs-target="#location"]').text(locationNames[0] + ' 외 ' + (locationNames.length - 1));
            } else if (locationNames.length === 1) {
                // 체크된 지역이 1개인 경우
                $('button[data-bs-target="#location"]').text(locationNames[0]);
            } else {
                // 체크된 지역이 없는 경우
                $('button[data-bs-target="#location"]').text('전국');
            }
        }
    }

    // 전국 버튼 클릭 시 모달창의 체크박스 상태를 업데이트
    $('button[data-bs-target="#location"]').on('click', function() {
        updateButtonLabel(); // 버튼 레이블 업데이트
        // 모달창의 체크박스 상태를 업데이트
        $('.location-checkbox').each(function() {
            const filter = $(this).data('filter');
            $(this).prop('checked', selectedLocations.includes(filter));
        });
    });

    
    // 자동 검색어 완성
 	var arr = [];
    var skillMap = {};
    $.ajax({
		type : 'get',
		url : "/recruitment/autoComplete",
		dataType : "json",
        beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
		success : function(data){
			console.log(data);
			$.each(data, function(i,v){
				arr.push(v.detailCodeName);
				skillMap[v.detailCodeName] = v.detailcode  // 객체로 회사이름과 회사아이디를 매칭함
			});
			console.log(arr);
			console.log(skillMap);
		}
	}); 
    
    $("#autoComplete").autocomplete({
        source: arr, // 자동 완성 데이터 소스
        select: function(event, ui) {
            console.log(ui.item); // 선택한 항목 출력
            var selectedId = skillMap[ui.item.label];  // 선택한 항목의 ID 저장
            $("#selectedSiliiStackId").val(selectedId); // ID를 input에 저장
            $('#' + selectedId).click(); // 저장된 ID를 사용하여 클릭 이벤트 트리거
        },
        focus: function(event, ui) {
            return false; // 포커스 시 기본 동작 방지
        },
        minLength: 1, // 최소 입력 길이
        autoFocus: true, // 첫 번째 항목 자동 포커스
        classes: {
            "ui-autocomplete": "highlight"
        },
        delay: 500, // 입력 후 자동완성 창 표시까지 지연 시간
        position: { my: "right top", at: "right bottom" }
    }).autocomplete('instance')._renderItem = function(ul, item) { // UI 변경 부
        return $('<li style="z-index:99999;">') //기본 tag가 li
        .append('<div style="z-index:99999;">' + item.label + '</div>') // 원하는 모양의 HTML 만들면 됨
        .appendTo(ul);
    }; 
    
    // 자동완성 끝
    
    // 학력 버튼에서 누름
    $('.eduBtn').on('click',function(){
		var eduCode = $(this).data('filter');
		selectedEduCode = eduCode;
		console.log("selectedEduCode : " + selectedEduCode)
		var fibalEduBtnText = $(this).text();
		console.log("fibalEduBtnText : " + fibalEduBtnText)
		$('#finalEduBtn').html(fibalEduBtnText);
		fetchNotices();
    });
    
    
    $('#toggleButton, #closeBtn3').click(function(){
        $('#dropdownBox').toggle();
    });
});// function 끝

function fetchNotices() {
    $.ajax({
        url: "/recruitment/latest",
        type: "get",
        data: {
            filters: currentFilters.join(','), // 선택된 필터를 문자열로 변환
            sort: currentSort, // 현재 정렬 기준
            locations: selectedLocations.join(','), // 선택된 지역을 문자열로 변환
            skills: selectedSkills.join(','), // 선택된 기술 스택을 문자열로 변환
            eduCode : selectedEduCode, 	// 선택된 학력
            posCode : selectedPosCode.join(',')
        },
        dataType: 'json',
        success: function(res) {
            console.log(res);
	        // "공고마감"이 아닌 채용공고만 필터링
/* 		        var activeRecruitments = res.filter(function(item) {
	            return item.status !== "공고마감";
	        }); */
	  		        	
	        
            let html = "";
            $.each(res, function(i, v) {
                // 채용공고 데이터를 HTML로 변환
                html += '<div class="job-posting" style="cursor: pointer;">\n';
                html += '    <div class="card-body position-relative">\n';
                html += '        <img src="' + contextPath + '/resources/images/' + v.crpLogoUrl + '" class="img-fluid rounded-image jobImg" style="width: 210px; height: 166px;" onclick="addRecentView(\'' + v.recNtcId + '\'); location.href=\'/recruitment/detail.do?recNtcId=' + v.recNtcId + '\'">\n';
                html += '        <b class="aa bookMarkResult-' + v.recNtcId + '"></b>\n';
                html += '        <input type="hidden" value="' + v.recNtcId + '" class="recId">\n';
                html += '    </div>\n';
                html += '    <div class="job-content" style="width: 230px;" onclick="addRecentView(\'' + v.recNtcId + '\'); location.href=\'/recruitment/detail.do?recNtcId=' + v.recNtcId + '\'" >\n';
                html += '        <p class="job-title">' + v.recNtcTitle + '</p>\n';
                html += '        <p class="company-name">' + v.crpName + '</p>\n';
                html += '        <p class="job-location">' + v.workingLocCode + '\n';
                if (v.experienceCode === '신입') {
                    html += '            신입\n';
                } else if (v.experienceCode === '경력무관') {
                    html += '            경력무관\n';
                } else if (v.experienceCode === '경력') {
                    html += '            경력 ' + v.experienceLevelCode + '\n';
                }
                html += '            <span style="color: red; float: right; font-weight: bold;">' + v.status + '</span>\n';
                html += '        </p>\n';
                html += '    </div>\n';
                html += '</div>\n';
            });
            $('#recruitmentView').html(html); // 동적으로 생성된 HTML을 채용공고 컨테이너에 삽입
       
            // 각 공고의 북마크 상태를 확인
            $('.recId').each(function() {
                var recId = $(this).val();
                console.log("recId: ", recId);
                updateBookmarkStatus(recId);
            });
        }
    });
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