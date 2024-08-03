<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.body{
	font-size: 16px;
}
.form-label {
    font-size: 18px;
}
.experience-details {
    margin-left: 20px;
}
.scrollable-container {
    max-height: 150px; 
    overflow-y: scroll;
}
.form-check{
	margin-right:10px;
} 
</style>
<div class="main-content app-content">
    <div class="container-fluid">
        <div class="container-lg">
    
        <!-- Page Header -->
		<br><br>
        <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
               <h1 class="page-title fw-semibold fs-21 mb-0">채용 공고 등록</h1>
               <button  class="btn btn-light rounded-pill btn-wave" id="autoBtn1">자동완성</button>
             
        </div>
        <!-- Page Header Close -->
    
        <div class="row">
                <div class="card custom-card" style="padding:10px;">

                    <div class="card-body">
                    
                     <form action="/recruitmentinsert/intialInsert.do" method="post" enctype="multipart/form-data" id="insertForm">
                        <div class="row" style="height: 100%; ">
                        	<!-- 맨위 왼쪽 시작  -->
                            <div class="col-md-7 mb-3" style="margin:0px 30px 50px 10px;">
                                <label class="form-label">공고 제목</label>
                                <input type="text" class="form-control" style="margin-bottom:50px;" placeholder="공고제목을 입력하세요" name="recNtcTitle" id="recNtcTitle">
                            </div>
                            <!-- 맨위 왼쪽  끝-->
                            
                            <!-- 맨위 오른쪽 시작  -->
                            <div class="col-md-4 mb-3" style="margin-bottom:50px;">
                                <label class="form-label">공고내용</label>
                                <input class="form-control" type="file" id="imgFile" name="imgFile">
                            </div>
                            <!-- 맨위 오른쪽 끝  -->
                            
                            <!--  가운대 왼쪽 시작--> 
                            <div class="col-md-7 mb-3" style="margin-left:10px; margin-right:30px;">
                                <div class="row" style="margin-bottom:50px;">
	                               	    <span class="form-label">고용형태</span>
	                                <div class="d-sm-flex">
	                               	    <div class="form-check form-check-lg">
	                                        <input class="form-check-input" type="radio" name="workingTypeCode" value="WTP0101" id="employmentType1" checked>
	                                        <label class="form-check-label" for="employmentType1">정규직</label>
	                                    </div>
	                               	    <div class="form-check form-check-lg">
	                                        <input class="form-check-input" type="radio" name="workingTypeCode" value="WTP0102" id="employmentType2">
	                                        <label class="form-check-label" for="employmentType2">계약직</label>
	                                    </div>
	                               	    <div class="form-check form-check-lg">
	                                        <input class="form-check-input" type="radio" name="workingTypeCode" value="WTP0103" id="employmentType3">
	                                        <label class="form-check-label" for="employmentType3">인턴직</label>
	                                    </div>
	                               	    <div class="form-check form-check-lg">
	                                        <input class="form-check-input" type="radio" name="workingTypeCode" value="WTP0104" id="employmentType4">
	                                        <label class="form-check-label" for="employmentType4">파견직</label>
	                                    </div>
	                                </div>
                                </div>
                                
                                <br>
                                <div class="row" style="margin-bottom:50px;">
	                               	    <span class="form-label">학력제한</span>
	                                <div class=" d-sm-flex align-items-center justify-content-between">
	                               	    <div class="form-check form-check-lg">
	                                        <input class="form-check-input" type="radio" name="eduCode" value="EDU0101" id="educationLevel1" checked>
	                                        <label class="form-check-label" for="educationLevel1">학력<br>무관</label>
	                                    </div>
	                               	    <div class="form-check form-check-lg">
	                                        <input class="form-check-input" type="radio" name="eduCode" value="EDU0107" id="educationLevel2">
	                                        <label class="form-check-label" for="educationLevel2">고등학교<br>졸업 이상 </label>
	                                    </div>
	                               	    <div class="form-check form-check-lg">
	                                        <input class="form-check-input" type="radio" name="eduCode" value="EDU0108" id="educationLevel3">
	                                        <label class="form-check-label" for="educationLevel3"> 대학교<br>졸업(2,3년) 이상</label>
	                                    </div>
	                               	    <div class="form-check form-check-lg">
	                                        <input class="form-check-input" type="radio" name="eduCode" value="EDU0109" id="educationLevel4">
	                                        <label class="form-check-label" for="educationLevel4"> 대학교<br>졸업(4년) 이상</label>
	                                    </div>
	                                    <div class="form-check form-check-lg">
	                                        <input class="form-check-input" type="radio" name="eduCode" value="EDU0110" id="educationLevel5">
	                                        <label class="form-check-label" for="educationLevel5">석사<br>졸업 이상</label>
	                                    </div>
	                                </div>
                                	
                                </div>
                                <br>
                                <div class="row experience-container" style="margin-bottom:50px;">
	                               	    <span class="form-label">경력유무</span>
	                                <div class=" d-sm-flex " style="width: 700px;">
	                               	    <div class="form-check form-check-lg">
	                                        <input class="form-check-input" type="radio" name="experienceCode" value="EXP0103" id="experience1" checked>
	                                        <label class="form-check-label" for="experience1">경력무관</label>
	                                    </div>
	                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
	                               	    <div class="form-check form-check-lg">
	                                        <input class="form-check-input" type="radio" name="experienceCode" value="EXP0101" id="experience2">
	                                        <label class="form-check-label" for="experience2">신입</label>
	                                    </div>
	                                    &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
	                               	    <div class="form-check form-check-lg">
	                                        <input class="form-check-input" type="radio" name="experienceCode" value="EXP0102" id="experience3">
	                                        <label class="form-check-label" for="experience3">경력</label>
	                                    </div>
	                                     &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
	                                <span id="experienceDetails" class="experience-details"></span>
	                                </div>
	                                <!-- 연차 경력을 누르면 연차를 체크할수있는 radio버튼이 나오게함  -->
                                </div>

                                
                            </div>
                            
                            
                            <!--  가운대 왼쪽 끝-->
                            
                            <!--  가운대 오른쪽 시작-->
                            <div class="col-md-4 mb-3">
                                <div class="row">
         <div class="col-xl-12 mb-3">
            <label class="form-label">공고 일정</label><br><br>
            <div class="row">
                <div class="col-md-6">
                    <label class="form-label" style="font-size: 14px;">- 공고 시작일</label>
                    <input type="date" id="recNtcStart" name="recNtcStart" class="form-control" aria-label="dateofbirth">
                </div>
                <div class="col-md-6">
                    <label class="form-label" style="font-size: 14px;">- 공고 마감일</label>
                    <input type="date" id="recNtcEnd" name="recNtcEnd" class="form-control" aria-label="dateofbirth">
                </div>
            </div>
        </div>
                                    	<br><br><br>
                                    <div class="col-xl-8 mb-3">   
                                    <label class="form-label">근무지 주소</label>
                                   <br><br>
                                      <select class="form-control" name="workingLocCode" id="workLocation">
                                            <option value="LOC0101">서울</option>
                                            <option value="LOC0102">경기</option>
                                            <option value="LOC0103">광주</option>
                                            <option value="LOC0104">대구</option>
                                            <option value="LOC0105">대전</option>
                                            <option value="LOC0106">부산</option>
                                            <option value="LOC0107">울산</option>
                                            <option value="LOC0108">인천</option>
                                            <option value="LOC0109">강원</option>
                                            <option value="LOC0110">경남</option>
                                            <option value="LOC0111">경북</option>
                                            <option value="LOC0112">전남</option>
                                            <option value="LOC0113">전북</option>
                                            <option value="LOC0114">충북</option>
                                            <option value="LOC0115">충남</option>
                                            <option value="LOC0116">제주</option>
                                            <option value="LOC0118">세종</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <!--  가운대 오른쪽 끝-->
                            <!-- 밑쪽 시작 -->
                           <br><br>
                            <div class="col-md-4 mb-3" style="padding-bottom:50px;">
                                <label class="form-label">담당자이름</label> 
                                <input type="text" class="form-control" id="rcrtName" name="rcrtName" placeholder="담당자 이름을 입력해주세요" >
                            </div>
                            <div class="col-md-4 mb-3" style="padding-bottom:50px;">
                                <label class="form-label">담당자 전화번호</label>
                                <input type="text" class="form-control" id="rcrtTel" name="rcrtTel" placeholder="담당자 전화번호를 입력해주세요" >
                            </div>
                            <div class="col-md-4 mb-3" style="padding-bottom:50px;">
                                <label class="form-label">담당자 이메일</label>
                                <input type="tel" class="form-control" id="rcrtEmail" name="rcrtEmail" placeholder="담당자 이메일을 입력해주세요" >
                            </div>
	                         
	                            <!-- 위는 담당자 정보 적는곳 밑은 모집분야 기술스택, 연봉 -->
	                            
                            <br><br> 
                             <div class="col-md-4 mb-3">
                                <label class="form-label">연봉</label>
                                  <select class="form-control " name="salaryRangeCode" id="salary">
                                        <option value="SAL0101">회사내규에 따름</option>
                                        <option value="SAL0102">2,600만원 이상</option>
                                        <option value="SAL0103">2,800만원 이상</option>
                                        <option value="SAL0104">3,000만원 이상</option>
                                        <option value="SAL0105">3,200만원 이상</option>
                                        <option value="SAL0106">3,400만원 이상</option>
                                        <option value="SAL0107">3,600만원 이상</option>
                                        <option value="SAL0108">3,800만원 이상</option>
                                        <option value="SAL0109">4,000만원 이상</option>
                                        <option value="SAL0110">5,000만원 이상</option>
                                        <option value="SAL0111">6,000만원 이상</option>
                                        <option value="SAL0112">7,000만원 이상</option>
                                        <option value="SAL0113">8,000~9,000만원</option>
                                        <option value="SAL0114">9,000~1억원</option>
                                        <option value="SAL0115">1억원 이상</option>
                                        <option value="SAL0116">면접후 결정</option>
                                  </select>
                             </div>
                            
                             <div class="col-md-4 mb-3">
                                <label class="form-label">모집 분야</label>
                                  <select class="form-control "name="positionCode" id="recruitmentField">
                                        <option value="POS0101">프론트엔드</option>
                                        <option value="POS0102">백엔드</option>
                                        <option value="POS0103">풀스택</option>
                                        <option value="POS0104">미들티어</option>
                                        <option value="POS0105">웹</option>
                                        <option value="POS0106">데스크톱</option>
                                        <option value="POS0107">모바일</option>
                                        <option value="POS0108">그래픽</option>
                                        <option value="POS0109">게임</option>
                                        <option value="POS0110">데이터 사이언티스트</option>
                                        <option value="POS0111">빅 데이터</option>
                                        <option value="POS0112">데브옵스</option>
                                        <option value="POS0113">CRM</option>
                                        <option value="POS0114">SDET</option>
                                        <option value="POS0115">임베디드</option>
                                        <option value="POS0116">보안</option>
                                  </select>
                             </div>
                             
                             <div class="col-md-4 mb-3" id="techStackContainer" >		
                             <label class="form-label">우대기술스택</label>				
								<div class="card-body">
								    <div class="scrollable-container">
								        <div class="form-check mb-2" style="font-size: 20px;">
								            <input class="form-check-input" type="checkbox" value="SKL0101" name="skillstackList">
								            <label class="form-check-label" for="primaryChecked">Java</label>
								        </div>
								        <div class="form-check mb-2" style="font-size: 20px;">
								            <input class="form-check-input form-checked-secondary" type="checkbox" value="SKL0102" name="skillstackList">
								            <label class="form-check-label" for="secondaryChecked">JavaScript</label>
								        </div>
								        <div class="form-check mb-2" style="font-size: 20px;">
								            <input class="form-check-input form-checked-warning" type="checkbox" value="SKL0103" name="skillstackList">
								            <label class="form-check-label" for="warningChecked">Spring</label>
								        </div>
								        <div class="form-check mb-2" style="font-size: 20px;">
								            <input class="form-check-input form-checked-info" type="checkbox" value="SKL0104" name="skillstackList" >
								            <label class="form-check-label" for="infoChecked">HTML/CSS</label>
								        </div>
								        <div class="form-check mb-2" style="font-size: 20px;">
								            <input class="form-check-input form-checked-success" type="checkbox" value="SKL0105" name="skillstackList" >
								            <label class="form-check-label" for="successChecked">jQuery</label>
								        </div>
								        <div class="form-check mb-2" style="font-size: 20px;">
								            <input class="form-check-input form-checked-danger" type="checkbox" value="SKL0106" name="skillstackList" >
								            <label class="form-check-label" for="dangerChecked">JSP</label>
								        </div>
								        <div class="form-check mb-0" style="font-size: 20px;">
								            <input class="form-check-input form-checked-dark" type="checkbox" value="SKL0107" name="skillstackList" >
								            <label class="form-check-label" for="darkChecked">Vue.js</label>
								        </div>
								        <div class="form-check mb-2" style="font-size: 20px;">
								            <input class="form-check-input" type="checkbox" value="SKL0108" name="skillstackList" >
								            <label class="form-check-label" for="primaryChecked">Oracle</label>
								        </div>
								        <div class="form-check mb-2" style="font-size: 20px;">
								            <input class="form-check-input form-checked-secondary" type="checkbox" value="SKL0109" name="skillstackList">
								            <label class="form-check-label" for="secondaryChecked">MySQL</label>
								        </div>
								        <div class="form-check mb-2" style="font-size: 20px;">
								            <input class="form-check-input form-checked-warning" type="checkbox" value="SKL0110" name="skillstackList">
								            <label class="form-check-label" for="warningChecked">React</label>
								        </div>
								        <div class="form-check mb-2" style="font-size: 20px;">
								            <input class="form-check-input form-checked-info" type="checkbox" value="SKL0111" name="skillstackList">
								            <label class="form-check-label" for="infoChecked">Spring Boot</label>
								        </div>
								        <div class="form-check mb-2" style="font-size: 20px;">
								            <input class="form-check-input form-checked-success" type="checkbox" value="SKL0112"name="skillstackList" >
								            <label class="form-check-label" for="successChecked">PHP</label>
								        </div>
								        <div class="form-check mb-2" style="font-size: 20px;">
								            <input class="form-check-input form-checked-danger" type="checkbox" value="SKL0113"name="skillstackList" >
								            <label class="form-check-label" for="dangerChecked">Python</label>
								        </div>
								        <div class="form-check mb-0" style="font-size: 20px;">
								            <input class="form-check-input form-checked-dark" type="checkbox" value="SKL0114" name="skillstackList" >
								            <label class="form-check-label" for="darkChecked">Node.js</label>
								        </div>
								        <div class="form-check mb-0" style="font-size: 20px;">
								            <input class="form-check-input form-checked-dark" type="checkbox" value="SKL0115" name="skillstackList" >
								            <label class="form-check-label" for="darkChecked">C#</label>
								        </div>
								        <div class="form-check mb-0" style="font-size: 20px;">
								            <input class="form-check-input form-checked-dark" type="checkbox" value="SKL0116" name="skillstackList" >
								            <label class="form-check-label" for="darkChecked">Swift</label>
								        </div>
								        <div class="form-check mb-0" style="font-size: 20px;">
								            <input class="form-check-input form-checked-dark" type="checkbox" value="SKL0117" name="skillstackList">
								            <label class="form-check-label" for="darkChecked">전자정부프레임워크</label>
								        </div>
								        <div class="form-check mb-0" style="font-size: 20px;">
								            <input class="form-check-input form-checked-dark" type="checkbox" value="SKL0118" name="skillstackList">
								            <label class="form-check-label" for="darkChecked">kotlin</label>
								        </div>
								        <div class="form-check mb-0" style="font-size: 20px;">
								            <input class="form-check-input form-checked-dark" type="checkbox" value="SKL0119" name="skillstackList">
								            <label class="form-check-label" for="darkChecked">MYSQL</label>
								        </div>
								        <div class="form-check mb-0" style="font-size: 20px;">
								            <input class="form-check-input form-checked-dark" type="checkbox" value="SKL0120"  name="skillstackList">
								            <label class="form-check-label" for="darkChecked">React</label>
								        </div>
								        <div class="form-check mb-0" style="font-size: 20px;">
								            <input class="form-check-input form-checked-dark" type="checkbox" value="SKL0121"  name="skillstackList">
								            <label class="form-check-label" for="darkChecked">Figma</label>
								        </div>
								        <div class="form-check mb-0" style="font-size: 20px;">
								            <input class="form-check-input form-checked-dark" type="checkbox" value="SKL0122" name="skillstackList">
								            <label class="form-check-label" for="darkChecked">Notion</label>
								        </div>
								        <div class="form-check mb-0" style="font-size: 20px;">
								            <input class="form-check-input form-checked-dark" type="checkbox" value="SKL0123"  name="skillstackList">
								            <label class="form-check-label" for="darkChecked">Slack</label>
								        </div>
								    </div>
								</div>
                             </div>
                            <div class="col-md-12" style="text-align: center;">
                                <button type="button" class="btn btn-primary" id="insertBtn">제출</button>
                            </div>
                             <!-- 밑쪽 끝-->
                        </div>
                        <sec:csrfInput/>
                      </form>        
                        
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>

