<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Start::app-content -->
<div class="main-content app-content">
     <div class="container-fluid">
        <div class="container-lg">

             <!-- Page Header -->
             <br><br>
             <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
                 <h1 class="page-title fw-semibold fs-21 mb-0">지원현황</h1>
                 <br><br>
             </div>
             <!-- Page Header Close -->
             
			<!-- 공고 제목별 -->
			<div class="mb-4">
				<select id="recNtcSelect" class="form-select form-select-lg mb-3">
			    	<option value="">=== 전체 공고 ===</option>
			    	<c:forEach var="recNtc" items="${recNtcList}">
			        	<option value="${recNtc.recNtcId}">${recNtc.recNtcTitle} (${recNtc.recNtcStart}-${recNtc.recNtcEnd })</option>
			     	</c:forEach>
				</select>
			</div>


             <div class="row row-cols-12">
                <div class="col">
                    <div class="card custom-card">
                    	<c:set value="${totalViews }" var="views" />
                        <div class="card-body">
                            <div class="d-flex align-items-top">
                                <div class="me-3">
                                    <span class="avatar avatar-md p-2 bg-primary">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
  										<path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
  										<path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
										</svg>
                                    </span>
                                </div>
                                <div class="flex-fill">
                                    <div class="d-flex mb-1 align-items-top justify-content-between">
                                        <h5 class="fw-semibold mb-0 lh-1">${views }</h5>
                                    </div>
                                    <p class="mb-0 fs-10 op-7 text-muted fw-semibold">공고 조회수</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card custom-card">
                    	<c:set value="${totalApply }" var="totalApply" />
                        <div class="card-body">
                            <div class="d-flex align-items-top">
                                <div class="me-3">
                                    <span class="avatar avatar-md p-2 bg-secondary">
                                        <svg class="svg-white" xmlns="http://www.w3.org/2000/svg"
                                            height="24px" viewBox="0 0 24 24" width="24px" fill="#000000">
                                            <path d="M0 0h24v24H0V0z" fill="none" />
                                            <path
                                                d="M12 5.9c1.16 0 2.1.94 2.1 2.1s-.94 2.1-2.1 2.1S9.9 9.16 9.9 8s.94-2.1 2.1-2.1m0 9c2.97 0 6.1 1.46 6.1 2.1v1.1H5.9V17c0-.64 3.13-2.1 6.1-2.1M12 4C9.79 4 8 5.79 8 8s1.79 4 4 4 4-1.79 4-4-1.79-4-4-4zm0 9c-2.67 0-8 1.34-8 4v3h16v-3c0-2.66-5.33-4-8-4z" />
                                        </svg>
                                    </span>
                                </div>
                                <div class="flex-fill">
                                    <div class="d-flex mb-1 align-items-top justify-content-between">
                                        <h5 class="fw-semibold mb-0 lh-1">${totalApply }</h5>
                                    </div>
                                    <p class="mb-0 fs-10 op-7 text-muted fw-semibold">지원자 수</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card custom-card">
                    	<c:set value="${totalExpPerson }" var="totalExpPerson" />
                        <div class="card-body">
                            <div class="d-flex align-items-top">
                                <div class="me-3">
                                    <span class="avatar avatar-md p-2 bg-secondary">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-clipboard2-check" viewBox="0 0 16 16">
  										<path d="M9.5 0a.5.5 0 0 1 .5.5.5.5 0 0 0 .5.5.5.5 0 0 1 .5.5V2a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 2v-.5a.5.5 0 0 1 .5-.5.5.5 0 0 0 .5-.5.5.5 0 0 1 .5-.5z"/>
  										<path d="M3 2.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 0 0-1h-.5A1.5 1.5 0 0 0 2 2.5v12A1.5 1.5 0 0 0 3.5 16h9a1.5 1.5 0 0 0 1.5-1.5v-12A1.5 1.5 0 0 0 12.5 1H12a.5.5 0 0 0 0 1h.5a.5.5 0 0 1 .5.5v12a.5.5 0 0 1-.5.5h-9a.5.5 0 0 1-.5-.5z"/>
  										<path d="M10.854 7.854a.5.5 0 0 0-.708-.708L7.5 9.793 6.354 8.646a.5.5 0 1 0-.708.708l1.5 1.5a.5.5 0 0 0 .708 0z"/>
										</svg>
                                    </span>
                                </div>
                                <div class="flex-fill">
                                    <div class="d-flex mb-1 align-items-top justify-content-between">
                                        <h5 class="fw-semibold mb-0 lh-1">${totalExpPerson }</h5>
                                        <!-- <div class="text-success fw-semibold"><i
                                            class="ri-arrow-up-s-fill me-1 align-middle"></i>+0.40%</div> -->
                                    </div>
                                    <p class="mb-0 fs-10 op-7 text-muted fw-semibold">경력자 수</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card custom-card">
                    	<c:set value="${totalNewComer }" var="totalNewComer" />
                        <div class="card-body">
                            <div class="d-flex align-items-top">
                                <div class="me-3">
                                    <span class="avatar avatar-md p-2 bg-secondary">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-mortarboard-fill" viewBox="0 0 16 16">
  										<path d="M8.211 2.047a.5.5 0 0 0-.422 0l-7.5 3.5a.5.5 0 0 0 .025.917l7.5 3a.5.5 0 0 0 .372 0L14 7.14V13a1 1 0 0 0-1 1v2h3v-2a1 1 0 0 0-1-1V6.739l.686-.275a.5.5 0 0 0 .025-.917z"/>
  										<path d="M4.176 9.032a.5.5 0 0 0-.656.327l-.5 1.7a.5.5 0 0 0 .294.605l4.5 1.8a.5.5 0 0 0 .372 0l4.5-1.8a.5.5 0 0 0 .294-.605l-.5-1.7a.5.5 0 0 0-.656-.327L8 10.466z"/>
										</svg>
                                    </span>
                                </div>
                                <div class="flex-fill">
                                    <div class="d-flex mb-1 align-items-top justify-content-between">
                                        <h5 class="fw-semibold mb-0 lh-1">${totalNewComer }</h5>
                                    </div>
                                    <p class="mb-0 fs-10 op-7 text-muted fw-semibold">신입 수</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
              </div> 
                
              <div class="row">
                  <div class="col-xl-12">
                      <div class="card custom-card">
                          <div class="card-header">
                              <div class="card-title">일자별 유입현황</div>
                          </div>
                          <div class="card-body">
                              <canvas id="chartjs-by-day" class="chartjs-chart"></canvas>
                          </div>
                      </div>
                  </div>
                  <div class="col-xl-6">
                      <div class="card custom-card">
                          <div class="card-header">
                              <div class="card-title">학력별 유입현황</div>
                          </div>
                          <div class="card-body">
                              <canvas id="chartjs-by-edu" class="chartjs-chart"></canvas>
                          </div>
                      </div>
                  </div>
                  <div class="col-xl-6">
                      <div class="card custom-card">
                          <div class="card-header">
                              <div class="card-title">전공별 유입현황</div>
                          </div>
                          <div class="card-body">
                              <canvas id="chartjs-by-major" class="chartjs-chart"></canvas>
                          </div>
                      </div>
                  </div>
              </div>
		</div>
	</div>
