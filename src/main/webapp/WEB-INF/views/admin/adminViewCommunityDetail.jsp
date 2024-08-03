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
	
	.reply {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	    padding: 10px;
	    border-bottom: 1px solid #ddd;
	}
	
	.reply-author {
	    flex: 1;
	}
	
	.reply-content {
	    flex: 3;
	    text-align: left;
	}
	
	.reply-date {
	    flex: 1;
	    text-align: right;
	}
	
	.reply-icons {
	    flex: 0.5;
	    text-align: right;
	}
	
	.reply-icons i {
	    margin-left: 10px;
	    cursor: pointer;
	}
	
	.bi-pencil{
		color: rgba(100, 149, 237);
	}
	
	.bi-trash{
		color: rgba(226, 75, 105);
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
					<div class="card custom-card mt-0">
						<div class="card-header">
							<div class="card-title">
								커뮤니티 관리
							</div>
							<div class="card-body">
								<div class="row gy-3">
									<div class="col-xl-6">
										<label for="blog-first-name" class="form-label">제목</label> 
										<input type="text" class="form-control" name="communityTitle" id="communityTitle" value="${communityDetail.communityTitle }" readonly="readonly">
									</div>
									<div class="col-xl-6">
										<label for="blog-last-name" class="form-label">등록일</label> 
										<input type="text" class="form-control" name="communityRegDate" id="communityRegDate" value="${communityDetail.communityRegDate }" readonly="readonly">
									</div>
									<div class="col-xl-6">
										<label for="blog-email" class="form-label">작성자</label> 
										<input type="text" class="form-control" name="memName" id="memName" value="${communityDetail.memName }" readonly="readonly">
									</div>
									<div class="col-xl-6">
										<label for="blog-email" class="form-label">아이디</label> 
										<input type="text" class="form-control" name="memId" id="memId" value="${communityDetail.memId }" readonly="readonly">
									</div>
									<div class="col-xl-12">
										<label for="blog-comment" class="form-label">내용</label>
										<textarea class="form-control" name="communityContent" id="communityContent" rows="5" readonly="readonly">${communityDetail.communityContent }</textarea>
									</div>
									<div class="col-xl-12">
									    <label for="blog-comment" class="form-label">댓글 <font style="color: #888; font-size: 12px;">전체 (${communityReply.size()}건)</font></label>
									    <c:if test="${not empty communityReply}">
											<c:forEach items="${communityReply}" var="reply">
											   <div class="reply form-control" data-reply-no="${reply.commReplyNo}">
													<div class="reply-author">
												        <a href="#" class="viewLicense" data-id="${reply.memId}">
											                ${reply.memName} (${reply.memId})
											            </a>
										            </div>
											        <div class="reply-content">
											        	<c:choose>
											                <c:when test="${reply.commReplyDelYN eq 'Y'}">
<!-- 											                    <font style="color: red;">관리자에 의해 삭제된 댓글입니다.</font> -->
																 <font style="color: red;">(${reply.commReplyContent} - 삭제되었습니다.)</font>
											                </c:when>
											                <c:otherwise>
											                    ${reply.commReplyContent}
											                </c:otherwise>
											            </c:choose>
											        </div>
											        <div class="reply-date">${reply.commReplyRegDate}</div>
											        <div class="reply-icons">
											            <i class="bi bi-pencil editCon" title="Edit"></i>
											            <i class="bi bi-trash delCon" title="Delete"></i>
											        </div>
											    </div>
											</c:forEach>
									    </c:if>
									    <c:if test="${empty communityReply}">
									        <p>댓글이 없습니다.</p>
									    </c:if>
									</div>
								</div>
							</div>
							<div class="card-footer">
								<div class="text-end">
									<button class="btn btn-primary-light" onclick="javascript:location.href='/admin/communityList'">목록</button>
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
			    <div class="row mb-3">
			        <label for="seekerStatusCode" class="col-sm-3 col-form-label">상태</label>
			        <div class="col-sm-9">
			            <input type="text" id="seekerStatusCode" name="seekerStatusCode" class="form-control" readonly>
			        </div>
			    </div>
			    <div class="row mb-3">
			        <label for="seekerExp" class="col-sm-3 col-form-label">경력</label>
			        <div class="col-sm-9">
			            <input type="text" id="seekerExp" name="seekerExp" class="form-control" readonly>
			        </div>
			    </div>
			</div>
            <div class="modal-footer"></div>
        </div>
    </div>
</div>



<script>
    $(document).ready(function() {
        // 게시글 수정 이벤트
        $('#editBtn').on('click', function() {
            Swal.fire({
                title: '수정하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: '수정',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    // readonly 속성 제거
                    $('#communityTitle').prop('readonly', false);
                    CKEDITOR.instances.communityContent.setReadOnly(false);

                    // 하늘색 쉐도우 박스 추가
                    $('#communityTitle').addClass('editable');
                    CKEDITOR.instances.communityContent.container.addClass('editable');

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
                        const communityContent = CKEDITOR.instances.communityContent.getData();
                        
                        // 폼 데이터 수집
                        const communityData = {
                            communityNo : '${communityDetail.communityNo}',
                            communityTitle : $('#communityTitle').val(),
                            communityContent : communityContent
                        };

                        // AJAX 요청을 통해 커뮤니티 게시글 업데이트
                        $.ajax({
                            url : '/admin/communityUpdate',
                            type : 'POST',
                            contentType : 'application/json',
                            data : JSON.stringify(communityData),
                            beforeSend : function(xhr) {
                                xhr.setRequestHeader(header, token);
                            },
                            success : function(response) {
                                if (response === 'success') {
                                    Swal.fire('수정되었습니다.').then(function() {
                                        location.reload(); // 변경 사항을 반영하기 위해 페이지 새로고침
                                    });
                                } else {
                                    Swal.fire('수정에 실패했습니다.');
                                }
                            },
                            error : function(error) {
                                console.error('Error:', error);
                                Swal.fire('수정에 실패했습니다.');
                            }
                        });
                    });
                }
            });
        });
        
        // 댓글 수정 이벤트
        $('.editCon').on('click', function() {
            Swal.fire({
                title: '수정하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: '수정',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    const $reply = $(this).closest('.reply');
                    const $replyContent = $reply.find('.reply-content');
                    const originalContent = $replyContent.text();
                    const replyNo = $reply.data('reply-no'); // 댓글 번호 가져오기

                    // 댓글 내용을 편집 가능하게 변경
                    $replyContent.prop('contenteditable', true).addClass('editable');

                    // 아이콘을 저장 및 취소 버튼으로 변경
                    $(this).hide();
                    $reply.find('.delCon').hide();
                    $reply.append('<button class="saveReplyBtn btn btn-info-light">저장</button>');
                    $reply.append('<button class="cancelReplyBtn btn btn-danger-light">취소</button>');

                    // 저장 버튼 클릭 이벤트
                    $reply.find('.saveReplyBtn').on('click', function() {
                        const updatedContent = $replyContent.text();
                        const replyData = {
                            commReplyNo: replyNo, // 댓글 번호 포함
                            commReplyContent: updatedContent
                        };

                        // AJAX 요청을 통해 댓글 업데이트
                        $.ajax({
                            url: '/admin/replyUpdate',
                            type: 'POST',
                            contentType: 'application/json',
                            data: JSON.stringify(replyData),
                            beforeSend : function(xhr) {
                                xhr.setRequestHeader(header, token);
                            },
                            success: function(response) {
                                if (response === 'success') {
                                    Swal.fire('댓글이 수정되었습니다.').then(function() {
                                        $replyContent.prop('contenteditable', false).removeClass('editable');
                                        $reply.find('.saveReplyBtn').remove();
                                        $reply.find('.cancelReplyBtn').remove();
                                        $reply.find('.editCon').show();
                                        $reply.find('.delCon').show();
                                        window.reload();
                                    });
                                } else {
                                    Swal.fire('댓글 수정에 실패했습니다.');
                                }
                            },
                            error: function(error) {
                                console.error('Error:', error);
                                Swal.fire('댓글 수정에 실패했습니다.');
                            }
                        });
                    });

                    // 취소 버튼 클릭 이벤트
                    $reply.find('.cancelReplyBtn').on('click', function() {
                        $replyContent.text(originalContent).prop('contenteditable', false).removeClass('editable');
                        $reply.find('.saveReplyBtn').remove();
                        $reply.find('.cancelReplyBtn').remove();
                        $reply.find('.editCon').show();
                        $reply.find('.delCon').show();
                    });
                }
            });
        });
        
        // 댓글 작성자 정보 보기 클릭 이벤트
        $('.viewLicense').on('click', function(event) {
            event.preventDefault();
            var memId = $(this).data('id');
            
            $.ajax({
                url: '/admin/seekerDetail',
                type: 'GET',
                data: {memId: memId},
                dataType: 'json',
                beforeSend: function(xhr){
                    xhr.setRequestHeader(header, token); 
                },
                success: function(data) {
                    
                    console.log('AJAX success : ', data); // 응답 데이터 전체를 출력
                    console.log('회원 아이디 : ', data.memId); // memId 값을 출력
                    
                    // 모달에 데이터 채우기
                    $('#memId').val(data.memId);
                    $('#seekerName').val(data.seekerName);
                    
                    if (data.memId === 'aaa1' || data.memId === 'bbb1') {
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
                    
                    //modalSizeAuto();
                },
                error: function(error) {
                    console.error('Error:', error);
                }
            });
        });
        
        // 게시글 삭제 이벤트(Y/N)
        $('#delBtn').on('click', function() {
            Swal.fire({
                title: '삭제하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: '삭제',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    const communityData = {
                        communityNo: '${communityDetail.communityNo}'
                    };

                    // AJAX 요청을 통해 커뮤니티 게시글 삭제(Y/N)
                    $.ajax({
                        url: '/admin/communityRemove',
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify(communityData),
                        beforeSend: function(xhr) {
                            xhr.setRequestHeader(header, token);
                        },
                        success: function(response) {
                            if (response === 'success') {
                                Swal.fire('삭제되었습니다.').then(function() {
                                    location.href = '/admin/communityList'; // 목록 페이지로 이동
                                });
                            } else {
                                Swal.fire('삭제에 실패했습니다.');
                            }
                        },
                        error: function(error) {
                            console.error('Error:', error);
                            Swal.fire('삭제에 실패했습니다.');
                        }
                    });
                }
            });
        });
        
        
        // 댓글 삭제 이벤트
        $('.delCon').on('click', function() {
            Swal.fire({
                title: '삭제하시겠습니까?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: '삭제',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    const $reply = $(this).closest('.reply');
                    const replyNo = $reply.data('reply-no');
                    // AJAX 요청을 통해 댓글 삭제(Y/N)
                    $.ajax({
                        url: '/admin/replyRemove',
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify({ commReplyNo: replyNo }),
                        beforeSend: function(xhr) {
                            xhr.setRequestHeader(header, token);
                        },
                        success: function(response) {
                            if (response === 'success') {
                                Swal.fire('댓글이 삭제되었습니다.').then(function() {
                                    const originalContent = $reply.find('.reply-content').text();
                                    $reply.find('.reply-content').html('<font style="color: red;">(' + originalContent + ' - 삭제되었습니다.)</font>');
                                    window.reload();
                                });
                            } else {
                                Swal.fire('댓글 삭제에 실패했습니다.');
                            }
                        },
                        error: function(error) {
                            console.error('Error:', error);
                            Swal.fire('댓글 삭제에 실패했습니다.');
                        }
                    });
                }
            });
        });
        
        // CK에디터
        CKEDITOR.replace('communityContent', {
            filebrowserUploadUrl: '${pageContext.request.contextPath}/imageUpload?${_csrf.parameterName}=${_csrf.token}', // 이미지 업로드를 처리할 URL
        });
        CKEDITOR.config.height = "500px"; // CK에디터 크기 키워주기
        
    });
</script>