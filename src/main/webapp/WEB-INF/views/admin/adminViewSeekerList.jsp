<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
    .custom-checkbox {
        width: 20px;
        height: 20px;
        border: 1px solid #000; /* 테두리를 진하게 */
    }
    
    .rejectIcon {
        font-size: 24px; /* 아이콘 크기 조절 */
        color: rgba(226, 75, 105); /* 비동의 아이콘 색상 */
    }
    .agreeIcon {
        font-size: 24px; /* 아이콘 크기 조절 */
        color: rgba(100, 149, 237); /* 동의 아이콘 색상 */
    }
    
   	.editable{
		box-shadow:  0 0 10px rgba(100, 149, 237);
	}
	
	#datatable-basic_length {
		display: none; 
    } 

	#datatable-basic_info {
    	display: none;
    }
</style>


<div class="row">
    <div class="col-xl-12">
        <div class="card custom-card mt-3">
            <div class="card-header">
                <div class="card-title">
                    	구직 회원 관리
                </div>
            </div>
            <div class="card-body">
<!--             	<div> -->
<!--                     <select class="form-select-sm" aria-label="Default select example" id="filterSelect"> -->
<!-- 					    <option value="all">전체 보기</option> -->
<!-- 					    <option value="deleted">탈퇴 회원 보기</option> -->
<!-- 					</select> -->
<!--                 </div> -->
                <div class="table-responsive">
                    <table id="datatable-basic" class="table table-bordered text-nowrap w-100">
                        <thead>
                            <tr>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">No</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">아이디</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">이름</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">이메일</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">가입일</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">개인정보공개</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">탈퇴처리</th>
                            </tr>
                        </thead>
                        <tbody>
							<c:forEach items="${seekerList}" var="seeker" varStatus="status">
						        <tr class="${seeker.seekerDelYN eq 'Y' ? 'deleted' : ''}">
						            <td>${pagingVO.startRow + status.index}</td>
						            <td>
						                <a href="#" class="viewLicense" data-id="${seeker.memId}" style="margin-left: 5px;">
						                    ${seeker.memId}
						                </a>
						            </td>
						            <td>${seeker.seekerName }</td>
						            <td>${seeker.seekerEmail }</td>
						            <td>${seeker.seekerJoinDate }</td>
						            <td>
						                <c:choose>
						                    <c:when test="${seeker.seekerModifyYn eq 'N'}">
						                        <i class="ri-close-circle-line rejectIcon"></i> <!-- 비동의 아이콘 -->
						                    </c:when>
						                    <c:otherwise>
						                        <i class="ri-checkbox-circle-line agreeIcon"></i> <!-- 동의 아이콘 -->
						                    </c:otherwise>
						                </c:choose>
						            </td>
						            <td>
										<c:choose>
											<c:when test="${seeker.seekerDelYN eq 'Y' }">
												<p class="text-danger mt-3">탈퇴처리 완료</p>
											</c:when>
											<c:otherwise>
												<button class="btn btn-light btn-wave rejectBtn" data-id="${seeker.memId }">탈퇴</button>
											</c:otherwise>
										</c:choose>
						            </td>
						        </tr>
						    </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="card-footer clearfix" id="pagingArea">
                  ${pagingVO.pagingHTML }
            </div>
             <form action="" method="get" id="pagingFrm">
            	<input type="hidden" name="page" id="page">
            </form>
            
        </div>
    </div>
</div>

