<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  

<!-- FullCalendar CSS -->
<link href="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/main.min.css" rel="stylesheet">
<!-- FullCalendar JS -->
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment@2.29.4/min/moment.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/moment-timezone@0.5.40/builds/moment-timezone-with-data.min.js"></script>

<style type="text/css">
body{
	font-size : 16px;
}
.mypagesideBar{
	text-align: center;
	font-weight: bold;
	font-size: 20px;
}
.mypagesideBarText{
	color: gray;
}
.mypage-left-tabs{
	margin-bottom: 50px;
}
.tab-titles{
	color: gray;
	margin-left:16px; 
	font-weight:500;
}
.tab-contents{
	margin-top:10px;
}
.tab-boxs{
	border-radius: 5px;
	background-color:#FEFBEC;
	text-align: center;
    height: 80px;
}
.tab-boxs-content{
	display:block;
	font-size: 14px;
	font-weight:500;
	color: gray;
}
.tab-boxs-content-count{
	display:block;
	font-size: 18px;
	font-weight:600;
	margin-bottom:5px;
}
.myCalendar{
	margin-left:30px;
}
.myApply{
}
</style>

<!-- 윗공간 주기 위한 DIV -->
<div style="margin-top:120px;"></div>

<!-- 페이지 시작 -->
<div style="display: flex;">

<div class="myApply col-xl-7" style="width: 54%;">
			
	<!--  내관심사 시작-->
	<div class="mypage-left-tabs">
	 	<span class="tab-titles">내 관심사</span>
	    <div class="tab-contents">
	           <div class="container">
	               <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3">
	                   
	                   <div class="col">
	                      <div class="tab-boxs p-3" style="height: 80px; cursor: pointer;" onclick="goBookmarkAll()">
	                      <span class="tab-boxs-content-count">${map.INTEREST_REC_NTC_COUNT }</span>
	                      <span class="tab-boxs-content">북마크</span>
	                      </div>
	                   </div>
	                   
	                   <div class="col">
	                       <div class="tab-boxs p-3" style="height: 80px; cursor: pointer;"  onclick="goInterestCrpAll()">
	                       <span class="tab-boxs-content-count">${map.INTEREST_CORPORATION_COUNT }</span>
	                       <span class="tab-boxs-content">관심회사</span>
	                       </div>
	                   </div>
	           	 </div>
	       	</div>
	   	</div>
	</div>
	<!-- 내관심사 끝-->
			
	<!-- 지원현황 시작 -->
	<div class="mypage-left-tabs">
	<span class="tab-titles">지원 현황</span>
          <div class="tab-contents">
              <div class="container">
                  <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3">
                      
                      <div class="col">
                          <div class="tab-boxs p-3" style="height: 80px;">
                          <span class="tab-boxs-content-count">${map.APPLY_COUNT }</span>
                          <span class="tab-boxs-content"><a href="/apply/main.do?tab=applySuccess">지원완료</a></span>
                          </div>
                      </div>
                      
                      <div class="col">
                          <div class="tab-boxs p-3" style="height: 80px;">
                          <span class="tab-boxs-content-count">${map.APPLY_COUNT2 }</span>
                          <span class="tab-boxs-content"><a href="/apply/main.do?tab=documentSuccess">서류통과</a></span>
                          </div>
                      </div>
                      <div class="col">
                          <div class="tab-boxs p-3" style="height: 80px;">
                          <span class="tab-boxs-content-count">${map.APPLY_COUNT3 }</span>
                          <span class="tab-boxs-content"><a href="/apply/main.do?tab=coteSuccess">코테통과</a></span>
                          </div>
                      </div>
                      <div class="col">
                          <div class="tab-boxs p-3" style="height: 80px;">
                          <span class="tab-boxs-content-count">${map.APPLY_COUNT4 }</span>
                          <span class="tab-boxs-content"><a href="/apply/main.do?tab=finalApplySuccess">최종합격</a></span>
                          
                          
                          </div>
                      </div>
                      <div class="col">
                          <div class="tab-boxs p-3" style="height: 80px;">
                          <span class="tab-boxs-content-count">${map.APPLY_COUNT5 }</span>
                          <span class="tab-boxs-content"><a href="/apply/main.do?tab=failSuccess">불합격</a></span>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
	</div>		
	<!-- 지원현황 끝 -->	

	<!-- 인재제안 시작 -->	
	<div class="mypage-left-tabs">
	<span class="tab-titles">인재 제안</span>
	<div class="tab-contents">
	    <div class="container">
	        <div class="row row-cols-2 row-cols-lg-5 g-2 g-lg-3">
	              <div class="col">
	                  <div class="tab-boxs p-3" style="height: 80px; cursor: pointer;" onclick="goProposalAll()">
	                  <span class="tab-boxs-content-count">${map.PROPOSAL_COUNT }</span>
	                  <span class="tab-boxs-content">받은 제안</span>
	                  </div>
	              </div>
	        </div>
	    </div>
	</div>
	</div>
	<!-- 인재제안 끝 -->		
