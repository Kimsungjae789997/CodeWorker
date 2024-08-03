<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<head>
<style>
.paging {
    display: flex;
    justify-content: center; /* 가로로 가운데 정렬 */
    align-items: center; /* 세로로 가운데 정렬 (필요시 사용) */
    height: 100%; /* 필요시 높이 설정 */
}
.recruiter-main-card{
	min-height : 600px;
}
</style>
</head>

<!-- app-content 넣는 부분 시작 -->
<!-- Start::app-content -->
      <div class="main-content app-content">
          <div class="container-fluid">

              <!-- Page Header -->
              <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
                  <h1 class="page-title fw-semibold fs-21 mb-0"></h1>
              </div>
              <!-- Page Header Close -->

              <!-- Start::row-2 -->
              <div class="row">
                  <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-12">
                      <div class="card custom-card">
                          <div class="card-header">
                              <div class="card-title">
                                  	자주묻는질문
                              </div>
                          </div>
                          <div class="card-body py-4 px-0">
                              <div id="jobs-summary" style="text-align: center;"><a href="#"><img src="${pageContext.request.contextPath }/resources/assets/images/recruiter/corp-faq-ex-white.png" alt="corp-faq-ex-white.png"></a></div>
                          </div>
                      </div>
                  </div>
                  <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-12">
                      <div class="card custom-card">
                          <div class="card-header">
                              <div class="card-title">
                                  	공지사항
                              </div>
                          </div>
                          <div class="card-body py-4 px-0">
                              <div id="jobs-summary" style="text-align: center;"><a href="#"><img src="${pageContext.request.contextPath }/resources/assets/images/recruiter/corp-notice-ex.png" alt="corp-notice-ex.png"></a></div>
                          </div>
                      </div>
                  </div>
                  
              </div>
              <!-- End::row-2 -->
		
		<!-- Start::row-3 -->
              <div class="row">
              	<!-- 진행중인 공고 목록 부분 시작 -->
              	<div class="col-xxl-6 col-xl-6 col-lg-6 col-md-12">
                      <div class="card custom-card recruiter-main-card">
                          <div class="card-header justify-content-between flex-wrap">
                              <!-- 전체 건수 출력 -->
                              <c:set value="${pagingVOA.totalRecord }" var="totalRecord" />
                              <div class="card-title">
                                 	진행 중인 채용 <font style="font-weight:bold;">: 총 ${totalRecord }건</font>
                              </div>
                              <!-- 전체 건수 출력 끝 -->
                              
                              <!-- 채용공고 목록 페이지로 이동 -->
                              <div class="d-flex flex-wrap gap-2">
                              	<button type="button" class="btn btn-primary-light btn-wave" id="recNtcMoreBtn">더보기</button>
                              </div>

                          </div>
                          
                          <div class="card-body">
                              <div class="table-responsive">
                                  <table class="table table-hover text-nowrap table-bordered">
                                      <thead>
                                          <tr>
                                              <th scope="col">No</th>
                                              <th scope="col">공고 제목</th>
                                              <th scope="col">마감일자</th>
                                              <th scope="col">상태</th>
                                              <th scope="col">지원자 수</th>
                                          </tr>
                                      </thead>
                           		<c:set value="${pagingVOA.dataList }" var="recNotice" />
                           		<c:choose>
                           			<c:when test="${empty recNotice}">
                           				<tbody>
                           					<tr>
												<td colspan="4">현재 진행 중인 채용이 없습니다.</td>                            		
                           					</tr>
                           				</tbody>
                           			</c:when>
                           			<c:otherwise>
                           				<c:forEach items="${recNotice }" var="recNtc">
											<tbody>
											<tr>
												<%-- <td>${recNtc.recNtcId }</td> --%>
												<td>${recNtc.rnum }</td>
												<td><a href="#">${recNtc.recNtcTitle }</a></td>
												<td>${recNtc.recNtcEnd }</td>
												<c:choose>
                                                    <c:when test="${recNtc.status eq '공고대기중'}">
                                                        <td><span class="badge rounded-pill bg-primary-transparent">${recNtc.status }</span></td>
                                                    </c:when>
                                                    <c:when test="${recNtc.status eq '공고마감'}">
                                                        <td><span class="badge rounded-pill bg-danger-transparent">${recNtc.status }</span></td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td><span class="badge rounded-pill bg-warning-transparent">${recNtc.status }</span></td>
                                                    </c:otherwise>
                                                </c:choose>
												<%-- <td><span class="badge bg-success">${recNtc.status }</span></td> --%>
												<td>${recNtc.applicant }명</td>
											</tr>	
											</tbody>                            				
                           				</c:forEach>
                           			</c:otherwise>
                           		</c:choose>
                                  </table>
                              </div>
                          </div>

                      </div>
                  </div>
                  <!-- 진행중인 공고 목록 부분 끝 -->
                  
                  <!-- 제안한 인재 목록 부분 시작 -->
                  <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-12">
                      <div class="card custom-card recruiter-main-card">
                              <div class="card-header justify-content-between flex-wrap">
                              <!-- 전체 건수 출력 -->
                              <c:set value="${pagingVOB.totalRecord }" var="totalRecordB" />
                              <div class="card-title">
                                 	제안한 인재 <font style="font-weight:bold;">: 총 ${totalRecordB }건</font>
                              </div>
                              <!-- 전체 건수 출력 끝 -->
                              
                              <!-- 제안 인재 페이지로 이동 -->
                              <div class="d-flex flex-wrap gap-2">
                              	<button type="button" class="btn btn-primary-light btn-wave" id="proposalBtn">더보기</button>
                              </div>

                          </div>
                      
                         <div class="card-body">
                              <div class="table-responsive">
                                  <table class="table table-hover text-nowrap table-bordered">
                                      <thead>
                                          <tr>
                                              <th scope="col">No</th>
                                              <th scope="col">이름</th>
                                              <th scope="col">최종학력</th>
                                              <th scope="col">이력서 제목</th>
                                              <th scope="col">제안일자</th>
                                              <th scope="col">상태</th>
                                          </tr>
                                      </thead>
                                                                             
                                 <c:set value="${pagingVOB.dataList }" var="proposalList" />
                                 <c:choose>
                                    <c:when test="${empty proposalList}">
                                       <tbody>
                                          <tr>
                                    <td colspan="4">인재 제안 목록이 없습니다.</td>                                  
                                          </tr>
                                       </tbody>
                                    </c:when>
                                    <c:otherwise>
                                       <c:forEach items="${proposalList }" var="proposal">
                                 <tbody>
                                 <tr>
                                    <td>${proposal.rnum }</td>
                                    <td>${proposal.seekerName } </td>
                                    <td>${proposal.eduName }</td>
                                    <td><a href="#">${proposal.resumeName }</a></td>
                                    <td>${proposal.proDate }</td>
                                    <td>
                                        <c:if test="${proposal.proReplyStatusCode eq '제안완료'}">
                                            <span class="badge bg-success statusBadge">${proposal.proReplyStatusCode}</span>
                                        </c:if>
                                        <c:if test="${proposal.proReplyStatusCode eq '제안수락'}">
                                            <span class="badge bg-warning statusBadge">${proposal.proReplyStatusCode}</span>
                                        </c:if>
                                        <c:if test="${proposal.proReplyStatusCode eq '제안거부'}">
                                            <span class="badge bg-danger statusBadge">${proposal.proReplyStatusCode}</span>
                                        </c:if>
                                    </td>
                                 </tr>   
                                 </tbody>                                        
                                       </c:forEach>
                                    </c:otherwise>
                                 </c:choose>
                                  </table>
                              </div>
                          </div>

                      </div>
                  </div>
              </div>
              <!-- End::row-3 -->
          </div>
      </div>
      <!-- End::app-content -->

<script type="text/javascript">
$(function(){
	
	// 진행중인 채용 더보기 버튼 클릭 이벤트
	let recNtcMoreBtn = $("#recNtcMoreBtn");
	recNtcMoreBtn.on("click", function(){
		location.href="/recruitmentmanage/main.do";
	});
	
	let proposalBtn = $("#proposalBtn");
	proposalBtn.on("click", function(){
		location.href="/candidate/list";
	});
	
});
</script>
