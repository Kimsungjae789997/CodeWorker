<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<style>
body{
	font-size : 16px;
}
.modal-dialog{
	min-width : 300px;
	max-width : 800px;
	min-height : 800px;
	max-height : 1000px;
}
.custom-modal-width{
	max-width : 60%;
}
.modal-body{
	max-height : 70vh;
	max-width : 100%;
	overflow-y : auto;
	overflow-x : auto;
}
.card {
    min-height: 700px;
    padding : 30px 10px 50px 10px;
}
.table{
	width:100%;
}
.table-responsive{
	overflow-x: hidden;
}
.table th{
	background-color : #F2EEFC;"
}
.useGuide{
	color:#650EEB;
}
.table th{
	text-align : center;
}
.table td{
    text-align: center !important;
}
.hereUseGuide{
	color:#650EEB;
}
</style>

<div class="main-content app-content">
    <div class="container-fluid">
    	<div class="container-lg">
    
    	<!-- 페이지 제목 시작 -->
		<br><br>
        <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
               <h1 class="page-title fw-semibold fs-21 mb-0">지원자 목록</h1>
               <br><br>
        </div>
    	<!-- 페이지 제목 끝 -->
    	
        <!-- 공고 제목 선택 시작 -->
        <div class="mb-4">
        	<!-- <label for="recNtcSelect" class="form-label fw-bold">공고 선택:</label> -->
	      	<select id="recNtcSelect" class="form-select form-select-lg mb-3 recNtcSelect">
	           <option value="">=== 전체 공고 ===</option>
	           <c:forEach var="recNtc" items="${recNtcList}">
	               <option value="${recNtc.recNtcId}">[${recNtc.status }] ${recNtc.recNtcTitle} (${recNtc.recNtcStart}-${recNtc.recNtcEnd })</option>
	           </c:forEach>
	      	</select>
      	</div>
        <!-- 공고 제목 선택 끝 -->
      
      	<!-- 내용 시작 -->
		<div class="row">
		    <div class="col-xl-12">
		        <div class="card custom-card overflow-hidden">
					<!-- Card Header : 지원단계별 탭 시작 -->
		            <div class="card-header justify-content-between">
		            
		                <div class="d-flex flex-wrap gap-2">
						    <ul class="nav nav-style-1 nav-pills mb-3" id="myTab" role="tablist">
						       <li class="nav-item">
						           <a class="nav-link active" data-bs-toggle="tab" role="tab" aria-current="page"
						           href="" aria-selected="true">전체 지원자</a>
						       </li>
						       <li class="nav-item">
						           <a class="nav-link" data-bs-toggle="tab" role="tab" aria-current="page"
						           href="APP0101" aria-selected="false">1차 서류전형</a>
						       </li>
						       <li class="nav-item">
						           <a class="nav-link" data-bs-toggle="tab" role="tab" aria-current="page"
						           href="APP0102" aria-selected="false">2차 코딩테스트 전형</a>
						       </li>
						       <li class="nav-item">
						           <a class="nav-link" data-bs-toggle="tab" role="tab" aria-current="page"
						           href="APP0103" aria-selected="false">3차 면접전형</a>
						       </li>
						       <li class="nav-item">
						           <a class="nav-link" data-bs-toggle="tab" role="tab" aria-current="page"
						           href="APP0104" aria-selected="false">합격 예정자</a>
						       </li>
						       <li class="nav-item">
						           <a class="nav-link" data-bs-toggle="tab" role="tab" aria-current="page"
						           href="APP0105" aria-selected="false">불합격자</a>
						       </li>
						   </ul>
		               	</div>
		               	
		               	<!-- 이용 가이드 시작 -->
						<div class="">
							<p>
							<span class="fw-semibold hereUseGuide"><i class="bi bi-lightbulb"></i> 이용 가이드</span> <br/>
							&nbsp; • 단계별 전형에서 합격/불합격 처리시 해당 지원자에게 실시간 알림이 갑니다.<br/>
							&nbsp; • 한번 합격/불합격 처리하면 번복할 수 없으니 신중히 선택하세요.
							</p>
						</div>
		              	<!-- 이용 가이드 끝 -->
		              	
		            </div>
					<!-- Card Header : 지원단계별 탭 끝 -->
					<!-- Card Body : 지원자 목록 시작  -->
		            <div class="card-body p-0">
		                <div class="table-responsive applicantTable">
		                    <table class="table table-hover text-nowrap" style="width:95%; margin:50px 30px 0px 30px;">
		                        <thead>
		                            <tr>
		                                <th scope="col" class="fs-16">번호</th>
		                                <th scope="col" class="fs-16">이름</th>
		                                <th scope="col" class="fs-16">최종학력</th>
		                                <th scope="col" class="fs-16">이력서</th>
		                                <th scope="col" class="fs-16">자기소개</th>
		                                <th scope="col" class="fs-16">코딩테스트</th>
		                                <th scope="col" class="fs-16">지원일자</th>
		                                <th scope="col"></th>
		                            </tr>
		                        </thead>
		                        <tbody id="applicantInfo">
		                        <c:set value="${pagingVO.dataList }" var="applyList"></c:set>
								<c:choose>
								<c:when test="${empty applyList }">
									<tr>
										<td colspan="8"><div style="text-align:center;">데이터가 존재하지 않습니다.</div></td>
									</tr>
								</c:when>
								<c:otherwise>
							 	<c:forEach items="${applyList }" var="applicant">
							 	<tr>
								 	<!-- 번호 시작 -->
									<td>
							        	<input type="hidden" value="${applicant.applyNo }">
							            <p class="fs-16 mb-0">${applicant.rnum }</p>
									</td>
								 	<!-- 번호 끝 -->
								 	<!-- 이름 시작 -->
									<td>
								    	<p class="fs-16 mb-0"><a href="#">${applicant.seekerVO.seekerName }</a></p>
									</td>
								 	<!-- 이름 끝 -->
								 	<!-- 최종학력 시작 -->
									<td>
									    <font class="fs-16 mb-0">${applicant.educationVO.eduName } · ${applicant.educationVO.eduMajor }</font>
									</td>
								 	<!-- 최종학력 끝 -->
								    <!-- 이력서 : 클릭시 새창으로 이력서 띄우기 시작 -->
									<td>
										<button class="btn btn-outline-primary btn-wave" onclick="window.open('/applicant/resume?resumeNo=${applicant.resumeNo }')">
									    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-text-fill" viewBox="0 0 16 16">
										<path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0M9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1M4.5 9a.5.5 0 0 1 0-1h7a.5.5 0 0 1 0 1zM4 10.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5m.5 2.5a.5.5 0 0 1 0-1h4a.5.5 0 0 1 0 1z"/>
										</svg>보기
									    </button>
									</td>
								    <!-- 이력서 : 클릭시 새창으로 이력서 띄우기 끝 -->
								    <!-- 자기소개 답변보기 : 클릭시 모달 -->
									<td>
										<a href="#" class="open-modal selfInfoARink" data-apply-no="${applicant.applyNo }">
										<button class="btn btn-outline-primary btn-wave"><i class="bi bi-card-text"></i> 답변보기</button>
										</a>
									</td>
								    <!-- 자기소개 답변보기 : 클릭시 모달 끝 -->
								    <!-- 코딩테스트 답변보기 : 클릭시 모달 -->
								    <td>
								    	<a href="#" class="open-modal codingTestARink" data-apply-no="${applicant.applyNo }">
										<button class="btn btn-outline-primary btn-wave"><i class="bi bi-code-slash"></i> 답안보기</button>
										</a>
								    </td>
								    <!-- 지원일자 시작 -->
								    <td>
								    	<font class="fs-16">${applicant.applyDate }</font>
								    </td>
								    <!-- 지원일자 끝 -->
							    </tr>
							 	</c:forEach>
								</c:otherwise>
								</c:choose>
		                        </tbody>
		                    </table>
		                </div>
		            </div>
		            <div class="card-footer border-top-0">
		                <div class="d-flex align-items-center flex-wrap overflow-auto applicantListPage">
		                    <div class="mb-2 mb-sm-0">
		                        <%-- <b>${pagingVO.startRow }</b> to <b>${pagingVO.endRow }</b>--%>
		                        <%-- 	총 <b>${pagingVO.totalRecord }</b>건<i class="bi bi-arrow-right ms-2 fw-semibold"></i> --%>
		                    </div>
		                    <div class="ms-auto" id="pagingArea">
		                        ${pagingVO.pagingHTML }
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
     </div> 
    </div>
