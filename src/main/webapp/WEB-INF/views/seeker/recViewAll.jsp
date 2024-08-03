<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
</style>

<div style="max-width: 1260px;">
    <br><br>
        <p class="ntcTabs">&nbsp;&nbsp;&nbsp;최근 본 공고</p>
    <br>
    <div class="job-postings-container">
		    <c:forEach items="${recruitmentNoticeList3 }" var="recruit" >       
		       <c:if test="${recruit.status ne '공고마감'}">
		        <div class="job-posting" >
		            <div class="card-body position-relative">
		               <img src="${pageContext.request.contextPath}/resources/images/${recruit.crpLogoUrl}" class="img-fluid rounded-image" style="border-radius:5px; width: 230px; height: 175px; cursor: pointer;" onclick="addRecentView('${recruit.recNtcId}'); location.href='/recruitment/detail.do?recNtcId=${recruit.recNtcId}'">
   							<b class="aa bookMarkResult-${recruit.recNtcId}"  style="padding:10px 10px 10px 10px" ></b>
          			        <input type="hidden" value="${recruit.recNtcId }" class="recId">
		            </div>
					<div class="job-info" style="width: 80%; cursor: pointer;" onclick="addRecentView('${recruit.recNtcId}'); location.href='/recruitment/detail.do?recNtcId=${recruit.recNtcId}'">
		                <p class="job-title">${recruit.recNtcTitle }</p>
		                <p class="company-name">${recruit.crpName }</p>
		                <p class="job-location">${recruit.workingLocCode} 
		                    <c:if test="${recruit.experienceCode eq '신입'}">신입</c:if>
		                    <c:if test="${recruit.experienceCode eq '경력무관'}">경력무관</c:if>
		                    <c:if test="${recruit.experienceCode eq '경력'}">경력 ${recruit.experienceLevelCode}</c:if>
		                	 <span style="color: red; float: right; font-weight: bold;">${recruit.status }</span>  
		                </p>
		            </div>
		        </div>
		        </c:if>
		    </c:forEach>
    </div>
</div>
<script>
$(function(){
    // 각 공고의 북마크 상태를 확인
    $('.recId').each(function() {
        var recId = $(this).val();
        console.log("recId: ", recId);
        updateBookmarkStatus(recId);
    });
});

//북마크 모양 띄우기
function updateBookmarkStatus(recNtcId) {
    var data = { recNtcId: recNtcId };
    console.log("recNtcId :   =======" + recNtcId)
    $.ajax({
        url: "/main/bookmarkSelect.do",
        type: "post",
        cache: false,
        beforeSend: function(xhr) {
            xhr.setRequestHeader(header, token);
        },
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(data),
        success: function(data) {
            console.log("Bookmark status response: ", data); 
            var bookmarkElement = $('.bookMarkResult-' + recNtcId);
            if(data == 'FAILED') {
                bookmarkElement.html('<i onclick="like_func(\'' + recNtcId + '\')" class="bi bi-bookmark bookMarkResult-' + recNtcId + '" style="font-size: 24px; cursor: pointer;"></i>');
            }
            if(data == 'EXIST') {
                bookmarkElement.html('<i onclick="like_func(\'' + recNtcId + '\')" class="bi bi-bookmark-fill bookMarkResult-' + recNtcId + '" style="font-size: 24px; cursor: pointer;"></i>');
            }
        }
    });
}

// 북마크 
function like_func(recId){
    var data = { recNtcId: recId };
    $.ajax({
        url:"/main/bookmark.do",
        type:"post",
        cache : false,
        beforeSend : function(xhr){ // 데이터 전송 전, 헤더에 csrf 값 설정
            xhr.setRequestHeader(header, token);
        },
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(data),
        success : function(data){
            console.log(data);
            if(data == "FAILED"){
                location.href = "/login";
            }
            if(data == "EXIST"){
                updateBookmarkStatus(recId);
            }
        }
    });
}

// 최근 본 공고
function addRecentView(recNtcId) {
    var data = {
        recNtcId : recNtcId
    };
    
    $.ajax({
        url: '/main/addRecentView',
        type: 'POST',
        beforeSend : function(xhr){ // 데이터 전송 전, 헤더에 csrf 값 설정
            xhr.setRequestHeader(header, token);
        },
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(data),
        success: function(res) {
            console.log(res);
        } // success 끝
    }); //ajax끝
} // addRecentView 끝
</script>