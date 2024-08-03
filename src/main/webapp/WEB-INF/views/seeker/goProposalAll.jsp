<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
    body {
        font-size: 16px;
    }

    .custom-card img {
        width: 100%;
        height: auto;
        cursor: pointer;
    }

    .custom-card .card-title {
        text-align: center;
        font-weight: bold;
        font-size: 20px;
    }

    .search-container {
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .search-container input,
    .search-container button {
        height: 70px;
        font-size: 22px;
    }

    .search-container input::placeholder {
        font-size: 22px;
        text-align: center;
        font-weight: bold;
    }

    .swiper-preview,
    .swiper-view,
    .swiper {
        height: 300px;
    }

    .swiper-slide img {
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .swiper-slide {
        position: relative;
    }

    .swiper-slide .slide-text {
        font-size: 25px;
        font-weight: bold;
        position: absolute;
        top: 50px;
        left: 80px;
        color: white;
        padding: 5px;
        border-radius: 5px;
    }

    .aa {
        position: absolute;
        right: 1px;
        top: -5px;
        font-size: 24px;
    }

    .job-title {
        font-size: 16px;
        font-weight: bold;
        margin: 5px 0;
        text-align: left;
    }

    .company-name,
    .job-location {
        font-size: 13px;
        color: gray;
        margin: 3px 0;
        text-align: left;
    }

    .job-postings-container {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(230px, 1fr));
        gap: 30px;
    }

    .job-posting {
    display: flex;
    flex-direction: column;
    align-items: center;
    overflow: hidden;
    transition: transform 0.2s;
    padding-bottom: 20px;
    }

    .job-posting:hover {
        transform: translateY(-5px);
    }

    .navbar-buttons {
        display: flex;
        gap: 10px;
    }

    .viewAll {
        margin-right: 15px;
        font-weight: bold;
        color: gray;
        padding: 5px 10px;
        transition: background-color 0.3s;
        cursor: pointer;
        border-radius: 20px;
    }

    .viewAll:hover {
        background-color: lightgray;
    }

    .ntcTabs {
        font-size: 25px;
        font-weight: 600;
    }
        .popular-tags {
        display: -webkit-box;
        -webkit-box-orient: vertical;
        -webkit-line-clamp: 3; /* 보여줄 줄 수 */
        overflow: hidden;
        text-overflow: ellipsis;
        max-height: 4.5em; /* 줄 수에 따라 적절하게 조정 */
    }
</style>


<div style="max-width: 1260px;">
    <br><br>
    <p class="ntcTabs">&nbsp;&nbsp;&nbsp;받은 제안</p>
    <br>
    <div style="display: flex; flex-wrap: wrap; gap: 16px; padding: 10px;">
        <c:forEach items="${corporationList}" var="corporation"> 
            <!-- 첫 번째 카드 -->
            <div style="width: 49%; height: 190px; padding: 10px; border: 1px solid #d9d7d7; border-radius: 20px;"> <!-- 고정 크기 설정 -->
                <div class="btn-list float-end">
               	<c:choose>
               	<c:when test="${corporation.proReplyStatusCode eq 'PRO0101'}">
                    <button type="button"  class="btn btn-outline-dark btn-wave acceptBtn" data-proNo="${corporation.proNo }" style="font-weight: bold;  font-size: 16px;">제안 수락</button>
                    <button type="button"  class="btn btn-outline-danger btn-wave denyBtn" data-proNo="${corporation.proNo }"  style="font-weight: bold; font-size: 16px;">제안 거절</button>
				</c:when>
				<c:otherwise>
					<button type="button" class="btn btn-dark btn-wave text-white" style="font-weight: bold; font-size: 16px;">응답 완료</button>
				</c:otherwise>
				</c:choose>
                </div>
                <div class="d-flex mb-3 flex-wrap gap-2 align-items-center">
                    <span class="avatar bg-primary bg-opacity-10 border" style="position: relative; width: 80px; height: 80px;"> <!-- 너비와 높이 설정 -->
                        <foreignObject x="0" y="0" width="150" height="150"> <!-- 너비와 높이 설정 -->
                            <img src="${pageContext.request.contextPath}/resources/images/${corporation.crpLogoUrl}" 
                                 style="width: 100%; height: 100%; border-radius: 20%; border: 3px solid white;" 
                                 class="img-thumbnail" alt="...">
                        </foreignObject>
                    </span>
                    <div>
                        <h5 class="fw-semibold mb-0 d-flex align-items-center">
                            <a href="/main/crpDetail?crpId=${corporation.crpId }">${corporation.crpName}</a>
                        </h5>
                        <a href="javascript:void(0);" style="color: gray;">${corporation.crpIndustryCode}</a>
                    </div>
                </div>
                <div class="popular-tags mb-3" style="color: gray; cursor: pointer;" onclick="javascript:location.href='/recruitment/detail.do?recNtcId=${corporation.recNtcId}'">
                   	<span style="font-size:18px; font-weight: bold;">${corporation.recNtcTitle}</span> 에서 인재 제안이 도착했습니다.
                </div>
                <div class="d-flex justify-content-between">
                    <h6 class="fw-semibold mb-0" style="font-weight: bold; color: #06f; font-size: 15px;    line-height: 22px">제안일자 : ${corporation.proDate }</h6>
                </div>
            </div>
        </c:forEach> 
    </div>
</div>

 <script>
 $(function(){
	 
	// 수락 버튼 누르기
	 $('.acceptBtn').on('click', function(e) {
	     e.preventDefault();
	     var proNo = $(this).data('prono');
	     console.log(proNo);

	     // SweetAlert2를 사용한 확인 대화상자
	     Swal.fire({
	         title: '제안을 수락하시겠습니까?',
	         text: "",
	         icon: 'question',
	         showCancelButton: true, // 취소 버튼 표시
	         confirmButtonText: '수락하기',
	         cancelButtonText: '취소'
	     }).then((result) => {
	         if (result.isConfirmed) {
	             // 사용자가 '수락하기' 버튼을 클릭한 경우
	             var data = {
	                 proNo: proNo
	             };

	             $.ajax({
	                 url: "/mypage/proposalAccept",
	                 type: "post",
	                 beforeSend: function(xhr) {
	                     xhr.setRequestHeader(header, token);
	                 },
	                 contentType: "application/json;charset=utf-8",
	                 data: JSON.stringify(data),
	                 success: function(res) {
	                     console.log(res);
	                     if (res == 'OK') {
	                         Swal.fire({
	                             title: '성공!',
	                             text: '제안이 성공적으로 수락되었습니다.',
	                             icon: 'success',
	                             confirmButtonText: '확인'
	                         }).then(() => {
	                             location.reload();
	                         });
	                     }
	                 }, // success 끝
	                 error: function(err) {
	                     Swal.fire({
	                         title: '오류 발생!',
	                         text: '제안 수락 중 오류가 발생했습니다.',
	                         icon: 'error',
	                         confirmButtonText: '확인'
	                     });
	                 }
	             }); // ajax 끝
	         } else {
	             // 사용자가 '취소' 버튼을 클릭한 경우
	             Swal.fire({
	                 title: '취소됨',
	                 text: '제안 수락이 취소되었습니다.',
	                 icon: 'info',
	                 confirmButtonText: '확인'
	             });
	         }
	     });
	 }); // 수락 버튼 끝
	 
	 
	// 거절 버튼 누르기
	 $('.denyBtn').on('click', function(e) {
	     e.preventDefault();
	     var proNo = $(this).data('prono');
	     console.log(proNo);

	     // SweetAlert2를 사용한 확인 대화상자
	     Swal.fire({
	         title: '제안을 거절하시겠습니까?',
	         text: "",
	         icon: 'question',
	         showCancelButton: true, // 취소 버튼 표시
	         confirmButtonText: '거절하기',
	         cancelButtonText: '취소'
	     }).then((result) => {
	         if (result.isConfirmed) {
	             // 사용자가 '거절하기' 버튼을 클릭한 경우
	             var data = {
	                 proNo: proNo
	             };

	             $.ajax({
	                 url: "/mypage/proposalDeny",
	                 type: "post",
	                 beforeSend: function(xhr) {
	                     xhr.setRequestHeader(header, token);
	                 },
	                 contentType: "application/json;charset=utf-8",
	                 data: JSON.stringify(data),
	                 success: function(res) {
	                     console.log(res);
	                     if (res == 'OK') {
	                         location.reload();
	                     }
	                 }, // success 끝
	                 error: function(err) {
	                     Swal.fire({
	                         title: '오류 발생!',
	                         text: '제안 거절 중 오류가 발생했습니다.',
	                         icon: 'error',
	                         confirmButtonText: '확인'
	                     });
	                 }
	             }); // ajax 끝
	         } else {
	             // 사용자가 '취소' 버튼을 클릭한 경우
	             Swal.fire({
	                 title: '취소됨',
	                 text: '제안 거절이 취소되었습니다.',
	                 icon: 'info',
	                 confirmButtonText: '확인'
	             });
	         }
	     });
	 }); // 거절 버튼 끝
	 
	 
 }); //function 끝
 </script>