<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
    i {
        font-size: 20px;
    }
    
    #datatable-basic_length {
        display: none; 
    }
    
    #datatable-basic_info {
    	display: none;
    }
    
   	#datatable-basic_filter {
        display: none;
    }
</style>

<div class="row">
    <div class="col-xl-12">
        <div class="card custom-card mt-3">
            <div class="card-header">
                <div class="card-title">
					자주묻는 질문
                </div>
            </div>
            <div class="card-body">
            
            <nav class="navbar navbar-expand-lg navbar-primary-transparent mb-3">
	                <div class="container-fluid">
	                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
	                        data-bs-target="#navbarColor01" aria-controls="navbarColor01"
	                        aria-expanded="false" aria-label="Toggle navigation">
	                        <span class="navbar-toggler-icon"></span>
	                    </button>
	                    <div class="collapse navbar-collapse">
							<form class="d-flex ms-auto" role="search" action="#" id="pagingFrm" method="get">
								<input type="hidden" name="page" id="page">
							    <select class="form-select me-2" style="width: 100px;">
							        <option value="community_title" <c:if test="${searchType eq 'community_title' }">selected</c:if>>제목</option>
							        <option value="mem_id" <c:if test="${searchType eq 'mem_id' }">selected</c:if>>작성자</option>
							    </select>
							    <input class="form-control me-2" type="search" value="${searchKeyword }" name="searchKeyword" placeholder="Search" aria-label="Search" style="width:250px">
							    <button class="btn btn-primary" type="submit">Search</button>
							</form>
	                    </div>
	                </div>
	            </nav>
            
                <div class="table-responsive">
                    <table id="datatable-basic" class="table table-bordered text-nowrap w-100">
                        <thead>
                            <tr>
                            	<th style="background-color: rgba(137, 32, 173, 0.1);">No</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">분류</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">제목</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">작성일</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${faqList}" var="faqList" varStatus="status">
                                <tr class="${faqList.delYn eq 'Y' ? 'deleted' : ''}" data-target-code="${faqList.boardTargetCode}">
                                	<td data-no = "${faqList.boardNo }">${pagingVO.startRow + status.index}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${faqList.boardTargetCode eq 'TAR0101' }">
												기업회원
                                            </c:when>
                                            <c:when test="${faqList.boardTargetCode eq 'TAR0102' }">
												구직회원
                                            </c:when>
                                        </c:choose>
                                    </td>
                                    <td>
                                        <a href="/faqDetail?boardNo=${faqList.boardNo }">
                                            ${faqList.boardTitle }
                                        </a>
                                    </td>
                                    <td>${faqList.boardRegDate }</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div class="card-footer clearfix" id="pagingArea">
                  ${pagingVO.pagingHTML }
            </div>
            <form action="" method="get" id="pagingFrm">
            	<input type="hidden" name="page" id="page">
            </form>
            
        </div>
    </div>
</div>

<script>
$(function(){
	var pagingArea = $('#pagingArea');
	var page = $('#page');
	var pagingFrm = $('#pagingFrm');
	
	pagingArea.on('click', 'a', function(event){
		event.preventDefault();
		var pageNo = $(this).attr("data-page");
		console.log("pageNo", pageNo);
		page.val(pageNo);
		pagingFrm.submit(); 
	});
});
</script>