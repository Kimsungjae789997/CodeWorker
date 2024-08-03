<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style type="text/css">
.header-link{
	font-size: 15px;
	font-weight: bold;
	color: black;
}
.header-element{
	padding-left: 10px;
	padding-right: 10px;
}
.notification-popup {
    position: absolute;
    top: 100%; /* 아이콘 바로 아래에 위치시키기 */
    left: 50%;
    transform: translateX(138%); /* 중앙 정렬 */
    z-index: 1050; /* 알림 아이콘보다 위에 위치시키기 */
    width: 250px; /* 배너의 너비 설정 */
    display: flex;
    justify-content: center;
    align-items: center;
    margin-top: 5px; /* 알림 아이콘과 배너 사이의 간격 조정 */
    background-color: #f8f9fa; /* 배경 색상 */
    border: 1px solid #ddd; /* 테두리 색상 */
    border-radius: 5px; /* 둥근 모서리 */
    padding: 10px; /* 내부 여백 */
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* 그림자 */
}


</style>

<!-- app-header -->
<header class="app-header-custom">
   <!-- Start::main-header-container -->
   <div class="main-header-container">

      <!-- 헤더 요소 왼쪽 부분 시작 -->
      <div class="header-content-left">
          <!-- 헤더 요소 1 : 로고 부분 시작  -->
           <div class="header-element"> 
             <div class="" >  
                  <a href="/main/list.do" class="header-logo">  
                  	<img width="120px;" style="margin-top:10px;" src="${pageContext.request.contextPath}/resources/assets/images/recruiter/codeWorker-logo.png" alt="logo" class="desktop-logo">
                  </a>  
              </div>
           </div> 
          <!-- 헤더 요소 1 : 로고 부분 끝 -->
          <!-- 헤더 요소 2 : 채용공고 부분 시작 -->
          <div class="header-element">
              <a href="/recruitment/main.do" class="header-link"><span>채용공고</span></a>
          </div>
          <!-- 헤더 요소 2 : 채용공고 부분 끝 -->
          <!-- 헤더 요소 3 : 이력서 관리 시작 -->
          <div class="header-element">
              <a href="/resume/mgmtMain" class="header-link"><span>이력서</span></a>
          </div>
          <!-- 헤더 요소 3 : 이력서 관리 끝 -->
          <!-- 헤더 요소 4 : 지원현황 시작 -->
          <div class="header-element">
              <!--  회원인 경우는 자신의 지원현황에 들어감 시작 -->
              <sec:authorize access="hasRole('ROLE_SEEKER')">
              	<a href="/apply/main.do?tab=applySuccess" class="header-link"><span>지원현황</span></a>
              </sec:authorize>
              <!--회원인 경우는 자신의 지원현황에 들어감 끝 --> 
              <!-- 비회원인 경우 시작 -->
              <sec:authorize access="isAnonymous()">
              	<a href="/login" class="header-link"><span>지원현황</span></a>
              </sec:authorize>
              <!-- 비회원인 경우 끝 -->
          </div>
          <!-- 헤더 요소 4 : 지원현황 끝 -->
          <!-- 헤더 요소 5 : 커뮤니티 시작 -->
          <div class="header-element">
              <a href="/communityMainList" class="header-link"><span>커뮤니티</span></a>
          </div>
          <!-- 헤더 요소 5 : 커뮤니티 끝 -->

           <div class="header-element">
              <a href="/noticeMain" class="header-link"><span>공지사항</span></a>
          </div>
          
          <div class="header-element">
              <a href="/faqMain" class="header-link"><span>FAQ</span></a>
          </div>
                    <!-- 헤더 요소 7 : 내 활동 시작 -->
              <sec:authorize access="hasRole('ROLE_SEEKER')">
              <sec:authentication property="principal.member.memId" var="memId"/>
              	<a href="/mypage/activity.do?memId=${memId }" class="header-link"><span>내 활동</span></a>
              </sec:authorize>
          <!-- 헤더 요소 7 : 내 활동 끝 -->
      </div>
      <!-- 헤더 요소 왼쪽 부분 끝 -->

      <!-- 헤더 요소 오른쪽 부분 시작 -->
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <div class="header-content-right">
       
		<sec:authorize access="hasRole('ROLE_SEEKER')">             
		<!-- 실시간 알람 부분 시작 -->
		<div class="header-element notifications-dropdown">
		    <!-- Start::header-link|dropdown-toggle -->