</div>
<!-- End::app-content -->

<!-- 모달  : 자기소개 답변 -->
<div class="modal fade ModalForselfIntro" id="selfIntroModal" tabindex="-1" role="dialog" aria-labelledby="selfIntroModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
			<!-- 데이터가 동적으로 바인딩될 공간 -->
            </div>
        </div>
    </div>
</div>
<!-- 모달 : 자기소개 답변 끝 -->

<!-- 모달 : 코딩테스트 답변 -->
<div class="modal fade" id="codingTestAnswerModal" tabindex="-1" aria-labelledby="codingTestAnswerModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" style="padding:10px;">
	    <div class="modal-content">
	        <div class="modal-header">
	            <h6 class="modal-title" id="exampleModalLgLabel">코딩테스트 제출답안</h6>
	        </div>
			<!-- 코딩테스트 답변 내용 바인딩 공간 -->
	        <div class="modal-body"></div>
	    </div>
	</div>
</div>
<!-- 모달 : 코딩테스트 답변 끝 -->

<script>
$(function(){
	
	ws = new WebSocket("ws://192.168.35.28/echo");
	// 합격버튼 클릭 이벤트
	$(".applicantTable").on("click", ".passBtn", function(event){
		event.preventDefault();
		
		Swal.fire({
	        title: '확인',
	        text: "해당 지원자를 정말로 통과시키겠습니까?",
	        icon: 'question',
	        showCancelButton: true, // 취소 버튼 표시
	        confirmButtonText: '합격',
	        cancelButtonText: '취소'
		}).then((result => {
			if(result.isConfirmed){
				/// 합격 진행시킬 지원번호[applyNo] 가져오기
				let applyNo = $(this).parent().siblings().find("input[type='hidden']").val();
				// console.log("applyNo : "+applyNo);
				let data = {
					applyNo: applyNo
				};
				$.ajax({
					url: "/applicant/pass",
					type: "POST",
					data: JSON.stringify(data),
					beforeSend : function(xhr){
						xhr.setRequestHeader(header, token);
					},
					contentType: "application/json; charset=utf-8",
					success: function(res){
		               Swal.fire({
		                   title: "지원자 합격",
		                    text: "합격 처리 되었습니다.",
		                    icon: "success",
		                    confirmButtonText: "확인"
		                })
		                // 합격시킨 지원자의 정보 제거하기 - applyNo기준으로 해당 tr요소 찾기 
		                $("input[type='hidden'][value='" + applyNo + "']").closest("tr").remove();
						// alarm 보내기
		        		let alarmData = {
		        				"code" : "success",
		        				"content" : "알람이 도착했습니다.",
		        				"applyNo" : applyNo
		        		}
		        		ws.send(JSON.stringify(alarmData));
		        		console.log(alarmData);
					}
				});
			} else {
	            Swal.fire({
	                title: '취소됨',
	                text: '합격 처리가 취소되었습니다.',
	                icon: 'info',
	                confirmButtonText: '확인'
	            });
			}
		}));

	});
	
	// 불합격버튼 클릭 이벤트
	$(".applicantTable").on("click", ".nonPassBtn", function(event){
		event.preventDefault();
		
		Swal.fire({
	        title: '확인',
	        text: "해당 지원자를 정말로 불합격시키겠습니까?",
	        icon: 'question',
	        showCancelButton: true, // 취소 버튼 표시
	        confirmButtonText: '삭제',
	        cancelButtonText: '취소'
		}).then((result) => {
			if(result.isConfirmed){
				// 클릭한 합격 버튼이 있는 줄의 applyNo가져오기
				let applyNo = $(this).parent().siblings().find("input[type='hidden']").val();
				
				let data = {
					applyNo: applyNo
				};
				
				$.ajax({
					url: "/applicant/nonPass",
					type: "POST",
					data: JSON.stringify(data),
					beforeSend : function(xhr){
						xhr.setRequestHeader(header, token);
					},
					contentType: "application/json; charset=utf-8",
					success: function(res){
		               Swal.fire({
		                   title: "지원자 불합격",
		                    text: "불합격 처리 되었습니다.",
		                    icon: "warning",
		                    confirmButtonText: "확인"
		                })
						$("input[type='hidden'][value='" + applyNo + "']").closest("tr").remove();
						
						// alarm 주기
		        		let alarmData = {
		        				"code" : "fail",
		        				"content" : "알람이 도착했습니다.",
		        				"applyNo" : applyNo
		        		}
		        		ws.send(JSON.stringify(alarmData));
						console.log(alarmData);
					}
				});
			} else {
	            Swal.fire({
	                title: '취소됨',
	                text: '불합격 처리가 취소되었습니다.',
	                icon: 'info',
	                confirmButtonText: '확인'
	            });
			}
			
		});
		
	});
	
	// 지원자결과상태 탭 선택에 따른 지원자 목록
	$("#myTab a").on("click", function(event){
		event.preventDefault();
		$(this).tab("show");
		
		let tabStatus =	$(this).attr("href");	
        //console.log('선택된 탭 ID:', tabStatus);
		let recNtcId = $("#recNtcSelect").val();
		
		let data = {
			applicantStatusCode: tabStatus,
			recNtcId: recNtcId
		};
        
        $.ajax({
        	url : "/applicant/oneApplyList",
        	type: "POST",
        	data : JSON.stringify(data),
			beforeSend : function(xhr){	// 데이터 전송 전, 헤더에 csrf 값 설정
				xhr.setRequestHeader(header, token);
			},
            contentType: "application/json;charset=utf-8",
        	success : function(res){
        		//alert("탭 이동 성공");
        		console.log("res >> ", res);
        		updateList(res);
        		//pageInfo(res);
        	},
        	error: function(xhr, status, error) {
                console.error("AJAX Error: ", status, error);
            }
        });
		
	});
	
	// 공고 선택에 따른 지원자 목록
	let recNtcSelect = $("#recNtcSelect");
	
	recNtcSelect.on("change", function(){
		let recNtcId = $(this).val();
		let data = {
				applicantStatusCode: getCurrentTabHref(), // 현재 화면 상의 탭 값 가져가기
				recNtcId: recNtcId
		};
		$.ajax({
			url: "/applicant/oneApplyList",
			type: "POST",
			data: JSON.stringify(data),
			beforeSend : function(xhr){
				xhr.setRequestHeader(header, token);
			},
            contentType: "application/json;charset=utf-8",
			success: function(res){
				//console.log("res >> ", res);
				updateList(res);
			},
            error: function(xhr, status, error) {
                console.error("AJAX Error: ", status, error); 
            }
		});
	});
	
	// 자기소개답변 버튼 클릭 시 모달 띄우기
	$(".applicantTable").on("click", ".selfInfoARink", function(e){
		e.preventDefault();
		
		let applyNo = $(this).data("apply-no");
		let url = "/applicant/selfInfoAnswer?applyNo="+applyNo;
		
		$.ajax({
			url: url,
			method : "GET", 
			success: function(data){
				//console.log("data >> ", data);
				let modalBody = $("#selfIntroModal .modal-body");
				modalBody.empty();
				modalBody.append("<h4>자기소개 문항 답변</h4><hr><br>");
				
				if(data.answerSelfIntroList && data.answerSelfIntroList.length > 0){
					$.each(data.answerSelfIntroList, function(index, answer){
						if(answer.recruitmentSelfIntroVO && answer.recruitmentSelfIntroVO.selfIntroTitle){
							modalBody.append("<div class='answerTitle'><h6><font style='font-weight:bold;'>" + answer.recruitmentSelfIntroVO.selfIntroTitle + "</font></h6></div>");
						}else{
							modalBody.append("<div class='answerTitle'>제목없음</div>");						
						}
						if(answer.ansIntroContent){
							modalBody.append("<div class='answerContent'><h6>" + answer.ansIntroContent + "</h6></div><br>");
						}else{
							modalBody.append("<div class='answerContent'>내용 없음</div>");
						}				
				});
            } else {
                console.log("No answers found or answerSelfIntroList is empty");
                modalBody.append("<div class='answerContent'><h6>해당 지원자는 아직 답변 제출 전입니다.</h6></div>");
            }
				$("#selfIntroModal").modal("show"); 
			},
			error: function(){
				alert("자기소개 답변 보기 실패 !")
			}
		});
		
	});
	
	// 코딩테스트 답안보기 클릭 시 모달 띄우기
	$(".applicantTable").on("click", ".codingTestARink", function(e){
		e.preventDefault();
		
		let applyNo = $(this).data("apply-no");
		let url= "/applicant/codingTestAnswer?applyNo="+applyNo;
		
		$.ajax({
			url: url,
			method : "GET",
			success: function(data){
				console.log("data >> ", data);
				let modalBody = $("#codingTestAnswerModal .modal-body");
				modalBody.empty();
				if(data.answerCodingTestList && data.answerCodingTestList.length > 0){
					$.each(data.answerCodingTestList, function(index, answer){
						if(answer.codingTestVO && answer.codingTestVO.coteTitle){
							modalBody.append("<div class='answerTitle'><h6><font style='font-weight:bold;'>" + "문제 " + (index+1) + "번 : "+ answer.codingTestVO.coteTitle + "</font></h6><h6>"+answer.codingTestVO.questionContent+"</h6></div>");
						}else{
							modalBody.append("<div class='answerTitle'>제목없음</div>");						
						}
						if(answer.ansCoteContent){
							
						    let formattedContent = answer.ansCoteContent.replace(/\n/g, "<br>").replace(/ /g, "&nbsp;");
							modalBody.append("<div class='answerContent' style='border: 1px solid gray; padding:5px;'><h6>" + formattedContent + "</h6></div><br>");
						}else{
							modalBody.append("<div class='answerContent'>내용 없음</div>");
						}				
				});
            } else {
                console.log("No answers found or answerCodingTestList is empty");
                modalBody.append("<div class='answerContent'><h6>해당 지원자는 아직 답변 제출 전입니다.</h6></div>");
            }
				$("#codingTestAnswerModal").modal("show"); 
			},
			error: function(){
				alert("자기소개 답변 보기 실패 !")
			}
		});
		
	});
	
    // 지원자 목록을 다시 불러오는 함수
    function reloadApplicantList() {
        let recNtcId = $("#recNtcSelect").val();
        let data = {
            applicantStatusCode: getCurrentTabHref(),
            recNtcId: recNtcId
        };
        
        $.ajax({
            url: "/applicant/oneApplyList",
            type: "POST",
            data: JSON.stringify(data),
            beforeSend: function(xhr){
                xhr.setRequestHeader(header, token);
            },
            contentType: "application/json;charset=utf-8",
            success: function(res){
                console.log("res >> ", res);
                updateList(res);
            },
            error: function(xhr, status, error) {
                console.error("AJAX Error: ", status, error);
            }
        });
    }

});


