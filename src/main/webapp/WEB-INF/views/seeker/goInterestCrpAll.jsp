<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
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
    <p class="ntcTabs">&nbsp;&nbsp;&nbsp;관심 회사</p>
    <br>
    <div style="display: flex; flex-wrap: wrap; gap: 16px; padding: 10px;">
        <c:forEach items="${corporationList}" var="corporation"> 
            <!-- 첫 번째 카드 -->
            <div style="width: 49%; height: 240px; padding: 10px; border: 1px solid #d9d7d7; border-radius: 20px;"> <!-- 고정 크기 설정 -->
                <div class="btn-list float-end">
                   <input type="hidden" value="${corporation.crpId }" class="crpId" data-crpId="${corporation.crpId }">
                   <span class="bookMarkResult-${corporation.crpId }" id="crpId2"></span>
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
                <div class="popular-tags mb-3" style="color: gray;">
                   	${corporation.crpInfo }
                </div>
                <div class="d-flex justify-content-between">
                    <h6 class="fw-semibold mb-0" style="font-weight: bold; color: #06f; font-size: 15px;    line-height: 22px">지금 ${corporation.recAll}개 포지션 채용 중</h6>
                </div>
            </div>
        </c:forEach> 
    </div>
</div>


<script>
$(function(){
	// 회사의 채용공고 가져오기
	$('.crpId').each(function(){
		var crpId = $(this).val();
		console.log('crpId : ' + crpId);
		updateInterestCrp(crpId);
	});
	
    const tags = document.querySelectorAll('.popular-tags');
    tags.forEach(tag => {
        const text = tag.innerText;
        if (text.length > 100) { // 100자는 적절하게 조정할 수 있습니다.
            tag.innerText = text.substring(0, 100) + '...';
        }
    });
	
	
});// function 끝


//관심회사 띄우기
function updateInterestCrp(crpId) {
 var data = { crpId : crpId };
 console.log("crpId :   =======" + crpId)
 $.ajax({
     url: "/crp/interestCrpSelect.do",
     type: "post",
     cache: false,
     beforeSend: function(xhr) {
         xhr.setRequestHeader(header, token);
     },
     contentType: "application/json;charset=utf-8",
     data: JSON.stringify(data),
     success: function(data) {
     	console.log("기업회원마다 관심을 가진 구직자 수 : " + data.count)
         console.log("interestCrp status response: ", data); 
         var crpElement = $('.bookMarkResult-' + crpId); // crpId는 요소의 id가 아닌 변수로서 존재함.
         if (data.count != undefined) {
             if (data.result == 'FAILED') {
                 crpElement.html('<span onclick="int_func(\'' + crpId + '\')" class="crpResult-' + crpId + '" style="font-size: 20px;">&nbsp;&nbsp;&nbsp;<button style="    border-radius: 15px; padding: 5px 10px; font-size: 22px; background-color: white; color:gray; border-color: gray;"><i class="bi bi-suit-heart"></i>&nbsp;' + data.count + '&nbsp;관심기업</button></span>');
             }
             if (data.result == 'EXIST') {
                 crpElement.html('<span onclick="int_func(\'' + crpId + '\')" class="crpResult-' + crpId + '" style="font-size: 20px; cursor: pointer;">&nbsp;&nbsp;&nbsp;<button style="     border-radius: 15px; padding: 5px 10px; font-size: 22px; background-color: white; color:gray; border-color: gray;"><i class="bi bi-suit-heart-fill"></i>&nbsp;' + data.count + '&nbsp;관심기업</button></span>');
             }
         } else {
             if (data.result == 'FAILED') {
                 crpElement.html('<span onclick="int_func(\'' + crpId + '\')" class="crpResult-' + crpId + '" style="font-size: 20px;">&nbsp;&nbsp;&nbsp;<button style="     border-radius: 15px; padding: 5px 10px; font-size: 22px; background-color: white; color:gray; border-color: gray;"><i class="bi bi-suit-heart"></i>관심기업</button></span>');
             }
             if (data.result == 'EXIST') {
                 crpElement.html('<span onclick="int_func(\'' + crpId + '\')" class="crpResult-' + crpId + '" style="font-size: 20px; cursor: pointer;">&nbsp;&nbsp;&nbsp;<button style="     border-radius: 15px; padding: 5px 10px; font-size: 22px; background-color: white; color:gray; border-color: gray;"><i class="bi bi-suit-heart-fill"></i>관심기업</button></span>');
             }
         }
         
         
     }
 });
}


//관심회사 
function int_func(crpId){
	var data = { crpId: crpId };
	$.ajax({
		url:"/crp/interestCrp.do",
		type:"post",
		cache : false,
		beforeSend : function(xhr){	// 데이터 전송 전, 헤더에 csrf 값 설정
			xhr.setRequestHeader(header, token);
		},
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(data),
		success : function(data){
			
			console.log(data);
			if(data.result == "FAILED"){
				location.href = "/login";
			}
			if(data.result == "EXIST"){
				updateInterestCrp(crpId);
			}
		}
	});
	
}

//최근 본 공고
function addRecentView(recNtcId) {
	var data = {
			recNtcId : recNtcId
	};
	
    $.ajax({
        url: '/main/addRecentView',
        type: 'POST',
		beforeSend : function(xhr){	// 데이터 전송 전, 헤더에 csrf 값 설정
			xhr.setRequestHeader(header, token);
		},
        contentType: "application/json;charset=utf-8",
        data: JSON.stringify(data),
        success: function(res) {
            console.log(res);
            
        }// success 끝
    });//ajax끝
}// addRecentView 끝
</script>












