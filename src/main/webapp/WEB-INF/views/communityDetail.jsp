<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>
    .main-content {
        margin-block-start: 0.8rem;
        margin-inline-start: 2em;
    }

    .card-footer {
        margin-inline-start: auto;
    }

    .col-xl-12 {
        border: 2px solid #deddf0;
        border-radius: 10px;
    }

    /* 댓글 목록 위,옆 줄 투명하게  */
    #replyForm {
        border-top: transparent;
        border-left: transparent;
        border-right: transparent;
    }

    .edit-form {
        display: none;
    }

	.card-header{
	    display: flex;
	    justify-content: flex-end;
	    align-items: center;
	    flex-direction: row;
	    gap: 5px;
	}
	
	#confirmCheck{
        width: 20px;
        height: 20px;
        border: 1px solid #000; /* 테두리를 진하게 */
        vertical-align: bottom;
	}
	
	
	.reply .reply {
	    margin-left: 50px; /* 들여쓰기 */
	    position: relative;
	}
	
	.reply .reply::before {
	    position: absolute;
	    left: -20px; /* 기호 위치 조정 */
	    top: 0;
	}
	
    .user-info {
       display: none;
       position: absolute;
       background-color: white;
       box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
       z-index: 1000;
       padding: 10px;
    }

    .user-info.show {
        display: block;
    }
	
</style>

<div class="page">
	<div class="main-content app-content">
		<div class="card-header mt-5">
			<!-- 로그인 했다면 -->
			<sec:authorize access="isAuthenticated()">
				<sec:authentication property="principal.member" var="member" />
			</sec:authorize>
			<button type="button" class="btn btn-light btn-wave fw-normal mb-0" onclick="javascript:location.href='/communityMainList'">◀ 전체 게시글</button>
			<c:if test="${communityMainDetail.memId == member.memId}">
				<button type="button" id="editBtn" class="btn btn-primary-light btn-wave">수정</button>
				<button type="button" id="delBtn" class="btn btn-danger-light btn-wave">삭제</button>
			</c:if>
		</div>
		<div class="container-lg my-5 mt-5">
			<div class="row">
				<div class="col-xl-20">
					<div class="row">
						<div class="col-xl-12">
							<div class="card custom-card">
								<div class="card-body">
									<div class="card-title">
<%-- 										<sec:authorize access="isAuthenticated() and hasRole('ROLE_SEEKER')"> --%>
<%-- 											<c:if test="${communityMainDetail.memId != member.memId}"> --%>
<!-- 												<i class="ri-alarm-warning-line report-icon"  -->
<%-- 													style="float: right; font-size: 20px; cursor:pointer; color: ${communityMainDetail.communityWarnYN == 'Y' ? 'red' : 'black'};" --%>
<%-- 													data-comm-no="${communityMainDetail.communityNo}"></i> --%>
<%-- 											</c:if> --%>
<%-- 										</sec:authorize> --%>
										<sec:authorize access="isAuthenticated() and hasRole('ROLE_SEEKER')">
										    <c:if test="${communityMainDetail.memId != member.memId}">
										        <div class="report-icon-container">
										            <i class="ri-alarm-warning-line report-icon" 
										                style="float: right; font-size: 20px; cursor:pointer; color: ${communityMainDetail.communityWarnYN == 'Y' ? 'red' : 'black'};"
										                data-comm-no="${communityMainDetail.communityNo}"></i>
										            <c:if test="${communityMainDetail.communityWarnYN == 'Y'}">
										                <div class="report-tooltip"><font style="color:red; font-size:20px; float:right;">신고된 게시글입니다</font></div>
										            </c:if>
										        </div>
										    </c:if>
										</sec:authorize>
<%-- 										<sec:authorize access="!isAuthenticated() or !hasRole('ROLE_SEEKER')"> --%>
<!-- 											<i class="ri-alarm-warning-line report-icon-disabled" -->
<%-- 												style="float: right; font-size: 20px; cursor:pointer; color: ${communityMainDetail.communityWarnYN == 'Y' ? 'red' : 'black'};" --%>
<!-- 												onclick="alert('로그인시 이용가능한 서비스입니다'); return false;"></i> -->
<%-- 										</sec:authorize> --%>
<sec:authorize access="!isAuthenticated() or !hasRole('ROLE_SEEKER')">
    <i class="ri-alarm-warning-line report-icon-disabled"
        style="float: right; font-size: 20px; cursor:pointer; color: ${communityMainDetail.communityWarnYN == 'Y' ? 'red' : 'black'};"
        onclick="Swal.fire('로그인시 이용가능한 서비스입니다'); return false;"></i>
