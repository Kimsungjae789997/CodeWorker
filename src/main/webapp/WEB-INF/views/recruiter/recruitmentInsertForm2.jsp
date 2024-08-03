<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
    .content-wrapper {
        float: right; /* 컨테이너를 오른쪽으로 정렬합니다. */
        margin-left: 20px; /* 탭과 컨텐츠 사이에 여백을 조절합니다. */
        width: 900px; /* 컨테이너의 너비를 설정하여 크기를 조절합니다. */
    }
    .question-btn {
        display: block;
        margin-bottom: 5px;
        width: 250px;
    }
</style>

<div class="col-md-8" style="margin-left: 430px; margin-top: 100px; height: 800px;">
    <div class="card custom-card" style="width: 100%; height: 750px;">
        <div class="card-header">
            <h4 id="rectitle">${recruitmentNoticeVO.recNtcTitle }</h4>
        </div>
        <div class="card-body">
            <nav class="nav nav-pills flex-column flex-sm-row mb-3" role="tablist">
                <a class="flex-sm-fill text-sm-center nav-link active" data-bs-toggle="tab" role="tab" aria-current="page"
                   href="#pill-flex-home" aria-selected="true" style="font-size: 20px;">1차 서류전형</a>
                <a class="flex-sm-fill text-sm-center nav-link" data-bs-toggle="tab" role="tab" aria-current="page"
                   href="#pill-flex-big" aria-selected="false" style="font-size: 20px;">2차 코딩테스트</a>
                <a class="flex-sm-fill text-sm-center nav-link" data-bs-toggle="tab" role="tab" aria-current="page"
                   href="#pill-flex-about" aria-selected="false" style="font-size: 20px;">3차 면접전형</a>
            </nav>
            <div class="tab-content" style="height: 600px;">
                <!-- 서류전형 시작 -->
                <div class="tab-pane show active text-muted" id="pill-flex-home" role="tabpanel" style="height: 570px;">
                   <div style="display: flex;">
                    <div class="left" style="width: 300px; height: 570px;">
                        <!-- 왼쪽 버튼 시작 -->
                        <button type="button" id="addBtn1" class="btn btn-outline-primary btn-wave" style="width: 250px;">
                            <span style="font-weight: bold; font-size: 15px;">자기소개 문항추가</span>
                        </button>
                        <div id="questionButtons">
                        </div>
                    </div>
                    <!-- 왼쪽 버튼 끝-->
                    <!-- 오른쪽 text 시작 -->
					<div class="right">
	                 	 <div id="selfIntro" style="height: 650px;">
						</div>
                    </div>
                    <!-- 오른쪽 text 끝 -->
               	  </div>
                </div>
                <!-- 서류전형 끝 -->

                <!-- 코딩테스트 시작 -->
                <div class="tab-pane text-muted" id="pill-flex-big" role="tabpanel" style="height: 570px;">
                   <div style="display: flex;">
                    <div class="left" style="width: 300px; height: 570px;">
                        <!-- 왼쪽 버튼 시작 -->
                        <button type="button" id="addBtn2" class="btn btn-outline-primary btn-wave" style="width: 250px;" data-bs-toggle="modal" data-bs-target="#exampleModalScrollable3">
                            <span style="font-weight: bold; font-size: 15px;">코딩테스트 문항추가</span>
                        </button>
                        <div id="coteButtons">
                        </div>
                    </div>
                    <!-- 왼쪽 버튼 끝-->
                    <!-- 오른쪽 text 시작 -->
					<div class="right">
	                 	 <div id="coteIntro" style="height: 650px;">

						</div>
                    </div>
                    <!-- 오른쪽 text 끝 -->
               	  </div>
                </div>
                <!-- 코딩테스트 끝 -->

                <!-- 면접시작 -->
                <div class="tab-pane text-muted" id="pill-flex-about" role="tabpanel" style="height: 570px;" >
                  <div style="display: flex;">
	                   <div id="riri" style="width: 400px;">
							<div class="input-group mb-3">
								<input type="text" class="form-control" id="memPostCode" value="${member.memPostcode }" name="memPostcode"> 
								<span class="input-group-append">
									<button type="button" class="btn btn-secondary btn-flat"
										onclick="DaumPostcode()">대면면접장소 찾기</button>
								</span>
							</div>
							<div class="input-group mb-3">
								<input type="text" class="form-control" id="memAddress1" name="memAddress1" value="${member.memAddress1 }" placeholder="주소를 입력해주세요">
							</div>
							<div class="input-group mb-3">
								<input type="text" class="form-control" id="memAddress2" name="memAddress2" value="${member.memAddress2 }" placeholder="상세주소를 입력해주세요">
							</div>
                              <div class="input-group">
                                  <div class="input-group-text text-muted"> <i class="ri-calendar-line"></i> </div>
                                  <input type="text" name="datetime" class="form-control" id="datetime" placeholder="면접날짜를 선택해주세요">
                              </div>	
                              <br>
                              <div style="text-align: center;">
                              	<button type="button" class="btn btn-outline-primary btn-wave" style="width: 250px; font-size: 20px; font-weight: bold;" id="lastInsertBtn">공고등록 완료</button>
							  </div>
						</div>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<div id="lele" style="width: 774px;">
													<div id="">
						<div class="input-group mb-3">
							<div id="map" style="width:100%; height: 550px; display:none;"></div>
						</div>
					</div>   
						</div>
					</div>
                </div>
                
                <!-- 면접 끝-->
            </div>
        </div>
    </div>
