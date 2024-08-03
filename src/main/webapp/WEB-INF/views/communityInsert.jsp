<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<style>
	.main-content{
		margin-block-start: 0.8rem;
    	margin-inline-start: 2em;
	}
	
	.card-footer{
		margin-inline-start: auto;
	}
	
	.col-xl-20{
		border: 2px solid #deddf0;
		border-radius: 10px;
	}
</style>

<div class="page">
	<div class="main-content app-content">
		<div class="container-lg my-5 mt-7">
			<div class="row">
				<div class="col-xl-20">
					<div class="row">
						<div class="col-xl-12">
							<div class="card custom-card mt-0">
								<div class="card-header">
									<div class="card-title">CODE WORKER Free Board</div>
								</div>
								<div class="card-body">
									<form action="/communityInsert" method="post" enctype="multipart/form-data">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
										<div class="row gy-3">
											<div class="col-xl-12">
												<label for="communityTitle" class="form-label">제목</label> 
												<input type="text" class="form-control" name="communityTitle" id="communityTitle" placeholder="제목을 입력해주세요" required>
											</div>
											<div class="col-xl-12">
												<label for="communityContent" class="form-label">내용</label>
												<textarea class="form-control" name="communityContent" id="communityContent" rows="5" placeholder="내용을 입력해주세요" required></textarea>
											</div>
										</div>   
										<div class="card-footer">
											<div class="text-end">
												<button type="button" class="btn btn-light btn-wave" id="autoBtn1">자동완성</button>
												<button type="submit" class="btn btn-primary-light">등록</button>
												<button type="button" class="btn btn-secondary-light" onclick="javascript:location.href='/communityMainList'">취소</button>
											</div>
										</div>
										<sec:csrfInput/>
									</form>
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
	// CK에디터
    CKEDITOR.replace('communityContent', {
        filebrowserUploadUrl: '${pageContext.request.contextPath}/imageUpload?${_csrf.parameterName}=${_csrf.token}', // 이미지 업로드를 처리할 URL
    });
    CKEDITOR.config.height = "500px"; // CK에디터 크기 키워주기	
   // communityTitle  communityContent
    $('#autoBtn1').on('click',function(){
    	$('#communityTitle').val("우아한형제들 코딩테스트 후기");
    	 CKEDITOR.instances.communityContent.setData("저 오늘 3문제 다 풀었는데 합격 가능하겠죠???? 다들 어떠셨는지 공유좀 해주세요 제발~~");
    });
});
</script>