</sec:authorize>
										<h5 class="fw-semibold mb-1">${communityMainDetail.communityTitle }</h5>
									</div>
									<div class="d-sm-flex align-items-cneter">
									    <div class="d-flex align-items-center flex-fill">
									        <div>
									            <h6 class="mb-1 text-muted fw-semibold">
									                <a href="#" class="user-id" data-id="${communityMainDetail.memId}">
									                    ${communityMainDetail.memName} (${communityMainDetail.memId})
									                </a>
									            </h6>
									            <div class="user-info" id="userInfo${communityMainDetail.memId}">
									                <a class="dropdown-item" href="/communityUserPost?memId=${communityMainDetail.memId}">작성글내역보기</a>
									            </div>
									            <h6 class="mb-0">${communityMainDetail.communityRegDate}</h6>
									        </div>
									    </div>
									</div>
								</div>
								<div class="card-body">
									<p class="mb-4 fs-6 mb-0">${communityMainDetail.communityContent }</p>
								</div>
							</div>
						</div>
						<div class="col-xl-12">
							<div class="card custom-card">
								<div class="card-body">
									<div class="row gy-3">
										<!-- 댓글 등록 -->
										<div class="col-xl-12">
											<input type="hidden" id="communityNo" value="${communityMainDetail.communityNo}" />
											<textarea class="form-control mb-4 mt-4" id="blog-comment" rows="5" placeholder="댓글을 입력해주세요"></textarea>
											<div class="text-end">
												<sec:authorize access="isAuthenticated()">
													<button class="btn btn-primary-light mb-3" id="submitReply">등록</button>
													<button class="btn btn-danger-light mb-3">취소</button>
												</sec:authorize>
											</div>
										</div>

										<!-- 댓글 / 대댓글 목록 -->
										<div class="col-xl-12 mt-4">
									    <label for="blog-comment" class="form-label mt-2">댓글 <font style="color: #888; font-size: 12px;">전체 (${communityMainReply.size()}건)</font></label>
									    <c:if test="${not empty communityMainReply}">
									        <c:forEach items="${communityMainReply}" var="reply">
									            <c:if test="${reply.level < 2}">
									                <div class="reply form-control mb-4" id="replyForm" data-reply-no="${reply.commReplyNo}">
									                    <div class="reply-author">
									                        <font style="font-weight: bold;">${reply.memName}</font>(${reply.memId})
									                    </div>
									                    <div class="reply-content">
									                        <c:choose>
									                            <c:when test="${reply.commReplyDelYN eq 'Y'}">
									                                <font style="color: red;">관리자에 의해 삭제된 댓글입니다.</font>
									                            </c:when>
									                            <c:otherwise>
									                                ${reply.commReplyContent}
									                            </c:otherwise>
									                        </c:choose>
									                    </div>
									                    <div class="reply-date">${reply.commReplyRegDate}</div>
									                    <sec:authorize access="isAuthenticated()">
									                        <c:if test="${reply.memId == member.memId}">
									                            <button class="btn btn-sm btn-primary-light edit-reply-btn" data-reply-no="${reply.commReplyNo}">수정</button>
									                            <button class="btn btn-sm btn-danger-light delete-reply-btn" data-reply-no="${reply.commReplyNo}">삭제</button>
									                            <button class="btn btn-sm btn-secondary-light reply-btn" data-reply-no="${reply.commReplyNo}">답글</button>
									                        </c:if>
									                        <c:if test="${reply.memId != member.memId}">
									                            <button class="btn btn-sm btn-secondary-light reply-btn" data-reply-no="${reply.commReplyNo}">답글</button>
									                        </c:if>
									                    </sec:authorize>
									                    <div class="reply-form" id="reply-form-${reply.commReplyNo}" style="display: none;">
									                        <textarea class="form-control mb-2" rows="3"></textarea>
									                        <button class="btn btn-primary-light submit-reply-btn" data-reply-no="${reply.commReplyNo}">등록</button>
									                        <button class="btn btn-danger-light cancel-reply-btn">취소</button>
									                    </div>
									                    <!-- 대댓글 컨테이너 -->
									                    <div class="replies-container" id="replies-container-${reply.commReplyNo}">
									                        <c:forEach items="${communityMainReply}" var="rereply">
									                            <c:if test="${rereply.parentReplyNo == reply.commReplyNo && rereply.level > 1}">
									                                <div class="reply form-control mb-3" id="replyForm" data-reply-no="${rereply.commReplyNo}" style="margin-left: 5%; width: 90%;">
									                                    <div class="reply-author"><font style="font-weight: bold;">${rereply.memName}</font>(${rereply.memId})</div>
									                                    <div class="reply-content"><i class="ri-corner-down-right-fill"></i>${rereply.commReplyContent}</div>
									                                    <div class="reply-date">${rereply.commReplyRegDate}</div>
									                                    <sec:authorize access="isAuthenticated()">
									                                        <c:if test="${rereply.memId == member.memId}">
									                                            <button class="btn btn-sm btn-primary-light edit-reply-btn" data-reply-no="${rereply.commReplyNo}">수정</button>
									                                            <button class="btn btn-sm btn-danger-light delete-reply-btn" data-reply-no="${rereply.commReplyNo}">삭제</button>
									                                        </c:if>
									                                    </sec:authorize>
									                                </div>
									                            </c:if>
									                        </c:forEach>
									                    </div>
									                </div>
									            </c:if>
									        </c:forEach>
									    </c:if>
									    <c:if test="${empty communityMainReply}">
									        <p>댓글이 없습니다.</p>
									    </c:if>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- 게시글 수정  -->
					<div class="row">
						<div class="col-xl-12 edit-form">
							<div class="card custom-card">
								<div class="card-body">
									<div class="card-title">
										<input type="text" class="form-control" id="editTitle"
											value="${communityMainDetail.communityTitle}">
									</div>
									<div class="d-sm-flex align-items-cneter">
										<div class="d-flex align-items-center flex-fill">
											<div>
												<h6 class="mb-1 text-muted fw-semibold">${communityMainDetail.memId }</h6>
												<h6 class="mb-0 text-muted">${communityMainDetail.communityRegDate }</h6>
											</div>
										</div>
									</div>
								</div>
								<div class="card-body">
									<textarea class="form-control" id="editContent" rows="10">${communityMainDetail.communityContent}</textarea>
									<input type="hidden" id="editCommunityNo"
										value="${communityMainDetail.communityNo}" />
									<div class="text-end mt-3">
										<button class="btn btn-primary-light" id="saveEdit">등록</button>
										<button class="btn btn-danger-light" id="cancelEdit" onclick="location.href='/communityMainList'">취소</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>


