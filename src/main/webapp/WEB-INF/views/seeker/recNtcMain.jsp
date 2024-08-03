<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
body{
	font-size:16px;
}

 .col-sm-5 {
     margin: 10px; /* 채용공고 간의 간격 */
 }
 
.non-clickable {
    pointer-events: none;
    opacity: 0.6;
}

.apply-form {
    position: absolute;
    width: 400px;
    z-index: 1000; /* 다른 요소 위에 표시되도록 설정 */
    background-color: white; /* 배경색 설정 */
    border: 1px solid #ddd; /* 테두리 설정 */
    border-radius: 5px; /* 모서리 둥글게 설정 */
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 설정 */
    padding: 20px; /* 내부 여백 설정 */
    max-height: 60vh; /* 최대 높이 설정 */
    overflow-y: auto; /* 세로 스크롤 설정 */
}
.apply-form .header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}
.apply-form .header h2 {
    flex-grow: 1;
    text-align: center;
    margin: 0;
}
.apply-form .header button {
    font-size: 24px; /* 버튼 크기 조정 */
}
.readonly-input {
    border: none;
    background-color: transparent;
    pointer-events: none;
    color: black; /* 텍스트 색상 */
}
.midTitle{
	margin-bottom:30px;
}
.recTabDivs{
	margin-bottom: 100px;
	font-size:21px;
	font-weight:600;
}
.self-info-btn-group{
	margin-right:10px; 
	margin-bottom:30px; 
    text-align: right;
	font-size: 18px;
	font-weight : 500;
}
.selfinfo-insert-crpName{
	font-size:18px;
	font-weight:600;
	font-color:black
}
.selfinfo-insert-recNtcTitle{
	font-size:18px;
	margin-bottom:30px;
}
.selfinfo-insert-recNtcSelfInfoTitle{
	font-size:16px;
}
.selfinfo-insert-recNtcSelfInfoCont{
	font-size:16px;
	margin-bottom:15px;
}
.selfIntroText{
	margin-bottom:15px;
}


</style>

