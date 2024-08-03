<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<div class="main-content app-content">
    <div class="container-fluid">
            <div class="container-lg">

	<!-- 타이틀 시작 -->
	<br><br>
    <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
           <h1 class="page-title fw-semibold fs-21 mb-0">공고 목록 관리</h1>
           <br><br>
    </div>
	<!-- 타이틀 끝 -->

    <!-- Start::row-1 -->
    <div class="row">
        <div class="col-xl-12" style="margin-right: 20px;">
            <div class="card custom-card overflow-hidden">
                <div class="card-header d-flex justify-content-end">
                    <div>
                        <!-- 분류별검색어 -->
                        <form class="input-group input-group-sm" action="/recruitmentmanage/main.do" id="searchForm" style="width: 440px;">
                            <input type="hidden" name="page" id="page"/>
                            <select class="form-control" name="searchType">
                                <option value="recNtcTitle" <c:if test="${searchType eq 'recNtcTitle' }">selected</c:if>>공고 제목</option>
                                <option value="positionCode" <c:if test="${searchType eq 'positionCode' }">selected</c:if>>직무</option>
                            </select> 
                            <input type="text" name="searchWord" value="${searchWord }" class="form-control float-right" placeholder="Search">
                            <div class="input-group-append">
                                <button type="submit" class="btn btn-default">
                                    <i class="fas fa-search"></i>검색
                                </button>
                            </div>
                            <sec:csrfInput/>
                        </form>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover text-nowrap" style="text-align: center;">
                            <thead>
                                <tr>
                                	<th scope="col">공고 번호</th>
                                    <th scope="col">직무</th>
                                    <th scope="col">공고 제목</th>
                                    <th scope="col">공고 상태</th>
                                    <th scope="col">공고 시작일</th>
                                    <th scope="col">공고 마감일</th>
                                    <th scope="col">지원자 수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="recruitment" value="${pagingVO.dataList }"/>
                                <c:choose>
                                    <c:when test="${empty recruitment }">
                                        <tr>
                                            <td colspan="10">조회하실 공고글이 존재하지 않습니다!</td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach items="${recruitment }" var="rec">
                                            <tr>
                                            	<td>${rec.recNtcId }</td>
                                                <td>${rec.positionCode }</td>
                                                <td><a href="/recruitmentmanage/detail.do?recNtcId=${rec.recNtcId }">${rec.recNtcTitle }</a></td>
                                                <c:choose>
                                                    <c:when test="${rec.status eq '공고대기중'}">
                                                        <td><span class="badge rounded-pill bg-primary-transparent">${rec.status }</span></td>
                                                    </c:when>
                                                    <c:when test="${rec.status eq '공고마감'}">
                                                        <td><span class="badge rounded-pill bg-danger-transparent">${rec.status }</span></td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td><span class="badge rounded-pill bg-warning-transparent">${rec.status }</span></td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <td>${rec.recNtcStart }</td>
                                                <td>${rec.recNtcEnd }</td>
                                                <td>${rec.applicant }</td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="card-footer border-top-0" id="pagingArea">
                    <!-- 페이징 -->
                    ${pagingVO.pagingHTML }
                </div>
            </div>
        </div>
    </div>
    <!--End::row-1 -->
    </div>
    </div>
</div>
<script>
$(function(){
    var pagingArea = $("#pagingArea");
    var searchForm = $("#searchForm");

    pagingArea.on("click", "a", function(event){
        console.log("페이징처리");
        event.preventDefault();
        var pageNo = $(this).data("page");
        console.log("pageNo : " + pageNo);
        // 검색 시 사용할 form태그안에 넣어준다.
        // 검색 시 사용할 form태그를 활용해서 검색도하고 페이징 처리도 같이 진행함
        searchForm.find("#page").val(pageNo);
        searchForm.submit();
    });
});
</script>