<!-- 알림 아이콘 -->
<a href="javascript:void(0);" class="header-link dropdown-toggle" id="notiMainBtn" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
    <i class="bx bx-bell header-link-icon"></i>
    <span class="badge bg-secondary rounded-pill header-icon-badge pulse pulse-secondary notiCount" id="notification-icon-badge"><span class="alarmCount"></span></span>
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
		                <span class="badge bg-secondary-transparent notiCount" id="notifiation-data" >안 읽은 알람 <span class="alarmCount"></span>건</span>
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
           
        <!-- 회원인 경우 -->
		<sec:authorize access="hasRole('ROLE_SEEKER')">
		<sec:authentication property="principal.member.memId" var="memId"/>
		<!-- 알람에서 memId 받기위해서 필요하다 -->
		<input type="hidden" id="memId" value="${memId }">

		<script type="text/javascript">
		   // JSP 태그를 사용하여 서버에서 렌더링된 값을 JavaScript 변수에 저장
		   $(function(){
		    var id = '${memId}';
		    console.log(" id : " + id);
		    var data = {
		        memId: id
		    };
		    
		    $.ajax({
		        url: "/main/profileSearch",
		        data: JSON.stringify(data),
		        type: "post",
		        beforeSend: function(xhr) { // 데이터 전송 전, 헤더에 csrf 값 설정
		            xhr.setRequestHeader(header, token);
		        },
		        contentType: "application/json;charset=utf-8",
		        success: function(res) {
		            if (res == null || res == "") {
		                $('#imgprofile').attr('src', "${pageContext.request.contextPath}/resources/images/black.png");
		            } else {
		                $('#imgprofile').attr('src', res);
		            }
		        }
		    });
		   });
		</script>
		<%-- <div class="d-flex align-items-center">
			<div class="me-sm-2 me-0" id="mypageBtn">
				<img id="imgprofile" src="" alt='' width="32" height="32" class="rounded-circle" style="cursor: pointer;">
			</div>
			<div class="d-sm-block d-none">
				<p class="fw-semibold mb-0 lh-1"><sec:authentication property='principal.member.memName' />
			</div>
		</div>
		</sec:authorize> --%>
		<!-- 현경 수정 부분 -->
		<div>
		   <a href="javascript:void(0);" class="header-link dropdown-toggle" id="mainHeaderProfile" data-bs-toggle="dropdown" data-bs-auto-close="outside" aria-expanded="false">
		      <div class="d-flex align-items-center">
		          <div class="me-sm-2 me-0">
		          		<img id="imgprofile" src="" alt='' width="32" height="32" class="rounded-circle" style="cursor: pointer;">
		          </div>
		          <div class="d-sm-block d-none">
		              <p class="fw-semibold mb-0 lh-1"><sec:authentication property='principal.member.memName' /></p>
		          </div>
		      </div>
		    </a>
		    <ul class="main-header-dropdown dropdown-menu pt-0 overflow-hidden header-profile-dropdown dropdown-menu-end" aria-labelledby="mainHeaderProfile">
		        <li><a class="dropdown-item d-flex" href="/mypage/profile.do?memId=${memId }"><i class="ti ti-user-circle fs-18 me-2 op-7"></i>개인정보 수정</a></li>
		        <li><a id="logoutBtn" class="dropdown-item d-flex" href="#"><i class="ti ti-logout fs-18 me-2 op-7"></i>로그아웃</a></li>
		    </ul>
		</div>    
		<!-- 현경 수정 부분 끝 -->
        </sec:authorize>
        <!-- 회원 끝 -->
           
        <!-- 비회원인 경우 -->
        <sec:authorize access="isAnonymous()">
        	<button class="btn btn-outline-info rounded-pill btn-wave header-link" style="margin:7px;" type="button" onclick="location.href='/login'">로그인/회원가입</button>
        </sec:authorize>
        <!-- 비회원 끝 -->    
               
           </div>  
           <!-- End::header-element -->
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </div>
      <!-- 헤더 요소 오른쪽 부분 끝 -->
   </div>