</div>
    
    <script src="${pageContext.request.contextPath }/resources/assets/libs/chart.js/chart.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/assets/js/chartjs-charts.js"></script>

<script>
let selectedRecNtcId = "";

$(function(){
	getApplicantByDayGraph();
	getApplicantByEduGraph();
	getApplicantByMajorGraph();
	
});

function getApplicantByMajorGraph(){
	
	let majorList = [];
	let countApplyByMajorList = [];
	
	$.ajax({
		url : "/statistics/applicantByMajor",
		type: "get",
		data : {recNtcId : selectedRecNtcId},
		success: function(data){
			console.log(data);
			console.log(data.applyListByMajor);
			for(let i = 0; i < data.applyListByMajor.length; i++){
				majorList.push(data.applyListByMajor[i].eduMajor);
				countApplyByMajorList.push(data.applyListByMajor[i].applyCount);
			}
			console.log("majorList >> ", majorList);
			console.log("countApplyByMajorList >> ", countApplyByMajorList);
			const applicantByMajor = document.querySelector("#chartjs-by-major");
			new Chart(applicantByMajor, {
				type: "doughnut",
				data: {
					labels: majorList,
					datasets: [{
						data : countApplyByMajorList,
						label : "지원자 수",
						backgroundColor: [
							"rgb(255, 99, 132)",
							"rgb(54, 162, 235)",
							"rgb(255, 205, 86)"
						],
						hoverOffset : 4
					}]
				}
			});
		},
		error:function(){
			 Swal.fire({
                 title: "실패",
                  text: "차트 가져오기 실패",
                  icon: "error",
                  confirmButtonText: "확인"
              })
		}
	});
	
}

function getApplicantByEduGraph(){
	
	let eduTypeList = [];
	let countApplyList = [];
	
	$.ajax({
		url : "/statistics/applicantByEdu",
		type: "get",
		success: function(data){
			//console.log(data);
			//console.log(data.applyListByEdu[0].eduType);
			for(let i = 0; i < data.applyListByEdu.length; i++){
				eduTypeList.push(data.applyListByEdu[i].eduType);
				countApplyList.push(data.applyListByEdu[i].applyCount);
			}
			//console.log("eduTypeList >> ", eduTypeList);
			//console.log("countApplyList >> ", countApplyList);
			const applicantByEdu = document.querySelector("#chartjs-by-edu");
			new Chart(applicantByEdu, {
				type: "doughnut",
				data: {
					labels: eduTypeList,
					datasets: [{
						data : countApplyList,
						label : "지원자 수",
						backgroundColor: [
							"rgb(255, 99, 132)",
							"rgb(54, 162, 235)",
							"rgb(255, 205, 86)"
						],
						hoverOffset : 4
					}]
				}
			});
		},
		error:function(){
			alert("실패");
		}
	});
	
}

function getApplicantByDayGraph(){
	
	let dateList = [];
	let countApplicantList = [];
	
	$.ajax({
		url : "/statistics/applicantByDay",
		type: "get",
		success: function(data){
			//console.log(data);
			//console.log(data.applyListByDay[0].applyDate);
			for(let i = 0; i < data.applyListByDay.length; i++){
				dateList.push(data.applyListByDay[i].applyDate);
				countApplicantList.push(data.applyListByDay[i].applyCount);
			}
			//console.log("dateList >> ", dateList);
			//console.log("countApplicantList >> ", countApplicantList);
			
			const applicantByDay = document.querySelector("#chartjs-by-day");
			new Chart(applicantByDay, {
				type: "line",
				data: {
					labels: dateList,
					datasets: [{
						data : countApplicantList,
						label : "지원자 수",
						borderColor: "#8e5ea2",
						fill : false
					}]
				}
			});
			
		},
		error:function(){
			alert("실패");
		}
	});
	
}

</script>
    