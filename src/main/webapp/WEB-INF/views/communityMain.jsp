<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

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
    

	.navbar-nav{
		float: left;
	}

	/* 글쓰기 버튼 오른쪽으로 정렬 */
	.card-header {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	}
	
	.card-title {
	    flex-grow: 1;
	}

	.no-caret::after {
        display: none !important;
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
    
<div class="row">
    <div class="col-xl-12">
        <div class="card custom-card mt-3">
            <div class="card-header">
                <div class="card-title">
					CODE WORKER Free Board
                </div>
				<form action="/communityInsert" method="get" id="writeForm">
				    <sec:authorize access="isAuthenticated() and hasRole('ROLE_SEEKER')">
				        <button type="submit" id="writeBtn" class="btn btn-primary-light btn-wave">글쓰기</button>
				    </sec:authorize>
<%-- 				    <sec:authorize access="!isAuthenticated()"> --%>
<!-- 				        <button type="button" class="btn btn-primary-light btn-sm" onclick="alert('로그인시 이용가능한 서비스입니다');">글쓰기</button> -->
<%-- 				    </sec:authorize> --%>
<sec:authorize access="!isAuthenticated()">
    <button type="button" class="btn btn-primary-light btn-sm" onclick="Swal.fire('로그인시 이용가능한 서비스입니다');">글쓰기</button>
</sec:authorize>
				</form>
            </div>
            <div class="card-body">
				<nav class="navbar navbar-expand-lg navbar-primary-transparent mb-3">
	                <div class="container-fluid">
	                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
	                        data-bs-target="#navbarColor01" aria-controls="navbarColor01"
	                        aria-expanded="false" aria-label="Toggle navigation">
	                        <span class="navbar-toggler-icon"></span>
	                    </button>
	                    <div class="collapse navbar-collapse" id="navbarColor01">
							<form class="d-flex ms-auto" role="search" action="/communitySearch" id="pagingFrm" method="get">
								<input type="hidden" name="page" id="page">
							    <select class="form-select me-2" name="searchType" aria-label="Search filter" style="width: 100px;">
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
                                <th style="background-color: rgba(137, 32, 173, 0.1);">아이디</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">제목</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">작성일</th>
                                <th style="background-color: rgba(137, 32, 173, 0.1);">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
							<c:forEach items="${communityMainList}" var="commuMainList" varStatus="status">
							    <tr class="table-waring">
							    	<td>${pagingVO.startRow + status.index}</td>
							        <td>
							            <sec:authorize access="isAuthenticated()">
							                <a href="#" class="user-id" data-id="${commuMainList.memId}">
							                    ${commuMainList.memId}
							                </a>
							                <div class="user-info" id="userInfo${commuMainList.memId}">
							                    <a class="dropdown-item" href="/communityUserPost?memId=${commuMainList.memId}">작성글내역보기</a>
							                </div>
							            </sec:authorize>
<%-- 							            <sec:authorize access="!isAuthenticated()"> --%>
<!-- 							                <a href="#" class="user-id" onclick="alert('로그인시 이용가능한 서비스입니다'); return false;"> -->
<%-- 							                    ${commuMainList.memId} --%>
<!-- 							                </a> -->
<%-- 							            </sec:authorize> --%>
<sec:authorize access="!isAuthenticated()">
    <a href="#" class="user-id" onclick="Swal.fire('로그인시 이용가능한 서비스입니다'); return false;">
        ${commuMainList.memId}
    </a>
</sec:authorize>
							        </td>
							        <td>
							            <a href="/communityMainDetail?communityNo=${commuMainList.communityNo}">
							                ${commuMainList.communityTitle}<font style="color: #888;">(${commuMainList.replyCount})</font>
							            </a>
							        </td>
							        <td>${commuMainList.communityRegDate}</td>
							        <td>${commuMainList.communityHit}</td>
							    </tr>
							</c:forEach>
						</tbody>
                    </table>
                </div>
            </div>
            
            <div class="card-footer clearfix" id="pagingArea">
                  ${pagingVO.pagingHTML }
            </div>
        </div>
    </div>
</div>

<script>


$(document).ready(function() {
    var pagingArea = $('#pagingArea');
    var page = $('#page');
    var pagingFrm = $('#pagingFrm');
    var searchForm = $('#searchForm');

    // 페이징 링크 클릭 이벤트
    pagingArea.on('click', 'a', function(event){
        event.preventDefault();
        var pageNo = $(this).attr("data-page");
        page.val(pageNo);
        pagingFrm.submit();
    });


 	// 회원 아이디 클릭 이벤트
    $(document).on('click', '.user-id', function(event) {
        event.preventDefault();
        const userId = $(this).data('id');
        const userInfo = $('#userInfo' + userId);
        $('.user-info').not(userInfo).removeClass('show'); // 다른 정보 숨기기
        userInfo.toggleClass('show'); // 현재 정보 토글
    });

    // 페이지 클릭 시 정보 숨기기
    $(document).on('click', function(event) {
        if (!$(event.target).closest('.user-id, .user-info').length) {
            $('.user-info').removeClass('show');
        }
    });
});
</script>