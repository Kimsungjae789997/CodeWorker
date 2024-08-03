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
								FAQ 관리
							</div>
							<div class="card-body">
								<div class="row gy-3">
									<div class="col-xl-6">
										<label for="blog-first-name" class="form-label">제목</label> 
										<input type="text" class="form-control" name="boardTitle" id="boardTitle" value="${faqDetail.boardTitle }" readonly="readonly">
									</div>
									<div class="col-xl-6">
										<label for="blog-last-name" class="form-label">등록일</label> 
										<input type="text" class="form-control" name="boardRegDate" id="boardRegDate" value="${faqDetail.boardRegDate }" readonly="readonly">
									</div>
									<div class="col-xl-6">
									    <label for="blog-email" class="form-label">분류</label> 
									    <input type="text" class="form-control" name="boardTypeCode" id="boardTypeCode" readonly="readonly" value="<c:if test="${faqDetail.boardTypeCode eq 'BOT0101'}">공지사항</c:if><c:if test="${faqDetail.boardTypeCode eq 'BOT0102'}">FAQ</c:if>">
									</div>
									<div class="col-xl-6">
										<label for="blog-email" class="form-label">타겟</label> 
										<input type="text" class="form-control" name="boardTargetCode" id="boardTargetCode" readonly="readonly" value="<c:if test="${faqDetail.boardTargetCode eq 'TAR0101'}">기업회원</c:if><c:if test="${faqDetail.boardTargetCode eq 'TAR0102'}">구직회원</c:if>">
									</div>
									<div class="col-xl-12">
										<label for="blog-comment" class="form-label">내용</label>
										<textarea class="form-control" name="boardContent" id="boardContent" rows="5" readonly="readonly">${faqDetail.boardContent }</textarea>
									</div>
								</div>
							</div>
							<div class="card-footer">
								<div class="text-end">
									<button class="btn btn-primary-light" onclick="javascript:location.href='/admin/faqList'">목록</button>
									<button class="btn btn-info-light" id="editBtn">수정</button>
									<button class="btn btn-danger-light" id="delBtn">삭제</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
	$(document).ready(function() {
		// 게시글 수정 이벤트
		$('#editBtn').on('click', function() {
			if (confirm('수정하시겠습니까?')) {
				// readonly 속성 제거
				$('#boardTitle').prop('readonly', false);
				CKEDITOR.instances.boardContent.setReadOnly(false);

				// 하늘색 쉐도우 박스 추가
				$('#boardTitle').addClass('editable');
				CKEDITOR.instances.boardContent.container.addClass('editable');
				
				// 버튼 텍스트를 "저장"으로 변경
				$(this).text('저장');
				$(this).attr('id', 'saveBtn');
				
				// 목록 버튼과 삭제 버튼을 숨기고 취소 버튼 추가
		        $('button:contains("목록")').hide();
		        $('#delBtn').hide();
		        $(this).after('<button class="btn btn-danger-light" id="cancelBtn">취소</button>');

		        // 취소 버튼 클릭 이벤트
		        $('#cancelBtn').on('click', function() {
		            location.reload(); // 페이지 새로고침
		        });
				
				
				// 저장 버튼에 이벤트 리스너 추가
				$('#saveBtn').on('click', function() {
                    // CKEditor에서 업데이트된 내용 가져오기
                    const boardContent = CKEDITOR.instances.boardContent.getData();
                    
					// 폼 데이터 수집
					const boardData = {
						boardNo : '${faqDetail.boardNo}',
						boardTitle : $('#boardTitle').val(),
						boardContent : boardContent
					};

					// AJAX 요청을 통해 커뮤니티 게시글 업데이트
					$.ajax({
						url : '/admin/faqUpdate',
						type : 'POST',
						contentType : 'application/json',
						data : JSON.stringify(boardData),
						beforeSend : function(xhr) {
							xhr.setRequestHeader(header, token);
						},
						success : function(response) {
							if (response === 'success') {
								alert('수정되었습니다.');
								location.reload(); // 변경 사항을 반영하기 위해 페이지 새로고침
							} else {
								alert('1.수정에 실패했습니다.');
							}
						},
						error : function(error) {
							console.error('Error:', error);
							alert('2.수정에 실패했습니다.');
						}
					});
				});
			}
		});
		
		
		// 게시글 삭제 이벤트(Y/N)
	    $('#delBtn').on('click', function() {
	        if (confirm('삭제하시겠습니까?')) {
	            const boardData = {
	                boardNo: '${faqDetail.boardNo}'
	            };

	            // AJAX 요청을 통해 커뮤니티 게시글 삭제(Y/N)
	            $.ajax({
	                url: '/admin/faqRemove',
	                type: 'POST',
	                contentType: 'application/json',
	                data: JSON.stringify(boardData),
	                beforeSend: function(xhr) {
	                    xhr.setRequestHeader(header, token);
	                },
	                success: function(response) {
	                    if (response === 'success') {
	                        alert('삭제되었습니다.');
	                        location.href = '/admin/faqList'; // 목록 페이지로 이동
	                    } else {
	                        alert('삭제에 실패했습니다.');
	                    }
	                },
	                error: function(error) {
	                    console.error('Error:', error);
	                    alert('삭제에 실패했습니다.');
	                }
	            });
	        }
	    });
		
        // CK에디터
        CKEDITOR.replace('boardContent', {
            filebrowserUploadUrl: '${pageContext.request.contextPath}/imageUpload?${_csrf.parameterName}=${_csrf.token}', // 이미지 업로드를 처리할 URL
        });
        CKEDITOR.config.height = "500px"; // CK에디터 크기 키워주기
        
	});
</script>