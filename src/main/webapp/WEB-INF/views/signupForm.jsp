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
                <div class="col-xxl-9 col-xl-7 col-lg-7 col-md-7 col-sm-8 col-12">
                    <div class="p-5">
                
                       <p class="h5 fw-semibold mb-2"></p>
                        <div class="text-center my-5 authentication-barrier">
                            <span></span>
                        </div>
                        <button type="button" id="autoBtn1" class="btn btn-light rounded-pill btn-wave">자동완성</button>
                <form action="/signup.do" method="post" id="signupForm">
                        <div class="row">
                            <div class="col-xl-12 mt-3">
                                <label for="memId" class="form-label text-default">아이디</label>
                                <input type="text" class="form-control form-control-lg" id="memId" name="memId" placeholder="4~20자리/영문,숫자,특수문자 사용가능">
								<div id="idCheckResult"></div>  
								<br>
                            </div>

                            <div class="col-xl-12 mb-3">   
                                <label for="memPw" class="form-label text-default d-block">비밀번호</label>
                             <div class="input-group">
                                    <input type="password" class="form-control form-control-lg" id="memPw" name="memPw" placeholder="8~16자리/영문 대소문자,숫자,특수문자 조합">
                                </div>
                            </div>  
                            <div class="col-xl-12 mb-3">
                                <label for="memName" class="form-label text-default d-block">이름</label>
                             <div class="input-group">
                                    <input type="text" class="form-control form-control-lg" id="memName" name="memName" placeholder="이름을 입력하세요">
                                </div>
                            </div>   
                            
                              <div class="col-xl-12 mb-3">
                                <label for="seekerBirth" class="form-label text-default d-block">생년월일</label>
                             <div class="input-group">
                                    <input type="text" class="form-control form-control-lg" id="seekerBirth" name="seekerVO.seekerBirth" placeholder="생년월일 입력하세요">
                                </div>
                            </div>   
                              <div class="col-xl-12 mb-3">
                                <label for="seekerEmail" class="form-label text-default d-block">이메일</label>
                             <div class="input-group">
                                    <input type="text" class="form-control form-control-lg" id="seekerEmail" name="seekerVO.seekerEmail" placeholder="">
                                </div>
                            </div>   
							
							<div class="col-xl-12 mb-3">
							<label for="seekerTel" class="form-label text-default d-block">휴대폰</label>
	                             <div class="input-group mb-3">
									<input type="text" class="form-control" id="seekerTel" name="seekerVO.seekerTel" placeholder="'-'빼고 숫자만 입력"> 
									<span class="input-group-append">
										<button type="button" class="btn btn-secondary btn-flat"
											id="checkTel">인증번호 전송</button>
									</span>
								</div>
							</div>
						
						 <!-- 추가 입력 폼 - 휴대폰 인증번호입력하는 곳 -->
						 <div id="telAuth" style="display: none;">
						 	<div class="col-xl-12 mb-3">
								<label for="seekerTel" class="form-label text-default d-block">인증번호 입력</label>
		                             <div class="input-group mb-3">
										 <input type="text" class="form-control form-control-lg" id="authNo" name="" placeholder="인증번호를 입력하세요">
										<span class="input-group-append">
											<button type="button" class="btn btn-secondary btn-flat" id="telAuthBtn">확인</button>
										</span>
									</div>
											<div id="telCheckResult"></div>
							</div>
						</div>
						 <!-- 추가입력폼 끝 -->  

                            <div class="col-xl-12 mb-3">
	                            <label for="seekerZip" class="form-label text-default d-block">우편번호</label>
				                <div class="input-group mb-3">
									<input type="text" class="form-control" id="seekerZip" name="seekerVO.seekerZip"> 
									<span class="input-group-append">
										<button type="button" class="btn btn-secondary btn-flat"
											onclick="DaumPostcode()">우편번호 찾기</button>
									</span>
								</div>
							</div>
                             <div class="col-xl-12 mb-3">
                                <label for="seekerAdd1" class="form-label text-default d-block">기본주소</label>
                             <div class="input-group">
                                    <input type="text" class="form-control form-control-lg" id="seekerAdd1" name="seekerVO.seekerAdd1" placeholder="">
                                </div>
                            </div>        
                             <div class="col-xl-12 mb-3">
                                <label for="seekerAdd2" class="form-label text-default d-block">상세주소</label>
                             <div class="input-group">
                                    <input type="text" class="form-control form-control-lg" id="seekerAdd2" name="seekerVO.seekerAdd2" placeholder="">
                                </div>
                            </div>   
                            
                   <div class="tab-content mt-2 mt-xl-2">
                                <div class="tab-pane show active text-muted" id="home-vertical" role="tabpanel">
                                    <label for="agree_all">
                                        <input type="checkbox" name="agree_all" id="agree_all">
                                        <span>모두 동의합니다</span>
                                    </label><br>
                                    <label for="agree1">
                                        <input type="checkbox" class="aa" name="agree" value="1" id="agree1">
                                        <span>이용약관 동의<strong>(필수)</strong></span>
                                    </label><br>
                                    <label for="agree2">
                                        <input type="checkbox" class="aa" name="agree" value="2" id="agree2">
                                        <span>개인정보 수집, 이용 동의<strong>(필수)</strong></span>
                                    </label><br>
                                    <label for="agree3">
                                        <input type="checkbox" class="aa" name="seekerVO.seekerModifyYn" value="Y" id="agree3">
                                        <span>개인정보 수정 동의<strong>(선택)</strong></span>
                                    </label>
                                </div>
                            </div>
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
</div>
 
