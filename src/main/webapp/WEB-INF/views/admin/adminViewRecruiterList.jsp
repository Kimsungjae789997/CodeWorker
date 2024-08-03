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
                    	구인 회원 관리
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
                                <th style="background-color: rgba(137, 32, 173, 0.1);">소속</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">아이디</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">이름</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">이메일</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">가입일</th>
<!--                                 <th style="background-color: rgba(137, 32, 173, 0.1);">개인정보공개</th> -->
                                <th style="background-color: rgba(137, 32, 173, 0.1);">탈퇴처리</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${recruiterList}" var="rcrt" varStatus="status">
	                            <tr class="${rcrt.rcrtDelYN eq 'Y' ? 'deleted' : ''}">
	                                <td>${pagingVO.startRow + status.index}</td>
	                                <td>${rcrt.crpName }</td>
	                                <td>
		                                <a href="#" class="viewLicense" data-id="${rcrt.memId}" style="margin-left: 5px;">
	                                        ${rcrt.memId}
	                                    </a>
	                                </td>
	                                <td>${rcrt.memName }</td>
	                                <td>${rcrt.rcrtEmail }</td>
	                                <td>${rcrt.rcrtJoinDate }</td>
<!-- 	                                <td> -->
<%-- 										<c:choose> --%>
<%-- 						                    <c:when test="${rcrt.memId eq 'a100' }"> --%>
<!-- 						                        <i class="ri-close-circle-line rejectIcon"></i> 비동의 아이콘 -->
<%-- 						                    </c:when> --%>
<%-- 						                    <c:otherwise> --%>
<!-- 						                        <i class="ri-checkbox-circle-line agreeIcon"></i> 동의 아이콘 -->
<%-- 						                    </c:otherwise> --%>
<%-- 						                </c:choose> --%>
<!-- 	                                </td> -->
	                                <td>
										<c:choose>
											<c:when test="${rcrt.rcrtDelYN eq 'Y' }">
												<p class="text-danger mt-3">탈퇴처리 완료</p>
											</c:when>
											<c:otherwise>
												<button class="btn btn-light btn-wave rejectBtn" data-id="${rcrt.memId }">탈퇴</button>
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
			        <label for="memName" class="col-sm-3 col-form-label">회원명</label>
			        <div class="col-sm-9">
			            <input type="text" id="memName" name="memName" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="rcrtTel" class="col-sm-3 col-form-label">전화번호</label>
			        <div class="col-sm-9">
			            <input type="text" id="rcrtTel" name="rcrtTel" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="rcrtEmail" class="col-sm-3 col-form-label">이메일</label>
			        <div class="col-sm-9">
			            <input type="text" id="rcrtEmail" name="rcrtEmail" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpName" class="col-sm-3 col-form-label">소속기업</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpName" name="crpName" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="rcrtPosition" class="col-sm-3 col-form-label">포지션</label>
			        <div class="col-sm-9">
			            <input type="text" id="rcrtPosition" name="rcrtPosition" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="rcrtJoinDate" class="col-sm-3 col-form-label">가입일</label>
			        <div class="col-sm-9">
			            <input type="text" id="rcrtJoinDate" name="rcrtJoinDate" class="form-control" readonly>
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
			        <label for="memName2" class="col-sm-3 col-form-label">회원명</label>
			        <div class="col-sm-9">
			            <input type="text" id="memName2" name="memName" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="rcrtTel2" class="col-sm-3 col-form-label">전화번호</label>
			        <div class="col-sm-9">
			            <input type="text" id="rcrtTel2" name="rcrtTel" class="form-control custom-tel" placeholder="변경 내용을 입력하세요">
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="rcrtEmail2" class="col-sm-3 col-form-label">이메일</label>
			        <div class="col-sm-9">
			            <input type="text" id="rcrtEmail2" name="rcrtEmail" class="form-control custom-email" placeholder="변경 내용을 입력하세요">
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpName2" class="col-sm-3 col-form-label">소속기업</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpName2" name="crpName" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="rcrtPosition2" class="col-sm-3 col-form-label">포지션</label>
			        <div class="col-sm-9">
			            <input type="text" id="rcrtPosition2" name="rcrtPosition" class="form-control custom-position" placeholder="변경 내용을 입력하세요">
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="rcrtJoinDate2" class="col-sm-3 col-form-label">가입일</label>
			        <div class="col-sm-9">
			            <input type="text" id="rcrtJoinDate2" name="rcrtJoinDate" class="form-control" readonly>
			        </div>
			    </div>
			</div>
			<!-- 요청에 의해 정보를 수정합니다 -->
            <div class="d-flex align-items-center mt-3 mb-3 justify-content-center w-100">
                <label class="fw-bolder me-2" for="consentCheck" style="font-size:1.2em;" >요청에 의해 정보를 수정함을 확인합니다</label>
                <input type="checkbox" class="form-check-input custom-checkbox" id="consentCheck">
            </div>
            <div class="modal-footer">
				 <button class="btn btn-primary-light btn-wave" id="saveChanges">저장</button>
            </div>
        </div>
    </div>
