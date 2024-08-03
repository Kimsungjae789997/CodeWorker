<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	#datatable-basic_length {
        display: none; 
    } 
    
    #datatable-basic_info {
        display: none;
    }
    
    #datatable-basic_filter{
    	display: none;
    }
    
    
    
	.card-header {
	    display: flex;
	    justify-content: space-between;
	    align-items: center;
	}
</style>


<div class="row">
    <div class="col-xl-12">
        <div class="card custom-card mt-3">
            <div class="card-header">
                <div class="card-title">
                    ${param.memId}님의 작성 글 목록
                </div>
                <button type="button" class="btn btn-light btn-wave fw-normal mb-0" onclick="javascript:location.href='/communityMainList'">◀ 목록</button>
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
<!-- 	                        <ul class="navbar-nav me-auto mb-2 mb-lg-0"> -->
<!-- 	                            <li class="nav-item"> -->
<!-- 	                                <input type="radio" class="btn_sort" id="sortRecent" name="sort" value="recent" checked> -->
<!-- 									<label for="sortRecent">최신순</label> -->
<!-- 	                            </li> -->
<!-- 	                            <li class="nav-item"> -->
<!-- 	                                <input type="radio" class="btn_sort" id="sortViews" name="sort" value="views"> -->
<!-- 									<label for="sortViews">조회순</label> -->
<!-- 	                            </li> -->
<!-- 	                        </ul> -->
							<form class="d-flex ms-auto" role="search" action="/searchCommunityByUser" method="get">
							    <select class="form-select me-2" name="searchType" aria-label="Search filter" style="width: 100px;">
							        <option value="title">제목</option>
							        <option value="author">작성자</option>
							    </select>
							    <input class="form-control me-2" type="search" name="searchKeyword" value="${param.searchKeyword}" placeholder="Search" aria-label="Search" style="width:500%">
							    <input type="hidden" name="memId" value="${param.memId}" style="width:250px"/>
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
                            <c:forEach items="${communityUserPost}" var="post" varStatus="status">
                                <tr class="table-waring">
                                	<td>${pagingVO.startRow + status.index}</td>
                                    <td>${post.memId}</td>
                                    <td>
                                        <a href="/communityMainDetail?communityNo=${post.communityNo}">
                                            ${post.communityTitle}<font style="color: #888;">(${post.replyCount})</font>
                                        </a>
                                    </td>
                                    <td>${post.communityRegDate}</td>
                                    <td>${post.communityHit}</td>
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
$(document).ready(function(){
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


	
    // 최신순
//     $('#sortRecent').on('click', function() {
//         fetchSortedData('recent');
//     });
    
//     // 조회순
//     $('#sortViews').on('click', function() {
//         fetchSortedData('views');
//     });
    
//     function fetchSortedData(sortType) {
//         const memId = '${param.memId}';
//         $.ajax({
//             url: '/communitySortByUser',
//             type: 'GET',
//             data: { sort: sortType, memId: memId },
//             dataType: 'json',
//             success: function(data) {
//                 updateTable(data);
//             },
//             error: function(error) {
//                 console.error('Error fetching sorted data:', error);
//             }
//         });
//     }
    
    function updateTable(data) {
        const tbody = $('#datatable-basic tbody');
        tbody.empty(); // 기존 행을 모두 지웁니다
        data.forEach(function(item) {
            const row = $('<tr>').addClass('table-waring');
            row.append($('<td>').text(item.memId));
            row.append($('<td>').html('<a href="/communityMainDetail?communityNo=' + item.communityNo + '">' + item.communityTitle + '</a>'));
            row.append($('<td>').text(item.communityRegDate));
            row.append($('<td>').text(item.communityHit));
            tbody.append(row);
        });
    }
});
</script>