<!-- 다음 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
$(function(){
    // 동의 모두선택 / 해제
    const agreeChkAll = document.querySelector('input[name=agree_all]');
    agreeChkAll.addEventListener('change', (e) => {
        let agreeChk = document.querySelectorAll('.aa');
        for(let i = 0; i < agreeChk.length; i++){
            agreeChk[i].checked = e.target.checked;
        }
    });

    // 중복확인 체크
    var memId = $('#memId');
    var idCheckFlag = false;
    
    memId.on('keyup', function(){
        var id = $('#memId').val(); // 아이디 입력 값
        var idPattern = /^[a-zA-Z0-9!@#$%^&*]{4,20}$/; // 아이디 정규식
        if(!idPattern.test(id)){
            $('#idCheckResult').html("아이디 입력 규칙이 지켜지지 않고 있습니다!").css("color", "red");
        }else{
        	var data = { memId: id };
            $.ajax({
                url: "/seeker/idCheck.do",
                type: "post",
                data: JSON.stringify(data),
    			beforeSend : function(xhr){	// 데이터 전송 전, 헤더에 csrf 값 설정
    				xhr.setRequestHeader(header, token);
    			},
                contentType: "application/json;charset=utf-8",
                success: function(res){
                    if(res == "NOTEXIST"){
                        $('#idCheckResult').html("사용 가능한 아이디입니다!").css('color','blue');
                        idCheckFlag = true;        
                    } else {
                        $("#idCheckResult").html("이미 사용중인 아이디입니다!").css("color", "red");
                        idCheckFlag = false;    
                    }
                }
            });    
	
        }
    });
    
    // 휴대폰 인증 api
    var phoneCheck = false;	// 인증요청확인 여부
    $('#checkTel').on('click', function(){
        
        $('#telAuth').show();
        
        var seekerTel = $('#seekerTel').val();
        $.ajax({
            type: "get",
            url: "/phoneCheck?phone=" + seekerTel,
            cache: false,
            success: function(data){
                if(data == "error"){
                    alert("휴대폰 번호가 올바르지 않습니다.");
                    $('#telCheckResult').html("유효한 휴대폰 번호가 아닙니다.").css('color','red');
                } else {
                    $("#telCheckResult").text("인증번호를 입력한 뒤 확인을 눌러주십시오.").css('color','red');
                    window.code2 = data; // 전역 변수로 설정
                }
            }
        });     
    });
    
    $('#telAuthBtn').on('click', function(){
        if($('#authNo').val() == window.code2){
            $('#telCheckResult').html("인증번호가 일치합니다.").css('color', 'blue');
            phoneCheck = true;
        } else {
            $('#telCheckResult').html("인증번호가 일치하지 않습니다.").css('color', 'red');
        }
    });

    var signupBtn = $("#signupBtn");  // 가입하기 버튼 Element
    var signupForm = $("#signupForm");    // 회원가입 Form Element

    // 가입하기 버튼
    signupBtn.on('click', function(){
        var memId = $('#memId').val();    // 아이디 값
        var memPw = $('#memPw').val();    // 비밀번호 값
        var memName = $('#memName').val();    // 이름 값
        var seekerBirth = $('#seekerBirth').val();    // 구직자생년월일 값
        var seekerZip = $('#seekerZip').val();    // 구직자우편주소 값
        var seekerEmail = $('#seekerEmail').val();    // 구직자이메일 값
        var seekerTel = $('#seekerTel').val();    // 구직자전화번호 값
        var agree1 = $('#agree1').prop('checked');    // 이용약관 동의 여부
        var agree2 = $('#agree2').prop('checked');    // 개인정보 수집, 이용 동의 여부
        var agree3 = $('#agree3').prop('checked');    // 개인정보 이용 동의 여부

        // 정규식 패턴
        var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if(memPw == null || memPw == ""){
            alert("비밀번호를 올바르게 입력해주세요!");
            return false;
        } 

        if(memName == null || memName == ""){
            alert("이름을 입력해주세요!");
            return false;
        } 

        if(seekerBirth == null || seekerBirth == ""){
            alert("생년월일을 입력해주세요!");
            return false;
        }

        if(seekerZip == null || seekerZip == ""){
            alert("우편번호를 올바르게 입력해주세요!");
            return false;
        }

        if(seekerEmail == null || seekerEmail == "" || !emailPattern.test(seekerEmail)){
            alert("이메일을 올바르게 입력해주세요!");
            return false;
        } 

        if(seekerTel == null || seekerTel == ""){
            alert("휴대폰번호를 올바르게 입력해주세요! ('-'빼고 숫자만 입력, 10~11자리)");
            return false;
        } 

        if(!agree1 || !agree2){
            alert("필수 약관에 모두 동의해주세요!");
            return false;
        }
    
        if(idCheckFlag && phoneCheck){
            signupForm.submit(); // 회원가입     
        } else {
            alert("다시한번 확인해보세요!");
            $('#memId').focus();
        }
    });    

    $('#autoBtn1').on('click',function(){
    	$('#memPw').val("1234");
    	$('#memName').val("이민호");
    	$('#seekerBirth').val("1997/10/01");
    	$('#seekerEmail').val("melon987789@naver.com");
    	$('#seekerTel').val("01031931413");
    	$('#seekerZip').val("34130");
    	$('#seekerAdd1').val("대전 유성구 가정로 306-6");
    	$('#seekerAdd2').val("101동 1601호");
    });
    
    
    
});

// 다음 api쓰기 - 주소
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            if(data.userSelectedType === 'R'){
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
            } 
              
            document.getElementById('seekerZip').value = data.zonecode;
            document.getElementById("seekerAdd1").value = addr;
            document.getElementById("seekerAdd2").focus();
        }
    }).open();
}
</script>