<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style type="text/css">
.mypagesideBar{
	text-align: center;
	font-weight: bold;
	font-size: 20px;
}
.mypagesideBarText{
	color: gray;
}
#result11 th{
	font-weight: bold;
	font-size: 15px;
}

#result11 td{
	font-weight: bold;
	font-size: 15px;
}
#result11 a{
	font-weight: bold;
	font-size: 15px;
}
.nav-item{
	font-size:18px;
	text-align:center;
	margin-right:5px;
	margin-left:5px;
}
.nav-first{
	margin-left:15px;
}
.nav-last{
	margin-right:15px;
}
.tab-name{
	color : #00008b;
}
table th{
	background-color: gray;
}
.table-row-height{
	height : 60px;
}
.nav-item.active {
      background-color: #77baff; /* 밝은 금색 */
    border-radius: 20px; /* 둥근 모서리 */
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
    transition: background-color 0.3s, box-shadow 0.3s, transform 0.3s; /* 부드러운 전환 효과 */
    padding: 15px 30px; /* 크기 키우기 */
    font-size: 1.2em; /* 폰트 크기 키우기 */
    transform: scale(1.1); /* 약간 확대 효과 */
}
</style>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<div style="margin-top:120px;">
    <img src="${pageContext.request.contextPath}/resources/images/my-apply-top.png" width="100%;">
</div>

<div class="col-xl-7" style="margin-top:30px; height: 800px; width: 100%;">
    <div class="" style="height: 800px;">
                 
        <ul class="nav nav-tabs mb-3 tab-style-6" id="myTab" role="tablist" style="justify-content: space-between;">
        
        <!-- 지원 완료 시작 -->
        <li class="nav-item" role="presentation">
	    <div>
		    <a class="" id="applySuccessBtn" href="#" role="tab" aria-controls="products-tab-pane" aria-selected="true">
				<span class="tab-name fw-semibold">지원 완료</span><br/>
		    	<span class="fw-semibold" >${cnt1 }</span>
		    </a>
	    </div>
        </li>
        <!-- 지원 완료 끝 -->
        
        <!-- 서류 통과 시작 -->
        <li class="nav-item nav-first" role="presentation">
	    	<a class="" id="documentSuccessBtn" href="#" role="tab" aria-controls="products-tab-pane" aria-selected="true">
		    <span class="tab-name fw-semibold">서류 통과</span><br/>
		    <span class="fw-semibold">${cnt2 }</span>
	    	</a>
        </li>
        <!-- 서류 통과 끝 -->

        <!-- 코딩 테스트 통과 시작 -->
        <li class="nav-item" role="presentation" >
	    <a class="" id="coteSuccessBtn" href="#" role="tab" aria-controls="products-tab-pane" aria-selected="true">
		    <span class="tab-name fw-semibold">코딩테스트 통과</span><br/>
		    <span class="fw-semibold">${cnt3 }</span>
	    </a>
        </li>
        <!-- 코딩 테스트 통과 끝-->
        
        <!--  최종 합격 시작  -->
        <li class="nav-item" role="presentation">
	    <a class="" id="finalApplySuccessBtn" href="#" role="tab" aria-controls="products-tab-pane" aria-selected="true">
	    	<span class="tab-name fw-semibold">최종 합격</span><br/>
	    	<span class="fw-semibold">${cnt4 }</span>
	    </a>
        </li>
        
        <!-- 불합격 시작 -->
        <li class="nav-item nav-last" role="presentation">
	    <a class="" id="failSuccessBtn" href="#" role="tab" aria-controls="products-tab-pane" aria-selected="true">
	    	<span class="tab-name fw-semibold">불합격</span><br/>
	    	<span class="fw-semibold">${cnt5 }</span>
	    </a>
        </li>
        <!-- 불합격 끝 -->
        </ul>
                     
        <!-- 지원 완료 시작 -->
        <div class="" id="myTabContent2" style="margin-top:30px;">
            <div class="" id="products-tab-pane"
                role="tabpanel" aria-labelledby="products-tab" tabindex="0">
                <div class="table-responsive">
                    <table class="table mb-0" style="text-align: center;">
                        <thead>
                            <tr>
                                <th style="background-color: #FEFBEC;">지원 회사</th>
                                <th style="background-color: #FEFBEC;">공고 이름</th>
                                <th style="background-color: #FEFBEC;">지원 포지션</th>
                                <th style="background-color: #FEFBEC;">지원 시간</th>
                                <th style="background-color: #FEFBEC;">진행상태</th>
                            </tr>
                        </thead>
                        <tbody id="result11" >   
                        <!-- 요청 결고 나오는 곳 시작  -->
                        <!-- 요청 결고 나오는 곳 끝  -->    
                        </tbody>
                     </table>
                 </div>
             </div>
         </div>  
        <!-- 지원 완료 시작 -->
        
	</div>
