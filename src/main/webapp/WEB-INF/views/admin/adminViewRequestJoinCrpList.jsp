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
                    	가입 요청 기업 관리
                </div>
            </div>
            <div class="card-body">
<!--             	<div> -->
<!--                     <select class="form-select-sm" aria-label="Default select example" id="filterSelect"> -->
<!--                         <option value="all">전체 보기</option> -->
<!--                         <option value="deleted">반려 기업 보기</option> -->
<!--                     </select> -->
<!--                 </div> -->
                <div class="table-responsive">
                    <table id="datatable-basic" class="table table-bordered text-nowrap w-100">
                        <thead>
                            <tr>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">No</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">기업명</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">대표</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">사업자등록증</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">가입요청일자</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">승인/반려</th>
                            </tr>
                        </thead>
                        <tbody>
							<c:forEach items="${jrCrpList}" var="jrCrp" varStatus="status">
							    <tr class="${jrCrp.joReqStatus eq 'N' ? 'deleted' : ''}">
							        <td>${pagingVO.startRow + status.index}</td>
							        <td>
							            <a href="#" class="viewLicense" data-id="${jrCrp.joReqCrpId}" style="margin-left: 5px;">
							                ${jrCrp.joReqCrpName}
							            </a>
							        </td>
							        <td>${jrCrp.joReqCrpRepresentative }</td>
							        <td>
							            <button class="btn btn-link" data-image="사업자등록증.png" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">
							                <i class='bx bx-file'></i>
							            </button>
							        </td>
							        <td>${jrCrp.joReqCrpDate }</td>
							        <td>
							            <c:choose>
							                <c:when test="${jrCrp.joReqStatus eq 'N' }">
							                    <p class="text-danger mt-3">반려처리 완료</p>
							                </c:when>
							                <c:when test="${jrCrp.joReqStatus eq 'Y' }">
							                    <p class="text-info mt-3">승인처리 완료</p>
							                </c:when>
							                <c:otherwise>
							                    <button class="btn btn-light btn-wave agreeBtn" data-id="${jrCrp.joReqCrpId }" data-no="${status.index }">승인</button>
							                    <button class="btn btn-light btn-wave rejectBtn" data-id="${jrCrp.joReqCrpId }">반려</button>
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
			        <label for="joReqCrpId" class="col-sm-3 col-form-label">기업아이디</label>
			        <div class="col-sm-9">
			            <input type="text" id="joReqCrpId" name="joReqCrpId" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="joReqCrpName" class="col-sm-3 col-form-label">기업명</label>
			        <div class="col-sm-9">
			            <input type="text" id="joReqCrpName" name="joReqCrpName" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="joReqCrpRepresentative" class="col-sm-3 col-form-label">기업대표명</label>
			        <div class="col-sm-9">
			            <input type="text" id="joReqCrpRepresentative" name="joReqCrpRepresentative" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="joReqCrpLicenseNo" class="col-sm-3 col-form-label">사업자등록번호</label>
			        <div class="col-sm-9">
			            <input type="text" id="joReqCrpLicenseNo" name="joReqCrpLicenseNo" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="joReqCrpUrl" class="col-sm-3 col-form-label">홈페이지</label>
			        <div class="col-sm-9">
			            <input type="text" id="joReqCrpUrl" name="joReqCrpUrl" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="joReqCrpAdd" class="col-sm-3 col-form-label">주소</label>
			        <div class="col-sm-9">
			            <input type="text" id="joReqCrpAdd1" name="joReqCrpAdd1" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="joReqCrpZipCode" class="col-sm-3 col-form-label">우편번호</label>
			        <div class="col-sm-9">
			            <input type="text" id="joReqCrpZipCode" name="joReqCrpZipCode" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="joReqCrpTel" class="col-sm-3 col-form-label">전화번호</label>
			        <div class="col-sm-9">
			            <input type="text" id="joReqCrpTel" name="joReqCrpTel" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="joReqCrpEmail" class="col-sm-3 col-form-label">이메일</label>
			        <div class="col-sm-9">
			            <input type="text" id="joReqCrpEmail" name="joReqCrpEmail" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="joReqCrpOpeningDay" class="col-sm-3 col-form-label">개업일</label>
			        <div class="col-sm-9">
			            <input type="text" id="joReqCrpOpeningDay" name="joReqCrpOpeningDay" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="joReqCrpIndustryCode" class="col-sm-3 col-form-label">업종</label>
			        <div class="col-sm-9">
			            <input type="text" id="joReqCrpIndustryCode" name="joReqCrpIndustryCode" class="form-control" readonly>
			        </div>
			    </div>
			</div>
            <div class="modal-footer">

            </div>
        </div>
    </div>
</div>

<!-- 사업자등록증 띄우는 모달 -->
<div class="modal fade" id="exampleModalToggle2" tabindex="-1" aria-labelledby="exampleModalToggleLabel2" aria-hidden="true">
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

