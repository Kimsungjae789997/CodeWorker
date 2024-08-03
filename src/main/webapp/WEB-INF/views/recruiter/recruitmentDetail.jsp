<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>



                            <div class="card custom-card" style="width: 80%; margin-left: 320px; margin-top: 120px;">
                                <div class="card-header justify-content-between">
                                    <h2 style="font-weight: bold;">채용 상세</h2>
                                    <div class="prism-toggle">
                                        <button class="btn btn-sm btn-primary-light" style="width: 150px; height: 50px; font-weight: bold; font-size: 15px;">공고파일 보기 </button>
                                    </div>
                                </div>
                                <div class="card-body" style="height: 720px;">
                                
                                <form action="/recruitmentmanage/update1.do" method="post"  id="manageForm">
                               		<input type="hidden" value="${recVO.recNtcId}" name="recNtcId">
                                    <div class="row"  style="height: 700px;">
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label" style="font-weight: bold; font-size: 15px;">공고제목</label>
                                            <input type="text" class="form-control" style="height: 50px;" value="${recVO.recNtcTitle }" readonly="readonly">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                             <label class="form-label" style="font-weight: bold; font-size: 15px;">학력제한</label>
                                            <input type="text" class="form-control"  style="height: 50px;" value="${recVO.eduCode }" readonly="readonly">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label" style="font-weight: bold; font-size: 15px;">경력제한</label>
                                            <input type="text" class="form-control" style="height: 50px;" value="${recVO.experienceCode}" readonly="readonly">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                             <label class="form-label" style="font-weight: bold; font-size: 15px;">고용형태</label>
                                            <input type="text" class="form-control"  style="height: 50px;" value="${recVO. workingTypeCode}" readonly="readonly">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label" style="font-weight: bold; font-size: 15px;">근무지</label>
                                            <input type="text" class="form-control" style="height: 50px;" value="${recVO.workingLocCode }" readonly="readonly">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                             <label class="form-label" style="font-weight: bold; font-size: 15px;">연봉</label>
                                            <input type="text" class="form-control"  style="height: 50px;" value="${recVO.salaryRangeCode }" readonly="readonly">
                                        </div>
                                         <div class="col-md-6 mb-3">
                                            <label class="form-label" style="font-weight: bold; font-size: 15px;">담당자 이름</label>
                                            <input type="text" class="form-control" style="height: 50px;" value="${recVO.rcrtName }" readonly="readonly">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                             <label class="form-label" style="font-weight: bold; font-size: 15px;">담당자 이메일</label>
                                            <input type="text" class="form-control"  style="height: 50px;" value="${recVO.rcrtEmail }" readonly="readonly">
                                        </div>                                                                         
                                        
                                        <div class="col-md-6 mb-3">
                                            <label class="form-label" style="font-weight: bold; font-size: 15px;">담당자 전화번호</label>
                                            <input type="text" class="form-control" style="height: 50px;" value="${recVO.rcrtTel }" readonly="readonly">
                                        </div>
                                        <div class="col-md-6 mb-3">
                                             <label class="form-label" style="font-weight: bold; font-size: 15px;">우대 기술스택</label>
                                            <input type="text" class="form-control"  style="height: 50px;" value="${skill }" readonly="readonly">                                            
                                        </div>                                                                                    
                                        <div class="col-md-6 mb-3">
                                             <label class="form-label" style="font-weight: bold; font-size: 15px;">채용 URL</label>
                                            <input type="text" class="form-control"  style="height: 50px;" value="${corVO.crpUrl }" readonly="readonly">
                                        </div>                                  
                                         <div style="display: flex; justify-content: end;">                                    
											&nbsp;&nbsp;
	                                          <div class="">
	                                            <button type="button" class="btn btn-primary" id="deleteBtn">삭제</button>
	                                        </div>
                                        </div>
                                    </div>
                                 </form>
                            </div>
                           <div class="card-footer d-none border-top-0">
                           </div>
                       </div>
<script>
$(function(){
	
	// 삭제 버튼 누르기
	$('#deleteBtn').on('click',function(){
		$('#manageForm').attr('action', '/recruitmentmanage/delete.do');
		$('#manageForm').submit();
	});
});
</script>