</div>
<!-- 로그아웃하기위한 hiddenForm 만들기 -->
<form action="/logout" method="post" id="logoutForm">
	<sec:csrfInput/>
</form>
<script type="text/javascript">
$(function(){
	var logoutBtn = $('#logoutBtn');
	var logoutForm = $('#logoutForm');
	// 로그아웃하기
	logoutBtn.on('click',function(){
		logoutForm.submit();
	});
	
    // 탭 클릭 시 활성화 상태 변경
    function activateTab(tabId) {
        $('.nav-item').removeClass('active'); // 모든 탭에서 active 클래스 제거
        $('#' + tabId).closest('.nav-item').addClass('active'); // 클릭된 탭에 active 클래스 추가
    }
	
	// 지원 완료 버튼 누를 시 생기는 거
	$('#applySuccessBtn').on('click',function(){
		activateTab('applySuccessBtn');
		$.ajax({
			url : "/apply/applySuccessSelect",
			type : "get",
			beforeSend: function(xhr) { // 데이터 전송 전, 헤더에 csrf 값 설정
	            xhr.setRequestHeader(header, token);
	        },
	        success : function(res){
	          console.log(res);
        	  var html = '';
                for (var i = 0; i < res.length; i++) {
                    html += '<tr class="table-row-height">';
                    html += "<th scope='row'>" + res[i].crpName + '</th>';
                    html += '<td>' + res[i].recNtcTitle + '</td>';
                    html += '<td>' + res[i].positionCode + '</td>';
                    html += '<td>' + res[i].applyDate + '</td>';
                    html += '<td><button class="btn btn-teal-light rounded-pill btn-wave">' + res[i].applicantStatusCode + '</button></td>';
                    html += '</tr>';
                }
                $('#result11').html(html);
	        }
		});
	});
	
	
	// 서류 통과 버튼 누를 시 생기는 거
    $('#documentSuccessBtn').on('click', function(){
    	 activateTab('documentSuccessBtn');
        $.ajax({
            url: "/apply/documentSuccessSelect",
            type: "get",
            beforeSend: function(xhr) { // 데이터 전송 전, 헤더에 csrf 값 설정
                xhr.setRequestHeader(header, token);
            },
            success: function(res){
                console.log(res);
                var html = '';
                for (var i = 0; i < res.length; i++) {
                    html += '<tr class="table-row-height">';
                    html += '<th scope="row">' + res[i].crpName + '</th>';
                    html += '<td>' + res[i].recNtcTitle + '</td>';
                    html += '<td>' + res[i].positionCode + '</td>';
                    html += '<td>' + res[i].applyDate + '</td>';
                    if(res[i].testYn == "시험응시"){
                        html += '<td><a href="/apply/coteSelect?recNtcId=' + res[i].recNtcId + '" class="btn btn-teal-light rounded-pill btn-wave update-test-status" data-id="' + res[i].recNtcId + '" data-href="/apply/coteSelect?recNtcId=' + res[i].recNtcId + '" class="btn btn-teal-light rounded-pill btn-wave">' + res[i].applicantStatusCode + '/시험응시</a></td>';
                   }else if(res[i].testYn == "응시완료"){
                        html += '<td><button class="btn btn-success rounded-pill btn-wave" style="font-weight: bold; font-size: 15px;">' + res[i].applicantStatusCode + '/응시완료</button></td>';
                   }
                    html += '</tr>';
                }
                $('#result11').html(html);
            }
        });
    });
	
 	// 시험응시를 응시완료로 바꾸기
$(document).on('click', '.update-test-status', function(e){
    e.preventDefault();
    var recNtcId = $(this).data('id');
    var href = $(this).data('href');
    var $this = $(this);
    
    // SweetAlert2를 사용한 확인 대화상자
    Swal.fire({
        title: '시험을 응시하시겠습니까?',
        text: "제한 시간은 30분이고, 총 3문제입니다.",
        icon: 'question',
        showCancelButton: true, // 취소 버튼 표시
        confirmButtonText: '응시하기',
        cancelButtonText: '취소'
    }).then((result) => {
        if (result.isConfirmed) {
            // 사용자가 '응시하기' 버튼을 클릭한 경우
            var data = {
                recNtcId: recNtcId 
            }
            
            $.ajax({
                url: '/apply/updateTestStatus',
                type: 'post',
                data: JSON.stringify(data),
                contentType: "application/json;charset=utf-8",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success: function(res){
                    console.log(res);
                    // 응시 완료 후 이동할 페이지로 리디렉션
                    location.href = href;
                },
                error: function(err) {
                    Swal.fire({
                        title: '오류 발생!',
                        text: '응시 상태 업데이트 중 오류가 발생했습니다.',
                        icon: 'error',
                        confirmButtonText: '확인'
                    });
                }
            });
        } else {
            // 사용자가 '취소' 버튼을 클릭한 경우
            Swal.fire({
                title: '취소됨',
                text: '응시 작업이 취소되었습니다.',
                icon: 'info',
                confirmButtonText: '확인'
            });
        }
    });
});
	
	
	// 코딩테스트 통과 버튼 누를 시 생기는 거
	$('#coteSuccessBtn').on('click',function(){
		activateTab('coteSuccessBtn');
		$.ajax({
			url : "/apply/coteSuccessSelect",
			type : "get",
			beforeSend: function(xhr) { // 데이터 전송 전, 헤더에 csrf 값 설정
	            xhr.setRequestHeader(header, token);
	        },
	        success : function(res){
	          console.log(res);
        	  var html = '';
                for (var i = 0; i < res.length; i++) {
                    html += '<tr class="table-row-height">';
                    html += "<th scope='row'>" + res[i].crpName + '</th>';
                    html += '<td>' + res[i].recNtcTitle + '</td>';
                    html += '<td>' + res[i].positionCode + '</td>';
                    html += '<td>' + res[i].applyDate + '</td>';
                    html += '<td><button class="btn btn-teal-light rounded-pill btn-wave">' + res[i].applicantStatusCode + ' / 면접시간 : ' + res[i].intvwDate + '</button></td>';
                    html += '</tr>';
                }
                $('#result11').html(html).trigger("create");
	        }
		});
	});
	
	// 최종합격 버튼 누를 시 생기는 거
	$('#finalApplySuccessBtn').on('click',function(){
		 activateTab('finalApplySuccessBtn');
		$.ajax({
			url : "/apply/finalApplySuccessSelect",
			type : "get",
			beforeSend: function(xhr) { // 데이터 전송 전, 헤더에 csrf 값 설정
	            xhr.setRequestHeader(header, token);
	        },
	        success : function(res){
	          console.log(res);
        	  var html = '';
                for (var i = 0; i < res.length; i++) {
                    html += '<tr class="table-row-height">';
                    html += "<th scope='row'>" + res[i].crpName + '</th>';
                    html += '<td>' + res[i].recNtcTitle + '</td>';
                    html += '<td>' + res[i].positionCode + '</td>';
                    html += '<td>' + res[i].applyDate + '</td>';
                    html += '<td><button class="btn btn-teal-light rounded-pill btn-wave">' + res[i].applicantStatusCode + '</button></td>';
                    html += '</tr>';
                }
                $('#result11').html(html);
	        }
		});
	});
	
	// 불합격 버튼 누를 시 생기는 거
	$('#failSuccessBtn').on('click',function(){
		activateTab('failSuccessBtn');
		$.ajax({
			url : "/apply/failApplySuccessSelect",
			type : "get",
			beforeSend: function(xhr) { // 데이터 전송 전, 헤더에 csrf 값 설정
	            xhr.setRequestHeader(header, token);
	        },
	        success : function(res){
	          console.log(res);
        	  var html = '';
                for (var i = 0; i < res.length; i++) {
                    html += '<tr class="table-row-height">';
                    html += "<th scope='row'>" + res[i].crpName + '</th>';
                    html += '<td>' + res[i].recNtcTitle + '</td>';
                    html += '<td>' + res[i].positionCode + '</td>';
                    html += '<td>' + res[i].applyDate + '</td>';
                    html += '<td><button class="btn btn-teal-light rounded-pill btn-wave">' + res[i].applicantStatusCode + '</button></td>';
                    html += '</tr>';
                }
                $('#result11').html(html);
	        }
		});
	});
	
	
	// 내활동탭에서 탭 누를때마다 방향 바꿔주는거
    var selectedTab = "${selectedTab}";
    console.log(selectedTab);
    if (selectedTab && $('#' + selectedTab + 'Btn').length > 0) {
        $('#' + selectedTab + 'Btn').click();
        console.log('#' + selectedTab + 'Btn');
    }
	
    
    
});
</script>

                        
  