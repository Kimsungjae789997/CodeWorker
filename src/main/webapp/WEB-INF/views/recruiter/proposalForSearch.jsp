<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
.profile-details {
    margin-left: 20px; 
}
.profile-image{
	width : 80px;
	height : 80px;
}
.profile-image-container {
    width: 120px; /* 프로필 이미지가 들어가는 div의 너비를 120px로 설정 */
    height: 120px; /* 프로필 이미지가 들어가는 div의 높이를 120px로 설정 */
    margin-left: 20px;
}
.content-wrapper {
    display: flex;
    width : 100%;
}
.filter-section {
    flex: 1 1 25%; /* 필터 섹션의 너비를 25%로 설정 */
    max-width: 25%;
    margin-right: 30px;  /* 필터와 후보자 사이에 여백 추가 */
}
.candidate-section {
   flex: 1 1 75%; /* 후보자 섹션의 너비를 75%로 설정 */
   max-width: 75%;
}
.candidate-card{
    margin-bottom: 20px;
    mid-height : 100vh;
}
.modal-xl {
    max-width: 100%; /* 모달의 너비를 90%로 설정 */
}
 .modal-body {
	min-width : 80vh;
 	min-height: 40vh;
    max-height: 120vh; /* 모달의 최대 높이를 80vh로 설정 */
    overflow-y: auto; /* 세로 스크롤바 추가 */
 }
.icon {
  width: 1em; /* 글자 크기와 비슷하게 설정 */
  height: 1em; /* 글자 크기와 비슷하게 설정 */
  vertical-align: middle; /* 텍스트와 수직으로 정렬 */
}
.candidate-search{
	height : 5vh;
}
</style>

