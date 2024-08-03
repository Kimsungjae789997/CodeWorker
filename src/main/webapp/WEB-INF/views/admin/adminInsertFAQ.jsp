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
        <div class="row">
            <div class="col-xl-12">
                <div class="card custom-card mt-0">
                    <div class="card-header">
                        <div class="card-title">
                            	FAQ 등록
                        </div>
                    </div>
                    <div class="card-body">
                        <sec:authorize access="hasRole('ROLE_ADMIN')">
                            <form action="/admin/faqInsert" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <div class="row gy-3">
                                    <div class="col-xl-6">
                                        <label for="boardTitle" class="form-label">제목</label>
                                        <input type="text" class="form-control" name="boardTitle" id="boardTitle" required>
                                    </div>
                                    <div class="col-xl-6">
                                        <label for="boardTargetCode" class="form-label">타겟</label>
                                        <select class="form-select" name="boardTargetCode" id="boardTargetCode" required>
                                            <option value="TAR0101">기업회원</option>
                                            <option value="TAR0102">구직회원</option>
                                        </select>
                                    </div>
                                    <div class="col-xl-12">
                                        <label for="boardContent" class="form-label">내용</label>
                                        <textarea class="form-control" name="boardContent" id="boardContent" rows="5" required></textarea>
                                    </div>
                                </div>
                                <div class="card-footer">
                                    <div class="text-end">
                                        <button type="submit" class="btn btn-primary-light">저장</button>
                                        <button type="button" class="btn btn-secondary-light" onclick="javascript:location.href='/admin/faqList'">취소</button>
                                    </div>
                                </div>
                            </form>
                        </sec:authorize>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$(document).ready(function() {
	// CK에디터
    CKEDITOR.replace('boardContent', {
        filebrowserUploadUrl: '${pageContext.request.contextPath}/imageUpload?${_csrf.parameterName}=${_csrf.token}', // 이미지 업로드를 처리할 URL
    });
    CKEDITOR.config.height = "500px"; // CK에디터 크기 키워주기	
});
</script>