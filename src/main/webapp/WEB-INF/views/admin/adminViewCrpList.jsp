<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
    .icon-large {
        font-size: 20px;
    }
    
    .bx{
    	font-size: 20px;
    }
    
    .modal-body img {
        width: 100%;
        max-width: 500px; 
        height: auto; 
    }
    
    .custom-checkbox {
        width: 20px;
        height: 20px;
        border: 1px solid #000; /* 테두리를 진하게 */
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
                    	기업 관리
                </div>
            </div>
            <div class="card-body">
<!--             	<div> -->
<!--                     <select class="form-select-sm" aria-label="Default select example" id="filterSelect"> -->
<!-- 					    <option value="all">전체 보기</option> -->
<!-- 					    <option value="deleted">탈퇴 기업 보기</option> -->
<!-- 					</select> -->
<!--                 </div> -->
                <div class="table-responsive">
                    <table id="datatable-basic" class="table table-bordered text-nowrap w-100">
                        <thead>
                            <tr>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">No</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">아이디</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">기업명</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">업종</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">사업자등록증</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">탈퇴처리</th>
                            </tr>
                        </thead>
                        <tbody>
                        	<c:forEach items="${crpList}" var="crp" varStatus="status">
	                            <tr class="${crp.crpDelYN eq 'Y' ? 'deleted' : ''}">
	                                <td>${pagingVO.startRow + status.index}</td>
	                                <td>
										<a href="#" class="viewLicense" data-id="${crp.crpId}" style="margin-left: 5px;">
	                                        ${crp.crpId}
	                                    </a>
                                    </td>
	                                <td>${crp.crpName }</td>
	                                <td>
	                                	<c:choose>
									        <c:when test="${crp.crpIndustryCode eq 'INS0101'}">
									            	서비스업
									        </c:when>
									        <c:when test="${crp.crpIndustryCode eq 'INS0102'}">
									            	제조/화학
									        </c:when>
									        <c:when test="${crp.crpIndustryCode eq 'INS0103'}">
									            	IT/웹/통신
									        </c:when>
									        <c:when test="${crp.crpIndustryCode eq 'INS0104'}">
									            	은행/금융업
									        </c:when>
									        <c:when test="${crp.crpIndustryCode eq 'INS0105'}">
									            	미디어/디자인
									        </c:when>
									        <c:when test="${crp.crpIndustryCode eq 'INS0106'}">
									            	교육업
									        </c:when>
									        <c:when test="${crp.crpIndustryCode eq 'INS0107'}">
									            	의료/제약/복지
									        </c:when>
									        <c:when test="${crp.crpIndustryCode eq 'INS0108'}">
									            	판매/유통
									        </c:when>
									        <c:when test="${crp.crpIndustryCode eq 'INS0109'}">
									            	건설업
									        </c:when>
									        <c:when test="${crp.crpIndustryCode eq 'INS0110'}">
									            	기관/협회
									        </c:when>
								    	</c:choose>
	                                </td>
	                                <td>
	                                	<button class="btn btn-link" data-image="사업자등록증.png" data-bs-target="#exampleModalToggle3" data-bs-toggle="modal">
				                            <i class='bx bx-file'></i>
				                        </button>
	                                </td>
	                                <td>
										<c:choose>
											<c:when test="${crp.crpDelYN eq 'Y' }">
												<p class="text-danger mt-3">탈퇴처리 완료</p>
											</c:when>
											<c:otherwise>
												<button class="btn btn-light btn-wave rejectBtn" data-id="${crp.crpId }">탈퇴</button>
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
                <h6 class="modal-title" id="exampleModalToggleLabel">기업정보</h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
			    <div class="row mb-3">
			        <label for="crpId" class="col-sm-3 col-form-label">기업아이디</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpId" name="crpId" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpName" class="col-sm-3 col-form-label">기업명</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpName" name="crpName" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpRepresentative" class="col-sm-3 col-form-label">기업대표명</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpRepresentative" name="crpRepresentative" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpLicenseNo" class="col-sm-3 col-form-label">사업자등록번호</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpLicenseNo" name="crpLicenseNo" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpUrl" class="col-sm-3 col-form-label">홈페이지</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpUrl" name="crpUrl" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpAddress1" class="col-sm-3 col-form-label">기본주소</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpAddress1" name="crpAddress1" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpAddress2" class="col-sm-3 col-form-label">상세주소</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpAddress2" name="crpAddress2" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpZipCode" class="col-sm-3 col-form-label">우편번호</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpZipCode" name="crpZipCode" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpTel" class="col-sm-3 col-form-label">전화번호</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpTel" name="crpTel" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpEmail" class="col-sm-3 col-form-label">이메일</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpEmail" name="crpEmail" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpOpeningDay" class="col-sm-3 col-form-label">개업일</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpOpeningDay" name="crpOpeningDay" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpIndustryCode" class="col-sm-3 col-form-label">업종</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpIndustryCode" name="crpIndustryCode" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpEmpNumber" class="col-sm-3 col-form-label">재직자수</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpEmpNumber" name="crpEmpNumber" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpCapitalstock" class="col-sm-3 col-form-label">자본금</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpCapitalstock" name="crpCapitalstock" class="form-control" readonly>
			        </div>
			    </div>
			</div>
            <div class="modal-footer">
				<button class="btn btn-primary-light btn-wave" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">수정</button>
            </div>
        </div>
    </div>
</div>

<!-- 사업자등록증 띄우는 모달 -->
<div class="modal fade" id="exampleModalToggle3" tabindex="-1" aria-labelledby="exampleModalToggleLabel2" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header" style="background-color: rgba(137, 32, 173, 0.1);">
                <h6 class="modal-title" id="exampleModalToggleLabel2">사업자등록증</h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            	<img src="${pageContext.request.contextPath}/resources/assets/images/corporation-licence/사업자등록증.png" alt="">
            </div>
        </div>
    </div>
</div>

<!-- 정보 수정 모달 -->
<div class="modal fade" id="exampleModalToggle2" aria-labelledby="exampleModalToggleLabel2" tabindex="-1" aria-hidden="true" style="display: none;">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header" style="background-color: rgba(137, 32, 173, 0.1);">
                <h6 class="modal-title" id="exampleModalToggleLabel2">기업 정보 수정</h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
			<div class="modal-body">
			    <div class="row mb-3">
			        <label for="crpId2" class="col-sm-3 col-form-label">기업아이디</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpId2" name="crpId" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpName2" class="col-sm-3 col-form-label">기업명</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpName2" name="crpName" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpRepresentative2" class="col-sm-3 col-form-label">기업대표명</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpRepresentative2" name="crpRepresentative" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpLicenseNo2" class="col-sm-3 col-form-label">사업자등록번호</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpLicenseNo2" name="crpLicenseNo" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpUrl2" class="col-sm-3 col-form-label">홈페이지</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpUrl2" name="crpUrl" class="form-control" placeholder="변경 내용을 입력하세요">
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpAddress12" class="col-sm-3 col-form-label">기본주소</label>
			        <div class="col-sm-9 d-flex align-items-center">
			            <input type="text" id="crpAddress12" name="crpAddress1" class="form-control" placeholder="변경 내용을 입력하세요">
			            <i class="ri-map-pin-line" id="addressIcon" style="font-size: 24px; cursor: pointer; margin-left: 10px;"></i>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpAddress22" class="col-sm-3 col-form-label">상세주소</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpAddress22" name="crpAddress2" class="form-control" placeholder="변경 내용을 입력하세요">
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpZipCode2" class="col-sm-3 col-form-label">우편번호</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpZipCode2" name="crpZipCode" class="form-control" placeholder="변경 내용을 입력하세요">
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpTel2" class="col-sm-3 col-form-label">전화번호</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpTel2" name="crpTel" class="form-control" placeholder="변경 내용을 입력하세요">
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpEmail2" class="col-sm-3 col-form-label">이메일</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpEmail2" name="crpEmail" class="form-control" placeholder="변경 내용을 입력하세요">
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpOpeningDay2" class="col-sm-3 col-form-label">개업일</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpOpeningDay2" name="crpOpeningDay" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpIndustryCode2" class="col-sm-3 col-form-label">업종</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpIndustryCode2" name="crpIndustryCode" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpEmpNumber2" class="col-sm-3 col-form-label">재직자수</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpEmpNumber2" name="crpEmpNumber" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="crpCapitalstock2" class="col-sm-3 col-form-label">자본금</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpCapitalstock2" name="crpCapitalstock" class="form-control" readonly>
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
            var companyId = $(this).data('id');
            
            $.ajax({
                url: '/admin/crpDetail',
                type: 'GET',
                data: {crpId:companyId},
                dataType: 'json',
                success: function(data) {
                    // 모달에 데이터 채우기
                    $('#crpId').val(data.crpId);
                    $('#crpName').val(data.crpName);
                    $('#crpRepresentative').val(data.crpRepresentative);
                    $('#crpLicenseNo').val(data.crpLicenseNo);
                    $('#crpUrl').val(data.crpUrl);
                    $('#crpAddress1').val(data.crpAddress1);
                    $('#crpAddress2').val(data.crpAddress2);
                    $('#crpZipCode').val(data.crpZipCode);
                    $('#crpTel').val(data.crpTel);
                    $('#crpEmail').val(data.crpEmail);
                    $('#crpOpeningDay').val(data.crpOpeningDay);
                    $('#crpEmpNumber').val(data.crpEmpNumber);
                    $('#crpCapitalstock').val(data.crpCapitalstock);
                    
                    // 모달에 데이터 채우기
                    $('#crpId2').val(data.crpId);
                    $('#crpName2').val(data.crpName);
                    $('#crpRepresentative2').val(data.crpRepresentative);
                    $('#crpLicenseNo2').val(data.crpLicenseNo);
                    $('#crpUrl2').val(data.crpUrl);
                    $('#crpAddress12').val(data.crpAddress1);
                    $('#crpAddress22').val(data.crpAddress2);
                    $('#crpZipCode2').val(data.crpZipCode);
                    $('#crpTel2').val(data.crpTel);
                    $('#crpEmail2').val(data.crpEmail);
                    $('#crpOpeningDay2').val(data.crpOpeningDay);
                    $('#crpEmpNumber2').val(data.crpEmpNumber);
                    $('#crpCapitalstock2').val(data.crpCapitalstock);
                    
                    const industryCodeMap = {
               		    "INS0101": "서비스업",
               		    "INS0102": "제조·화학",
               		    "INS0103": "IT·웹·통신",
               		    "INS0104": "은행·금융업",
               		    "INS0105": "미디어·디자인",
               		    "INS0106": "교육업",
               		    "INS0107": "의료·제약·복지",
               		    "INS0108": "판매·유통",
               		    "INS0109": "건설업",
               		    "INS0110": "기관·협회"
               		};
                 
                    const industryName = industryCodeMap[data.crpIndustryCode] || data.crpIndustryCode;
                    $('#crpIndustryCode').val(industryName);
                    $('#crpIndustryCode2').val(industryName);

                    
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
     	$('#crpTel2').on('input', function(){
     		var telPattern = /^010-\d{4}-\d{4}$/;
     		var telInput = $(this).val();
     		
     		if(!telPattern.test(telInput)){
     			$(this).css('border-color', 'red');
     			if($('#telError').length === 0){
     				$(this).after('<div id="telError" style="color: red; font-size: 0.9em;">형식에 맞게 입력해주세요 (ex) 010-0000-0000)</div>');
     			}
     		} else{
     			$(this).css('border-color', '');
                $('#telError').remove();
     		}
     	});
    
     	// 이메일 입력 필드에 대한 검증
        $('#crpEmail2').on('input', function(){
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
        
        
     	// 수정 모달창에서 저장하기
        $('#saveChanges').on('click', function() {
        	
        	// 전화번호 유효성 검사
        	var telPattern = /^010-\d{4}-\d{4}$/;
            var telInput = $('#crpTel2').val();
            
            if (!telPattern.test(telInput)) {
                alert('전화번호 형식이 올바르지 않습니다.');
                return;
            }
            
            // 이메일 유효성 검사
            var emailPattern = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
            var emailInput = $('#crpEmail2').val();
        	
            if(!emailPattern.test(emailInput)){
            	alert("이메일 형식이 올바르지 않습니다");
            	return;
            }
            
            var updatedData = {
                crpId: $('#crpId2').val(),
                crpName: $('#crpName2').val(),
                crpRepresentative: $('#crpRepresentative2').val(),
                crpLicenseNo: $('#crpLicenseNo2').val(),
                crpUrl: $('#crpUrl2').val(),
                crpAddress1: $('#crpAddress12').val(),
                crpAddress2: $('#crpAddress22').val(),
                crpZipCode: $('#crpZipCode2').val(),
                crpTel: $('#crpTel2').val(),
                crpEmail: $('#crpEmail2').val(),
                crpOpeningDay: $('#crpOpeningDay2').val(),
                crpEmpNumber: $('#crpEmpNumber2').val(),
                crpCapitalstock: $('#crpCapitalstock2').val()
            };

            $.ajax({
                url: '/admin/crpUpdate',
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
	    $('#exampleModalToggle .btn-primary-light').on('click', function() {
	        // 수정 가능한 필드에 박스 쉐도우 추가
	        $('#crpUrl2, #crpAddress12, #crpAddress22, #crpZipCode2, #crpTel2, #crpEmail2').addClass('editable');
	    });
    	
		// 페이지 로드 시 crp_del_yn이 Y인 기업들을 탈퇴처리 완료로 표시
		$('tbody tr').each(function(){
			var crpDelYN = $(this).find('.crpDelYN').text().trim();
			
			if(crpDelYN === 'Y'){
				$(this).find('.rejectBtn').closest('td').html('<p class="text-danger mt-3"탈퇴처리 완료</p>');
			}
		})
		
		// 탈퇴 버튼 클릭 이벤트
		$('.rejectBtn').on('click', function(){
			var $this = $(this);
			var crpId = $this.data('id');
			
			if(confirm('탈퇴처리 하시겠습니까?')){
				$.ajax({
					url: '/admin/crpRemove',
					type: 'POST',
					contentType: 'application/json',
					data: JSON.stringify({ crpId: crpId }),
					beforeSend: function(xhr){
						xhr.setRequestHeader(header, token);
					},
					success: function(response){
						if(response === "success"){
							alert('탈퇴처리 되었습니다');
							$this.closest('td').html('<p class="text-danger mt-3">탈퇴처리 완료</p>');
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
                    $('#crpZipCode2').val(data.zonecode);
                    $('#crpAddress12').val(addr);
                    $('#crpkerAddress22').val(extraAddr);
                    $('#crpAddress22').focus();
                }
            }).open();
        }
        
     	// 셀렉트박스 - 탈퇴처리된 기업만 보기
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