</div>


<!-- 코딩테스트 문항 추가 버튼  누르면 나오는 모달창 시작 -->
<div class="card custom-card">
    <div>
        <div class="modal fade" id="exampleModalScrollable3" tabindex="-1"
            aria-labelledby="exampleModalScrollable3" data-bs-keyboard="false"
            aria-hidden="true">
            <!-- Scrollable modal -->
            <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                <div class="modal-content">
                <br>
                    <h6 class="modal-title" id="staticBackdropLabel3" style="text-align: center; font-weight: bold; font-size: 25px;">기업 코딩테스트용 문제 목록</h6>
                    <div class="modal-body">
                        <!-- 난이도 선택과 검색 시작 -->
                        <div class="mb-3 d-flex" style="justify-content: center;">
  <!--                         <form id="searchForm" class="d-flex "  action="/recruitmentinsert/coteList.do" style="width: 100%; justify-content: center;"> -->
                            <select class="form-control me-2" data-trigger name="searchType" id="difficultySelect" style="width: 90px;">
                                <option value="">난이도</option>
                                <option value="LEV0101">초급</option>
                                <option value="LEV0102">중급</option>
                                <option value="LEV0103">고급</option>
                            </select>
                            <input class="form-control me-2" id="searchInput" name="searchWord" type="text" placeholder="Search" aria-label="Search" style="width: 200px;">
                            <button class="btn btn-light" type="button" id="searchBtn">검색</button>
       <!--                     </form> -->
                        </div>
                        <!-- 난이도 선택과 검색 끝 -->
                        <!-- 코딩데이터 본문 시작-->
                         <table class="table table-hover text-nowrap">
                             <thead>
                                 <tr>
                                     <th scope="col" style="text-align: center;">&nbsp;선택</th>
                                     <th scope="col" style="text-align: center;">제목</th>
                                     <th scope="col">난이도</th>

                                 </tr>
                             </thead>
                             <tbody id="coteListResult">
                             	<!--코딩리스트 뜨는 화면  시작-->
												
                             	<!--코딩리스트 뜨는 화면 끝  -->
                             </tbody>
                             <tfoot>
                             </tfoot>
                         </table>
                        <!-- 코딩데이터 본문 끝-->
                        <!-- 페이징처리 시작 -->
                        <div  id="pagingArea">
                        </div>
                        <!-- 페이징처리 끝 -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" id="coteInsertBtn">등록하기</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 코딩테스트 문항 추가 버튼  누르면 나오는 모달창 끝 -->