<!-- Start::app-content -->
<div class="main-content app-content">
    <div class="container-fluid">
        <div class="container-lg">
        
        	<!-- 제목 시작 -->
        	<br><br>
	        <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
	            <h1 class="page-title fw-semibold fs-21 mb-0">인재풀 인재 검색</h1>
	        	<br><br>
	        </div>
        	<!-- 제목 끝 -->
            
            <!-- 검색 부분 -->
            <form id="searchForm">
            
            <div class="row align-items-center mb-4">
                <div class="col-lg-12">
                    <div class="input-group companies-search-input candidate-search">
                    	<input type="hidden" name="page" id="page" /> 
                    	<span class="input-group-text">
                    	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
  						<path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"/>
						</svg>
                    	</span>
                        <input type="text" id="searchWord" name="searchWord" value="${searchWord }" class="form-control" placeholder="직무, 업무, 회사 등을 입력해 보세요.">
                        <button type="submit" class="btn btn-primary">
                        	<i class="bi bi-search"></i>
                        </button>
                    </div>
                </div>
            </div>
			
            <!-- 중간 제목 부분 -->
            <div class="card custom-card mb-4">
                <div class="card-body">
                    <div class="d-flex flex-wrap gap-2 align-items-center">
                        <h6 class="mb-0 flex-grow-1"> 총 <span class="fw-semibold fs-16" style="color:purple;">${pagingVO.totalRecord }</span><span class="fw-normal fs-16">명 ✦ 우리기업에서 제안할 수 있는 인재</span> </h6>
                        <div class="btn-group">
                            <font>업데이트일 순 </font>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="javascript:void(0);">Newest</a></li>
                                <li><a class="dropdown-item" href="javascript:void(0);">Premium</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 메인 컨텐츠 부분 : 사이드 필터, 후보자 목록 -->
            <div class="content-wrapper mb-4">
                <!-- 사이드 필터 부분 -->
                <div class="filter-section">
                    <div class="card custom-card products-navigation-card">
	                        <div class="card-body p-0">
	                        	<!-- 필터 0 : 경력 여부 -->
	                        	<div class="px-2 py-4 px-sm-4 border-bottom">
		                            <h6 class="fw-semibold mb-0">경력 여부</h6>
		                            <div class="row px-2 py-3 pb-0">
		                            <div style="display: flex; flex-wrap: wrap;">
		                               <c:forEach items="${hasCareerList }" var="hasCareer">
		                               <div class="form-check form-check-lg" style="width: 50%;">
		                                   <input class="form-check-input hasCareer-radio" type="radio" name="seekerExp" 
		                                          value="${hasCareer.DETAILCODE}" id="hasCareer_${hasCareer.DETAILCODE }"/>
		   								   <label class="form-check-label" for="hasCareer_${hasCareer.DETAILCODE }">
		       							   ${hasCareer.DETAIL_CODE_NAME }
		   								   </label>
		   							   </div>	
		   							   </c:forEach>
		                            </div>
		                            </div>
	                            </div>
	                            <!-- 필터 1 : 경력 연차 -->
	                            <div class="px-2 py-4 px-sm-4 border-bottom">
	                                <h6 class="fw-semibold mb-0">경력</h6>
	                                <div class="row px-2 py-3 pb-0">
		                                <select class="form-control" data-trigger name="seekerExpYearsCode" id="careerYearsSelect">
		                                     <option value="">경력 연차를 선택하세요</option>
		                                <c:forEach items="${careerYearsList }" var="careerYears">
	                                       <option value="${careerYears.DETAILCODE }" <c:if test="${careerYears.DETAILCODE == seekerExpYearsCode }">selected</c:if>>
	                                        ${careerYears.DETAIL_CODE_NAME }</option>
	                                    </c:forEach>
		                                </select>
	                                </div>
	                            </div>
	                            <!-- 필터 1 : 경력 끝 -->
	                            <!-- 필터 2 : 지역 -->
	                            <div class="px-2 py-4 px-sm-4 border-bottom">
	                                <h6 class="fw-semibold mb-0">지역</h6>
	                                <div class="px-2 py-3 pb-0">
	                                   <select class="form-control" data-trigger name="seekerAdd1" id="seekerAdd1">
	                                        <option value="">지역을 선택하세요</option>
	                                        <c:forEach items="${locationList }" var="location">
	                                        <option value="${location.DETAILCODE }" <c:if test="${location.DETAILCODE == seekerAdd1}">selected</c:if>>
	                                        ${location.DETAIL_CODE_NAME }</option>
	                                        </c:forEach>
	                                    </select>
	                                </div>
	                            </div>
	                            <!-- 필터 2 : 지역 끝 -->
	                            <!-- 필터 3 : 학력 -->
	                            <div class="px-2 py-4 px-sm-4 border-bottom">
	                                <h6 class="fw-semibold mb-0">학력</h6>
	                                <div class="px-2 py-3 pb-0">
	                                	<div style="display: flex; flex-wrap: wrap;">
		                                	<c:forEach items="${educationList }" var="education"> 
			                                <div class="form-check form-check-lg" style="width:100%;">
			                                    <input class="form-check-input education-radio" type="radio" name="eduTypeCode" value="${education.DETAILCODE }"
			                                    <c:if test="${education.DETAILCODE == eduTypeCode }">checked</c:if>>
			    								<label class="form-check-label" for="">
			        							${education.DETAIL_CODE_NAME }
			    								</label>
			    							</div>	
											</c:forEach>
		                                </div>
	                                </div>
	                            </div>
	                            <!-- 필터 3 : 학력 끝 -->
	                            <!-- 필터 4 : 보유 기술 -->
	                            <div class="px-2 py-4 px-sm-4 border-bottom">
	                                <h6 class="fw-semibold mb-0">보유 기술</h6>
	                                <div class="px-2 py-3 pb-0">
	                                   <select class="form-control" data-trigger name="skillstackCode" id="">
	                                        <option value="">기술을 선택하세요</option>
	                                        <c:forEach items="${skillList }" var="skill">
	                                        <option value="${skill.DETAILCODE }" <c:if test="${skillList == skillstackCode }">selected</c:if>>
	                                        ${skill.DETAIL_CODE_NAME }</option>
	                                        </c:forEach>
	                                    </select>
	                                </div>
	                            </div>
	                            <!-- 필터 4 : 보유 기술 끝 -->
	                        </div>
	                        <div class="card-footer">
	                        	<input type="submit" class="btn btn-primary" value="검색" />
	                        </div>
                    </div>
                </div>
                <!-- 사이드 필터 끝 -->
                
                <!-- 후보자 내용 시작 -->
                <div class="candidate-section" id="propAreaDiv">
				<c:set value="${pagingVO.dataList }" var="seekerList" />
				<c:choose>
					<c:when test="${empty seekerList}">
						<div class="candidate-card">
							<div class="card custom-card">
								<div class="card-body container">
								<h5 style="text-align:center;">검색 가능한 인재가 없습니다.</h5>
								</div>
							</div>
						</div>
					</c:when>
				 	<c:otherwise>
				 		<c:forEach items="${seekerList }" var="seeker">
				 	    <div class="candidate-card">
				        <div class="card custom-card">
				            <div class="card-body container">
				                <!-- 아이콘 부분 -->
				                <div class="d-flex justify-content-end mb-2">
				                <div class="btn-list float-end"></div>
				                </div>
				                <!-- 내용 부분 전체 -->
				                <div class="col-12 col-md-12">
				                  <div class="row">
					                  <!-- 프로필 부분 -->
					                  <div class="col-12 col-md-3 d-flex align-items-center profile-image-container">
					                          <span class="avatar avatar-lg avatar-rounded profile-image w-100 h-100">
					                              <img src="${seeker.resumeVO.resumeProfileUrl}" alt="profile-ex.PNG">
					                          </span>
					                  </div> 
					                  <!-- 내용 부분 -->      
					                  <div class="col-12 col-md-7 profile-details">
					                      <h5 class="fw-semibold">${seeker.seekerName }</h5><h6>${seeker.seekerAge }세 - ${seeker.seekerExp } <c:if test="${seeker.seekerExp eq '경력' }">(총 ${seeker.careerTotalDuration })</c:if></h6>
					                      <div><h6>이력서 제목 : ${seeker.resumeVO.resumeName }</h6></div>
					                      <br>
					                      <div>
					                      	<h6>
					                      	<svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M12 20.8995L16.9497 15.9497C19.6834 13.2161 19.6834 8.78392 16.9497 6.05025C14.2161 3.31658 9.78392 3.31658 7.05025 6.05025C4.31658 8.78392 4.31658 13.2161 7.05025 15.9497L12 20.8995ZM12 23.7279L5.63604 17.364C2.12132 13.8492 2.12132 8.15076 5.63604 4.63604C9.15076 1.12132 14.8492 1.12132 18.364 4.63604C21.8787 8.15076 21.8787 13.8492 18.364 17.364L12 23.7279ZM12 13C13.1046 13 14 12.1046 14 11C14 9.89543 13.1046 9 12 9C10.8954 9 10 9.89543 10 11C10 12.1046 10.8954 13 12 13ZM12 15C9.79086 15 8 13.2091 8 11C8 8.79086 9.79086 7 12 7C14.2091 7 16 8.79086 16 11C16 13.2091 14.2091 15 12 15Z"></path></svg>
					                      	희망지역 : ${seeker.seekerAdd1 }</h6>
					                      </div>
					                      <div>
					                          <h6>
					                          <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M4 11.3333L0 9L12 2L24 9V17.5H22V10.1667L20 11.3333V18.0113L19.7774 18.2864C17.9457 20.5499 15.1418 22 12 22C8.85817 22 6.05429 20.5499 4.22263 18.2864L4 18.0113V11.3333ZM6 12.5V17.2917C7.46721 18.954 9.61112 20 12 20C14.3889 20 16.5328 18.954 18 17.2917V12.5L12 16L6 12.5ZM3.96927 9L12 13.6846L20.0307 9L12 4.31541L3.96927 9Z"></path></svg>
					                                                            학력 : ${seeker.educationVO.eduName } ${seeker.educationVO.eduMajor } (${seeker.educationVO.eduType }) </h6>
					                      </div>
					                      <div>
					                      	  <c:choose>
					                      	  	  <c:when test="${empty seeker.resumeCareerVO }"></c:when>
						                      	  <c:otherwise>
						                          <h6>
						                          <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M21.0082 3C21.556 3 22 3.44495 22 3.9934V20.0066C22 20.5552 21.5447 21 21.0082 21H2.9918C2.44405 21 2 20.5551 2 20.0066V3.9934C2 3.44476 2.45531 3 2.9918 3H21.0082ZM20 5H4V19H20V5ZM18 15V17H6V15H18ZM12 7V13H6V7H12ZM18 11V13H14V11H18ZM10 9H8V11H10V9ZM18 7V9H14V7H18Z"></path></svg>
						                          	경력 : ${seeker.resumeCareerVO.resCareerName } · ${seeker.resumeCareerVO.resCareerDept } · ${seeker.resumeCareerVO.careerYears }년 </h6>
						                          <p>• ${seeker.resumeCareerVO.resCareerContent }</p>
						                      	  </c:otherwise>
					                      	  </c:choose>
					                      </div>
					                      <div>
						                    <c:choose>
									       	<c:when test="${empty seeker.resumeSkillList }">
									       	</c:when>
									       	<c:otherwise>
									       		<div class="popular-tags flex-grow-1">
									       		<svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M5.32943 3.27152C6.56252 2.83314 7.9923 3.10743 8.97927 4.0944C10.1002 5.21531 10.3019 6.90735 9.5843 8.23378L20.293 18.9436L18.8788 20.3579L8.16982 9.64869C6.84325 10.3668 5.15069 10.1653 4.02952 9.04415C3.04227 8.0569 2.7681 6.62659 3.20701 5.39326L5.44373 7.62994C6.02952 8.21572 6.97927 8.21572 7.56505 7.62994C8.15084 7.04415 8.15084 6.0944 7.56505 5.50862L5.32943 3.27152ZM15.6968 5.15506L18.8788 3.38729L20.293 4.80151L18.5252 7.98349L16.7574 8.33704L14.6361 10.4584L13.2219 9.04415L15.3432 6.92283L15.6968 5.15506ZM8.97927 13.2868L10.3935 14.701L5.09018 20.0043C4.69966 20.3948 4.06649 20.3948 3.67597 20.0043C3.31334 19.6417 3.28744 19.0698 3.59826 18.6773L3.67597 18.5901L8.97927 13.2868Z"></path></svg>
									       		보유기술 :
									       		<c:forEach items="${seeker.resumeSkillList }" var="skill">
									       		   <span class="badge bg-outline-info">${skill.skillstackCode }</span>
									       		</c:forEach>
									            </div>
									       	</c:otherwise>
									     	</c:choose>
					                      </div>
					                  </div>  
					                  <!-- 내용 부분 끝 --> 
									  <!-- 이력서 및 제안하기 버튼 -->
									  <div class="col-12 col-md-2 align-items-bottom md-0" style="margin-top: 90px;">
									  <div>    
									  	 <button class="btn btn-info btn-wave w-100" onclick="window.open('/applicant/resume?resumeNo=${seeker.resumeVO.resumeNo }')"><i class="bi bi-download"></i> 이력서 보기</button>
									  </div>
									  <div style="margin-top: 5px;">    
									  	 <button class="btn btn-success btn-wave w-100 propBtn" data-memid="${seeker.memId }">
									  	 <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M21 7C22.6569 7 24 5.65685 24 4C24 2.34315 22.6569 1 21 1C19.3431 1 18 2.34315 18 4C18 5.65685 19.3431 7 21 7ZM22 18V8.89998C21.6769 8.96557 21.3425 9 21 9C20.6575 9 20.3231 8.96557 20 8.89998V17H5.76282L4 18.3851V5H16.1C16.0344 4.67689 16 4.34247 16 4C16 3.65753 16.0344 3.32311 16.1 3H3C2.44772 3 2 3.44772 2 4V22.5L6.45455 19H21C21.5523 19 22 18.5523 22 18Z"></path></svg>
									  	  제안하기</button>
									  </div>
									  </div>
									  <!-- 버튼 끝 -->
				                  </div>
				           	   </div>
				           	   <!-- 내용 부분 전체 끝 -->
				            </div>
				            <div class="card-footer" style="text-align:right;">
				            <svg class="icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor"><path d="M12 22C6.47715 22 2 17.5228 2 12C2 6.47715 6.47715 2 12 2C17.5228 2 22 6.47715 22 12C22 17.5228 17.5228 22 12 22ZM11.0026 16L18.0737 8.92893L16.6595 7.51472L11.0026 13.1716L8.17421 10.3431L6.75999 11.7574L11.0026 16Z"></path></svg>                  
				                                이력서 업데이트 ${seeker.resumeVO.resumeUpdDate }
				            </div>
				    	 </div>
				    	 </div>
				 		 </c:forEach>
				    </c:otherwise>
				</c:choose>
                </div>
                <!-- 1명의 후보자 내용 끝 -->
            </div>
            <sec:csrfInput/>
            </form>
            <!-- -->
            <div class="pagination mb-4 justify-content-end">
                 <div class="ms-auto" id="pagingArea">
                     ${pagingVO.pagingHTML }
                 </div>
            </div>
        </div>
        </div>