<!-- End:: row-6 -->
<script>
$(function(){
    $('input[name="experienceCode"]').on('change', function(){
        if ($('#experience3').is(':checked')) {
            $('#experienceDetails').html(`
                <div class='form-check form-check-lg form-check-inline'>
                    <input class='form-check-input' type='radio' name='experienceLevelCode' value='YRS0101' id='years1'>
                    <label class='form-check-label' for='years1'>1-3년차</label>
                </div>
                <div class='form-check form-check-lg form-check-inline'>
                    <input class='form-check-input' type='radio' name='experienceLevelCode' value='YRS0102' id='years2'>
                    <label class='form-check-label' for='years2'>3-5년차</label>
                </div>
                <div class='form-check form-check-lg form-check-inline'>
                    <input class='form-check-input' type='radio' name='experienceLevelCode' value='YRS0103' id='years3'>
                    <label class='form-check-label' for='years3'>5년차이상</label>
                </div>
            `);
        } else {
            $('#experienceDetails').html('');
        }
    });

/*     $('#recruitmentField').on('change', function(){
        $('#techStackContainer').show();
    }); */

    $('#insertBtn').on('click',function(){
    	var recNtcTitle = $("#recNtcTitle").val();
		var imgFile = $("#imgFile").val();
		var recNtcStart = $("#recNtcStart").val();
		var recNtcEnd = $("#recNtcEnd").val();
		var rcrtName = $("#rcrtName").val();
		var rcrtTel = $("#rcrtTel").val();
		var rcrtEmail = $("#rcrtEmail").val();
		if(recNtcTitle == null || recNtcTitle == ""){
			alert("공고제목을 입력해주세요");
			return false;
		}
		if(recNtcTitle == null || recNtcTitle == ""){
			alert("공고제목을 입력해주세요");
			return false;
		}
		if(imgFile == null || imgFile == ""){
			alert("공고내용을 입력해주세요");
			return false;
		}
		if(recNtcStart == null || recNtcStart == ""){
			alert("공고시작일을 입력해주세요");
			return false;
		}
		if(recNtcEnd == null || recNtcEnd == ""){
			alert("공고마감일을 입력해주세요");
			return false;
		}
		if(rcrtName == null || rcrtName == ""){
			alert("담당자이름을 입력해주세요");
			return false;
		}
		if(rcrtTel == null || rcrtTel == ""){
			alert("담당자 전화번호를 입력해주세요");
			return false;
		}
		if(rcrtEmail == null || rcrtEmail == ""){
			alert("담당자 이메일을 입력해주세요");
			return false;
		}
		
		$('#insertForm').submit();
    	
    });
    
    $('#autoBtn1').on('click',function(){
    	$('#recNtcTitle').val("우아한 형제들 서버 개발자 모집");
    	$('#rcrtName').val("김현경");
    	$('#rcrtTel').val("010-4444-8450");
    	$('#rcrtEmail').val("tjdwo78361@naver.com")
    });
    
});
</script>