</div>

<div class="myCalendar col-xl-7" style="width: 50%;">
	<div class="" style="height: 784px;">
		<span class="tab-titles" style="margin-left:-5px;">내 일정 관리</span>
		<!-- 캘리더 뿌려지는 곳 -->
		<div id='calendar-container'>
			<div id='calendar'></div>
		</div>	
	</div>
</div>

</div>
<!-- 로그아웃하기위한 hiddenForm 만들기 -->
<form action="/logout" method="post" id="logoutForm">
	<sec:csrfInput/>
</form>

<!-- Event Modal -->
<div id="eventModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">일정</h4>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="edit-title">일정명</label>
                        <input type="text" class="form-control" id="edit-title">
                    </div>
                    <div class="form-group">    
                        <label for="edit-start">시작일</label>
                        <input type="text" class="form-control" id="edit-start">
                    </div>
                    <div class="form-group">
                        <label for="edit-end">종료일</label>
                        <input type="text" class="form-control" id="edit-end">
                    </div>
                    <div class="form-group">
                        <label for="edit-desc">설명</label>
                        <textarea class="form-control" id="edit-desc"></textarea>
                    </div>
                    <div class="form-group">
                        <label for="edit-color">색상</label>
                        <input type="color" class="form-control" id="edit-color">
                    </div>
                    <div class="form-group">
                        <label for="edit-allDay">하루종일</label>
                        <input type="checkbox" id="edit-allDay">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <div class="modalBtnContainer-addEvent">
                    <button type="button" class="btn btn-light btn-wave" id="autoBtn1">자동완성</button>
                    <button type="button" class="btn btn-primary" id="save-event">저장</button>
                </div>
                <div class="modalBtnContainer-modifyEvent">
                    <button type="button" class="btn btn-primary" id="updateEvent">수정</button>
                    <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                </div>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
