<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link rel="stylesheet" href="../assets/libs/swiper/swiper-bundle.min.css">

    <style>
        .center-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 뷰포트 높이 전체를 사용 */
        }
        .authentication-container {
            max-width: 1000px; /* 적절한 최대 너비 설정 */
            width: 100%;
        }
        .tab {
            cursor: pointer;
            padding: 10px 20px;
        }
        .tab.active {
            border-bottom: 3px solid blue;
        }
    </style>
	
	
<div class="center-container" style="height: 100%;">
        <div class="col-xxl-8 col-xl-8 col-lg-8 authentication-container">
            <div class="row justify-content-center align-items-center h-100">
                    <div class="p-5" style="width: 75%;">
                       <p class="h5 fw-semibold mb-2"></p>
                        <button type="button" id="autoBtn1"  class="btn btn-light rounded-pill btn-wave">자동완성 1</button>
                        <button type="button" id="autoBtn2"  class="btn btn-light rounded-pill btn-wave">자동완성 2</button>
                        <div class="text-center my-5 authentication-barrier">
                            <span></span>
                        </div>
                <form action="" method="post" id="signupForm">
                        <div class="row gy-3">
                            <div class="col-xl-12 mt-0">
                                <label for="corporationNum" class="form-label text-default">사업자등록번호</label>
                                <input type="text" class="form-control form-control-lg" id="corporationNum" name="corporationNum"  data-serviceKey="yvHJChZj8iQycd5I%2FUOo6HPiq9%2BPXm%2F4%2FckcuSy52MyusBAtDzWHME2j6Yz1Ogh%2BgOPLBKgClZyWClzgzXWOUw%3D%3D" placeholder="사업자번호를 -를 제외하고 입력해주세요">
                            </div>
                            <div id="resultText"></div>   
                            
                            
             			   <!-- 추가 입력 폼 -->
			                <div id="additionalForm" style="display: none;">
			                    <div class="col-xl-12 mt-0">
			                        <label for="crpName" class="form-label text-default">기업명</label>
			                        <input type="text" class="form-control form-control-lg" id="crpName" name="recruitVO.corporationVO.crpName" placeholder="사업자등록증명원 기업명">
			                    </div>
			                    <br>
			                    <div class="col-xl-12 mt-0">
			                        <label for="memName" class="form-label text-default">대표자</label>
			                        <input type="text" class="form-control form-control-lg" id="memName" name="memName" placeholder="대표자 이름">
			                    </div>
			                       <br>    
			                    <div class="col-xl-12 mt-0">
			                        <label for="memName" class="form-label text-default">기업형태</label>
			                        <input type="text" class="form-control form-control-lg" id="crpType" name="memName" placeholder="기업형태">
			                    </div>
			                       <br>
			                    <div class="col-xl-12 mt-0">
			                        <label for="memName" class="form-label text-default">사원수</label>
			                        <input type="text" class="form-control form-control-lg" id="crpPeople" name="memName" placeholder="사원수">
			                    </div>
			                       <br>
			                    <div class="col-xl-12 mt-0">
			                        <label for="memName" class="form-label text-default">자본금</label>
			                        <input type="text" class="form-control form-control-lg" id="crpMoney" name="memName" placeholder="자본금">
			                    </div>
			                       <br>
			                    <div class="col-xl-12 mt-0">
			                        <label for="memName" class="form-label text-default">URL</label>
			                        <input type="text" class="form-control form-control-lg" id="crpUrl" name="memName" placeholder="URL">
			                    </div>
			                       <br>
			                    <div class="col-xl-12 mt-0">
			                        <label for="crpZipCode" class="form-label text-default">우편번호</label>
			                        <input type="text" class="form-control form-control-lg" id="crpZipCode" name="recruitVO.corporationVO.crpZipCode" placeholder="우편번호">
			                    </div>
			                       <br>
			                    <div class="col-xl-12 mt-0">
			                        <label for="crpAddress1" class="form-label text-default">기본주소</label>
			                        <input type="text" class="form-control form-control-lg" id="crpAddress1" name="recruitVO.corporationVO.crpAddress1" placeholder="기본주소">
			                    </div>
			                       <br>  
			                    <div class="col-xl-12 mt-0">
			                        <label for="crpAddress2" class="form-label text-default">상세주소</label>
			                        <input type="text" class="form-control form-control-lg" id="crpAddress2" name="recruitVO.corporationVO.crpAddress2" placeholder="상세주소">
			                    </div>
			                       <br>
			                    <div class="col-xl-12 mt-0">
			                        <label for="rcrtEmail" class="form-label text-default">이메일</label>
			                        <input type="text" class="form-control form-control-lg" id="rcrtEmail" name="recruitVO.rcrtEmail" placeholder="email@naver.com">
			                    </div>
			                       <br>
			                    <div class="col-xl-12 mt-0">
			                        <label for="memId" class="form-label text-default">아이디</label>
			                        <input type="text" class="form-control form-control-lg" id="memId" name="memId" placeholder="4~20자리/영문,숫자 사용가능">
			                    </div>
			                       <br>
			                    <div class="col-xl-12 mt-0">
			                        <label for="memPw" class="form-label text-default">비밀번호</label>
			                        <input type="text" class="form-control form-control-lg" id="memPw" name="memPw" placeholder="8~16자리/영어 대소문자,숫자,특수문자 조합">
			                    </div>
			                </div>
                          <!-- 추가입력폼 끝 -->
                            
                            
                            
                            <!-- 약관 시작-->
                            <div class="tab-content mt-2 mt-xl-2">
                                <div class="tab-pane show active text-muted" id="home-vertical" role="tabpanel">
                                    <label for="agree_all">
                                        <input type="checkbox" name="agree_all" id="agree_all">
                                        <span>모두 동의합니다</span>
                                    </label><br>
                                    <label for="agree1">
                                        <input type="checkbox" name="agree" value="1" id="agree1">
                                        <span>이용약관 동의<strong>(필수)</strong></span>
                                    </label><br>
                                    <label for="agree2">
                                        <input type="checkbox" name="agree" value="2" id="agree2">
                                        <span>개인정보 수집, 이용 동의<strong>(필수)</strong></span>
                                    </label><br>
                                    <label for="agree3">
                                        <input type="checkbox" name="agree" value="3" id="agree3">
                                        <span>개인정보 이용 동의<strong>(필수)</strong></span>
                                    </label>
                                </div>
                            </div>
                            <!-- 약관 끝 -->
                            <div class="col-xl-12 d-grid mt-2">
                                <button type="button" class="btn btn-lg" id="signupBtn" style="background-color: skyblue; color: white;">가입하기</button>
                            </div>                 
                        </div>
                  <sec:csrfInput/>
             </form>   
                    </div>
                </div>
            </div>
        </div>

    
     <!-- Bootstrap JS -->
    <script src="../assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Swiper JS -->
    <script src="../assets/libs/swiper/swiper-bundle.min.js"></script>

    <!-- Internal Sing-Up JS -->
    <script src="../assets/js/authentication.js"></script>

    <!-- Show Password JS -->
    <script src="../assets/js/show-password.js"></script>
    
     <!-- Custom JS -->
    <script src="../assets/js/custom.js"></script>
    
    
    
