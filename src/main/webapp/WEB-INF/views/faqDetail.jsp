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
								자주 묻는 질문
							</div>
							<div class="card-body">
								<div class="row gy-3">
									<div class="col-xl-12">
										<label for="blog-first-name" class="form-label"></label> 
										<input type="text" class="form-control" name="boardTitle" id="boardTitle" value="${faqDetail.boardTitle }" readonly="readonly" style="border: none; font-size:25px; font-weight: bolder;">
									</div>

									<div class="col-xl-12">
										<label for="blog-comment" class="form-label"></label>
										<div class="form-control" name="boardContent" id="boardContent" style="height:auto; border: none;">${faqDetail.boardContent }</div>
									</div>
								</div>
							</div>
							<div class="card-footer">
								<div class="text-end">
									<button class="btn btn-primary-light" onclick="javascript:location.href='/faqMain'">목록</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>