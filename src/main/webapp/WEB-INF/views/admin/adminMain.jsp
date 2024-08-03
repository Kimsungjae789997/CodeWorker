<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.1/dist/chart.umd.min.js"></script>

<style>
	.badge{
		margin-top: 5px;
		font-size: 13px;
	}
	
	.topContent{
		font-size: 17px;
	}

</style>

<div class="row">
	<div class="col-md-12 pb-3"></div>
	<div class="col-md-12">
		<div class="row">
			<div class="col-xl-12">
				<div class="card custom-card">
					<div class="card-header">
						<div class="card-title">
							<font>Code Worker <span class="time" id="currentTime"></span></font>
						</div>
					</div>
					<div class="card-body">
						<div class="row gy-md-0 gy-3">
							<div class="col-xxl-4 col-xl-4 col-lg-4 col-md-4 col-sm-12">
								<div class="d-flex align-items-top">
									<div class="me-3">
										<span class="avatar avatar-rounded bg-light text-primary">
											<i class="ri-user-line fs-20"></i>
										</span>
									</div>
									<div>
										<a class="d-block mb-1 text-muted topContent" href="/admin/seekerList">구직 회원수</a>
										<h6 class="fw-semibold mb-0">${seekerNum }명</h6>
										<p class="mb-0">
											<span class="badge bg-primary-transparent">Today</span>
										</p>
									</div>
								</div>
							</div>
							<div class="col-xxl-4 col-xl-4 col-lg-4 col-md-4 col-sm-12">
								<div class="d-flex align-items-top">
									<div class="me-3">
										<span class="avatar avatar-rounded bg-light text-secondary">
											<i class="ri-building-4-line fs-19"></i>
										</span>
									</div>
									<div>
										<a class="d-block mb-1 text-muted topContent" href="/admin/crpList">등록 기업수</a>
										<h6 class="fw-semibold mb-0">${crpNum }곳</h6>
										<p class="mb-0">
											<span class="badge bg-secondary-transparent">Today</span>
										</p>
									</div>
								</div>
							</div>
							<div class="col-xxl-4 col-xl-4 col-lg-4 col-md-4 col-sm-12">
								<div class="d-flex align-items-top">
									<div class="me-3">
										<span class="avatar avatar-rounded bg-light text-warning">
											<i class="ti ti-file-dislike fs-18"></i>
										</span>
									</div>
									<div>
										<span class="d-block mb-1 text-muted topContent">등록 공고수</span>
										<h6 class="fw-semibold mb-0">${recNtcNum }건</h6>
										<p class="mb-0">
											<span class="badge bg-danger-transparent">Today</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="col-xxl-4 col-xl-4 col-lg-4 col-md-12">
	    <div class="card custom-card">
	        <div class="card-header">
	            <div class="card-title">
	                	관심 기업순
	            </div>
	        </div>
	        <div class="card-body py-4 px-0">
				<canvas id="pending-works-chart2" style="width:100px;height:100px;"></canvas>
	        </div>
	        <div class="card-footer p-4 my-2">

	        </div>
	    </div>
	</div>
	
	<div class="col-xxl-4 col-xl-4 col-lg-4 col-md-12">
	    <div class="card custom-card">
	        <div class="card-header">
	            <div class="card-title">
	                	가장 많이 조회된 공고순
	            </div>
	        </div>
	        <div class="card-body py-4 px-0">
				<canvas id="pending-works-chart4" style="width:300px;height:300px;"></canvas>
	        </div>
	        <div class="card-footer p-4 my-2">

	        </div>
	    </div>
	</div>
	
	<div class="col-xxl-4 col-xl-4 col-lg-4 col-md-12">
	    <div class="card custom-card">
	        <div class="card-header">
	            <div class="card-title">
	                	지원율이 가장 많은 기업순
	            </div>
	        </div>
	        <div class="card-body py-4 px-0">
				<canvas id="pending-works-chart3" style="width:300px;height:300px;"></canvas>
	        </div>
	        <div class="card-footer p-4 my-2">

	        </div>
	    </div>
	</div>
	
<!-- 	<div class="col-xxl-6 col-xl-6 col-lg-6 col-md-12"> -->
<!-- 	    <div class="card custom-card"> -->
<!-- 	        <div class="card-header"> -->
<!-- 	            <div class="card-title"> -->
<!-- 	                	가장 많이 북마크에 추가된 공고순<br/> -->
<!-- 	            </div> -->
<!-- 	        </div> -->
<!-- 	        <div class="card-body py-4 px-0"> -->
<%-- 				<canvas id="pending-works-chart1" style="width:300px;height:300px;"></canvas> --%>
<!-- 	        </div> -->
<!--             <div class="card-footer p-4 my-2"> -->
            