</header>
<!-- /app-header -->

<!-- 로그아웃하기위한 hiddenForm 만들기 -->
<form action="/logout" method="post" id="logoutForm">
	<sec:csrfInput/>
</form>

<script type="text/javascript">
$(function(){
	// 로그아웃
	var logoutBtn = $('#logoutBtn');
	var logoutForm = $('#logoutForm');
	// 로그아웃하기
	logoutBtn.on('click',function(){
		logoutForm.submit();
	});
	
	var mypageBtn = $('#mypageBtn');
	var mypageForm = $('#mypageForm');
	
	mypageBtn.on('click',function(){
		location.href = "/mypage/main.do";
	});
	
	
	// 알람 - 다른곳에서 이벤트를 주면 여기가 반응함 
	var sock = null;
	var ws = null;
	
	const notiMainBtn = $('#notiMainBtn');	// 알람아이콘 버튼
	var notiCount = $('.notiCount');

		
	// 안읽은 알람수 설정하기
/* 	function f_notiCount(){
		$.ajax({
			url : "/alarm/alarmCount"
		})
	} */
	
	$(document).ready(function(){
		connectWs();
	});
	
	function connectWs(){
	 	ws = new WebSocket("ws://192.168.35.28/echo");
		
		ws.onopen = function(){
			console.log("연결 완료");	
		};
		
		ws.onmessage = function(event) {
			   console.log("받은 메시지: ", event.data);
	            
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
	            }
			
		};
		
		ws.onclose = function(){
			console.log('close');
		};
		
	}
	
	
	
	// 알람 클릭후 내역보기 알람읽음여부에서 N인거만 가져오고 읽으면 읽음여부가 Y로 업데이트한다.(보이지않게함)
	notiMainBtn.on('click',function(){
		var popup = document.getElementById('notification-popup');
		 popup.style.display = 'none';
		var memId = $('#memId').val();
		console.log(memId);
		$.ajax({
			url : "/alarm/alarmList",
			type : "get",
			dataType:"json",
			beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success: function(res) {
			    var html = "";
			    
			    // 두 개의 리스트를 병합
		//	    var combinedList = (res.alarmList || []).concat(res.alarmList2 || []);
			    
			    $.each(res.alarmList, function(i, v) {
			        var aHref = "";
			        var title = "";
			        
			        // alarmType에 따라 링크와 제목 설정
			        switch (v.alarmType) {
			            case "01": // 서류전형 결과
			                aHref = "/apply/main.do?tab=documentSuccess";
			                title = '지원 결과알림';
			                break;
			            case "02": // 코딩테스트 결과
			                aHref = "/apply/main.do?tab=coteSuccess";
			                title = '지원 결과알림';
			                break;
			            case "03": // 면접전형 결과
			                aHref = "/apply/main.do?tab=finalApplySuccess";
			                title = '지원 결과알림';
			                break;
			            case "04": // 불합격 통보
			                aHref = "/apply/main.do?tab=failSuccess";
			                title = '지원 결과알림';
			                break;
			            case "05": // 인재제안
			                aHref = "/mypage/goProposalAll";
			                title = '인재 제안알림';
			                break;
			            default:
			                aHref = "#";
			                title = '알림';
			                break;
			        }
			        
			        // HTML 문자열 생성
			        html += '<li class="dropdown-item">' +
			                '<div class="d-flex align-items-start">' +
			                '<div class="pe-2">' +
			                '<span class="avatar avatar-md bg-primary-transparent avatar-rounded"><i class="ri-mail-line"></i></span>' +
			                '</div>' +
			                '<div class="flex-grow-1 d-flex align-items-center justify-content-between">' +
			                '<div>' +
			                '<span style="color : #06f; font-weight:bold;">'+ title +'</span>' + 
			                '<p class="mb-0 ">' + (v.recNtcTitle || '제목 없음') + '</p>' +
			                '<p class="mb-0 "><a href="' + aHref + '" class="updateAlarmRead" data-alarmNo="' + (v.alarmNo || '') + '">' + (v.alarmContent || '내용 없음') + '</a></p>' +
			                '<span class="text-muted fw-normal fs-12 header-notification-text">' + (v.alarmDate || '날짜 없음') + '</span>' +
			                '</div>' +
			                '<div>' +
			                '</div>' +
			                '</div>' +
			                '<a href="javascript:void(0);" class="min-w-fit-content text-muted me-1 dropdown-item-close1"><i class="ti ti-x fs-16"></i></a>' +
			                '</div>' +
			                '</li>';
			    });
			    
			    // HTML을 DOM에 삽입
			    $('#alarmList').html(html);
			}
		});// ajax 끝
	}); // notiMainBtn 끝
	
	
	
	// 내가 읽은 알람의 알람종류만 읽음여부 N->Y로 업데이트 하기
	$('#alarmList').on('click','.updateAlarmRead',function(e){
		e.preventDefault();
		var alarmNo = $(this).data("alarmno");	//data는 소문자로 바뀜
		var href = $(this).attr("href");
		console.log(alarmNo);
		console.log(href);
		
		var data = {
				alarmNo : alarmNo
		}
		
		$.ajax({
			url : "/alarm/updateAlarmRead",
			type : "post",
			data : JSON.stringify(data),
			contentType: "application/json;charset=utf-8",
			beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success : function(res){
				console.log(res);
				location.replace(href);
			}
			
		});// ajax 끝
		
	}); // updateAlarmRead 끝
	
	
	// 읽지 않은 알람 갯수 가져오기
	<sec:authorize access="hasRole('ROLE_SEEKER')">
	$(document).ready(function() {
	    loadAlarmData(); 

	});
	</sec:authorize>
	
	
	
	// 'x' 아이콘을 클릭했을 때 알람 삭제하기
	$('#alarmList').on('click', '.dropdown-item-close1', function(e) {
	    e.preventDefault();
	    var listItem = $(this).closest('li'); // 클릭된 아이콘이 포함된 li 요소 가져오기
	    listItem.remove(); // 해당 li 요소 삭제
	    var alarmNo = $(this).closest('.flex-grow-1').find('.updateAlarmRead').data('alarmno'); // 해당 알람의 번호 가져오기
	    console.log(alarmNo);
	    
	    var data = {
	    		alarmNo : alarmNo
	    }
	    $.ajax({
	    	url : "/alarm/updateAlarmRead",
			type : "post",
			data : JSON.stringify(data),
			contentType: "application/json;charset=utf-8",
			beforeSend:function(xhr){
				xhr.setRequestHeader(header,token);
			},
			success : function(res){
				console.log(res);
				var alarmCount = $('.alarmCount').html();
				console.log(alarmCount);
	            var ala = alarmCount-1;
	            $('.alarmCount').html(ala);
			}
	    });// ajax끝
	});

	
	
});// function({}) 끝

// 알람 울기
function showPopup(message) {
    var popup = document.getElementById('notification-popup');
    var popupMessage = document.getElementById('popup-message');
    popupMessage.textContent = message;
    
    popup.style.display = 'block';

    setTimeout(function() {
        popup.style.display = 'none';
    }, 6000); // 3초 후 자동으로 배너 사라짐
}

function alarmCry(content) {
    loadAlarmData();
    showPopup(content);
}

// 읽지 않은 알람 갯수 가져오기
function loadAlarmData() {
    var memId = $('#memId').val();
    console.log(memId);
    var data = {
        memId: memId
    };

    $.ajax({
        url: "/alarm/getNoReadAlarm",
        data: JSON.stringify(data),
        contentType: "application/json;charset=utf-8",
        type: "post",
        dataType: "json",
        beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function(res) {
            console.log(res.noReadAlarm);
            var alarmCount = $('.alarmCount').html(res.noReadAlarm);
        }
    });
}
</script>