<!-- 반려 사유 모달 -->
<div class="modal fade" id="rejectReasonModal" tabindex="-1" aria-labelledby="rejectReasonModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header" style="background-color: rgba(137, 32, 173, 0.1);">
                <h6 class="modal-title" id="rejectReasonModalLabel">반려 사유 작성</h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label for="rejectReason" class="form-label">반려 사유</label>
                    <textarea class="form-control" id="rejectReason" rows="3"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" id="submitRejectReason">보내기</button>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                url: '/admin/crpRequestJoinDetail',
                type: 'GET',
                data: {joReqCrpId:companyId},
                dataType: 'json',
                success: function(data) {
                    // 모달에 데이터 채우기
                    $('#joReqCrpId').val(data.joReqCrpId);
                    $('#joReqCrpName').val(data.joReqCrpName);
                    $('#joReqCrpRepresentative').val(data.joReqCrpRepresentative);
                    $('#joReqCrpLicenseNo').val(data.joReqCrpLicenseNo);
                    $('#joReqCrpUrl').val(data.joReqCrpUrl);
                    $('#joReqCrpAdd1').val(data.joReqCrpAdd1 + ' ' + data.joReqCrpAdd2);
                    $('#joReqCrpZipCode').val(data.joReqCrpZipCode);
                    $('#joReqCrpTel').val(data.joReqCrpTel);
                    $('#joReqCrpEmail').val(data.joReqCrpEmail);
                    $('#joReqCrpOpeningDay').val(data.joReqCrpOpeningDay);
                    
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
                    
                    const industryName = industryCodeMap[data.joReqCrpIndustryCode] || data.joReqCrpIndustryCode;
                    $('#joReqCrpIndustryCode').val(industryName);
                    
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
        
        
        // 모달이 닫힐 때 백드롭을 수동으로 제거
        $('#exampleModalToggle').on('hidden.bs.modal', function () {
            $('.modal-backdrop').remove();
        });
        
        function modalSizeAuto() {
            var modalContent = document.querySelector('.modal-content');
            var modalBody = document.querySelector('.modal-body');
           
            modalContent.style.height = 'auto';
            modalContent.style.maxHeight = '80vh';
            modalBody.style.overflowY = 'auto';
        };

     	
     	// 승인 버튼 클릭 이벤트
		$('.agreeBtn').on('click', function() {
		    Swal.fire({
		        title: '승인하시겠습니까?',
		        showCancelButton: true,
		        confirmButtonText: '확인',
		        cancelButtonText: '취소'
		    }).then((result) => {
		        if (result.isConfirmed) {
		            var companyId = $(this).data('id');
		            var button = $(this);
		
		            var data = {
		                joReqCrpId: companyId,
		                joReqStatus: 'Y'
		            };
		
		            $.ajax({
		                url: '/admin/crpRequestJoinUpdate',
		                type: 'POST',
		                beforeSend: function(xhr) { // 데이터 전송 전, 헤더에 csrf 값 설정
		                    xhr.setRequestHeader(header, token);
		                },
		                contentType: "application/json;charset=utf-8",
		                data: JSON.stringify(data),
		                success: function(response) {
		                    Swal.fire({
		                        icon: 'success',
		                        title: '승인 완료되었습니다.'
		                    }).then(() => {
		                        // 버튼 상태 업데이트
		                        button.closest('td').html('<p class="text-info mt-3">승인처리 완료</p>');
		                        location.reload();
		                    });
		                },
		                error: function(error) {
		                    console.error('Error:', error);
		                }
		            });
		        }
		    });
		});
        
        
     	// 반려 버튼 클릭 이벤트
        var selectedCompanyId;
        var selectedButton;

        $('.rejectBtn').on('click', function() {
            Swal.fire({
                title: '반려하시겠습니까?',
                showCancelButton: true,
                confirmButtonText: '확인',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    selectedCompanyId = $(this).data('id');
                    selectedButton = $(this);
                    var targetModal = new bootstrap.Modal(document.getElementById('rejectReasonModal'));
                    targetModal.show();
                }
            });
        });

        // 반려 사유 모달 창에서 보내기 버튼 클릭 이벤트
		$('#submitRejectReason').on('click', function() {
		    var rejectReason = $('#rejectReason').val();
		    if (!rejectReason) {
		        Swal.fire({
		            icon: 'warning',
		            title: '반려 사유를 작성해 주세요.'
		        });
		        return;
		    }
		    var data = {
		        joReqCrpId: selectedCompanyId,
		        joReqStatus: 'N',
		        rejectReason: rejectReason
		    };
		    $.ajax({
		        url: '/admin/crpRequestJoinUpdate',
		        type: 'POST',
		        beforeSend: function(xhr) { // 데이터 전송 전, 헤더에 csrf 값 설정
		            xhr.setRequestHeader(header, token);
		        },
		        contentType: "application/json;charset=utf-8",
		        data: JSON.stringify(data),
		        success: function(response) {
		            Swal.fire({
		                icon: 'success',
		                title: '반려 되었습니다.'
		            }).then(() => {
		                // 버튼 상태 업데이트
		                selectedButton.closest('td').html('<p class="text-danger mt-3">반려처리 완료</p>');
		                var targetModal = bootstrap.Modal.getInstance(document.getElementById('rejectReasonModal'));
		                targetModal.hide();
		                location.reload();
		            });
		        },
		        error: function(error) {
		            console.error('Error:', error);
		        }
		    });
		});
        
     	// 셀렉트박스 - 반려 처리된 기업만 보기
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