<!-- 코딩테스트문제리 모달창에서 제목을 누르면 생기는 문제요약 창 시작-->
<!-- 코딩테스트문제리 모달창에서 제목을 누르면 생기는 문제요약 창 끝-->




<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d8ad9ab9f536d30c70467e58473ff09a&libraries=services"></script>


<script>
$(function(){
	// 페이지 로드시 여기에서 저장했던 로컬스토리지들 삭제
    window.addEventListener('beforeunload', function(event) {
    	localStorage.clear();
    });

    let questionCount = 1;

    // 문항 추가 버튼 클릭 시 동작
    $('#addBtn1').on('click', function(){
        if(questionCount >= 6){
            alert("문항은 5개까지만 제공합니다");
            return;
        }
        if (questionCount <= 5) { 
            let questionBtn = $('<button/>', {
                type: 'button',
                id : 'questionBtn' + questionCount,
                text: '문항 ' + questionCount,
                class: 'btn btn-outline-primary btn-wave question-btn', 
                style: 'width: 250px; margin-bottom: 5px; font-weight: bold; font-size: 15px;'
            });
            $('#questionButtons').append(questionBtn);
            questionCount++;
            $('#selfIntro .content-wrapper').hide();
            $('#selfIntro .btnGroup').hide();
        }
    });
    
    // 문항 버튼 클릭 시 해당 문항의 제목과 내용 입력란 생성
	 $(document).on('click', '[id^=questionBtn]', function(){
	    let questionIndex = $(this).attr('id').replace('questionBtn', ''); // 현재 문항 번호 추출
	    console.log(questionIndex); 
	
	    // 저장된 값 불러오기
	    let storedTitle = localStorage.getItem('title' + questionIndex) || '';
	    let storedContent = localStorage.getItem('content' + questionIndex) || '';
	    
	    // 선택한 문항의 제목과 내용 보이기
	    $('#selfIntro').html(
	        '<div class="content-wrapper" id="contentWrapper' + questionIndex + '">' +
	            '<div>' +
	                '<label class="form-label" style="font-weight: bold; font-size: 15px;">문항제목</label>' +
	                '<button type="button" id="autoCompleteBtn' + questionIndex + '" class="btn btn-light rounded-pill btn-wave" style="margin-left: 10px;">자동완성</button>' +
	                '<textarea class="form-control" id="text-area-title' + questionIndex + '" rows="1" style="height: 80px; width:751px;">' + storedTitle + '</textarea>' +
	            '</div>' +
	            '<br>' +
	            '<div>' +
	                '<label class="form-label" style="font-weight: bold; font-size: 15px;">문항내용</label>' +
	                '<textarea class="form-control" id="text-area-content' + questionIndex + '" rows="1" style="height: 300px; width:751px;">' + storedContent + '</textarea>' +
	            '</div>' +
	            '<br><br><div class="btnGroup" id="btnGroup' + questionIndex + '" style="width:751px; text-align:right; height:600px;">' +
	                '<button type="button" id="storeBtn' + questionIndex + '" class="btn btn-primary rounded-pill" style="width: 150px; margin-bottom: 5px; font-weight: bold; font-size: 15px;">문항저장</button>' +
	                '<button type="button" id="cancelBtn' + questionIndex + '" class="btn btn-primary rounded-pill" style="width: 150px; margin-bottom: 5px; font-weight: bold; font-size: 15px;">문항삭제</button>' +
	            '</div>' +
	        '</div>'
	    );
	});
    
//자동완성 버튼 클릭 시 제목과 내용을 채우는 함수
 $(document).on('click', '[id^=autoCompleteBtn]', function(){
     let questionIndex = $(this).attr('id').replace('autoCompleteBtn', ''); // 현재 문항 번호 추출
     
     let autoCompleteData = {
         '1': {
             'title': '학교 재학기간 중 학업에 기울인 노력과 배우고 느낀 점을 기술해주세요.',
             'content': '학교 외에 자신의 경험을 적으셔도 됩니다.'
         },
         '2': {
             'title': '해당회사 및 직무에 지원하는 동기에 대해 기술해 주십시오.',
             'content': '성격 장단점, 직무와 관련된 경험 및 역량, 관심사항, 개인의 목표 및 비전 등 자신을 어필 할 수 있는 내용을 자유롭게 기술하시기 바랍니다.'
         },
         '3': {
             'title': '도전적인 목표를 정하고 열정적으로 일을 추진했던 경험을 구체적으로 기술해 주십시오.',
             'content': '일을 추진해 나가는 데 있어서 어려웠던 점과 그 결과에 대해서 중심적으로 기술해 주시기 바랍니다.'
         }
     };

     // 자동완성 데이터 설정
     let title = autoCompleteData[questionIndex]?.title || '';
     let content = autoCompleteData[questionIndex]?.content || '';

     // 제목과 내용 채우기
     $('#text-area-title' + questionIndex).val(title);
     $('#text-area-content' + questionIndex).val(content);
 });
    
    // 문항 저장 버튼 클릭 시 동작
    $(document).on('click', '[id^=storeBtn]', function(){
        let storeBtnIndex = $(this).attr('id').replace('storeBtn', ''); // 현재 저장번호 추출
        console.log(storeBtnIndex); 
        localStorage.setItem('title' + storeBtnIndex, $('#text-area-title' + storeBtnIndex).val());
        localStorage.setItem('content' + storeBtnIndex, $('#text-area-content' + storeBtnIndex).val());
    });
    
    // 문항 삭제 버튼 클릭 시 동작
    $(document).on('click','[id^=cancelBtn]',function(){
        let cancelBtnIndex = $(this).attr('id').replace('cancelBtn', ''); // 현재 삭제번호 추출
        console.log(cancelBtnIndex); 
        localStorage.removeItem('title' + cancelBtnIndex);
        localStorage.removeItem('content' + cancelBtnIndex);
        console.log("삭제 완료");

        // 마지막으로 추가된 문항부터 삭제
        if (questionCount > 1 && cancelBtnIndex == questionCount - 1) {
            $('#contentWrapper' + cancelBtnIndex).remove();
            $('#btnGroup' + cancelBtnIndex).remove();
            $('#questionBtn' + cancelBtnIndex).remove();

            // 문항 삭제 후 남은 문항의 인덱스를 다시 조정합니다.
            questionCount--;
        } else {
            alert("마지막 문항부터 삭제할 수 있습니다.");
        }

    });
    
    // 코딩 테스트 추가 버튼 
	$('#addBtn2').on('click', function() {
	    $.ajax({
	        url: "/recruitmentinsert/coteMain.do",
	        type: "get",
	        dataType: 'json',
			beforeSend : function(xhr){	// 데이터 전송 전, 헤더에 csrf 값 설정
				xhr.setRequestHeader(header, token);
			},
	        success: function(res) {
	            console.log(res);
	            console.log(res[0].coteTitle);
	
	            var coteListResult = $('#coteListResult');
	            
	            var html = "";
	            res.forEach(function(item, index) {
	                console.log(item);
	                console.log(item.coteLevelCode);
	                console.log(index);
	                html += '<tr>' +
	                '    <td class="ps-4" style="text-align: center;"><input class="form-check-input" type="checkbox" id="check' + item.coteNo + '" value="" aria-label="..."></td>' +
	                '    <td>' +
	                '        <div class="d-flex" style="justify-content:center;">' +
	                '            <div class="ms-2">' +
	                '                <p class="fw-semibold mb-0 d-flex align-items-center" style="font-size:15px;"><a href="#" id="detail' + item.coteNo + '">' + item.coteTitle + '</a></p>' +
	                '            </div>' +
	                '        </div>' +
	                '    </td>' +
	                '    <td><span class="badge rounded-pill ' + getColorClass(item.coteLevelCode) + '" style="width:60px; height:25px; font-size:15px;">' + item.coteLevelCode + '</span></td>' +
	                '</tr>';
	            });
	            coteListResult.html(html);
	        }
	    });
	}); // addBtn2 끝
	
	// 난이도별로검색하기
	$('#searchBtn').on('click',function(){
		var searchType = $('#difficultySelect').val();
		var searchWord = $('#searchInput').val();
		
		$.ajax({
			url : "/recruitmentinsert/coteMain.do",
			type : "get",
			data : {
				searchType : searchType,	// 선택한 난이도
				searchWord : searchWord		// 검색어 입력값
			},
			dataType : "json",
			success : function(res){
                var coteListResult = $('#coteListResult');
                var html = "";
                res.forEach(function(item, index) {
                    html += '<tr>' +
                        '    <td class="ps-4" style="text-align: center;"><input class="form-check-input" type="checkbox" id="check' + item.coteNo + '" value="" aria-label="..."></td>' +
                        '    <td>' +
                        '        <div class="d-flex" style="justify-content:center;">' +
                        '            <div class="ms-2">' +
                        '                <p class="fw-semibold mb-0 d-flex align-items-center" style="font-size:15px;"><a href="#" id="detail' + item.coteNo + '">' + item.coteTitle + '</a></p>' +
                        '            </div>' +
                        '        </div>' +
                        '    </td>' +
                        '    <td><span class="badge rounded-pill ' + getColorClass(item.coteLevelCode) + '" style="width:60px; height:25px; font-size:15px;">' + item.coteLevelCode + '</span></td>' +
                        '</tr>';
                });
                coteListResult.html(html); 
			}
		});
	});

	// 문제 등록 버튼 클릭
	$(document).on('click','#coteInsertBtn',function(){
        // 기존 문제 버튼 제거
        $('#coteButtons').empty();        
        
        // 로컬스토리지 전에꺼 제거
        for(var i=0; i<=12; i++){
            localStorage.removeItem('coteTitle' + i);
            localStorage.removeItem('coteContent' + i);
            localStorage.removeItem('coteConstranints1' + i);
            localStorage.removeItem('coteConstranints2' + i);
        };
        
		var checkedBoxes = $('#coteListResult input:checked');
		console.log(checkedBoxes);
		if (checkedBoxes.length != 3) {
		    alert("코딩 테스트 문제는 3개 등록해야합니다!");
		    return;
		}
		// 선택된 문제의 개수만큼 버튼을 생성한다.
		var arr = [];
		checkedBoxes.each(function(index){
	        var coteNo = $(this).attr('id').replace('check', ''); // 체크된 문제의 고유 번호 추출
	        console.log(coteNo);
	        arr.push(coteNo);
	        
	        // 버튼 생성 및 추가
	        var coteBtn = $('<button/>', {
	            type: 'button',
	            id: 'coteBtn' + coteNo,
	            text: '문항 ' + (index + 1), // 문항 번호
	            class: 'btn btn-outline-primary btn-wave question-btn',
	            style: 'width: 250px; margin-bottom: 5px; font-weight: bold; font-size: 15px;'
	        });
	        
	        // 버튼 추가
	        $('#coteButtons').append(coteBtn);
	        
		}); //checkedBoxes.each 끝
			console.log(arr);
			data = {
					arr : arr
			}
			// 내가 선택한 문제들 데이터들 db랑 연결지어서  문제, 제약사항, 문제내용 가져오기
			$.ajax({
				url : "/recruitmentinsert/selectedCote",
				type : "post",
				beforeSend : function(xhr){	// 데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
				contentType: "application/json;charset=utf-8",
		        data: JSON.stringify(data),
				success : function(res){
					console.log(res);
				//  로컬스토리지 저장
			    //  localStorage.setItem('title' + storeBtnIndex, $('#text-area-title' + storeBtnIndex).val());
			    //  localStorage.setItem('content' + storeBtnIndex, $('#text-area-content' + storeBtnIndex).val());
				     $.each(res,function(index,item){
				    	 localStorage.setItem('coteTeNo' + item.coteNo, item.coteNo);
				    	 localStorage.setItem('coteTitle' + item.coteNo, item.coteTitle);
				    	 localStorage.setItem('coteContent' + item.coteNo, item.questionContent);
				    	 localStorage.setItem('coteConstranints1' + item.coteNo, item.coteConstraints1);
				    	 localStorage.setItem('coteConstranints2' + item.coteNo, item.coteConstraints2);
				     });    
				}
			});
		
	     // 모달창 닫기
        $('#exampleModalScrollable3').modal('hide');
	});
	
    // 문제 버튼 클릭 시 해당 문제 정보 불러오기
    $(document).on('click', '[id^=coteBtn]', function(){
        var coteIndex = $(this).attr('id').replace('coteBtn', ''); // 현재 문항 번호 추출
        console.log(coteIndex); 

        // 저장된 값 불러오기
 		var storedCoteTitle = localStorage.getItem('coteTitle' + coteIndex)  || '';	// 코딩문제
        var storedCoteContent = localStorage.getItem('coteContent' + coteIndex)  || '';	//코딩 문제내용
        var storedCoteConstraints1 = localStorage.getItem('coteConstranints1' + coteIndex)  || '';	// 코딩 제약사항
        var storedCoteConstraints2 = localStorage.getItem('coteConstranints2' + coteIndex)  || '';	// 코딩 제약사항
        
        console.log(storedCoteTitle);
        console.log(storedCoteContent);
        console.log(storedCoteConstraints1);
        console.log(storedCoteConstraints2);
        $('#coteIntro').html(
                '<div class="coteContent-wrapper" id="coteContentWrapper">' +
                '<div>' +
                    '<label class="form-label" style="font-weight: bold; font-size: 15px;">문제</label>' +
                    '<textarea class="form-control" id="coteTextArea1" rows="1" style="height: 50px; width:751px;">' + storedCoteTitle + '</textarea>' +
                '</div>' +
                '<br>' +
                '<div>' +
                    '<label class="form-label" style="font-weight: bold; font-size: 15px;">제약사항</label>' +
                    '<textarea class="form-control" id="coteTextArea2" rows="1" style="height: 50px; width:751px;">' + storedCoteConstraints1 + ' ' + storedCoteConstraints2 + '</textarea>' +
                '</div>' +
                '<br>' +
                '<div>' +
                    '<label class="form-label" style="font-weight: bold; font-size: 15px;">문제내용</label>' +
                    '<textarea class="form-control" id="coteTextArea3" rows="1" style="height: 250px; width:751px;">' + storedCoteContent + '</textarea>' +
                '</div>' +
                '</div>'
            );
    });
    
    // 문제 버튼 클릭 시 초기화
    $('#addBtn2').on('click', function() {
        for (let i = 0; i <= 12; i++) {
            localStorage.removeItem('coteTitle' + i);
            localStorage.removeItem('coteContent' + i);
            localStorage.removeItem('coteConstranints1' + i);
            localStorage.removeItem('coteConstranints2' + i);
        }
        // coteIntro의 내용을 지웁니다.
        $('#coteIntro').empty(); // 또는 $('#coteIntro').html('');

        // 추가적으로, coteButtons 내의 내용도 비워야 할 수 있습니다.
        $('#coteButtons').empty();
    });

    var memAddress2 = $("#memAddress2"); 
    $('#datetime').on('change',function(){
     	var datetime = $('#datetime').val();	
     	// 로컬 스토리지에 저장
     	localStorage.setItem('datetime', datetime);
    })
 	
 	// 상세주소란에서 포커스가 다른곳으로 이동되었을때 이벤트(주소에 맞는 지도 띄우기)
	memAddress2.focusout(function(){
		var address1 = $("#memAddress1").val();	// 일반주소 데이터
		var address2 = $("#memAddress2").val();	// 상세주소 데이터
		
		// 로컬 스토리지 저장
		localStorage.setItem('intvwLocation', address1 + address2);
		
		// 일반주소 데이터가 존재하지 않는 경우, 지도를 띄울수 없기 때문에 데이터 유무의 기준을 address1으로 설정
		if(address1 != null || address1 != ""){
			var mapContainer = document.getElementById('map'); // 지도를 표시할 div 
			mapContainer.style.display = "block";
		    mapOption = {
		        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
		        level: 3 // 지도의 확대 레벨
		    };  

			// 지도를 생성합니다    
			var map = new kakao.maps.Map(mapContainer, mapOption); 
	
			// 주소-좌표 변환 객체를 생성합니다
			var geocoder = new kakao.maps.services.Geocoder();
	
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(address1 + " " + address2, function(result, status) {
	
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
	});
 
 // 공고 최종등록
    $('#lastInsertBtn').on('click', function() {
        console.log("공고최종등록 눌림");

        // 자기소개 문항 데이터 가져오기
        var selfIntroData = [];
        for (var i = 1; i <= 5; i++) {
            var title = localStorage.getItem('title' + i);
            var content = localStorage.getItem('content' + i);
            if (title && content) {
                selfIntroData.push({
                    selfIntroTitle: title,
                    selfIntroContent: content
                });
            }
        }

        // 코딩테스트 문항 데이터 가져오기
        var coteData = [];
        for (var i = 0; i <= 12; i++) {
            var coteTeNo = localStorage.getItem('coteTeNo' + i);
            if (coteTeNo) { // coteTeNo가 존재하는 경우에만 추가
                coteData.push({
                    coteNo: coteTeNo
                });
            }
        }
        if (selfIntroData.length === 0) {
            Swal.fire({
                icon: 'warning',
                title: '경고',
                text: '자기소개 문항을 추가해주세요.'
            });
            return;
        }
        if (coteData.length === 0) {
            Swal.fire({
                icon: 'warning',
                title: '경고',
                text: '코딩테스트 문항을 추가해주세요.'
            });
            return;
        }

        
        // RecruitmentNoticeVO 객체 생성
        var recNtcId = "${recruitmentNoticeVO.recNtcId}";
        var recruitmentNoticeVO = {
            recNtcTitle: $('#rectitle').text(),
            memPostcode: $('#memPostCode').val(),
            memAddress1: $('#memAddress1').val(),
            memAddress2: $('#memAddress2').val(),
            datetime: $('#datetime').val(),
            selfIntroList: selfIntroData,
            codingTestList: coteData,
            recNtcId : recNtcId
        };

        $.ajax({
            url: '/recruitmentinsert/lastInsert.do',
            type: 'post',
            contentType: 'application/json',
            data: JSON.stringify(recruitmentNoticeVO),
            beforeSend: function(xhr) { // 데이터 전송 전, 헤더에 csrf 값 설정
                xhr.setRequestHeader(header, token);
            },
            success: function(res) {
                console.log(res);
                if(res == "OK"){
                    // 로컬스토리지 초기화
                    localStorage.clear();

                    // 성공 메시지 Swal 사용
                    Swal.fire({
                        icon: 'success',
                        title: '성공',
                        text: '공고 등록이 완료되었습니다.'
                    }).then(() => {
                        // 페이지 이동
                        window.location.href = "/recruitmentmanage/main.do";
                    });
                }
            },
            error: function(err) {
                Swal.fire({
                    icon: 'error',
                    title: '오류',
                    text: '공고 등록에 실패했습니다. 다시 시도해주세요.'
                });
            }
        });
    });
 	
});// $(function(){}) 끝

function getColorClass(levelCode) {
    switch(levelCode) {
        case '고급':
            return 'bg-danger'; 
        case '중급':
            return 'bg-purple'; 
        case '초급':
            return 'bg-blue';   
        default:
            return 'bg-primary'; 
    }
}


function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
            } 
              
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('memPostCode').value = data.zonecode;
            document.getElementById("memAddress1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("memAddress2").focus();
        }
    }).open();
}
</script>