<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  

<style type="text/css">
.mypagesideBar{
	text-align: center;
	font-weight: bold;
	font-size: 20px;
}
.mypagesideBarText{
	color: gray;
}
.aaa {
	display: flex;
	flex-direction: column;
	align-items: center;
}
.checkBtn{
	width: 100px;
	text-align: center;
}
.flex-row {
	display: flex;
	flex-direction: row;
	align-items: center;
	justify-content: space-between;
	width: 100%;
}
.flex-row .col-auto {
	flex: 1;
	margin-right: 10px;
}
.centered {
	display: flex;
	flex-direction: column;
	align-items: center;
}
.button-container {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}
</style>

        <div class="col-xl-7"  style="width: 100%;">
    <!-- form문 쓰기 -->
    <form action="/mypage/profileUpdate.do" method="post" enctype="multipart/form-data" id="profileForm">
      <input type="hidden" id="memId" name="seekerVO.memId" value="${seekerVO.memId }">
        	<!--  개인정보 설정 -->
        	
            <div class="card custom-card shadow-none mb-0 border">
          	<h2 style="font-weight: bold; margin: 20px;">개인정보 수정</h2>
                <div class="card-body" >
                    <div class="mb-4">
                        <div class="mb-2">
                           <div class="mb-4 d-sm-flex align-items-center" style="justify-content: center;">
                               <div class="mb-0 me-5">
	                                   <span class="avatar avatar-xxl avatar-rounded">

	                                      <img  
	                                   <c:if test="${seekerVO.seekerProfileUrl == null || seekerVO.seekerProfileUrl  == ''}"> src="${pageContext.request.contextPath}/resources/images/black.png"</c:if> 
	                                   <c:if test="${seekerVO.seekerProfileUrl != null && seekerVO.seekerProfileUrl  != ''}">src="${seekerVO.seekerProfileUrl}"</c:if>
	                                       id="profileImg" style="cursor: pointer;" class="large-profile-img">
	                                   </span>
                                 	   <input type="file" class="custom-file-input" id="imgFile" name="seekerVO.imgFile" style="display: none;" value="${seekerVO.seekerProfileUrl}"> 
                               </div>	
                           </div>
                        </div>
                    </div>
			<!-- 개인정보 설정 끝 -->
						<div class="aaa">
		                     <div class="col-xl-6 mt-0">
                                <label for="seekerName" class="form-label text-default"  style="font-size: 15px;">이름</label><!-- memName도 update 해줘야함 -->
                                <input type="text" class="form-control form-control-lg" id="seekerName" name="seekerVO.seekerName" value="${seekerVO.seekerName }">   
                            </div><br>
                            <div class="col-xl-6 mt-0">
                                <label for="seekerEmail" class="form-label text-default"  style="font-size: 15px;">이메일</label>
                                <input type="text" class="form-control form-control-lg" id="seekerEmail" name="seekerVO.seekerEmail" value="${seekerVO.seekerEmail }">   
                            </div><br>
                            <div class="col-xl-6 mt-0">
                                <label for="seekerTel" class="form-label text-default"  style="font-size: 15px;">휴대폰</label>
                                <input type="text" class="form-control form-control-lg" id="seekerTel" name="seekerVO.seekerTel" value="${seekerVO.seekerTel }">   
                            </div><br>
                          <div class="col-xl-6 mt-0">
	                           <label for="seekerZip" class="form-label text-default d-block"  style="font-size: 15px;">우편번호</label>
			                <div class="input-group mb-3">
								<input type="text" class="form-control" id="seekerZip" name="seekerVO.seekerZip" value="${seekerVO.seekerZip }"> 
								<span class="input-group-append">
									<button type="button" class="btn btn-secondary btn-flat"
										onclick="DaumPostcode()">우편번호 찾기</button>
								</span>         
							</div>
						</div>
                           <div class="col-xl-6 mt-0">
                              <label for="seekerAdd1" class="form-label text-default d-block" style="font-size: 15px;">기본주소</label>
                           <div class="input-group">
                                  <input type="text" class="form-control form-control-lg" id="seekerAdd1" name="seekerVO.seekerAdd1"  value="${seekerVO.seekerAdd1 }">
                              </div>
                          </div>      <br>
                           <div class="col-xl-6 mt-0">
                              <label for="seekerAdd2" class="form-label text-default d-block"  style="font-size: 15px;">상세주소</label>
                           <div class="input-group">
                                  <input type="text" class="form-control form-control-lg" id="seekerAdd2" name="seekerVO.seekerAdd2"  value="${seekerVO.seekerAdd2 }">
                              </div>
                          </div>
							<br>

                            <div class="col-xl-6 mt-0">
                                <div class="card-header justify-content-between" style="padding: 0px;">
                                    <div  style="font-weight: bold; font-size: 15px;">
                                   	     최종 학력
                                    </div>
                                </div>
                                <br>
                                <div class="card-body justify-content-between" style="padding: 0px;">
                                    <div class="flex-row">
                                        <div class="col-auto">
                                            <input type="text" class="form-control" id="eduGraduatedDate" name="educationVO.eduGraduatedDate" placeholder="YYYY.MM 졸업" value="${educationVO.eduGraduatedDate }">
                                        </div>
                                        <div class="col-auto">	
                                            <select class="form-select" id="eduTypeCode" name="educationVO.eduTypeCode">
                                                <option selected>학력구분</option>
                                                <option value="EDU0101" <c:if test="${educationVO.eduTypeCode eq 'EDU0101'}">selected</c:if>>학력무관</option>
                                                <option value="EDU0102" <c:if test="${educationVO.eduTypeCode eq 'EDU0102'}">selected</c:if>>고등학교졸업</option>
                                                <option value="EDU0103" <c:if test="${educationVO.eduTypeCode eq 'EDU0103'}">selected</c:if>>대학졸업(2,3년)</option>
                                                <option value="EDU0104" <c:if test="${educationVO.eduTypeCode eq 'EDU0104'}">selected</c:if>>대학졸업(4년)</option>
                                                <option value="EDU0105" <c:if test="${educationVO.eduTypeCode eq 'EDU0105'}">selected</c:if>>석사졸업</option>
                                                <option value="EDU0106" <c:if test="${educationVO.eduTypeCode eq 'EDU0106'}">selected</c:if>>박사졸업</option>
                                            </select>
                                        </div>
                                        <div class="col-auto">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="eduName" name="educationVO.eduName" value="${educationVO.eduName }" placeholder="학교명">
                                            </div>
                                        </div>
                                        <div class="col-auto">
                                            <div class="input-group">
                                                <input type="text" class="form-control" id="eduMajor" name="educationVO.eduMajor" value="${educationVO.eduMajor }" placeholder="전공/학과">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

							<br>
                                <div class="card-header justify-content-between">
                                    <div class="card-title">
                                 		        인재 제안 여부
                                    </div>
                                </div>
                                <div class="card-body d-sm-flex align-items-center justify-content-between">
                                    <div class="form-check checkBtn">
                                        <input class="form-check-input" type="radio" name="seekerVO.seekerStatusCode" id="seekerStatusPermit" value="OPN0101" <c:if test="${seekerVO.seekerStatusCode eq 'OPN0101' }">checked</c:if> style="font-size: 20px;">
                                        <label class="form-check-label" for="seekerStatusPermit" style="font-size: 20px; font-weight: bold;">
                                            허가
                                        </label>
                                    </div>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <div class="form-check checkBtn">
                                        <input class="form-check-input" type="radio" name="seekerVO.seekerStatusCode" id="seekerStatusDeny" value="OPN0102"  <c:if test="${seekerVO.seekerStatusCode eq 'OPN0102' }">checked</c:if> style="font-size: 20px;">
                                        <label class="form-check-label" for="seekerStatusDeny" style="font-size: 20px; font-weight: bold;">
                                            거부
                                        </label>
                                    </div>
                                </div>
                                
                                <div class="card-header justify-content-between">
                                    <div class="card-title">
                                 		        경력 여부
                                    </div>
                                </div>
                                <div class="card-body d-sm-flex align-items-center justify-content-between">
                                    <div class="form-check checkBtn">
                                        <input class="form-check-input" type="radio" name="seekerVO.seekerExp" id="seekerExp" value="경력"  style="font-size: 20px;" <c:if test="${seekerVO.seekerExp eq '경력' }">checked</c:if> >
                                        <label class="form-check-label" for="seekerExp" style="font-size: 20px; font-weight: bold;">
                                            경력
                                        </label>
                                    </div>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <div class="form-check checkBtn">
                                        <input class="form-check-input" type="radio" name="seekerVO.seekerExp" id="seekerNew" value="신입" style="font-size: 20px;" <c:if test="${seekerVO.seekerExp eq '신입' }">checked</c:if>>
                                        <label class="form-check-label" for="seekerNew" style="font-size: 20px; font-weight: bold;">
                                            신입
                                        </label>
                                    </div>
                                </div>
                       </div>    
                       

                </div>
            <div class="button-container">
                <button type="button" class="btn btn-secondary rounded-pill btn-wave" id="updateBtn">수정 완료</button>
            </div>
            <br>
            </div>
        <sec:csrfInput/>
     </form>
        </div>
     <!-- form문 끝 -->