<!-- 정보 보기 모달  -->
<div class="modal fade" id="exampleModalToggle" tabindex="-1" aria-labelledby="exampleModalToggleLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header" style="background-color: rgba(137, 32, 173, 0.1);">
                <h6 class="modal-title" id="exampleModalToggleLabel">회원정보</h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
			    <div class="row mb-3">
			        <label for="memId" class="col-sm-3 col-form-label">아이디</label>
			        <div class="col-sm-9">
			            <input type="text" id="memId" name="memId" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="recruiterName" class="col-sm-3 col-form-label">회원명</label>
			        <div class="col-sm-9">
			            <input type="text" id="seekerName" name="seekerName" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="seekerBirth" class="col-sm-3 col-form-label">생년월일</label>
			        <div class="col-sm-9">
			            <input type="text" id="seekerBirth" name="seekerBirth" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="seekerAdd1" class="col-sm-3 col-form-label">기본주소</label>
			        <div class="col-sm-9">
			            <input type="text" id="seekerAdd1" name="seekerAdd1" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="seekerAdd2" class="col-sm-3 col-form-label">상세주소</label>
			        <div class="col-sm-9">
			            <input type="text" id="seekerAdd2" name="seekerAdd2" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="seekerTel" class="col-sm-3 col-form-label">전화번호</label>
			        <div class="col-sm-9">
			            <input type="text" id="seekerTel" name="seekerTel" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="seekerEmail" class="col-sm-3 col-form-label">이메일</label>
			        <div class="col-sm-9">
			            <input type="text" id="seekerEmail" name="seekerEmail" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="seekerJoinDate" class="col-sm-3 col-form-label">가입일</label>
			        <div class="col-sm-9">
			            <input type="text" id="seekerJoinDate" name="seekerJoinDate" class="form-control" readonly>
			        </div>
			    </div>
<!-- 			    <div class="row mb-3"> -->
<!-- 			        <label for="seekerStatusCode" class="col-sm-3 col-form-label">인재풀</label> -->
<!-- 			        <div class="col-sm-9"> -->
<!-- 			            <input type="text" id="seekerStatusCode" name="seekerStatusCode" class="form-control" readonly> -->
<!-- 			        </div> -->
<!-- 			    </div> -->
			    <div class="row mb-3">
			        <label for="seekerExp" class="col-sm-3 col-form-label">경력</label>
			        <div class="col-sm-9">
			            <input type="text" id="seekerExp" name="seekerExp" class="form-control" readonly>
			        </div>
			    </div>
			</div>
            <div class="modal-footer">
				<button class="btn btn-primary-light btn-wave" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal" id="editButton">수정</button>
            </div>
        </div>
    </div>
</div>

<!-- 정보 수정 모달 -->
<div class="modal fade" id="exampleModalToggle2" aria-labelledby="exampleModalToggleLabel2" tabindex="-1" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header" style="background-color: rgba(137, 32, 173, 0.1);">
                <h6 class="modal-title" id="exampleModalToggleLabel2">회원 정보 수정</h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
			<div class="modal-body">
			    <div class="row mb-3">
			        <label for="memId2" class="col-sm-3 col-form-label">아이디</label>
			        <div class="col-sm-9">
			            <input type="text" id="memId2" name="memId" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="recruiterName2" class="col-sm-3 col-form-label">회원명</label>
			        <div class="col-sm-9">
			            <input type="text" id="seekerName2" name="seekerName" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="seekerBirth2" class="col-sm-3 col-form-label">생년월일</label>
			        <div class="col-sm-9">
			            <input type="text" id="seekerBirth2" name="seekerBirth" class="form-control" readonly>
			        </div>
			    </div>
			    
				<div class="row mb-3">
				    <label for="seekerAdd12" class="col-sm-3 col-form-label">기본주소</label>
				    <div class="col-sm-9 d-flex align-items-center">
				        <input type="text" id="seekerAdd12" name="seekerAdd1" class="form-control custom-address" placeholder="변경 내용을 입력하세요" readonly>
				        <i class="ri-map-pin-line" id="addressIcon" style="font-size: 24px; cursor: pointer; margin-left: 10px;"></i>
				    </div>
				</div>
				<div class="row mb-3">
				    <label for="seekerAdd22" class="col-sm-3 col-form-label">상세주소</label>
				    <div class="col-sm-9">
				        <input type="text" id="seekerAdd22" name="seekerAdd2" class="form-control custom-address" placeholder="변경 내용을 입력하세요">
				    </div>
				</div>
				
			    <div class="row mb-3">
			        <label for="seekerTel2" class="col-sm-3 col-form-label">전화번호</label>
			        <div class="col-sm-9">
			            <input type="text" id="seekerTel2" name="seekerTel" class="form-control custom-tel" placeholder="변경 내용을 입력하세요">
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="seekerEmail2" class="col-sm-3 col-form-label">이메일</label>
			        <div class="col-sm-9">
			            <input type="text" id="seekerEmail2" name="seekerEmail" class="form-control custom-email" placeholder="변경 내용을 입력하세요">
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="seekerJoinDate2" class="col-sm-3 col-form-label">가입일</label>
			        <div class="col-sm-9">
			            <input type="text" id="seekerJoinDate2" name="seekerJoinDate" class="form-control" readonly>
			        </div>
			    </div>
