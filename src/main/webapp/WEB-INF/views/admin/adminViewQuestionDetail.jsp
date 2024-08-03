<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
	.main-content{
		margin-block-start: 0.8rem;
    	margin-inline-start: 9em;
	}
	
	.card-footer{
		margin-inline-start: auto;
	}
	
	.editable{
		box-shadow:  0 0 10px rgba(100, 149, 237);
	}
</style>
<div class="page">
	<div class="main-content app-content">
		<div class="container-lg mt-5">
			<div class="row">
				<div class="col-xl-12">
					<div class="card custom-card">
						<div class="card-header">
							<div class="card-title">
								문의사항 관리
							</div>
							<div class="card-body">
								<div class="row gy-3">
									<div class="col-xl-6">
										<label for="blog-first-name" class="form-label">제목</label> 
										<input type="text" class="form-control" name="boardTitle" id="boardTitle" value="${questionDetail.questionTitle }" readonly="readonly">
									</div>
									<div class="col-xl-6">
										<label for="blog-last-name" class="form-label">등록일</label> 
										<input type="text" class="form-control" name="boardRegDate" id="boardRegDate" value="${questionDetail.questionRegDate }" readonly="readonly">
									</div>
									<div class="col-xl-6">
									    <label for="blog-email" class="form-label">분류</label> 
									    <input type="text" class="form-control" name="boardTypeCode" id="boardTypeCode" readonly="readonly" value="<c:if test="${questionDetail.boardTargetCode eq 'ROL0103'}">기업회원</c:if><c:if test="${noticeDetail.boardTypeCode eq 'ROL0103'}">FAQ</c:if>">
									</div>
									<div class="col-xl-6">
										<label for="blog-email" class="form-label">타겟</label> 
										<input type="text" class="form-control" name="boardTargetCode" id="boardTargetCode" readonly="readonly" value="<c:if test="${questionDetail.boardTargetCode eq 'ROL0102'}">구직회원</c:if><c:if test="${noticeDetail.boardTargetCode eq 'ROL0102'}">구직회원</c:if>">
									</div>
									<div class="col-xl-12">
										<label for="blog-comment" class="form-label">내용</label>
										<textarea class="form-control" name="boardContent" id="boardContent" rows="5" readonly="readonly">${questionDetail.questionContent }</textarea>
									</div>
								</div>
							</div>
							<div class="card-footer">
								<div class="text-end">
                                    <button class="btn btn-primary-light" onclick="javascript:location.href='/admin/questionList'">목록</button>
                                    <button class="btn btn-info-light" id="answerBtn" data-bs-toggle="modal" data-bs-target="#answerModal">답변</button>
                                </div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 답변하기 모달창 -->
<div class="modal fade" id="answerModal" tabindex="-1" aria-labelledby="answerModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header" style="background-color: rgba(137, 32, 173, 0.1);">
                <h6 class="modal-title" id="answerModalLabel">답변 작성</h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form id="answerForm">
                    <div class="mb-3">
                        <label for="answerContent" class="form-label">답변 내용</label>
                        <textarea class="form-control" id="answerContent" rows="5"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="button" class="btn btn-primary" id="submitAnswerBtn">저장</button>
            </div>
        </div>
    </div>
</div>


<script>
    $(document).ready(function() {
        $('#submitAnswerBtn').on('click', function() {
            const answerContent = $('#answerContent').val();
            const questionNo = '${questionDetail.questionNo}';

            if (answerContent.trim() === '') {
                alert('답변 내용을 입력해주세요.');
                return;
            }

            const answerData = {
                questionNo: questionNo,
                questionReplyContent: answerContent
            };

            $.ajax({
                url: '/admin/questionAnswer',
                type: 'POST',
                contentType: 'application/json',
                data: JSON.stringify(answerData),
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success: function(response) {
                    if (response === 'success') {
                        alert('답변이 등록되었습니다.');
                        location.href = '/admin/questionList';
                    } else {
                        alert('1. 답변 등록에 실패했습니다.');
                    }
                },
                error: function(error) {
                    console.error('Error:', error);
                    alert('2. 답변 등록에 실패했습니다.');
                }
            });
        });
        
     	// CK에디터
        CKEDITOR.replace('boardContent', {
            filebrowserUploadUrl: '${pageContext.request.contextPath}/imageUpload?${_csrf.parameterName}=${_csrf.token}', // 이미지 업로드를 처리할 URL
        });
        CKEDITOR.config.height = "500px"; // CK에디터 크기 키워주기
        
    });
</script>