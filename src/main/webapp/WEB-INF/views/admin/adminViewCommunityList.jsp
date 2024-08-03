<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
    i {
        font-size: 20px;
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
                    	커뮤니티 게시판
                </div>
            </div>
            <div class="card-body">
<!--                 <div> -->
<!--                     <select class="form-select-sm" aria-label="Default select example" id="filterSelect"> -->
<!--                         <option value="all">전체 보기</option> -->
<!--                         <option value="warned">신고된 게시글 보기</option> -->
<!--                         <option value="deleted">삭제된 게시글 보기</option> -->
<!--                     </select> -->
<!--                 </div> -->
                <div class="table-responsive">
                    <table id="datatable-basic" class="table table-bordered text-nowrap w-100">
                        <thead>
                            <tr>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">No</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">아이디</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">제목</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">작성일</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">신고</th>
                            </tr>
                        </thead>
                        <tbody>
						    <c:forEach items="${communityList}" var="commuList" varStatus="status">
						        <tr class="${commuList.communityDelYN eq 'Y' ? 'deleted' : ''} ${commuList.communityWarnYN eq 'Y' ? 'warned' : ''}">
						            <td data-no="${commuList.communityNo }">${pagingVO.startRow + status.index}</td>
						            <td>${commuList.memId }</td>
						            <td>
						                <c:if test="${commuList.communityDelYN eq 'Y'}">
						                    <a href="/admin/communityDetail?communityNo=${commuList.communityNo }" style="color: red; text-decoration: none;">
						                        (${commuList.communityTitle }(${commuList.replyCount}) - 삭제되었습니다)
						                    </a>
						                </c:if>
						                <c:if test="${commuList.communityDelYN ne 'Y'}">
						                    <a href="/admin/communityDetail?communityNo=${commuList.communityNo }" style="color: black;">
						                        ${commuList.communityTitle }(${commuList.replyCount})
						                    </a>
						                </c:if>
						            </td>
						            <td>${commuList.communityRegDate }</td>
						            <td>
						                <c:choose>
						                    <c:when test="${commuList.communityWarnYN eq 'Y'}">
						                        <i class="ri-alarm-warning-line" style="color: red;"></i>
						                    </c:when>
						                    <c:otherwise>
						                        <i class="ri-alarm-warning-line"></i>
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


<!-- 신고내역 보기 모달  --> 
<div class="modal fade" id="exampleModalToggle" tabindex="-1" aria-labelledby="exampleModalToggleLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header" style="background-color: rgba(137, 32, 173, 0.1);">
                <h6 class="modal-title" id="exampleModalToggleLabel">신고내역</h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
			    <div class="row mb-3">
			        <label for="crpId" class="col-sm-3 col-form-label">신고자 아이디</label>
			        <div class="col-sm-9">
			            <input type="text" id="crpId" name="crpId" class="form-control" readonly>
			        </div>
			    </div>
				<div class="row mb-3">
				    <label for="crpName" class="col-sm-3 col-form-label">신고 사유</label>
				    <div class="col-sm-9">
				        <select id="crpName" name="crpName" class="form-control">
				            <option value="욕설/혐오">욕설/혐오</option>
				            <option value="광고/스팸">광고/스팸</option>
				            <option value="음란/공연질서 문란">음란/공연질서 문란</option>
				        </select>
				    </div>
				</div>
			    <div class="row mb-3">
			        <label for="crpRepresentative" class="col-sm-3 col-form-label">신고 상세 사유</label>
			        <div class="col-sm-9">
			            <textarea rows="5" cols="10" id="crpRepresentative" name="crpRepresentative" class="form-control" readonly>
			            
			            </textarea>
			        </div>
			    </div>
			</div>
            <div class="modal-footer">
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function(){
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
	        } else if (filter === "warned") {
	            if ($(this).hasClass("warned")) {
	                $(this).show();
	            } else {
	                $(this).hide();
	            }
	        } else {
	            $(this).show();
	        }
	    });
	});
	
	// 신고 상태로 바뀐 아이콘 클릭 이벤트(신고 사유 보기)
	$('.ri-alarm-warning-line').on('click', function(){
		var communityNo = $(this).closest('tr').find('td:first').data("no");
		
		$.ajax({
			url: '/admin/complaintDetail',
			type: 'GET',
			data: {communityNo: communityNo},
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success: function(response){
	            $('#crpId').val(response.memId);
	            $('#crpName').val(response.complaintReason);
	            $('#crpRepresentative').val(response.complaintContent);
	            $('#exampleModalToggle').modal('show');
			},
			error: function(){
				Swal.fire("신고 내역을 불러오는데 실패했습니다");
			}
		});		
	});
	
	// 신고 상태로 바뀐 아이콘만 스타일 주기 
	$('.ri-alarm-warning-line[style*="color: red"]').css('cursor', 'pointer');
});
</script>