<!-- 신고 하기 버튼 클릭시 뜨는 신고사유 입력 모달창 -->
<div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
    <input type="hidden" id="commNo" value=""/>
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header" style="background-color: rgba(137, 32, 173, 0.1);">
                <h6 class="modal-title" id="reportModalLabel">신고하기</h6>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row mb-3">
                    <label for="complaintReason" class="col-sm-3 col-form-label">신고 사유 선택</label>
                    <div class="col-sm-9">
                        <select id="complaintReason" name="complaintReason" class="form-control">
                            <option value="욕설/혐오">욕설/혐오</option>
                            <option value="광고/스팸">광고/스팸</option>
                            <option value="음란/공연질서 문란">음란/공연질서 문란</option>
                        </select>
                    </div>
                </div>
                <div class="row mb-3">
                    <label for="complaintContent" class="col-sm-3 col-form-label">신고 상세 사유</label>
                    <div class="col-sm-9">
                        <textarea id="complaintContent" name="complaintContent" class="form-control" rows="3"></textarea>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-sm-12" style="text-align:center; font-weight: bold;">
                        <p class="fw-bolder me-2" style="color: red; font-size: 1.2em;">허위신고시 사이트 이용에 제한사항이 있을 수 있습니다.</p>
                        <label for="confirmCheck" style="font-size: 1.2em;">위 내용을 확인하였습니다.</label>
                        <input type="checkbox" id="confirmCheck" name="confirmCheck">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-light btn-wave" id="autoBtn1">자동완성</button>
                <button type="button" class="btn btn-primary" id="submitReport">등록</button>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
