<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
body{
	font-size : 16px;
}
.card{
	min-height : 700px;
	padding : 30px 10px 50px 10px;
}
.table{
	margin : 50px 10px 50px 10px; 
}
.table th{
	background-color : #F2EEFC;"
}
.table-responsive{
	overflow-x: hidden;
}
.card {
    min-height: 700px;
    padding : 30px 10px 50px 10px;
}
.useGuide{
	color:#650EEB;
}
.candidateDiv tr{
	cursor: pointer;
}
.table th{
	text-align : center;
	font-size : 16px;
}
.table td{
	text-align : center;
	font-size : 16px;
	height : 2rem;
	padding: 16px;
}


</style>    
    
<div class="main-content app-content">
    <div class="container-fluid">
    	<div class="container-lg">
		
		<br><br>
        <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
               <h1 class="page-title fw-semibold fs-21 mb-0">후보자 목록</h1>
               <br><br>
        </div>
      
      <div class="row">
          <div class="col-xl-12">
              <div class="card custom-card overflow-hidden">
              	<!-- 이용 가이드 시작 -->
				<div class="card-header">
					<p>
					<span class="fw-semibold useGuide"><i class="bi bi-lightbulb"></i> 이용 가이드</span> <br/>
					&nbsp; • 후보자 정보를 클릭하면 해당 후보자의 상세정보를 확인할 수 있습니다. <br/>
					&nbsp; • 후보자가 제안을 확인 후 해당 공고에 지원할 경우, 지원자 관리로 정보가 이관됩니다.
					</p>
				</div>
              	<!-- 이용 가이드 끝 -->
                  <div class="card-body p-0">
                      <div style="margin-right: 20px;s">
                          <table class="table table-hover text-nowrap">
                              <thead>
                                  <tr>
                                      <th scope="col">번호</th>
                                      <th scope="col">공고명</th>
                                      <th scope="col">후보자명</th>
                                      <th scope="col">학력</th>
                                      <th scope="col">이력서 제목</th>
                                      <th scope="col">제안일</th>
                                      <th scope="col">상태</th>
                                  </tr>
                              </thead>
                           		<c:set value="${pagingVO.dataList }" var="proposalList" />
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
											<tbody id="candidateBox" class="candidateDiv">
											<tr>
												<td class="fs-16 mb-0">${proposal.rnum }</td>
												<td class="fs-16 mb-0">${proposal.recNtcTitle }</td>
												<td class="fs-16 mb-0"><a href="/applicant/resume?resumeNo=${proposal.resumeNo }">${proposal.seekerName }</a></td>
												<td class="fs-16 mb-0">${proposal.eduName } · ${proposal.eduMajor } </td>
												<td class="fs-16 mb-0"><a href="#">${proposal.resumeName }</a></td>
												<td class="fs-16 mb-0">${proposal.proDate }</td>
												<td class="fs-16 mb-0">
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
                  <div class="card-footer border-top-0">
                      <div class="d-flex align-items-center flex-wrap overflow-auto applicantListPage">
                          <div class="ms-auto" id="pagingArea">
                              ${pagingVO.pagingHTML }
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
$(function(){
	
	let candidateBox = $("#candidateBox");
	candidateBox.on("click", function(){
    	let resumeLink = $(this).find("a").attr("href");
    	window.location.href = resumeLink;
	});
	
})
</script>