<!-- 			    <div class="row mb-3"> -->
<!-- 			        <label for="seekerStatusCode2" class="col-sm-3 col-form-label">인재풀</label> -->
<!-- 			        <div class="col-sm-9"> -->
<!-- 			            <input type="text" id="seekerStatusCode2" name="seekerStatusCode" class="form-control custom-status" placeholder="변경 내용을 입력하세요"> -->
<!-- 			        </div> -->
<!-- 			    </div> -->
			    <div class="row mb-3">
			        <label for="seekerExp2" class="col-sm-3 col-form-label">경력</label>
			        <div class="col-sm-9">
			            <input type="text" id="seekerExp2" name="seekerExp" class="form-control custom-exp" placeholder="변경 내용을 입력하세요">
			        </div>
			    </div>
			</div>
			<!-- 요청에 의해 정보를 수정합니다 -->
            <div class="d-flex align-items-center mt-3 mb-3 justify-content-center w-100">
                <label class="fw-bolder me-2" for="consentCheck" style="font-size:1.2em;">요청에 의해 정보를 수정함을 확인합니다</label>
                <input type="checkbox" class="form-check-input custom-checkbox" id="consentCheck">
            </div>
            <div class="modal-footer">
				 <button class="btn btn-primary-light btn-wave" id="saveChanges">저장</button>
            </div>
        </div>
    </div>
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(document).ready(function() {
	var pagingArea = $('#pagingArea');
	var page = $('#page');
	var pagingFrm = $('#pagingFrm');
	
	pagingArea.on('click', 'a', function(event){
		event.preventDefault();
		var pageNo = $(this).attr("data-page");
		console.log("pageNo", pageNo);
		page.val(pageNo);
		pagingFrm.submit(); 
	});
	
	
    $('.viewLicense').on('click', function(event) {
        event.preventDefault();
        var seekerId = $(this).data('id');
        
        $.ajax({
            url: '/admin/seekerDetail',
            type: 'GET',
            data: {memId: seekerId},
            dataType: 'json',
            beforeSend: function(xhr){
                xhr.setRequestHeader(header, token); 
            },
            success: function(data) {
                // 모달에 데이터 채우기
                $('#memId').val(data.memId);
                $('#seekerName').val(data.seekerName);
                
                if (data.seekerModifyYn == 'N') {
                    $('#seekerBirth').val('개인정보공개에 동의하지 않은 회원입니다');
                    $('#seekerAdd1').val('개인정보공개에 동의하지 않은 회원입니다');
                    $('#seekerAdd2').val('개인정보공개에 동의하지 않은 회원입니다');
                    $('#seekerTel').val('개인정보공개에 동의하지 않은 회원입니다');
                    $('#seekerEmail').val('개인정보공개에 동의하지 않은 회원입니다');
                    $('#seekerJoinDate').val('개인정보공개에 동의하지 않은 회원입니다');
                    $('#seekerStatusCode').val('개인정보공개에 동의하지 않은 회원입니다');
                    $('#seekerExp').val('개인정보공개에 동의하지 않은 회원입니다');
                    $('#editButton').prop('disabled', true);
                } else {
                    $('#seekerBirth').val(data.seekerBirth);
                    $('#seekerAdd1').val(data.seekerAdd1);
                    $('#seekerAdd2').val(data.seekerAdd2);
                    $('#seekerTel').val(data.seekerTel);
                    $('#seekerEmail').val(data.seekerEmail);
                    $('#seekerJoinDate').val(data.seekerJoinDate);
                    $('#seekerStatusCode').val(data.seekerStatusCode);
                    $('#seekerExp').val(data.seekerExp);
                    $('#editButton').prop('disabled', false);
                }
                
                // 수정 모달 데이터 채우기
                $('#memId2').val(data.memId);
                $('#seekerName2').val(data.seekerName);
                $('#seekerBirth2').val(data.seekerBirth);
                $('#seekerAdd12').val(data.seekerAdd1);
                $('#seekerAdd22').val(data.seekerAdd2);
                $('#seekerTel2').val(data.seekerTel);
                $('#seekerEmail2').val(data.seekerEmail);
                $('#seekerJoinDate2').val(data.seekerJoinDate);
                $('#seekerStatusCode2').val(data.seekerStatusCode);
                $('#seekerExp2').val(data.seekerExp);
                
				// 제안허용/비허용
                const seekerStatusMap = {
           		    "OPN0101": "제안허용",
           		    "OPN0102": "제안비허용"
          		};
                 
				const seekerStatus = seekerStatusMap[data.seekerStatusCode] || data.seekerStatusCode;
				if (data.memId === 'aaa1' || data.memId === 'bbb1') {
                    $('#seekerStatusCode').val('개인정보공개에 동의하지 않은 회원입니다');
                    $('#seekerStatusCode2').val('개인정보공개에 동의하지 않은 회원입니다');
                } else {
                    $('#seekerStatusCode').val(seekerStatus);
                    $('#seekerStatusCode2').val(seekerStatus);
                }
                
                // 모달 표시
                var targetModal = new bootstrap.Modal(document.getElementById('exampleModalToggle'));
                targetModal.show();
                
                modalSizeAuto();
            },
            error: function(error) {
                console.error('Error:', error);
            }
        });
    });
    
    
 	// 전화번호 입력 필드에 대한 검증
    $('#seekerTel2').on('input', function() {
        var telPattern = /^010-\d{4}-\d{4}$/;
        var telInput = $(this).val();
        
        if (!telPattern.test(telInput)) {
            $(this).css('border-color', 'red');
            if ($('#telError').length === 0) {
                $(this).after('<div id="telError" style="color: red; font-size: 0.9em;">형식에 맞게 입력해주세요 (ex) 010-0000-0000)</div>');
            }
        } else {
            $(this).css('border-color', '');
            $('#telError').remove();
        }
    });
    
    // 이메일 입력 필드에 대한 검증
    $('#seekerEmail2').on('input', function(){
    	var emailPattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    	var emailInput = $(this).val();
    	
    	if(!emailPattern.test(emailInput)){
    		$(this).css('border-color', 'red');
    		if($('#emailError').length === 0){
    			$(this).after('<div id="emailError" style="color: red; font-size: 0.9em;">형식에 맞게 입력해주세요 (ex) abcd@google.com)</div>');
    		}
    	} else{
    		$(this).css('border-color', '');
            $('#emailError').remove();
    	}
    });
    
 	// 경력 입력 필드에 대한 검증
    $('#seekerExp2').on('input', function() {
        var originalExp = $('#seekerExp').val();
        var updatedExp = $(this).val();
        
        if (originalExp !== '신입' && updatedExp === '신입') {
            $(this).css('border-color', 'red');
            if ($('#expError').length === 0) {
                $(this).after('<div id="expError" style="color: red; font-size: 0.9em;">경력에서 신입으로 수정할 수 없습니다.</div>');
            }
        } else {
            $(this).css('border-color', '');
            $('#expError').remove();
        }
    });
    
    
    // 수정 모달창에서 저장하기
    $('#saveChanges').on('click', function() {
    	
    	// 전화번호 유효성 검사
    	var telPattern = /^010-\d{4}-\d{4}$/;
        var telInput = $('#seekerTel2').val();
        
        if (!telPattern.test(telInput)) {
            alert('전화번호 형식이 올바르지 않습니다.');
            return;
        }
        
        // 이메일 유효성 검사
        var emailPattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
        var emailInput = $('#seekerEmail2').val();
        
        if(!emailPattern.test(emailInput)){
        	alert("이메일 형식이 올바르지 않습니다");
        	return;
        }
    	
        // 경력이 신입으로 수정 못하게
        var originalExp = $('#seekerExp').val();
        var updateExp = $('#seekerExp2').val();
        
        if(originalExp != '신입' && updateExp === '신입'){
        	alert("경력회원을 신입회원으로 수정할 수 없습니다");
        	return;
        }
        
        var updatedData = {
            memId: $('#memId2').val(),
            seekerName: $('#seekerName2').val(),
            seekerEmail: $('#seekerEmail2').val(),
            seekerBirth: $('#seekerBirth2').val(),
            seekerJoinDate: $('#seekerJoinDate2').val(),
            seekerAdd1: $('#seekerAdd12').val(),
            seekerAdd2: $('#seekerAdd22').val(),
            seekerTel: $('#seekerTel2').val(),
            seekerStatusCode: $('#seekerStatusCode2').val(),
            seekerExp: $('#seekerExp2').val()
        };

        $.ajax({
            url: '/admin/seekerUpdate',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify(updatedData),
            beforeSend: function(xhr){
                xhr.setRequestHeader(header, token); 
            },
            success: function(response) {
                if (response === "success") {
                    alert('수정이 완료되었습니다.');
                    var targetModal = bootstrap.Modal.getInstance(document.getElementById('exampleModalToggle2'));
                    targetModal.hide();
                    location.reload();
                } else {
                    alert('수정에 실패했습니다.');
                }
            },
            error: function(error) {
                console.error('Error:', error);
            }
        });
    });

    // 모달창 체크박스 클릭했을때만 수정 가능하도록
    $('#consentCheck').on('change', function() {
        $('#saveChanges').prop('disabled', !this.checked);
    });
     
    // 처음 수정 모달창 열었을때 저장버튼 비활성화
    $('#saveChanges').prop('disabled', true);
    
    
 	// 수정 버튼 클릭 이벤트
    $('#editButton').on('click', function() {
        // 수정 가능한 필드에 박스 쉐도우 추가
        $('#seekerAdd12, #seekerAdd22, #seekerTel2, #seekerEmail2, #seekerStatusCode2, #seekerExp2').addClass('editable');
    });
    
 	
    // 페이지 로드 시 seeker_del_yn이 Y인 회원들을 탈퇴처리 완료로 표시
    $('tbody tr').each(function() {
        var seekerDelYN = $(this).find('.seekerDelYN').text().trim();
        
        if (seekerDelYN === 'Y') {
            $(this).find('.rejectBtn').closest('td').html('<p class="text-danger mt-3">탈퇴처리 완료</p>');
        }
    });

    // 탈퇴 버튼 클릭 이벤트
    $('.rejectBtn').on('click', function() {
        var $this = $(this);
        var seekerId = $this.data('id');
        
        if (confirm('탈퇴처리 하시겠습니까?')) {
            $.ajax({
                url: '/admin/seekerRemove',
                type: 'POST',
                contentType: 'application/json', // JSON 형식으로 데이터 전송
                data: JSON.stringify({ memId: seekerId }), 
                beforeSend: function(xhr){
                    xhr.setRequestHeader(header, token); 
                },
                success: function(response) {
                    if (response === "success") {
                        alert('탈퇴처리 되었습니다.');
                        $this.closest('td').html('<p class="text-danger mt-3">탈퇴처리 완료</p>');
                        location.reload();
                    } else {
                        alert('탈퇴처리에 실패했습니다.');
                    }
                },
                error: function(error) {
                    console.error('Error:', error);
                }
            });
        }
    });
	
	// 지도 아이콘 클릭 이벤트 추가
    $('#addressIcon').on('click', function() {
        DaumPostcode();
    });

    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('#seekerAdd12').val(addr);
                $('#seekerAdd22').val(extraAddr);
                $('#seekerAdd22').focus();
            }
        }).open();
    }
    
    
 	// 셀렉트박스 - 삭제처리된 게시글만 보기
    $('#filterSelect').on('change', function() {
        var filter = $(this).val();
        var rows = $("#datatable-basic tbody tr");

        rows.each(function() {
            if (filter === "deleted") {
                if ($(this).hasClass("deleted")) {
                    $(this).show();
                } else {
                    $(this).hide();
                }
            } else {
                $(this).show();
            }
        });
    });
});
</script>