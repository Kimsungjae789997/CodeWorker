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
</style>
    
<div class="row">
    <div class="col-xl-12">
        <div class="card custom-card mt-3">
            <div class="card-header">
                <div class="card-title">
					FAQ 게시판
                </div>
            </div>
            <div class="card-body">
<!--                 <div> -->
<!--                     <select class="form-select-sm" aria-label="Default select example" id="filterSelect"> -->
<!--                         <option value="all">전체 보기</option> -->
<!--                         <option value="TAR0101">기업 회원</option> -->
<!--                         <option value="TAR0102">구직 회원</option> -->
<!--                         <option value="deleted">삭제된 게시글 보기</option> -->
<!--                     </select> -->
<!--                 </div> -->
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
                        	<c:set value="${pagingVO.dataList }" var="noticeList"/>
                            <c:forEach items="${faqList}" var="faqList" varStatus="status">
                                <tr class="${faqList.delYn eq 'Y' ? 'deleted' : ''}" data-target-code="${faqList.boardTargetCode}">
                                	<td>${pagingVO.startRow + status.index}</td>
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
                                        <a href="/admin/faqDetail?boardNo=${faqList.boardNo }" style="color: ${faqList.delYn eq 'Y' ? 'red' : 'black'};">
                                            ${faqList.boardTitle }
                                        </a>
                                    </td>
                                    <td>${faqList.boardRegDate }</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <button type="button" class="btn btn-primary-light btn-sm" onclick="location.href='/admin/faqInsert'">등록</button>
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


    // 셀렉트박스 - 필터링 기능
// 	$('#filterSelect').on('change', function() {
// 	    var filter = $(this).val();
// 	    var rows = $("#datatable-basic tbody tr");
	
// 	    rows.each(function() {
// 	        var targetCode = $(this).data('target-code');
// 	        var isDeleted = $(this).hasClass('deleted');
	
// 	        if (filter === 'all') {
// 	            $(this).show();
// 	        } else if (filter === 'deleted') {
// 	            if (isDeleted) {
// 	                $(this).show();
// 	            } else {
// 	                $(this).hide();
// 	            }
// 	        } else {
// 	            if (targetCode === filter) {
// 	                $(this).show();
// 	            } else {
// 	                $(this).hide();
// 	            }
// 	        }
// 	    });
// 	});
</script>