$(document).ready(function() {
    // 내 게시글 수정 버튼 클릭 이벤트
    $('#editBtn').click(function() {
        $('.col-xl-12').hide();
        $('.edit-form').show();
    });

    // 수정 등록 버튼 클릭 이벤트
    $('#saveEdit').click(function() {
        var communityNo = $('#editCommunityNo').val(); // 수정 폼에서 communityNo 값을 가져옴
        var communityTitle = $('#editTitle').val();
        //var communityContent = $('#editContent').val();
        var communityContent = CKEDITOR.instances.editContent.getData();

        if (communityTitle.trim() === '') {
            Swal.fire('제목을 입력하세요.');
            return;
        }
        
        if(communityContent.trim() === ''){
            Swal.fire('내용을 입력하세요.');
            return;
        }

        var updateData = {
            communityNo: communityNo,
            communityTitle: communityTitle,
            communityContent: communityContent,
            memId: "${member.memId}"
        };

        $.ajax({
            url: '/communityUpdate',
            type: 'POST',
            contentType: 'application/json;charset=utf-8',
            data: JSON.stringify(updateData),
            dataType: 'text',
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(response) {
                if (response === 'success') {
                    Swal.fire('게시글이 수정되었습니다.').then(function() {
                        location.reload();
                    });
                } else {
                    Swal.fire('게시글 수정에 실패했습니다.');
                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                Swal.fire('게시글 수정 중 오류가 발생했습니다.');
            }
        });
    });

    
 	// 게시글 삭제 버튼 클릭 이벤트
    $('#delBtn').click(function() {
        Swal.fire({
            title: '정말 삭제하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: '삭제',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                var communityNo = $('#communityNo').val();
                var deleteData = {
                    communityNo: communityNo,
                    memId: "${member.memId}"
                };

                $.ajax({
                    url: '/communityDelete',
                    type: 'POST',
                    contentType: 'application/json;charset=utf-8',
                    data: JSON.stringify(deleteData),
                    dataType: 'text',
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                    },
                    success: function(response) {
                        if (response === 'success') {
                            Swal.fire('게시글이 삭제되었습니다.').then(function() {
                                window.location.href = '/communityMainList';
                            });
                        } else {
                            Swal.fire('게시글 삭제에 실패했습니다.');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error:', error);
                        Swal.fire('게시글 삭제 중 오류가 발생했습니다.');
                    }
                });
            }
        });
    });
    
    // 댓글 등록 버튼 클릭 이벤트
    $('#submitReply').click(function() {
        var communityNo = $('#communityNo').val();
        var commReplyContent = $('#blog-comment').val();

        if (commReplyContent.trim() === '') {
            Swal.fire('댓글 내용을 입력하세요.');
            return;
        }

        var replyData = {
            communityNo: communityNo,
            commReplyContent: commReplyContent,
            memId: "${member.memId}"
        };

        $.ajax({
            url: '/addReply',
            type: 'POST',
            contentType: 'application/json;charset=utf-8',
            data: JSON.stringify(replyData),
            dataType: "text",
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(response) {
                if (response === 'success') {
                    Swal.fire('댓글이 등록되었습니다.').then(function() {
                        location.reload();
                    });
                } else {
                    Swal.fire('댓글 등록에 실패했습니다.');
                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                Swal.fire('댓글 등록 중 오류가 발생했습니다.');
            }
        });
    });

    
    // 댓글 수정 버튼 클릭 이벤트
    $('.edit-reply-btn').on('click', function() {
        var replyNo = $(this).data('reply-no');
        var replyContent = $(this).closest('.reply').find('.reply-content').text().trim();
        var editTextArea = `<textarea class="form-control edit-textarea" rows="3">\${replyContent}</textarea>`;
        var updateButton = `<button class="btn btn-primary-light update-reply-btn" data-reply-no="\${replyNo}">저장</button>`;
        var cancelButton = `<button class="btn btn-danger-light cancel-update-btn ml-10">취소</button>`;
        $(this).closest('.reply').find('.reply-content').html(editTextArea + updateButton + cancelButton);
    });

    // 댓글 수정 저장 버튼 클릭 이벤트
    $(document).on('click', '.update-reply-btn', function() {
        var replyNo = $(this).data('reply-no');
        var updatedContent = $(this).closest('.reply').find('.edit-textarea').val().trim();
        if (updatedContent === '') {
            Swal.fire('댓글 내용을 입력하세요.');
            return;
        }

        var updateData = {
            commReplyNo: replyNo,
            commReplyContent: updatedContent,
            memId: "${member.memId}"
        };
        
        $.ajax({
            url: '/updateReply',
            type: 'POST',
            contentType: 'application/json;charset=utf-8',
            data: JSON.stringify(updateData),
            dataType: 'text',
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(response) {
                if (response === 'success') {
                    Swal.fire('댓글이 수정되었습니다.').then(function() {
                        location.reload();
                    });

                } else {
                    Swal.fire('댓글 수정에 실패했습니다.');
                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                Swal.fire('댓글 수정 중 오류가 발생했습니다.');
            }
        });
    });

    // 댓글 수정 취소 버튼 클릭 이벤트
    $(document).on('click', '.cancel-update-btn', function() {
        location.reload();
    });

 	// 댓글 삭제 버튼 클릭 이벤트
    $(document).on('click', '.delete-reply-btn', function() {
        var replyNo = $(this).data('reply-no');
        Swal.fire({
            title: '정말 삭제하시겠습니까?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: '삭제',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                var deleteData = {
                    commReplyNo: replyNo,
                    memId: "${member.memId}"
                };

                $.ajax({
                    url: '/deleteReply',
                    type: 'POST',
                    contentType: 'application/json;charset=utf-8',
                    data: JSON.stringify(deleteData),
                    dataType: 'text',
                    beforeSend: function(xhr) {
                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
                    },
                    success: function(response) {
                        if (response === 'success') {
                            Swal.fire('댓글이 삭제되었습니다.').then(function() {
                                location.reload();
                            });
                        } else {
                            Swal.fire('댓글 삭제에 실패했습니다.');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.error('Error:', error);
                        Swal.fire('댓글 삭제 중 오류가 발생했습니다.');
                    }
                });
            }
        });
    });
    
    
    // 대댓글 버튼 클릭 이벤트
    $(document).on('click', '.reply-btn', function() {
        var replyNo = $(this).data('reply-no');
        $('#reply-form-' + replyNo).toggle();
    });

    // 대댓글 등록 버튼 클릭 이벤트
    $(document).on('click', '.submit-reply-btn', function() {
        var replyNo = $(this).data('reply-no');
        var replyContent = $(this).closest('.reply-form').find('textarea').val().trim();

        if (replyContent === '') {
            Swal.fire('답글 내용을 입력하세요.');
            return;
        }

        var replyData = {
            communityNo: $('#communityNo').val(),
            parentReplyNo: replyNo,
            commReplyContent: replyContent,
            memId: "${member.memId}"
        };

        $.ajax({
            url: '/addRereply',
            type: 'POST',
            contentType: 'application/json;charset=utf-8',
            data: JSON.stringify(replyData),
            dataType: "text",
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(response) {
                if (response === 'success') {
                    Swal.fire('답글이 등록되었습니다.').then(function() {
                        location.reload();
                    });
                    // 대댓글을 동적으로 추가
                    var currentDate = new Date().toLocaleString();
                    var newReply =
                        `<div class="reply form-control mb-4" id="replyForm" data-reply-no="\${replyNo}">
                            <div class="reply-author"><font style="font-weight: bold;">\${member.memName}</font> (\${member.memId})</div>
                            <div class="reply-content"><i class="fas fa-reply" style="color: gray;"></i> \${replyContent}</div>
                            <div class="reply-date">\${currentDate}</div>
                            <button class="btn btn-sm btn-primary-light edit-reply-btn" data-reply-no="\${replyNo}">수정</button>
                            <button class="btn btn-sm btn-danger-light delete-reply-btn" data-reply-no="\${replyNo}">삭제</button>
                        </div>`;
                    // 대댓글을 해당 댓글의 대댓글 컨테이너에 삽입
                    $('#replies-container-' + replyNo).append(newReply);
                    $('#reply-form-' + replyNo).hide();
                    
                } else {
                    Swal.fire('답글 등록에 실패했습니다.');
                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                Swal.fire('답글 등록 중 오류가 발생했습니다.');
            }
        });
    });

    // 대댓글 취소 버튼 클릭 이벤트
    $(document).on('click', '.cancel-reply-btn', function() {
        $(this).closest('.reply-form').hide();
    });
    
    
    // 대댓글 수정 버튼 클릭 이벤트
    $(document).on('click', '.edit-rereply-btn', function() {
        var replyNo = $(this).data('reply-no');
        var parentReplyNo = $(this).closest('.reply').data('parent-reply-no');
        var replyContent = $(this).closest('.reply').find('.reply-content').text().trim();
        var editTextArea = `<textarea class="form-control edit-textarea" rows="3">\${replyContent}</textarea>`;
        var updateButton = `<button class="btn btn-primary-light update-rereply-btn" data-reply-no="\${replyNo}" data-parent-reply-no="\${parentReplyNo}">저장</button>`;
        var cancelButton = `<button class="btn btn-danger-light cancel-update-btn ml-10">취소</button>`;
        $(this).closest('.reply').find('.reply-content').html(editTextArea + updateButton + cancelButton);
    });

    // 대댓글 수정 저장 버튼 클릭 이벤트
    $(document).on('click', '.update-rereply-btn', function() {
        var replyNo = $(this).data('reply-no');
        var parentReplyNo = $(this).data('parent-reply-no');
        var updatedContent = $(this).closest('.reply').find('.edit-textarea').val().trim();
        if (updatedContent === '') {
            Swal.fire('댓글 내용을 입력하세요.');
            return;
        }

        var updateData = {
            commReplyNo: replyNo,
            commReplyContent: updatedContent,
            memId: "${member.memId}",
            parentReplyNo: parentReplyNo
        };

        $.ajax({
            url: '/updateRereply',
            type: 'POST',
            contentType: 'application/json;charset=utf-8',
            data: JSON.stringify(updateData),
            dataType: 'text',
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(response) {
                if (response === 'success') {
                    Swal.fire('댓글이 수정되었습니다.').then(function() {
                        location.reload();
                    });
                } else {
                    Swal.fire('댓글 수정에 실패했습니다.');
                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                Swal.fire('댓글 수정 중 오류가 발생했습니다.');
            }
        });
    });
    
    
    
    // CK에디터
    CKEDITOR.replace('editContent', {
        filebrowserUploadUrl: '${pageContext.request.contextPath}/imageUpload?${_csrf.parameterName}=${_csrf.token}', // 이미지 업로드를 처리할 URL
    });
    CKEDITOR.config.height = "500px"; // CK에디터 크기 키워주기
    
    
    // 신고하기 아이콘 클릭 이벤트
    $('.report-icon').on('click', function() {
        var communityNo = $(this).data("comm-no");
        $('#reportModal').find("#commNo").val(communityNo);
        $('#reportModal').modal('show');
    });

    // 신고 모달창 체크박스 이벤트
    $('#confirmCheck').on('change', function(){
        $('#submitReport').prop('disabled', !this.checked);
    });
    
    $('#submitReport').prop('disabled', true);
    
    // 신고 등록 버튼 클릭 이벤트
    $('#submitReport').on('click', function() {
        var communityNo = $('#commNo').val();
        var complaintReason = $('#complaintReason').val();
        var complaintContent = $('#complaintContent').val();

        if (complaintReason.trim() === '') {
            Swal.fire('신고 사유를 선택하세요.');
            return;
        }

        if (complaintContent.trim() === '') {
            Swal.fire('신고 상세 사유를 입력하세요.');
            return;
        }

        var reportData = {
            communityNo: communityNo,
            complaintReason: complaintReason,
            complaintContent: complaintContent,
            memId: "${member.memId}"
        };
        
        $.ajax({
            url: '/reportCommunity',
            type: 'POST',
            contentType: 'application/json;charset=utf-8',
            data: JSON.stringify(reportData),
            beforeSend: function(xhr) {
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
            success: function(response) {
                if (response === 'success') {
                    Swal.fire('신고가 접수되었습니다.').then(function() {
                        $('#reportModal').modal('hide');
                        // 신고 아이콘 색상 변경
                        var reportIcon = $('.report-icon[data-comm-no="' + communityNo + '"]');
                        reportIcon.css('color', 'red');
                        if (!reportIcon.siblings('.report-tooltip').length) {
                            reportIcon.after('<div class="report-tooltip">신고된 게시글입니다</div>');
                        }
                        location.reload();
                    });
                } else {
                    Swal.fire('신고 접수에 실패했습니다.');
                }
            },
            error: function(xhr, status, error) {
                console.error('Error:', error);
                Swal.fire('신고 접수 중 오류가 발생했습니다.');
            }
        });
    });
    
    
    
    // 회원 아이디 클릭 이벤트
    $(document).on('click', '.user-id', function(event) {
        event.preventDefault();
        const userId = $(this).data('id');
        const userInfo = $('#userInfo' + userId);
        $('.user-info').not(userInfo).hide(); // 다른 정보 숨기기
        userInfo.toggle(); // 현재 정보 토글
    });

    // 페이지 클릭 시 정보 숨기기
    $(document).on('click', function(event) {
        if (!$(event.target).closest('.user-id, .user-info').length) {
            $('.user-info').hide();
        }
    });
    
    $('#autoBtn1').on('click',function(){
    	$('#complaintContent').val("게시글 제목과는 다른 광고내용들이 입력되어 있습니다. 신고처리해주세요!!!");
    })
});
</script>