<div style="margin-top:120px;"></div>
<div id="submitBeforeShow">

    <!-- Start::row-1 -->
    <div class="row">
        <div class="col-xl-12">
            <div class="" style="padding-bottom:100px;">
                <div class="">
                    <div class="d-flex flex-wrap align-items-top justify-content-between gap-2">
                        <div>
                            <div>
                               <img src="${pageContext.request.contextPath}/resources/images/${reruitmentVO.crpRecntcInfo}" style="display: block;  border-radius: 3%;">
                            </div>
                            <br><br>
                            <div>
                                <font style="font-size:16px; color:gray; font-weight: bold;"><span style="cursor:pointer; font-size:16px;" id="goCrp">${reruitmentVO.crpName }</span>&nbsp;&nbsp;&nbsp;<span style="font-size: 16px;"><i class="bi bi-geo-alt me-1"></i>${reruitmentVO.workingLocCode}&nbsp;&nbsp;&nbsp;<i class="bi bi-mortarboard"></i> ${reruitmentVO.experienceCode} ${reruitmentVO.experienceLevelCode}</span></font>
                                <!--  북마크, 관심회사 넣기 -->
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 
                                <span> 
                            	 	<b class="aa bookMarkResult-${reruitmentVO.recNtcId}"  style="padding:10px 10px 10px 10px" ></b>
	          			        	<input type="hidden" value="${reruitmentVO.recNtcId }" class="recId"><input type="hidden" value="${reruitmentVO.crpId }" id="crpId"><span id="crpId2"></span>
                           		</span>
                            </div>
                            <div style="display: flex; justify-content: space-between;">
                                <font class="md-0" style="font-size:32px; font-weight:600;">${reruitmentVO.recNtcTitle }    </font> 
                                <button type="button" id="applyBtn" class="btn btn-secondary btn-wave" style="width: 400px; height: 50px; font-size: 20px; font-weight: bold;">지원하기</button>
                            </div>
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
        
          <!--  채용공고 내용  시작 -->    
            <div class="recTabDivs">
                <div class="">
                    <div class="midTitle"><i class="bi bi-pin-angle-fill"></i> 포지션 상세</div>
                </div>
                <div class="">
                    <div class="row" style="margin-right:185px;">	        					
                        <!--  채용공고 내용 들어가는 곳 -->
                        <img src="${pageContext.request.contextPath}/resources/images/${reruitmentVO.recNtcContent}">
                    </div>
                </div>
            </div>
            <hr><br><br>
            <!--  채용공고 내용  끝 -->       
            
            <!--  기술 스택 시작 -->
            <div class="recTabDivs">                           
                <div class="">
                     <div class="midTitle"><i class="bi bi-pin-angle-fill"></i> 우대 기술 스택</div>
                </div>
                 <div class="">
                    <c:forEach items="${skillVO}" var="skill">
                        <%-- <span class="badge bg-outline-dark" style="font-size: 20px;">${skill.skillstackCode}</span>&nbsp;&nbsp; --%>
                        <button type="button" class="btn btn-secondary-light rounded-pill btn-wave" style="font-size: 20px; margin-right: 20px;">${skill.skillstackCode}</button>
                    </c:forEach>
                </div>
                <div>
                </div>
            </div>
            <hr><br><br>
            <!--  기술 스택 끝 -->
            
            <!--  고용 형태 시작 -->
            <div class="recTabDivs">                           
                <div class="">
                     <div class="midTitle"><i class="bi bi-pin-angle-fill"></i> 고용 형태</div>
                </div>
                 <div class="">
                 	<button type="button" class="btn btn-light rounded-pill btn-wave" style="font-size: 20px;">${reruitmentVO.workingTypeCode  }</button>
                </div>
                <div>
                </div>
            </div>
            <hr><br><br>
            <!--  고용 형태 끝 -->
            
            <!--  학력 자격요건 시작 -->
            <div class="recTabDivs">                           
                <div class="">
                     <div class="midTitle"><i class="bi bi-pin-angle-fill"></i> 학력 자격 요건</div>
                </div>
                 <div class="">
                 	<button type="button" class="btn btn-light rounded-pill btn-wave" style="font-size: 20px;">${reruitmentVO.eduCode  }</button>
                </div>
                <div>
                </div>
            </div>
            <hr><br><br>
            <!--  학력 자격 요건 끝 -->
            
            <!--  위치 시작 -->                        
            <div class="recTabDivs">                           
                <div class=>
                     <div class="midTitle"><i class="bi bi-pin-angle-fill"></i> 근무 지역</div>
                </div>
                 <div>
                    <div id="map" style="width:100%; height:400px;"></div>																
                </div>
                <div style="font-size:18px; font-weight:400; margin-top:30px;">
                	<p>${reruitmentVO.crpAddress1  } ${reruitmentVO.crpAddress2  }</p>
                </div>
            </div>
            <hr><br><br>
            <!--  위치 끝 -->       
            <!--  마감일 -->
            <div class="recTabDivs">                           
                <div class="">
                     <div class="midTitle"><i class="bi bi-pin-angle-fill"></i> 마감일</div>
                </div>
                 <div class="">
                    <h5>${reruitmentVO.recNtcEnd  } </h5>													
                </div>
                <div>
                </div>
            </div>
            <!--  마감일 -->

        </div>
    </div>           
 <!--  오른쪽 끝-->
    <!-- End::row-2 -->
</div>

<!--  자기소개문항서 시작 -->
<div class="col-xl-12" style="margin-top: 100px; display: none;" id="submitAfterShow">
	<div class="self-info-btn-group">
		<button class="bi bi-wallet btn btn-light btn-wave" id="loadBtn"> 불러오기</button>
		<button class="bi bi-arrow-down-square btn btn-light btn-wave" id="storeBtn"> 임시저장</button>  
		<button type="button" style="width: 130px;" class="bi bi-send btn btn-warning btn-wave" id="finalSubmitBtn"> 제출</button>
	</div>
    <!--  자기소개문항서 들어가는 곳 시작-->
    <div class="" id="mainShow"></div>
    <!--  자기소개문항서 들어가는 곳 끝-->