$(function(){
	 // 풀 캘린더
    var calendarEl = document.getElementById('calendar');
    
    // FullCalendar 초기화
    var calendar = new FullCalendar.Calendar(calendarEl, {
        headerToolbar : {
            left : 'prev,next today',
            center : 'title',
            right : 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        timeZone : 'local',
        locale : 'ko',
        navLinks : true,
        selectable : true,
        selectMirror : true,
        editable : true,
        dayMaxEvents : true,
        allDaySlot : true,
        displayEventTime : true,
        displayEventEnd : true,
        firstDay : 0,
        weekNumbers : false,
        weekNumberCalculation : 'ISO',
        eventLimit : true,
        timeFormat : 'HH:mm',
        defaultTimedEventDuration : '01:00:00',
        minTime : '00:00:00',
        maxTime : '24:00:00',
        weekends : true,
        events : [
            {
                title : '이력서 검토',
                start : '2024-07-31',
                end : '2024-08-02',
                backgroundColor : '#D25565',
                textColor : '#ffffff'
            },
            {
                title : '백엔드 개발자 by우아한 형제들 지원',
                start : '2024-08-04',
                end : '2024-08-07',
                backgroundColor : 'black',
                textColor : '#ffffff'
            },
            {
                title : '백엔드 개발자 by당근마켓',
                start : '2024-08-13',
                end : '2024-08-17',
                backgroundColor : '#D25541',
                textColor : '#ffffff'
            }
        ],
        select : function(info){
            newEvent(info.startStr, info.endStr);
        },
        eventClick : function(info){
            editEvent(info.event);
        },
        eventDrop : function(info){
            handleEventDropResize(info.event);
        },
        eventResize : function(info){
            handleEventDropResize(info.event);
        }
    });
    calendar.render();
    
    var eventModal = $('#eventModal');
    var modalTitle = $('.modal-title');
    var editAllDay = $('#edit-allDay');
    var editTitle = $('#edit-title');
    var editStart = $('#edit-start');
    var editEnd = $('#edit-end'); 
    var editType = $('#edit-type');
    var editColor = $('#edit-color');
    var editDesc = $('#edit-desc');
    var addBtnContainer = $('.modalBtnContainer-addEvent');
    var modifyBtnContainer = $('.modalBtnContainer-modifyEvent');
    
    // 새로운 일정 생성
    
    var newEvent = function(start,end){
    	modalTitle.html("새로운 일정");
    	editTitle.val('');
    	editStart.val(start);
    	editEnd.val(end);
    	editDesc.val('');
    	addBtnContainer.show();
    	modifyBtnContainer.hide();
    	eventModal.modal('show');
    	
    	var eventId = 1 + Math.floor(Math.random() * 1000);
    	
    	// 새로운 일정 저장버튼 클릭
    	$('#save-event').unbind();
    	$('#save-event').on('click',function(){
    		var eventData = {
    			id : eventId,
    			title : editTitle.val(),
    			start : editStart.val(),
    			end : editEnd.val(),
    			description : editDesc.val(),
    			type : editType.val(),
    			backgroundColor : editColor.val(),
    			textColor : '#ffffff',
    			allDay : editAllDay.is(':checked')
    		};
    		
    		if(eventData.start > eventData.end){
    			alert("끝나는 날짜가 앞설 수 없습니다.");
    			return false;
    		}
    		
    		if(eventData.title === ''){
    			alert("일정명은 필수입니다.");
    			return false;
    		}
    		
    		if(editAllDay.is(':checked')){
    			eventData.start = moment(eventData.start).format('YYYY-MM-DD');
    			eventData.end = moment(eventData.end).add(1, 'days').format('YYYY-MM-DD');
    			eventData.allDay = true;
    		}
    		
    		calendar.addEvent(eventData);
    		eventModal.find('input, textarea').val('');
    		editAllDay.prop('checked', false);
    		eventModal.modal('hide');
    	});
        // 자동완성 버튼 클릭 이벤트 핸들러
        $('#autoBtn1').on('click',function(){
            console.log("Button clicked");
            $('#edit-title').val("자기소개서 검토하기");
            $('#edit-desc').val("대덕인재개발원에서 첨삭받기");
        });
    }// newEvent 끝
    
    
    // 일정 편집 
    
    var editEvent = function(event){
    	$('#deleteEvent').data('id', event.id);	// 클릭한 이벤트 ID
    	
    	if(event.allDay){
    		editAllDay.prop('checked', true);
    	}else{
    		editAllDay.prop('checked', false);
    	}
    	
    	if(!event.end){
    		event.end = event.start;
    	}
    	
    	if(event.allDay && event.end !== event.start){
    		editEnd.val(moment(event.end).subtract(1, 'days').format('YYYY-MM-DD HH:mm'));
    	}else{
    		editEnd.val(moment(event.end).format('YYYY-MM-DD HH:mm'));
    	}
    	
    	modalTitle.html('일정 수정');
    	editTitle.val(event.title);
    	editStart.val(moment(event.start).format('YYYY-MM-DD HH:mm'));
    	editType.val(event.extendedProps.type);
    	editDesc.val(event.extendedProps.description);
    	editColor.val(event.backgroundColor).css('color', event.backgroundColor);
    	addBtnContainer.hide();
    	modifyBtnContainer.show();
    	eventModal.modal('show');
    	
    	// 업데이트 버튼 클릭시
    	$('#updateEvent').unbind();
    	$('#updateEvent').on('click',function(){
    		if(editStart.val() > editEnd.val()){
    			alert("끝나는 날짜가 앞설 수 없습니다.");
    			return false;
    		}
    		
    		if(editTitle.val() === ''){
    			alert("일정명은 필수입니다.");
    			return false;
    		}
    		
    		var statusAllDay = editAllDay.is(':checked');
    		var startDate = statusAllDay ?  moment(editStart.val()).format('YYYY-MM-DD') : editStart.val();
    		var endDate = statusAllDay ? moment(editEnd.val()).format('YYYY-MM-DD') : editEnd.val();
    		var displayDate = statusAllDay ? moment(editEnd.val()).add(1, 'days').format('YYYY-MM-DD') : endDate;
    	
    		eventModal.modal('hide');
    		
    		event.setAllDay(statusAllDay);
    		event.setProp('title', editTitle.val());
    		event.setStart(startDate);
    		event.setEnd(displayDate);
    		event.setExtendedProp('type', editType.val());
    		event.setProp('backgroundColor', editColor.val());
    		event.setExtendedProp('description', editDesc.val());
    		calendar.render();
    	});
    	
    	// 삭제 버튼 클릭시
    	
    	$('#deleteEvent').unbind();
    	$('#deleteEvent').on('click',function(){
    		event.remove();
    		eventModal.modal('hide');
    	});	
    };// editEvent 끝
    
    
    // 일정 드래그앤드 및 리사이즈
    
    var handleEventDropResize = function(event){
    	if(event.allDay && event.end !== event.start){
    		event.end = moment(event.end).subtract(1, 'days').format('YYYY-MM-DD');
    	}
    	
    	calendar.render();
    };
    
    // select 색 변경
    $('#edit-color').change(function(){
    	$(this).css('color', $(this).val());
    });
    
    // datetimepicker 초기화
    $('#edit-start, #edit-end').datetimepicker({
    	format : 'YYYY-MM-DD HH:mm'
    });



    
}); // function() 끝

// 이벤트 시간 표시 함수
function getDisplayEventDate(event){
	var displayEventDate;
	
	if(!event.allDay){
		var startTimeEventInfo = moment(event.start).format('HH:mm');
		var endTimeEventInfo = moment(event.end).format('HH:mm');
		displayEventDate = startTimeEventInfo + " - " + endTimeEventInfo;
	}else{
		displayEventDate = "하루종일";
	}
	
	return displayEventDate;
}

function goBookmarkAll(memId){
    location.href = "/mypage/bookMarkAll";
}

function goInterestCrpAll(){
	 location.href = "/mypage/goInterestCrpAll";
}

function goProposalAll(){
	location.href = "/mypage/goProposalAll"
}
</script>