// 현재 선택된 Tab의 Href값 가져오기
function getCurrentTabHref() {
	let activeTabHref = $(".nav-link.active").attr("href");
	//console.log("현재 선택된 탭의 href 값 >> ", activeTabHref);
	return activeTabHref;
}

function updateList(data){
	
	let tableBody = $("#applicantInfo");
	tableBody.html(""); // 기존 내용 삭제
    
    let pagingVO = data.pagingVO; // Controller에서 넘겨준 데이터
	let applyList = pagingVO.dataList; 
    
	if(applyList.length === 0){
		tableBody.append("<tr><td colspan='8'><div style='text-align:center;'>데이터가 존재하지 않습니다.</div></td></tr>")
	}else{
		$.each(applyList, function(index, applicant){
			let row = `
				<tr>
                <td>
                    <div class="d-flex">
                        <div class="ms-2">
                       		<input type="hidden" value="\${applicant.applyNo }">
                            <p class="fs-16 mb-0">\${applicant.rnum }</p>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="d-flex">
                        <div class="ms-2">
                            <p class="fs-16 mb-0"><a href="#">\${applicant.seekerVO.seekerName }</a></p>
                        </div>
                    </div>
                </td>
                <td>
                    <div class="d-flex align-items-center">
                    	<font class="fs-16 mb-0">\${applicant.educationVO.eduName } · \${applicant.educationVO.eduMajor }</font>
                    </div>
                </td>
                <!-- 이력서 : 클릭시 새창 -->
                <td>
                	<button class="btn btn-outline-primary btn-wave" onclick="window.open('/applicant/resume?resumeNo=\${applicant.resumeNo }')">
                	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-file-earmark-text-fill" viewBox="0 0 16 16">
						<path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0M9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1M4.5 9a.5.5 0 0 1 0-1h7a.5.5 0 0 1 0 1zM4 10.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5m.5 2.5a.5.5 0 0 1 0-1h4a.5.5 0 0 1 0 1z"/>
					</svg> 보기
                	</button>
                </td>
                <!-- 자기소개 답변보기 : 클릭시 모달 -->
                <td>
                	<a href="#" class="open-modal selfInfoARink" data-apply-no="\${applicant.applyNo }">
                	<button class="btn btn-outline-primary btn-wave"><i class="bi bi-card-text"></i> 답변보기</button>
                	</a>
                </td>
                <!-- 코딩테스트 답변보기 : 클릭시 모달 -->
                <td>
                	<a href="#" class="open-modal codingTestARink" data-apply-no="\${applicant.applyNo }">
                	<button class="btn btn-outline-primary btn-wave"><i class="bi bi-code-slash"></i> 답안보기</button>
                	</a>
                </td>
                <td>
                	<font class="fs-16 mb-0">\${applicant.applyDate }</font>
                </td>
                <td class="action-buttons">
                	<input type="button" class="btn btn-outline-primary passBtn" value="합격">
                	<input type="button" class="btn btn-outline-primary nonPassBtn" value="불합격">
                </td>
           		</tr>`;
	        	
				tableBody.append(row);
		});
		
		// 전체 지원자 탭이 활성화된 경우 합격/불합격 버튼 숨기기
		if(getCurrentTabHref() === "" || getCurrentTabHref() === "APP0104" || getCurrentTabHref() === "APP0105"){
			$(".action-buttons").hide();
		}else{
			$(".action-buttons").show();
		}
	}
}

</script>
</html>