</div>
<!--  자기소개문항서 끝 -->


<form action="/main/crpDetail" method="get" id="go">
	<input type="hidden" id="crpId" name="crpId" value="${reruitmentVO.crpId }">
</form>




<sec:authorize access="hasRole('ROLE_SEEKER')">
<sec:authentication property="principal.member.memId" var="memId"/>
<input type="hidden" id="memId" value="${memId }">
</sec:authorize>
<input type="hidden" id="crpAddress1" value="${reruitmentVO.crpAddress1  }">
<input type="hidden" id="crpAddress2" value="${reruitmentVO.crpAddress2  }">
<input type="hidden" id="recNtcId" value="${reruitmentVO.recNtcId }">
<input type="hidden" id="recNtcTitle" value="${reruitmentVO.recNtcTitle }">
<input type="hidden" id="crpName" value="${reruitmentVO.crpName }">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8ad9ab9f536d30c70467e58473ff09a&libraries=services"></script>
<script>
$(function() {
	var crpName = $('#crpName').val();
	var recNtcTitle = $('#recNtcTitle').val();
	console.log(crpName);
	console.log(recNtcTitle);
    // 카카오지도 시작
    var crpAddress1 = $("#crpAddress1").val(); // 일반주소 데이터
    var crpAddress2 = $("#crpAddress2").val(); // 상세주소 데이터

    // 일반주소 데이터가 존재하지 않는 경우, 지도를 띄울 수 없기 때문에 데이터 유무의 기준을 address1으로 설정
    if (crpAddress1 != null || crpAddress2 != "") {
        var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
        mapContainer.style.display = "block";
        var mapOption = {
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

    // 지원하기 버튼 클릭 이벤트
    $('#applyBtn').on('click', function() {
        var data = {
            memId: $('#memId').val()
        };
        $.ajax({
            url: "/recruitment/selectSeeker",
            beforeSend: function(xhr) {
                xhr.setRequestHeader(header, token);
            },
            contentType: "application/json;charset=utf-8",
            data: JSON.stringify(data),
            type: "post",
            success: function(res) {
                console.log(res);
                if (res == null || res == "") {
                    location.href = "/login";
                } else {
                    var buttonOffset = $('#applyBtn').offset();
                    var html = "";
                    html += "<div class='apply-form' style='top: " + buttonOffset.top + "px; left: " + buttonOffset.left + "px;'>";
                    html += "    <div class='header'>";
                    html += "        <button class='bi bi-chevron-left' id='backBtn' style='border: none; background: none;'></button>";
                    html += "        <h2 style='font-size: 20px; font-weight: bold;'>지원하기</h2>";
                    html += "    </div>";
                    html += "<br>     <h2 style='font-size: 20px; font-weight: bold;'>지원 정보</h2><br>";
                    html += "        <div class='mb-3' style='display: flex; align-items: center;'>";
                    html += "            <label for='applicantName' class='form-label' style='margin-right: 5px; width: 80px; color:gray; font-size:15px;'>이름</label>";
                    html += "            <input type='text' class='form-control readonly-input' id='applicantName' placeholder='이름을 입력하세요' style='flex: 1; font-size:15px;' value='" + res.seekerName + "' readonly>";
                    html += "        </div>";
                    html += "        <div class='mb-3' style='display: flex; align-items: center;'>";
                    html += "            <label for='applicantEmail' class='form-label' style='margin-right: 5px; width: 80px; color:gray; font-size:15px;'>이메일</label>";
                    html += "            <input type='email' class='form-control readonly-input' id='applicantEmail' placeholder='이메일을 입력하세요' style='flex: 1; font-size:15px;' value='" + res.seekerEmail + "' readonly>";
                    html += "        </div>";
                    html += "        <div class='mb-3' style='display: flex; align-items: center;'>";
                    html += "            <label for='applicantPhone' class='form-label' style='margin-right: 5px; width: 80px; color:gray; font-size:15px;'>연락처</label>";
                    html += "            <input type='text' class='form-control readonly-input' id='applicantPhone' placeholder='연락처를 입력하세요' style='flex: 1; font-size:15px;' value='" + res.seekerTel + "' readonly>";
                    html += "        </div><br><br>";
                    html += "    <h2 style='font-size: 20px; font-weight: bold;'>첨부파일 선택</h2><br>";
                    html += "    <ul class='list-group'>";

                    res.resumeList.forEach(function(resume) {
                        html += "        <li class='list-group-item' style='border:1px solid gray;'>";
                        html += "            <div class='d-flex align-items-center'>";
                        html += "                <div class='me-2'><input class='form-check-input form-checked-success resume-checkbox' data-resume='" + resume.resumeNo + "' type='checkbox' value='" + resume.resumeNo + "' style='border:1px solid gray; width: 20px; height: 20px;'></div>";
                        html += "                <div>";
                        html += "                    <div class='fw-semibold'>" + resume.resumeName + "</div>";
                        if (resume.resumeYn === 'Y') {
                            html += "  <div class='fw-semibold' style='margin-left: 10px;'><span style='color:#36f;'>기본</span>  | " + resume.selectedDate + "</div>";
                        } else {
                            html += "  <div class='fw-semibold' style='margin-left: 10px;'>" + resume.selectedDate + "</div>";
                        }
                        html += "                </div>";
                        html += "            </div>";
                        html += "        </li><br>";
                    });

                    html += "    </ul>";
                    html += "    <div class='mt-3 text-center'>";
                    html += "        <button type='button' id='uploadBtn' class='btn btn-secondary btn-wave clsFile' style='width:100%'>파일 업로드</button><input type='file' name='file' id='fileInput' style='display: none;'/><br/><br/>";
                    html += "        <button class='btn btn-secondary btn-wave' style='width:100%' onclick=\"location.href='/resume/mgmtMain'\">새 이력서 작성</button>";
                    html += "    </div>";
                    html += "<div><br><br>"
                    html += "<p style='font-size:18px; font-weight:bold;'>지원 안내</p>"
                    html += "<ul>"
                    html += "<li style='font-size:15px;'>CodeWorker 이력서로 지원하면 서류 합격률이 2배 증가합니다.</li>"
                    html += "<li style='font-size:15px;'>제출한 서류는 다음 기간 동안 기업에게 제공됩니다.</li>"
                    html += "<li style='font-size:15px;'>버튼에 클릭 시 서류 제출에 대한 동의로 간주됩니다. 동의하지 않을 경우 입사 지원이 불가능합니다.</li>"
                    html += "<li style='font-size:15px;'>제출하기를 누르면 자기소개서를 입력해야합니다.</li>"
                    html += "</ul>"
                    html += "</div>"
                    html += "<button id='submitBtn' class='btn btn-light btn-wave' style='width:100%; font-weight:bold; font-size:20px;' disabled>제출 하기</button>"
                    html += "</div>";
                    $('body').append(html);
                    $('#applyBtn').hide();
                    $('#backBtn').on('click', function() {
                        $('.apply-form').remove();
                        $('#applyBtn').show();
                    });

                    
                    
                    $('.resume-checkbox').on('change', function() {
                        var checkedCount = $('.resume-checkbox:checked').length;
                        $('#submitBtn').prop('disabled', checkedCount !== 1);
                    });
                }
            }
        });
    });//end applyBtn
    
 	// 파일 업로드 버튼 클릭 이벤트
    $(document).on('click','.clsFile' ,function() {
       $("#fileInput").click();
       
    });
    if (sessionStorage.getItem('triggerApplyBtn') === 'true') {
        // applyBtn 클릭 이벤트 트리거
        $('#applyBtn').click();
        // 클릭 처리가 완료되면 sessionStorage의 해당 항목 삭제
        sessionStorage.removeItem('triggerApplyBtn');
    }
    
    // 파일 업로드
    $(document).on('change', '#fileInput', function(event){
    	var files = event.target.files;
    	var file = files[0];
        var memId = $('#memId').val();
        
        if (file) {
            var formData = new FormData();
            formData.append('file', file);
            formData.append('memId', memId);
            
            $.ajax({
                url: '/resume/uploadFile', 
                type: 'post',
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success: function (res) {
                    console.log(res);
                    alert('파일 업로드 성공');
                    // 페이지 리로드 후 applyBtn 클릭 정보를 sessionStorage에 저장
                    sessionStorage.setItem('triggerApplyBtn', 'true');

                    // 페이지 리로드
                    location.reload();
                    
                    
                    
                    
                    
                } // scuuess ㄲ
            });// ajax 끝
        }
    });// 파일 업로드 끝
    
 // 이력서 선택 후 제출하기 버튼
    $(document).on('click', '#submitBtn', function() {
        Swal.fire({
            title: '선택한 이력서를  제출하시겠습니까?',
            text: "",
            icon: 'question',
            showCancelButton: true, // 취소 버튼 표시
            confirmButtonText: '제출',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                $('#submitBeforeShow').hide();
                $('#submitAfterShow').show();
                $('.apply-form').hide();
                var crpName = $('#crpName').val();
                var recNtcTitle = $('#recNtcTitle').val();
                
                var recNtcId = $('#recNtcId').val();
                var data = {
                    recNtcId: recNtcId
                };
                $.ajax({
                    url: "/recruitment/selfIntroSelect",
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader(header, token);
                    },
                    contentType: "application/json;charset=utf-8",
                    data: JSON.stringify(data),
                    type: "post",
                    success: function(res) {
                        var html = '<div class="">';
                        html += '<nav class="nav nav-pills flex-column flex-sm-row mb-3" role="tablist">';
                        
                        res.forEach(function(item, index) {
                            var activeClass = index === 0 ? 'active' : '';
                            html += '<a style="font-size: 21px;" class="flex-sm-fill text-sm-center nav-link ' + activeClass + '" data-bs-toggle="tab" role="tab" aria-current="page" href="#tab-' + index + '" aria-selected="' + (index === 0) + '">' + parseInt(index+1) + '번 문항</a>';
                        });
                        
                        html += '</nav>';
                        html += '<div class="tab-content" style="height: 800px;">';
                        
                        res.forEach(function(item, index) {
                            var activeClass = index === 0 ? 'show active' : '';
                            html += '<div class="tab-pane ' + activeClass + ' text-muted" id="tab-' + index + '" role="tabpanel" style="height: 800px; padding-left:50px; padding-right:50px;"><br>';
                            html += '<div class="selfinfo-insert-crpName">' + '[' + crpName + ']' + '</div>';
                            html += '<div class="selfinfo-insert-recNtcTitle">' + recNtcTitle + '</div>';
                            html += '<div class="selfinfo-insert-recNtcSelfInfoTitle">'  +  parseInt(index+1) +'.&nbsp;' + item.selfIntroTitle + '</div>'; 
                            html += '<div class="selfinfo-insert-recNtcSelfInfoCont">' + item.selfIntroContent + '</div>'; 
                            html += '<textarea class="selfIntroText" data-self="' + item.selfIntroNo + '" style="width: 100%; height: 35%; font-size:18px;"></textarea>';
                            html += '<div class="char-count" style="font-size: 18px; margin-top: 10px;">0/1000자 (글자수, 공백포함)</div>';
                            html += '<div class="progress" style="height: 30px; margin-top: 10px;">';
                            html += '<div class="progress-bar" role="progressbar" style="width: 0%;" aria-valuenow="0" aria-valuemin="0" aria-valuemax="1000">0%</div>';
                            html += '</div>';
                            html += '</div>';
                        });
                        
                        html += '</div></div>';
                        
                        $('#mainShow').html(html);

                        // Add event listener for input fields to update character count and progress bar
                        $('.selfIntroText').on('input', function() {
                            var charCount = $(this).val().length;
                            var progress = (charCount / 1000) * 100;
                            $(this).next('.char-count').text(charCount + '/1000자 (글자수, 공백포함)');
                            $(this).nextAll('.progress').find('.progress-bar').css('width', progress + '%').attr('aria-valuenow', charCount).text(Math.round(progress) + '%');
                        });

                        // 페이지 로드 시 로컬 스토리지에서 값 불러오기
                        $('.selfIntroText').each(function(index) {
                            var savedText = localStorage.getItem('selfIntroText' + index);
                            if (savedText) {
                                $(this).val(savedText);
                                // 글자 수 및 진행률 업데이트
                                var charCount = savedText.length;
                                var progress = (charCount / 1000) * 100;
                                $(this).next('.char-count').text(charCount + '/1000자 (글자수, 공백포함)');
                                $(this).nextAll('.progress').find('.progress-bar').css('width', progress + '%').attr('aria-valuenow', charCount).text(Math.round(progress) + '%');
                            }
                        });
                    }
                });
            } else {
                // 사용자가 '취소' 버튼을 클릭한 경우
                Swal.fire({
                    title: '취소됨',
                    text: '제출 작업이 취소되었습니다.',
                    icon: 'info',
                    confirmButtonText: '확인'
                });
            }
        });
    });//submitBtn 끝

    // 자기소개문항서
    

	// 임시저장 버튼 클릭 이벤트
	$('#storeBtn').on('click', function() {
	    // 각 탭의 textarea 값을 가져와 로컬 스토리지에 저장
	    $('.selfIntroText').each(function(index) {
	        var selfIntroText = $(this).val();
	        console.log("selfIntroText : " + selfIntroText);
	        localStorage.setItem('selfIntroText' + index, selfIntroText);
	    });
	    
	    // SweetAlert2를 사용하여 임시 저장 알림 표시
	    Swal.fire({
	        title: '임시 저장 완료',
	        text: '작성하신 내용들이 임시 저장되었습니다.',
	        icon: 'success',
	        confirmButtonText: '확인'
	    });
	});

	// 제출버튼 누르기
	$('#finalSubmitBtn').on('click', function() {
	    // SweetAlert2를 사용하여 제출 확인 대화상자 표시
	    Swal.fire({
	        title: '정말 제출하시겠습니까?',
	        text: "제출 후에는 수정이 불가능합니다.",
	        icon: 'question',
	        showCancelButton: true, // 취소 버튼 표시
	        confirmButtonText: '제출',
	        cancelButtonText: '취소'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            // 사용자가 '제출' 버튼을 클릭한 경우
	            // 이력서 번호
	            var resumeNo = $('.resume-checkbox:checked').data('resume');
	            console.log(resumeNo);
	            // 회원 id
	            var memId = $('#memId').val();
	            console.log(memId);
	            // 공고 id
	            var recNtcId = $('#recNtcId').val();
	            console.log(recNtcId);
	            
	            var selfIntroList = [];
	            var elements = $('.selfIntroText');
	            $.each(elements, function(i, v) {
	                var selfIntroText = $(this).val();
	                var selfIntroNo = $(this).data('self');
	                selfIntroList.push({ selfIntroNo: selfIntroNo, selfIntroText: selfIntroText });
	            });
	            console.log("selfIntroList ===========" + JSON.stringify(selfIntroList));
	            
	            var data = {
	                resumeNo: resumeNo,
	                memId: memId,
	                recNtcId: recNtcId,
	                selfIntroList: selfIntroList
	            };
	            
	            $.ajax({
	                url: "/recruitment/applyResume.do",
	                type: "post",
	                data: JSON.stringify(data),
	                beforeSend: function(xhr) {
	                    xhr.setRequestHeader(header, token);
	                },
	                contentType: "application/json;charset=utf-8",
	                success: function(res) {
	                    console.log(res);
	                    if (res == "OK") {
	                        Swal.fire({
	                            title: '지원 성공!',
	                            text: '지원에 성공하였습니다!',
	                            icon: 'success',
	                            confirmButtonText: '확인'
	                        }).then(() => {
	                            window.localStorage.clear();
	                            location.href = "/apply/main.do?tab=applySuccess";
	                        });
	                    } else {
	                        Swal.fire({
	                            title: '지원 실패',
	                            text: '지원 중 오류가 발생했습니다. 다시 시도해 주세요.',
	                            icon: 'error',
	                            confirmButtonText: '확인'
	                        });
	                    }
	                }
	            });
	        } else {
	            // 사용자가 '취소' 버튼을 클릭한 경우
	            Swal.fire({
	                title: '취소됨',
	                text: '제출 작업이 취소되었습니다.',
	                icon: 'info',
	                confirmButtonText: '확인'
	            });
	        }
	    });
	});// 제출버튼 누르기 끝
    
    $('#goCrp').on('click',function(){
    	$('#go').submit();
    });
    
    
    // 파일업로드 클릭
/*     $(document).on('click','#uploadBtn', function(){
        $('#fileInput').click();
    }); */
    
    
    
    // 각 공고의 북마크 상태를 확인
    $('.recId').each(function() {
        var recId = $(this).val();
        console.log("recId: ", recId);
        updateBookmarkStatus(recId);
    });
    
    
	// 회사의 채용공고 가져오기
	var data = {
	    crpId : $('#crpId').val()
	}
	console.log(data.crpId);
	
	// 관심회사 상태 확인
	var crpId = $('#crpId').val();
	console.log("crpId ==" + crpId)
	updateInterestCrp(crpId);
	
	//html += '<textarea class="selfIntroText" data-self="' + item.selfIntroNo + '" style="width: 100%; height: 50%; font-size:18px;"></textarea>';
    // 불러오기
	// 불러오기 버튼 클릭 이벤트
	$('#loadBtn').on('click', function() {
	    var sampleTexts = [
	        "우아한 형제들의 혁신적인 기술과 고객 중심의 서비스에 깊이 공감하여 지원하게 되었습니다. 서버 개발자로서 회사의 성장에 기여하고 싶습니다.저는 문제 해결에 대한 열정과 끈기를 가지고 있으며, 새로운 기술을 배우는 것을 즐깁니다. 다만, 완벽주의 성향이 있어 세부 사항에 집중하는 경향이 있습니다.5년간 서버 개발자로 일하며 대규모 트래픽 처리 시스템을 설계하고 구현한 경험이 있습니다. AWS 환경에서의 서버 운영 경험도 갖추고 있습니다.안정적이고 효율적인 서버 시스템을 구축하여 사용자에게 최상의 경험을 제공하는 것이 목표입니다. 우아한 형제들에서 성장하며 회사의 발전에 기여하고 싶습니다.",
	        "저는 이전 회사에서 대규모 실시간 데이터 처리 시스템을 구축하는 프로젝트를 맡았습니다. 목표는 서버 성능을 30% 향상시키는 것이었습니다.프로젝트 초기에는 데이터 처리 속도와 안정성을 동시에 확보하는 것이 어려웠습니다. 또한, 기존 시스템과의 호환성 문제로 인해 많은 수정 작업이 필요했습니다.팀원들과 협력하여 마이크로서비스 아키텍처를 도입하고, 성능 최적화를 위한 다양한 기술을 적용했습니다. 지속적인 테스트와 피드백을 통해 문제를 해결해 나갔습니다.결국 목표를 달성하여 서버 성능을 35% 향상시켰고, 시스템의 안정성도 크게 개선되었습니다. 이 경험을 통해 도전적인 목표를 달성하는 데 필요한 끈기와 협업의 중요성을 배웠습니다.",
	        "대학교 재학 중 컴퓨터 공학을 전공하며, 매 학기마다 성적 우수 장학금을 받을 정도로 학업에 열정을 쏟았습니다. 특히, 알고리즘과 데이터 구조 과목에서 높은 성취를 이루기 위해 매일 꾸준히 문제를 풀고, 스터디 그룹을 조직하여 함께 학습했습니다.이 과정에서 문제 해결 능력과 논리적 사고력을 크게 향상시킬 수 있었습니다. 또한, 팀원들과의 협업을 통해 다양한 관점을 배우고, 서로의 강점을 활용하는 방법을 익혔습니다.학교 외에도 여러 해커톤과 프로그래밍 대회에 참가하여 실전 경험을 쌓았습니다. 이를 통해 실무에서의 문제 해결 능력과 빠른 적응력을 키울 수 있었습니다."

	    ];

	    $('.selfIntroText').each(function(index) {
	        var savedText = sampleTexts[index % sampleTexts.length]; // 예시로 각 textarea에 다른 값을 설정
	        $(this).val(savedText);
	        // 글자 수 및 진행률 업데이트
	        var charCount = savedText.length;
	        var progress = (charCount / 1000) * 100;
	        $(this).next('.char-count').text(charCount + '/1000자 (글자수, 공백포함)');
	        $(this).nextAll('.progress').find('.progress-bar').css('width', progress + '%').attr('aria-valuenow', charCount).text(Math.round(progress) + '%');
	    });
	});
    
});// function 끝
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
                bookmarkElement.html('<i onclick="like_func(\'' + recNtcId + '\')" class="bi bi-bookmark bookMarkResult-' + recNtcId + '" style="font-size: 24px; cursor: pointer;"></i>');
            }
            if(data == 'EXIST') {
                bookmarkElement.html('<i onclick="like_func(\'' + recNtcId + '\')" class="bi bi-bookmark-fill bookMarkResult-' + recNtcId + '" style="font-size: 24px; cursor: pointer;"></i>');
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
        beforeSend : function(xhr){ // 데이터 전송 전, 헤더에 csrf 값 설정
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


//관심회사 띄우기
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
                 crpElement.html('<span onclick="int_func(\'' + crpId + '\')" class="crpResult-' + crpId + '" style="font-size: 0px;">&nbsp;&nbsp;&nbsp;<button style="    border-radius: 15px; padding: 5px 10px; font-size: 19px; background-color: white; color:gray; border-color: gray;"><i class="bi bi-suit-heart"></i>&nbsp;' + data.count + '&nbsp;관심기업</button></span>');
             }
             if (data.result == 'EXIST') {
                 crpElement.html('<span onclick="int_func(\'' + crpId + '\')" class="crpResult-' + crpId + '" style="font-size: 0px; cursor: pointer;">&nbsp;&nbsp;&nbsp;<button style="     border-radius: 15px; padding: 5px 10px; font-size: 19px; background-color: white; color:gray; border-color: gray;"><i class="bi bi-suit-heart-fill"></i>&nbsp;' + data.count + '&nbsp;관심기업</button></span>');
             }
         } else {
             if (data.result == 'FAILED') {
                 crpElement.html('<span onclick="int_func(\'' + crpId + '\')" class="crpResult-' + crpId + '" style="font-size: 0px;">&nbsp;&nbsp;&nbsp;<button style="     border-radius: 15px; padding: 5px 10px; font-size: 19px; background-color: white; color:gray; border-color: gray;"><i class="bi bi-suit-heart"></i>관심기업</button></span>');
             }
             if (data.result == 'EXIST') {
                 crpElement.html('<span onclick="int_func(\'' + crpId + '\')" class="crpResult-' + crpId + '" style="font-size: 0px; cursor: pointer;">&nbsp;&nbsp;&nbsp;<button style="     border-radius: 15px; padding: 5px 10px; font-size: 19px; background-color: white; color:gray; border-color: gray;"><i class="bi bi-suit-heart-fill"></i>관심기업</button></span>');
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
</script>