<!--             </div> -->

<!-- 	    </div> -->
<!-- 	</div> -->
</div>


 
<script type="text/javascript">
/*
	// 가장 많이 북마크에 추가된 공고순
	var ctxPending1 = document.getElementById('pending-works-chart1').getContext('2d');
	var pendingWorksData1 = {
	    labels: [
	    	<c:forEach items="${map1}" var="entry1">
		        '${entry1.REC_NTC_TITLE}',
		    </c:forEach>
	    ],
	    datasets: [{
// 	        label: '미완료 작업 수',
	        data: [
	        	<c:forEach items="${map1}" var="entry2">
			        '${entry2.REC_NTC_ID_COUNT}',
			    </c:forEach>
	        ],
	        backgroundColor: ['#36A2EB', '#9966FF', '#FF9F40']
	    }]
	};
	
	var pendingWorksChart1 = new Chart(ctxPending1, {
	    type: 'doughnut',
	    data: pendingWorksData1,
	    options: {
	        responsive: true,
	        cutout: '40%',
	        plugins: {
	            legend: {
	                display: true,
	                position: 'bottom'
	            },
	            title: {
	                display: true,
	            }
	        }
	    }
	});
	*/
	
	// 관심기업순
	var ctxPending2 = document.getElementById('pending-works-chart2').getContext('2d');
	var pendingWorksData2 = {
	    labels: [
	    	<c:forEach items="${map2}" var="entry1">
		        '${entry1.REC_NTC_TITLE}',
		    </c:forEach>
	    ],
	    datasets: [{
// 	        label: '미완료 작업 수',
	        data: [
	        	<c:forEach items="${map2}" var="entry2">
			        '${entry2.REC_NTC_ID_COUNT}',
			    </c:forEach>
	        ],
	        backgroundColor: ['#36A2EB', '#9966FF', '#FF9F40']
	    }]
	};
	
	var pendingWorksChart2 = new Chart(ctxPending2, {
	    type: 'bar',
	    data: pendingWorksData2,
	    options: {
	        responsive: true,
	        plugins: {
	            legend: {
	                display: false,
	                position: 'bottom'
	            },
	            title: {
	                display: true,
	            }
	        }
	    }
	});

	// 지원율이 가장 많은 기업순
	var ctxPending3 = document.getElementById('pending-works-chart3').getContext('2d');
	var pendingWorksData3 = {
	    labels: [
	    	<c:forEach items="${map3}" var="entry1">
		        '${entry1.REC_NTC_TITLE}',
		    </c:forEach>
	    ],
	    datasets: [{
// 	        label: '미완료 작업 수',
	        data: [
	        	<c:forEach items="${map3}" var="entry2">
			        '${entry2.REC_NTC_ID_COUNT}',
			    </c:forEach>
	        ],
	        backgroundColor: ['#36A2EB', '#9966FF', '#FF9F40']
	    }]
	};
	
	var pendingWorksChart3 = new Chart(ctxPending3, {
	    type: 'doughnut',
	    data: pendingWorksData3,
	    options: {
	        responsive: true,
	        plugins: {
	            legend: {
	                display: true,
	                position: 'bottom'
	            },
	            title: {
	                display: true,
	            }
	        }
	    }
	});

	
	// 가장 많이 조회된 공고순
	var ctxPending4 = document.getElementById('pending-works-chart4').getContext('2d');
	var pendingWorksData4 = {
	    labels: [
	    	<c:forEach items="${map4}" var="entry1">
		        '${entry1.REC_NTC_TITLE}',
		    </c:forEach>
	    ],
	    datasets: [{
// 	        label: '미완료 작업 수',
	        data: [
	        	<c:forEach items="${map4}" var="entry2">
			        '${entry2.HIT}',
			    </c:forEach>
	        ],
	        backgroundColor: ['#36A2EB', '#9966FF', '#FF9F40']
	    }]
	};
	
	var pendingWorksChart4 = new Chart(ctxPending4, {
	    type: 'bar',
	    data: pendingWorksData4,
	    options: {
	        responsive: true,
	        plugins: {
	            legend: {
	                display: false,
	                position: 'bottom'
	            },
	            title: {
	                display: true,
	            }
	        }
	    }
	});


	// 메인페이지 현재시간 띄우기
	function updateTime() {
	    const now = new Date();
	    const timeString = now.toLocaleTimeString();
	    $('#currentTime').text(timeString);
	}
	setInterval(updateTime, 1000);
	updateTime(); 
	
</script>