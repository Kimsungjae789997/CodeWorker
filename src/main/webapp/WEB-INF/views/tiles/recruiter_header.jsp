<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  

<!-- Loader -->
<div id="loader" >
    <img src="${pageContext.request.contextPath}/resources/assets/images/media/loader.svg" alt="">
</div>
<!-- Loader -->

<!-- app-header -->
         <header class="app-header">
         	<sec:authentication property="principal.member" var="user"/>
         	<%-- ${user.recruitVO } --%>

            <!-- Start::main-header-container -->
            <div class="main-header-container container-fluid">

                <!-- Start::header-content-left -->
                <div class="header-content-left">
                
                
          <div class="header-element">
              <a href="#" class="header-link"><span>공지사항</span></a>
          </div>
          
          <div class="header-element">
              <a href="#" class="header-link"><span>고객센터</span></a>
          </div>
          
          
                </div>
                <!-- End::header-content-left -->

                <!-- Start::header-content-right -->
                <div class="header-content-right">
                
                    <!-- (알람 부분 시작) -->
 		<sec:authorize access="hasRole('ROLE_RECRUITER')">             
		<!-- 실시간 알람 부분 시작 -->
		<div class="header-element notifications-dropdown">
		    <!-- Start::header-link|dropdown-toggle -->
		<!-- 알림 아이콘 -->
		<a href="javascript:void(0);" class="header-link dropdown-toggle" id="notiMainBtn" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
		    <i class="bx bx-bell header-link-icon"></i>
		    <span class="badge bg-secondary rounded-pill header-icon-badge pulse pulse-secondary notiCount" id="notification-icon-badge"><span class="alarmCount"></span>0</span>
		</a>
		
		<!-- 알림 아이콘 아래에 나타나는 배너 -->
		<div id="notification-popup" class="notification-popup" style="display: none;">
		    <div class="alert alert-info mb-0" style="text-align: center;">
		        <span id="popup-message"style="font-weight: bold;"></span>
		    </div>
		</div>
		    <!-- End::header-link|dropdown-toggle -->
		    <!-- Start::main-header-dropdown -->
		    <div class="main-header-dropdown dropdown-menu dropdown-menu-end" data-popper-placement="none">
		         <div class="p-3">
		            <div class="d-flex align-items-center justify-content-between">
		                <p class="mb-0 fs-17 fw-semibold">알림 내역</p>
		                <span class="badge bg-secondary-transparent notiCount" id="notifiation-data" >안 읽은 알람 <span class="alarmCount"></span>0건</span>
		            </div>
		        </div>
		        <ul class="list-unstyled mb-0" id="alarmList" >
				<!-- 여기는 알람 내역이 들어가는곳 -->
		        </ul>
		    </div>
		    <!-- End::main-header-dropdown -->
		</div>
		<!-- 실시간 알람 부분 끝 -->
		</sec:authorize>   


                    <!-- Start::header-element -->
                    <div class="header-element">
                        <a href="javascript:void(0);" class="header-link dropdown-toggle" id="mainHeaderProfile" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
                            <div class="d-flex align-items-center">
                                <div class="me-sm-2 me-0">
                                    <img src="${pageContext.request.contextPath}/resources/assets/images/recruiter/${user.recruitVO.rcrtProfileUrl}" alt="${user.recruitVO.rcrtProfileUrl}" width="32" height="32" class="rounded-circle">
                                </div>
                                <div class="d-sm-block d-none">
                                    <p class="fw-semibold mb-0 lh-1">${user.memName }</p>
                                    <span class="op-7 fw-normal d-block fs-11">${user.recruitVO.rcrtPosition }</span>
                                </div>
                            </div>
                        </a>
                        <ul class="main-header-dropdown dropdown-menu pt-0 overflow-hidden header-profile-dropdown dropdown-menu-end" aria-labelledby="mainHeaderProfile">
                            <li><a class="dropdown-item d-flex" href="#"><i class="ti ti-user-circle fs-18 me-2 op-7"></i>내 프로필</a></li>
                            <li><a id="logoutBtn" class="dropdown-item d-flex" href="#"><i class="ti ti-logout fs-18 me-2 op-7"></i>로그아웃</a></li>
                        </ul>
                    </div>  
                    <!-- End::header-element -->

                </div>
                <!-- End::header-content-right -->

            </div>
            <!-- End::main-header-container -->

        </header>
        <!-- /app-header -->




<!-- 로그아웃하기위한 hiddenForm 만들기 -->
<form action="/logout" method="post" id="logoutForm">
	<sec:csrfInput/>
</form>

<script>
$(function(){
	var logoutBtn = $('#logoutBtn');
	var logoutForm = $('#logoutForm');
	// 로그아웃하기
	logoutBtn.on('click',function(){
		logoutForm.submit();
	});
	
	
	
	// 알람 - 다른곳에서 이벤트를 주면 여기가 반응함 
	var sock = null;
	var ws = null;
	
	const notiMainBtn = $('#notiMainBtn');	// 알람아이콘 버튼
	var notiCount = $('.notiCount');
	
	
	$(document).ready(function(){
	//	connectWs();
	});
	
	
	function connectWs(){
		//ws = new WebSocket("ws://192.168.35.28/echo");
		
		ws.onopen = function(){
			console.log("연결 완료");	
		};
		
		ws.onmessage = function(event) {
/* 			   console.log("받은 메시지: ", event.data);
	            
	            let jsonData = null;
	            
	            try {
	                jsonData = JSON.parse(event.data);
	                console.log("파싱된 JSON 데이터: ", jsonData);
	            } catch (e) {
	                console.error("JSON 파싱 실패: ", event.data);
	                return;
	            }

	            let jsonType = jsonData.type;
	            console.log("메시지 유형: ", jsonType);

	            if (jsonType === "alarm") {
	                let content = jsonData.data;
	                console.log("알람 내용: ", content);
	                alarmCry(content);
	            } */
			
		};
		
		ws.onclose = function(){
			console.log('close');
		};
		
	}
	
	
	
	
	
	
});	
</script>