</div>
<!-- End::app-content -->

<!-- 제안하기 버튼 클릭시 띄워지는 모달 -->
<div class="modal fade" id="recNtcListForPropModal" tabindex="-1"
     aria-labelledby="recNtcListForPropModalLabel" aria-hidden="true">
<div class="modal-dialog modal-xl" style="width:1200px;">
    <div class="modal-content">
        <div class="modal-header">
            <h6 class="modal-title" id="exampleModalLgLabel">제안할 포지션 선택하기(현재 채용중인 포지션)</h6>
            <button type="button" class="btn-close" data-bs-dismiss="modal"
                aria-label="Close"></button>
        </div>
        <div class="modal-body">
        <!-- 여기에 공고 목록 뿌려놓기 -->  
       		<table class="table table-bordered">
				<thead>
					<tr>
						<td>번호</td>
						<td>공고명</td>
						<td>상태</td>
						<td>마감일자</td>
						<td>선택</td>
					</tr>		
				</thead>
				<tbody id="modBody">
				<!-- 비동기처리로 데이터 들어오는 장소 -->
				</tbody>
			</table>
        
        </div>
        <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="proposalBtn">확인</button>
    </div>
    </div>
</div>
</div>

<script>
$(function(){
	ws = new WebSocket("ws://192.168.35.28/echo");
	let pagingArea = $("#pagingArea");
	let searchForm = $("#searchForm");
	
	pagingArea.on("click", "a", function(event){
		event.preventDefault();
		let pageNo = $(this).data("page");
		
		searchForm.find("#page").val(pageNo);
		searchForm.submit();
	});

	// 후보자 목록 화면에 있는 제안하기 버튼 클릭 이벤트 -> 모달창(공고 목록) 띄우기
	let propBtn = $(".propBtn");
	let selectedMemId;
	
	$("#propAreaDiv").on("click", ".propBtn", function(event){

		event.preventDefault();

		selectedMemId = $(this).data("memid");
		console.log("selectedMemId 1 -> ", selectedMemId);
		
	    Swal.fire({
	        title: '확인',
	        text: "해당 인재에게 제안 메세지를 보내시겠습니까?",
	        icon: 'question',
	        showCancelButton: true, // 취소 버튼 표시
	        confirmButtonText: '확인',
	        cancelButtonText: '취소'
	    }).then((result) => {
	    	if(result.isConfirmed){
				$.ajax({
					url: "/proposal/recNtcList",
					method: "GET",
					success: function(data){
						let html = "";
						data.map(function(v,i){
							html += "<tr>";
							html += "	<td>"+v.rnum+"</td>		";
							html += "	<td>"+v.recNtcTitle+"</td>		";
							html += "	<td>"+v.status+"</td>		";
							html += "	<td>"+v.recNtcEnd+"</td>";
							html += "	<td><input type='radio' name='selectPosition' value='"+v.recNtcId +"'></td>";
							html += "</tr>";
						});
						console.log("data >> ", data);
						$("#modBody").html(html);
						$("#recNtcListForPropModal").modal("show");
					},
					error: function(){
						Swal.fire({
			                  title: "ajax 실패",
			                   text: "제안에 실패하였습니다.",
			                   icon: "error",
			                   confirmButtonText: "확인"
			            })
					}
				});
	    	} else {
	            Swal.fire({
	                title: "취소",
	                 text: "취소 되었습니다.",
	                 icon: "warning",
	                 confirmButtonText: "확인"
	             })
	    	}
	    });
		
	});
	
	// 모달창 안에 있는 제안하기 버튼 클릭 이벤트(PROPOSAL테이블 INSERT)
	let proposalBtn = $("#proposalBtn");
	proposalBtn.on("click", function(event){
		
		event.preventDefault();
		let recNtcId = $("input[name='selectPosition']:checked").val();
		// 필요한 데이터 : 기업ID/기업회원ID(컨트롤러에서 시큐리티 처리), 구직자ID, 공고 ID
		let data = { 
				memId : selectedMemId,
				recNtcId : recNtcId
		};
		
		// 제안 테이블 insert
		$.ajax({
			url : "/proposal/insert",
			method : "POST",
			data : JSON.stringify(data),
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
			contentType : "application/json; chartset=utf-8",
			success: function(res){
				//console.log("res : " + res);
				// 알림 보내기
        		let alarmData = {
        				"code" : "success",
        				"content" : "알람이 도착했습니다.",
        				"proNo" : res.proNo
        		}
        		ws.send(JSON.stringify(alarmData));
				console.log(alarmData);
				// alert창 띄우기
				Swal.fire({
                  title: "제안 성공",
                   text: "해당 후보자에게 알림을 보냈습니다.",
                   icon: "success",
                   confirmButtonText: "확인"
               })
			}
		});
		$("#recNtcListForPropModal").modal("hide");
	});
	
	// 경력 연차 비활성화
	$("#careerYearsSelect").prop("disabled", true);
	
	// 경력 여부 라디오 버튼 변경 이벤트
	$("input[name='seekerExp']").change(function(){
		let careerYearsSelect = $("#careerYearsSelect");
		
		if($(this).val() === "EXP0102"){
			careerYearsSelect.prop("disabled", false);
		}else{
			careerYearsSelect.prop("disabled", true);
			careerYearsSelect.val(''); // 선택 초기화
		}
	});
	
    // 페이지 로드 시 URL 파라미터를 폼 필드에 설정
    setFormValuesFromURL();
	
});

// URL의 쿼리 파라미터를 읽어 폼 필드에 값을 설정하는 함수
function setFormValuesFromURL() {
    let urlParams = new URLSearchParams(window.location.search);

    // 각 필드에 대해 URL 파라미터 값을 설정
    $('#searchWord').val(urlParams.get('searchWord'));
    $('input[name="seekerExp"][value="' + urlParams.get('seekerExp') + '"]').prop('checked', true);
    $('#careerYearsSelect').val(urlParams.get('seekerExpYearsCode'));
    $('#seekerAdd1').val(urlParams.get('seekerAdd1'));
    $('input[name="eduTypeCode"][value="' + urlParams.get('eduTypeCode') + '"]').prop('checked', true);
    $('select[name="skillstackCode"]').val(urlParams.get('skillstackCode'));

    // 경력 여부에 따라 경력 연차 필드 활성화/비활성화
    if (urlParams.get('seekerExp') === 'EXP0102') {
        $('#careerYearsSelect').prop('disabled', false);
    } else {
        $('#careerYearsSelect').prop('disabled', true);
    }
}

</script>