<!-- 로그아웃하기위한 hiddenForm 만들기 -->
<form action="/logout" method="post" id="logoutForm">
	<sec:csrfInput/>
</form>

<!-- 다음 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
$(function(){
	// 이미지를 누르면 파일이 나타나게함
	var profileImg = $('#profileImg');
	profileImg.on('click',function(){
		$('#imgFile').click();
	});
	
	// 임시로 프로필 이미지를 바꿔줌 - 데이터에는 이미지파일  URL이 안들어감
	var imgFile = $('#imgFile');
	imgFile.on('change',function(event){
		var file = event.target.files[0]; // 내가 선택한 파일(우리는 이미지가 되겠습니다)
		
		if(isImageFile(file)){ // 이미지 파일이라면
			 var reader = new FileReader();
			 reader.onload = function(e){
			// 프로필 이미지 Element에 src 경로로 result를 셋팅한다.
			// 이미지 파일 데이터가 base64인코딩 형태로 변형된 데이터가 src경로에 설정된다.
			profileImg.attr("src", e.target.result);
		}
			 reader.readAsDataURL(file);
		}else{
			alert("이미지 파일을 선택해주세요!");
		}
	});
	

	// 수정완료
	var updateBtn = $('#updateBtn');
	var profileForm = $('#profileForm');
	
	updateBtn.on('click',function(){
		var seekerName = $('#seekerName').val();
		var seekerEmail = $('#seekerEmail').val();
		var seekerTel = $('#seekerTel').val();
		var seekerZip = $('#seekerZip').val();
		var seekerAdd1 = $('#seekerAdd1').val();
		var seekerAdd2 = $('#seekerAdd2').val();
		var eduGraduatedDate = $('#eduGraduatedDate').val();
		var eduTypeCode = $('#eduTypeCode').val();
		
		if(seekerName == null || seekerName == ""){
			alert("이름을 입력해주세요");
			return false;
		}
		if(seekerEmail == null || seekerEmail == ""){
			alert("이메일을 입력해주세요");
			return false;
		}
		if(seekerTel == null || seekerTel == ""){
			alert("전화번호를 입력해주세요");
			return false;
		}
		if(seekerZip == null || seekerZip == ""){
			alert("우편번호를 입력해주세요");
			return false;
		}
		if(seekerAdd1 == null || seekerAdd1 == ""){
			alert("기본주소를 입력해주세요");
			return false;
		}
		if(seekerAdd2 == null || seekerAdd2 == ""){
			alert("상세주소를 입력해주세요");
			return false;
		}
		if(eduGraduatedDate == null || eduGraduatedDate == ""){
			alert("졸업일자를 입력해주세요");
			return false;
		}
		if(eduTypeCode == null || eduTypeCode == ""){
			alert("학교종류를 입력해주세요");
			return false;
		}
		profileForm.submit();
	});
	
});	


//다음 api쓰기 - 주소
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

//이미지 파일인지 체크
function isImageFile(file){
	var ext = file.name.split(".").pop().toLowerCase();	// 파일명에서 확장자를 가져온다.
	return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
}
</script>