<script type="text/javascript">
$(function(){
    // 동의 모두선택 / 해제   (약관)
    const agreeChkAll = document.querySelector('input[name=agree_all]');
    agreeChkAll.addEventListener('change', (e) => {
        let agreeChk = document.querySelectorAll('input[name=agree]');
        for(let i = 0; i < agreeChk.length; i++){
            agreeChk[i].checked = e.target.checked;
        }
    });
    
    
	
	// 사업자등록번호 확인
	let serviceKey = $('#corporationNum').attr('data-serviceKey');
	let bNo="";
    
	$('#corporationNum').blur(function(){
	    bNo = $('#corporationNum').val();
	    let data = {
	        "b_no": [bNo], // 사업자번호 "xxxxxxx" 로 조회 시,
	    };
	       console.log(bNo)
	       console.log(serviceKey)
	    $.ajax({
	        url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey="+serviceKey,  // serviceKey 값을 xxxxxx에 입력
	        type: "POST",
	        data: JSON.stringify(data), // json 을 string으로 변환하여 전송
	        dataType: "JSON",
	        contentType: "application/json",
	        accept: "application/json",
	        success: function(result) {
	        	
		            if(result.match_cnt == "1") {
                	//성공
		                console.log("success");
		                $('#resultText').html("사업자등록번호 확인완료");
		                $('#resultText').css('color', 'blue');
		                $('#additionalForm').show();
//		                openSignUpForm();	// 사업자등록번호 확인완료하면 아래 회원가입 칸 뜨게함
		                
		            } else {
                	//실패
		                console.log("fail");
		                $('#resultText').html(result.data[0]["tax_type"]);
		                $('#resultText').css('color', 'red');
		                $('#additionalForm').hide();
		            }
		        },
	        error: function(result) {
	            console.log(result.responseText); //responseText의 에러메세지 확인
	        }
	    })
	})

	$('#autoBtn1').on('click',function(){
		$('#corporationNum').val("1208765763");
	});
	
	
	$('#autoBtn2').on('click',function(){
		$('#corporationNum').val("1208765763");
		$('#crpName').val("우아한 형제들");
		$('#memName').val("이국환");
		$('#crpType').val("대기업");
		$('#crpPeople').val("2,013");
		$('#crpMoney').val("792,784,341,00");
		$('#crpUrl').val("https://www.woowahan.com/");
		$('#crpZipCode').val("05544 ");
		$('#crpAddress1').val(" 서울특별시 송파구 위례성대로 2 ");
		$('#crpAddress2').val("장은빌딩 2층");
		$('#rcrtEmail').val("dndkgks@naver.com");
		$('#memId').val("C002");
		$('#memPw').val("1234");
	});
	
	
	$('#signupBtn').on('click',function(){
		alert("이미 가입된 정보입니다!");
	})
    
});
</script>