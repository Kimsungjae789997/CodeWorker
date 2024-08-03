<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    
    .text-info {
        cursor: pointer; /* 커서를 손가락 모양으로 변경 */
    }
</style>
    
<div class="row">
    <div class="col-xl-12">
        <div class="card custom-card mt-3">
            <div class="card-header">
                <div class="card-title">
					문의 게시판
                </div>
            </div>
            <div class="card-body">
<!--                 <div> -->
<!--                     <select class="form-select-sm" aria-label="Default select example" id="filterSelect"> -->
<!--                         <option value="all">전체 보기</option> -->
<!--                         <option value="deleted">미처리 문의사항 보기</option> -->
<!--                     </select> -->
<!--                 </div> -->
                <div class="table-responsive">
                    <table id="datatable-basic" class="table table-bordered text-nowrap w-100">
                        <thead>
                            <tr>
                            	<th style="background-color: rgba(137, 32, 173, 0.1);">No</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">분류</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">작성자</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">제목</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">작성일</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">답변</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${questionList}" var="queList" varStatus="status">
                                <tr class="${queList.delYN eq 'Y' ? 'deleted' : ''}" data-target-code="${queList.boardTargetCode}">
                                	<td>${pagingVO.startRow + status.index}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${queList.boardTargetCode eq 'ROL0103' }">
												기업회원
                                            </c:when>
                                            <c:when test="${queList.boardTargetCode eq 'ROL0102' }">
												구직회원
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>${queList.memId }</td>
                                    <td>
                                        <a href="/admin/questionDetail?questionNo=${queList.questionNo }" style="color: ${queList.delYN eq 'Y' ? 'red' : 'black'};">
                                            ${queList.questionTitle }
                                        </a>
                                    </td>
                                    <td>${queList.questionRegDate }</td>
                                    <td>
										<c:choose>
										    <c:when test="${queList.answerYN eq 'Y'}">
										        <p class="text-info mt-3">답변 완료</p>
										    </c:when>
										    <c:otherwise>
										    	<p class="text-danger mt-3">미처리</p>
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


<!-- 답변 내역 모달 -->
<div class="modal fade" id="answerDetailModal" tabindex="-1" aria-labelledby="answerDetailModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header" style="background-color: rgba(137, 32, 173, 0.1);">
                <h6 class="modal-title" id="answerDetailModalLabel">답변 내역</h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row mb-3">
                    <label for="answerContent" class="col-sm-3 col-form-label">답변 내용</label>
                    <div class="col-sm-9">
                        <textarea id="answerContent" name="answerContent" class="form-control" rows="5" readonly></textarea>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
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
	
    // 셀렉트박스 - 필터링 기능
	$('#filterSelect').on('change', function() {
	    var filter = $(this).val();
	    var rows = $("#datatable-basic tbody tr");
	
	    rows.each(function() {
	        var targetCode = $(this).data('target-code');
	        var isDeleted = $(this).hasClass('deleted');
	
	        if (filter === 'all') {
	            $(this).show();
	        } else if (filter === 'deleted') {
	            if (isDeleted) {
	                $(this).show();
	            } else {
	                $(this).hide();
	            }
	        } else {
	            if (targetCode === filter) {
	                $(this).show();
	            } else {
	                $(this).hide();
	            }
	        }
	    });
	});
    
	// 답변 완료 버튼 클릭 이벤트(답변 내역 보기)
    $('.text-info').on('click', function() {
    	var questionNo = $(this).closest('tr').find('a').attr('href').split('=')[1];

        // AJAX 요청을 통해 답변 내역 가져오기
    	$.ajax({
            url: '/admin/answerDetail',
            type: 'GET',
            data: { questionNo: questionNo },
            beforeSend: function(xhr){
                xhr.setRequestHeader(header, token); 
            },
            success: function(response) {
                // 모달 창에 답변 내용 표시
                $('#answerContent').val(response.questionReplyContent);
                $('#answerDetailModal').modal('show');
            },
            error: function(error) {
                console.error('Error:', error);
                alert('답변 내역을 가져오는 데 실패했습니다.');
            }
        });
    });
});
</script>