</div>


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
        var recruiterId = $(this).data('id');
        
        $.ajax({
            url: '/admin/recruiterDetail',
            type: 'GET',
            data: {memId: recruiterId},
            dataType: 'json',
            beforeSend: function(xhr){
                xhr.setRequestHeader(header, token); 
            },
            success: function(data) {
                // 모달에 데이터 채우기
                $('#memId').val(data.memId);
                $('#memName').val(data.memName);
                
                if (data.memId === 'a100') {
                    $('#rcrtTel').val('개인정보공개에 동의하지 않은 회원입니다');
                    $('#rcrtEmail').val('개인정보공개에 동의하지 않은 회원입니다');
                    $('#crpName').val('개인정보공개에 동의하지 않은 회원입니다');
                    $('#rcrtPosition').val('개인정보공개에 동의하지 않은 회원입니다');
                    $('#rcrtJoinDate').val('개인정보공개에 동의하지 않은 회원입니다');
                    $('#editButton').prop('disabled', true);
                } else {
                    $('#rcrtTel').val(data.rcrtTel);
                    $('#rcrtEmail').val(data.rcrtEmail);
                    $('#crpName').val(data.crpName);
                    $('#rcrtPosition').val(data.rcrtPosition);
                    $('#rcrtJoinDate').val(data.rcrtJoinDate);
                    $('#editButton').prop('disabled', false);
                }
                
                // 수정 모달 데이터 채우기
                $('#memId2').val(data.memId);
                $('#memName2').val(data.memName);
                $('#crpName2').val(data.crpName);
                $('#rcrtTel2').val(data.rcrtTel);
                $('#rcrtEmail2').val(data.rcrtEmail);
                $('#rcrtPosition2').val(data.rcrtPosition);
                $('#rcrtJoinDate2').val(data.rcrtJoinDate);
                
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
    
 	// 전화번호 입력 필드에 대한 검증 로직 추가
    $('#rcrtTel2').on('input', function() {
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
    
    
    // 이메일 입력 필드에 대한 검증 로직 추가
    $('#rcrtEmail2').on('input', function(){
    	var emailPattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
    	var emailInput = $(this).val();
    	
    	if(!emailPattern.test(emailInput)){
    		$(this).css('borderd-color', 'red');
    		if($('#emailError').length === 0){
    			$(this).after('<div id="emailError" style="color: red; font-size: 0.9em;">형식에 맞게 입력해주세요 (ex) abcd@google.com)</div>');
    		}
    	} else{
    		$(this).css('border-color', '');
            $('#emailError').remove();
    	}
    });
    
    
    // 수정 모달창에서 저장하기
    $('#saveChanges').on('click', function() {
    	
    	// 전화번호 유효성 검사
    	var telPattern = /^010-\d{4}-\d{4}$/;
        var telInput = $('#rcrtTel2').val();
        
        if (!telPattern.test(telInput)) {
            alert('전화번호 형식이 올바르지 않습니다.');
            return;
        }
        
        // 이메일 유효성 검사
        var emailPattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
        var emailInput = $('#rcrtEmail2').val();
        
        if(!emailPattern.test(emailInput)){
        	alert("이메일 형식이 올바르지 않습니다");
        	return;
        }
    	
        var updatedData = {
            memId: $('#memId2').val(),
            memName: $('#memName2').val(),
            crpName: $('#crpName2').val(),
            rcrtTel: $('#rcrtTel2').val(),
            rcrtEmail: $('#rcrtEmail2').val(),
            rcrtPosition: $('#rcrtPosition2').val(),
            rcrtJoinDate: $('#rcrtJoinDate2').val()
        };

        $.ajax({
            url: '/admin/recruiterUpdate',
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
        $('#rcrtTel2, #rcrtEmail2, #rcrtPosition2').addClass('editable');
    });
 	
 	// 페이지 로드 시 rcrt_del_yn이 Y인 회원들을 탈퇴처리 완료로 표시
    $('tbody tr').each(function(){
    	var rcrtDelYN = $(this).find('.rcrtDelYN').text().trim();
    	
    	if(rcrtDelYN === 'Y'){
    		$(this).find('.rejectBtn').closest('td').html('<p class="text-danger mt-3">탍퇴처리 완료</p>');
    	}
    })
 	
    // 탈퇴 버튼 클릭 이벤트
    $('.rejectBtn').on('click', function(){
    	var $this = $(this);
    	var memId = $this.data('id');
    	
    	if(confirm('탈퇴처리 하시겠습니까?')){
    		$.ajax({
    			url: '/admin/recruiterRemove',
    			type: 'POST',
    			contentType: 'application/json',
    			data: JSON.stringify({ memId : memId }),
    			beforeSend: function(xhr){
    				xhr.setRequestHeader(header, token);
    			},
    			success: function(response){
    				if(response === "success"){
    					alert('탈퇴처리 되었습니다');
    					$this.closest('td').html('<p class="text-danger mt-3">탈퇴처리 완료</p>');
    					location.reload();
    				} else {
    					alert('탈퇴처리에 실패했습니다');
    				}
    			},
    			error: function(error){
    				console.error('Error:', error);
    			}
    		});
    	}
    });
 	
 	// 셀렉트박스 - 탈퇴처리한 회원만 보기
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