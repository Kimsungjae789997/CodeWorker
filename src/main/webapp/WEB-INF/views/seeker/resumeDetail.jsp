<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>

<style>
body {
    font-size: 18px;
}
.basicResumeConfig{
	background-color:#F8F5FF;
	height : 60px;
	display: flex; 
	justify-content: space-between; 
	margin-bottom:100px;
}
.resume-content{
	margin-right : 200px;
}
.basicResumeConfig{
	display: flex; 
	justify-content: center; 	
	align-items: center; 
	padding: 20px;
}
.info-content p, .skillPlusInfo{
	padding : 5px;
	font-size : 16px;	
	color: #909497 ;
}
.skillBtn {
    margin-right: 5px; 
    margin-bottom: 5px; 
}
hr {
    height: 2px; 
    background-color: #909497; 
}
.careerItem:hover {
	background-color: #F8F5FF; 
}
.certificationItem:hover {
	background-color: #F8F5FF; 
}
input[type="text"], textarea {
    border: none;
    outline: none;
}
.mySkill{
	font-size : 18px;
	font-weight : 500;
	margin-right: 5px; 
    margin-bottom: 5px; 
}
</style>

<div class="row">

	<c:set value="${resumeVo }" var="resume"></c:set>
	<c:set value="${userCareerList }" var="userCareerList"></c:set>
	
	<form action="/resume/update" method="post" enctype="multipart/form-data" id="resume">
		
		<!-- 기본 이력서 여부 -->
		<div class="col-12">
		<div class="basicResumeConfig" style="text-align: left;">
		<c:choose>
			<c:when test="${resume.resumeYn eq 'Y'}">
				<span>채용담당자에게 면접 제안을 받을 수 있는 기본 이력서입니다. 개인정보는 공개되지 않으니 안심하세요.</span>&nbsp;&nbsp;	
				<span style='font-weight:bold; color:#6600cc;'>기본 이력서 <i class='bi bi-patch-check'></i>&nbsp;&nbsp;</span>
				<input type="hidden" name="resumeYn" value="Y"> 
			</c:when>
			<c:otherwise>
				<span>기본 이력서로 설정 시 채용담당자에게 노출되어 채용 제안받을 확률이 높아집니다.</span>&nbsp;&nbsp;
		        <span id="basicResumeBtn" style="font-weight: bold; color: #0066cc; text-align: right; cursor:pointer">기본 이력서로 설정하기</span>
				<input type="hidden" id="basicResumeYn" name="resumeYn" value="N"> 
			</c:otherwise>
		</c:choose>
		</div>
		</div>
		
		<!-- PDF 다운로드 -->
		<div style="text-align:right">
			<button type="button" id="resumeDownBtn" class="btn btn-dark btn-wave text-white">PDF 다운로드 <i class="bi bi-download" style="font-weight:500;"></i></button>
		</div>
			
		<!-- PDF 다운로드 영역 지정 시작 -->	
		<div id="capture">
				
			<!-- 이력서 제목  시작 -->
			<input type="hidden" name="resumeNo" id="resumeNo">
			<input type="text" class="form-control fw-semibold" name="resumeName" id="resumeName"
		           style="border: none; background: transparent; font-size:30px;" 
		           placeholder="이력서 제목을 입력하세요" value="${resume.resumeName }">
		    <label for="resumeName" class="form-label"></label>
			<!-- 이력서 제목 끝 -->
			
			<!-- 이력서 사진 등록 form 시작 -->
			<div class="col-2 resume-profile" style="margin-top:50px;">
				<!-- 사진 등록시 이미지 바꿔주기 -->
				<label for="resumeProfileUrl">
				<c:choose>
					<c:when test="${empty resume.resumeProfileUrl }">
					<img id="uploadedProfile" src="${pageContext.request.contextPath}/resources/assets/images/seeker/resume-profile-default.png" alt="#" width="150" height="190"/>
					</c:when>
					<c:otherwise>
					<img id="uploadedProfile" src="${resume.resumeProfileUrl }" alt="${resume.resumeProfileUrl }" width="150" height="190"/>
					</c:otherwise>
				</c:choose>
				</label>
				<input type="file" id="resumeProfileUrl" name="resumeProfile" style="display:none;" />
			</div>
			<!-- 이력서 사진 등록 form 끝 -->
			
			<!-- 이력서 기본 정보 시작 -->
			<c:set value="${seekerVo }" var="seeker"></c:set>
			<input type="hidden" name="memId" value="${seeker.memId }" />
			<div class="resume-basic-info" style="margin-top:20px; margin-bottom:150px;">
				<div style="margin-bottom: 10px;" class="fw-semibold fs-21">
		        	<span>${seeker.seekerName }</span>
				</div>
				<div style="margin-bottom: 10px;">
		        	<span>생년월일 : ${seeker.seekerBirth }</span>
				</div>
				<div style="margin-bottom: 10px;">
		        	<span>이메일주소 : ${seeker.seekerEmail }</span>
				</div>
				<div style="margin-bottom: 10px;">
		        	<span>휴대폰번호 : ${seeker.seekerTel }</span>
				</div>
			</div>
			<!-- 이력서 기본 정보 끝 -->
			
			<!-- 간단 소개 시작 -->
			<div class="col-12" style="margin-bottom:150px;">
				<div>
					<span class="fw-semibold" style="color:#909497">간단 소개글</span><hr>
				</div>
				<div class="info-content" data-html2canvas-ignore="true" style="background-color:#F3F9FE; padding:10px;">
					<p>
						• 본인의 업무 경험을 기반으로 핵심역량과 업무 스킬을 간단히 작성해주세요.<br/>
						• 3~5줄로 요약하여 작성하는 것을 추천합니다!
					</p>
				</div>
				<div>
					<label for="resumeIntroduction" class="form-label"></label>
					<textarea class="form-control" id="resumeIntroduction"
						name="resumeIntroduction" maxlength="4000"
						style="font-size: 18px; height: 154px; margin: 0px 3px; border: none; background: transparent;">
					<c:choose>
					<c:when test="${empty resume.resumeIntroduction }">안녕하세요. 5년차 경영지원을 경험했습니다.</c:when>
					<c:otherwise>${resume.resumeIntroduction }</c:otherwise>
					</c:choose>
					</textarea>
				</div> 
			</div>
			<!-- 간단 소개 끝 -->
			
			<!-- 경력 시작 -->
			<div class="col-12" style="margin-bottom:30px;">
				<span class="fw-semibold" style="color:#909497">경력</span><hr>
				<div class="info-content" data-html2canvas-ignore="true" style="background-color:#F3F9FE; padding-left:10px; padding-top:5px;">
					<p>
						• 담당하신 업무 중 우선순위가 높은 업무를 선별하여 최신순으로 작성해주세요.<br/>
						• 신입의 경우, 직무와 관련된 대외활동, 인턴, 계약직 경력 등이 있다면 작성해주세요.<br/>
						• 업무 또는 활동 시 담당했던 역할과 과정, 성과에 대해 자세히 작성해주세요.
					</p>
				</div>
				<button type="button" class="btn btn-success ignoreDiv" data-html2canvas-ignore="true" id="addCareer" style="font-size:18px; font-weight:500;"><i class="bi bi-plus-lg"></i>추가</button>
			</div>
			<div>
				<ul id="careerList" style="list-style: none;">
				<!-- 경력 추가 버튼 클릭시 입력 form 추가되는 부분 -->
				<c:choose>
					<c:when test="${empty userCareerList }">
					</c:when>
					<c:otherwise>
						<c:forEach items="${userCareerList }" var="userCareer" varStatus="status"> 
							<li class="careerItem" style="padding:30px; 10px;">
							<input type="hidden" class="careerResumeNo" name="resumeCareerList[${status.index }].resumeNo" value="${param.resumeNo}"> 
								<div style="display:flex;">
									<div class="career_date_yn" style="flex:2; margin-right:10px;">
										<div class="career_date" style="margin-bottom:10px; font-weight:550; font-size:18px;">
											<input style="font-weight:550; font-size:18px; width:110px; border:none; background:transparent;" name="resumeCareerList[${status.index }].resCareerJoinDate" type="text" placeholder="YYYY-MM-DD" value="${userCareer.resCareerJoinDate }">-<input style="font-weight:550; font-size:18px; width:110px; border: none; background: transparent;" name="resumeCareerList[${status.index }].resCareerOutDate" type="text" placeholder="YYYY-MM-DD" value="${userCareer.resCareerOutDate }">
										</div>
										<div class="isCareer_yn">
    										<input class="form-check-input form-checked-outline form-checked-success isCareerCheckBtn" type="checkbox" id="careerCheckBtn" name="resumeCareerList[${status.index }].resCareerType" <c:if test="${userCareer.resCareerType != '퇴사'}">checked</c:if>>
    										<label class="form-check-label" for="careerCheckBtn">현재 재직중</label>
										</div>
									</div>
									<div class="career_detail" style="flex:3;">
										<div class="career_name" style="margin-bottom:5px;">
											<input type="text" name="resumeCareerList[${status.index }].resCareerName" maxlength="255" style="font-size:21px; font-weight:550; width:100%; border: none; background: transparent;" placeholder="회사명" value="${userCareer.resCareerName }">
										</div>
										<div class="career_dept" style="margin-bottom:5px;">
											<input type="text" name="resumeCareerList[${status.index }].resCareerDept" maxlength="255" style="font-size:18px; width: 100%; border: none; background: transparent;" placeholder="부서명" value="${userCareer.resCareerDept }">
										</div>
										<div class="career_dept" style="margin-bottom:5px;">
											<input type="text" name="resumeCareerList[${status.index }].resCareerPosition" maxlength="255" style="font-size:18px; width: 100%; border: none; background: transparent;" placeholder="직책" value="${userCareer.resCareerPosition }">
										</div>
										<div class="career_content" style="margin-bottom:5px;">
											<textarea name="resumeCareerList[${status.index }].resCareerContent" maxlength="4000" placeholder="상세 업무 내용과 성과를 기입해주세요" style="font-size: 16px; width: 700px; height: 154px; 
											color: rgb(59, 61, 64); margin: 0px 3px; border: none; background: transparent;">${userCareer.resCareerContent }</textarea>
										</div>
									</div>
									<div>
										<i class="bi bi-x-lg careerItemDeleteBtn"></i>
									</div>
								</div>
							</li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				<!-- 경력 추가 버튼 클릭시 입력 form 추가되는 부분 끝-->
				</ul>
			</div>
			<!-- 경력 끝 -->
			
			<!-- 학력 시작 -->
			<div class="col-12" style="margin-top:150px;">
				<span class="fw-semibold" style="color:#909497">학력</span><hr>
			</div>
			<div style="margin-bottom:150px;">
				<div style="margin-bottom:100px;">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            
					<c:set value="${educationVo }" var="education"/>
					<ul style="list-style: none;">
						<li>
							<div style="display:flex;">
								<div class="edu_date_yn" style="flex:1;">
									<div class="edu_date" style="margin-bottom:5px; font-weight:550; font-size:18px;">
										<span>${education.eduEnterDate }</span> - <span>${education.eduGraduatedDate }</span>
									</div>
									<div class="isCareer_yn">
									    <c:choose>
		        							<c:when test="${education.eduGraduatedYn eq 'Y'}">졸업</c:when>
		        							<c:when test="${education.eduGraduatedYn eq 'N'}">재학중</c:when>
		    							</c:choose>
									</div>
								</div>
								<div class="edu_detail" style="flex:2;">
									<div style="margin-bottom:5px;">
										<span style="font-size:21px; font-weight:550;">${education.eduName }</span>
									</div>
									<div>
										<span style="margin-bottom:5px;">${education.eduMajor }</span>
										<span style="margin-bottom:5px;">${education.eduType }</span>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>

			<!-- 스킬 추가 -->
			<div class="col-12" style="margin-bottom:150px;">
				<span class="fw-semibold" style="color:#909497">스킬</span><hr>
				
				<div class="info-content" data-html2canvas-ignore="true" style="background-color:#F3F9FE; padding-left:10px; padding-top:5px;">
					<p>
						• 개발 스택, 디자인 툴, 마케팅 툴 등 가지고 있는 직무와 관련된 스킬을 추가해보세요.<br/>
						• 데이터 분석 툴이나 협업 툴 등의 사용해본 경험이 있으신 툴들도 추가해보세요.
					</p>
				</div>
				
				<!-- 제시되는 스킬 목록 -->
				<div class="skillList" data-html2canvas-ignore="true" style="background-color:#F3F9FE;">
					<div class="recommendedSkills" style="padding-left:10px; padding-top:5px;">
						<div style="margin:3px;">
							<c:forEach items="${skillList }" var="skill">
								<c:set value="" var="selected"/>
								<c:set value="bi-plus-lg" var="icon"/>
								<c:set value="btn-success-light" var="backColor"/>
								<c:forEach items="${userSkillList }" var="userSkill">
									<c:if test="${skill.skillstackCode eq userSkill.skillstackCode}">
										<c:set value="selected" var="selected"/>
										<c:set value="btn-success" var="backColor"/>
										<c:set value="bi-check-lg" var="icon"/>
									</c:if>
								</c:forEach>
								<button type="button" class="btn ${backColor } rounded-pill btn-wave skillBtn ${selected }" data-skill="${skill.skillstackName }" data-code="${skill.skillstackCode }">
									<span class="skillName" style="font-weight: 500;">${skill.skillstackName }</span>
									<span data-testid="plus"><i class="bi ${icon }" style="font-size: 1.2em; font-weight: bold;"></i></span>
								</button>
							</c:forEach>
						</div>
					</div>
				</div>			
				<!-- 제시되는 스킬 목록 끝 -->
				
				<!-- 보유 스킬 추가되는 곳 -->
				<div style="margin-top: 20px;">				
					<c:set value="${userSkillList }" var="userSkill"></c:set>
					<div id="seekerSkillList" style="margin:3px; display:flex;">
					<c:choose>
						<c:when test="${empty userSkill }">
						</c:when>
						<c:otherwise>
							<c:forEach items="${userSkillList }" var="userSkill" varStatus="stat">
							<div class="skillItem">
							<button type="button" class="btn btn-purple-light rounded-pill btn-wave mySkill originSkill" data-skillNo="${userSkill.skillstackCode }" data-resumeNo="${resume.resumeNo }">
								<span>${userSkill.detailCodeVO.detailCodeName }</span>
								<span class="ignoreDiv"><i class="bi bi-x-lg"></i></span>
							</button>
							</div>
							</c:forEach>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
				<!-- 보유 스킬 추가되는 곳 끝 -->
			</div>
			<!-- 스킬 추가 끝 -->

			<!-- 자격증 시작 -->
			<div class="col-12" style="margin-bottom:50px;">
				<span class="fw-semibold" style="color:#909497">자격증</span><hr>
				<div class="info-content" data-html2canvas-ignore="true" style="background-color:#F1FBFF; padding-left:10px; padding-top:5px;">
					<p>
					• 직무 관련 자격증, 수료한 교육이나 참석한 외부활동 등이 있다면 간략히 작성해주세요.<br/>
					• 지원하는 회사에서 요구하는 경우가 아니라면 운전면허증과 같은 자격증은 생략하는 것이 좋습니다!
					</p>
				</div>
				<button type="button" data-html2canvas-ignore="true" class="btn btn-success ignoreDiv" id="addCertificationBtn" style="font-size:18px; font-weight:500;"><i class="bi bi-plus-lg"></i>추가</button>
			</div>
			<div>
				<c:set value="${userCertificationList }" var="userCertification"></c:set>
				<ul id="certificationList" style="list-style: none;">
				<c:choose>
					<c:when test="${empty userCertification }">
					</c:when>
					<c:otherwise>
					<c:forEach items="${userCertificationList }" var="userCertification" varStatus="status">
						<li class="certificationItem" style="padding:30px; 10px;">
							<div style="display:flex; margin-bottom: 15px;">
							<input type="hidden" name="certificationList[${status.index }].resumeNo" value="${param.resumeNo}"> 
								<div class="career_date_yn" style="flex:2; margin-right:10px;">
									<div class="career_date">
										<input style="font-size:18px; font-weight:550; width:120px; border: none; background: transparent;" name="certificationList[${status.index }].certDate" type="text" class="cert_date" placeholder="YYYY-MM-DD" value="${userCertification.certDate }">
									</div>
								</div>
								<div class="career_detail" style="flex:3;">
									<div class="cert_name">
										<input type="text" name="certificationList[${status.index }].certName" maxlength="255" style="font-size:21px; font-weight:550; width: 100%; border: none; background: transparent;" placeholder="자격증명" value="${userCertification.certName }">
									</div>
									<div class="cert_serial_num">
										<input type="text" name="certificationList[${status.index }].certSerialNum" maxlength="255" style="font-size:18px; width: 100%; border: none; background: transparent;" placeholder="자격증일련번호" value="${userCertification.certSerialNum }">
									</div>
									<div class="cert_institution">
										<input type="text" name="certificationList[${status.index }].certInstitution" maxlength="255" style="font-size:18px; width: 100%; border: none; background: transparent;" placeholder="시행부처" value="${userCertification.certInstitution }">
									</div>
								</div>
								<div>
									<i class="bi bi-x-lg cartificationItemDeleteBtn"></i>
								</div>
							</div>
						</li>
					</c:forEach>	
					</c:otherwise>				
				</c:choose>
				</ul>
			</div>
			<!-- 자격증 끝 -->
			</div>
			<!-- PDF 다운로드 영역 지정 시작 -->	
			
			<div class="submitBtn" style="text-align:center; margin-top:100px; margin-bottom: 50px;">
				<button type="submit" style="font-size:1.2em; font-weight:semi-bold; width:200px; height:50px;" class="btn btn-secondary btn-wave" id="resumeUpdateBtn">저장하기</button>
			</div>
			<sec:csrfInput/>
	</form>		
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
$(function(){
	
	// 이력서 수정 실패시 alert 메세지
	let msg = "${msg}";
	//console.log("msg : ", msg);
	if(msg === "fail"){
        Swal.fire({
            title: "수정 실패",
             text: "이력서 수정이 실패되었습니다. 다시 시도하세요.",
             icon: "error",
             confirmButtonText: "확인"
         });
	}
	
	// 수정하기 버튼 클릭시 -> 보유 skill 데이터 input 만들어서 넣어주기 -> 전송
	$("#resumeUpdateBtn").on("click", function(){
		
		let mySkillList = $("#seekerSkillList").find(".skillItem").find(".mySkill");
		mySkillList.each(function(i){
			var html = ""; 
			let resumeNo = $(this).data("resumeno");
			let skillCode = $(this).data("skillno");
			html += "<input type='hidden' name='resumeSkillList["+i+"].resumeNo' value='"+resumeNo +"'/>";
			html += "<input type='hidden' name='resumeSkillList["+i+"].skillstackCode' value='"+skillCode +"'/>";
			$("#resume").append(html);
		});

        $("#resume").submit();

	});
	
	// 자기소개글 공백 제거
    let text = $('#resumeIntroduction').val().trim();
    $('#resumeIntroduction').val(text);
	
	// 쿼리스트링에서 resumeNo 받아서 이력서 제목 뿌리기
	let urlParams = new URLSearchParams(window.location.search);
	let resumeNo = urlParams.get("resumeNo");
	
	getBasicResumeInfo(resumeNo); // 수정불가한 기본정보 뿌리기

	// 경력 추가 
	let addCareer = $("#addCareer");
	addCareer.on("click", function(){
		let careerListSize = $("#careerList").find("li").length;
		//console.log(careerListSize);
		//console.log("경력 추가하기 버튼 클릭 이벤트");
		let isCareerChecked = $(".isCareerCheckBtn").is(":checked");
		let careerType = isCareerChecked ? "재직중" : "퇴사";
		
		let careerItem = `
				<li class="careerItem" style="padding:30px; 10px;">
				<input type="hidden" class="careerResumeNo" name="resumeCareerList[\${careerListSize}].resumeNo" value="${param.resumeNo}"> 
					<div style="display:flex;">
						<div class="career_date_yn" style="flex:2; margin-right:10px;">
							<div class="career_date" style="margin-bottom:10px;">
								<input style="font-weight:550; font-size:16px; width:120px; border: none; background: transparent;" name="resumeCareerList[\${careerListSize}].resCareerJoinDate" type="text" placeholder="YYYY-MM-DD">-<input style="font-weight:550; font-size:16px; width:120px; border: none; background: transparent;" name="resumeCareerList[\${careerListSize}].resCareerOutDate" type="text" placeholder="YYYY-MM-DD">
							</div>
							<div class="isCareer_yn">
								<input class="form-check-input isCareerCheckBtn" type="checkbox" name="resumeCareerList["+careerListSize+"].resCareerType">
								<label for="" class="form-check-label" style="color:#909497">현재 재직중</label>
							</div>
						</div>
						<div class="career_detail" style="flex:3;">
							<div class="career_name" style="margin-bottom:5px;">
								<input type="text" name="resumeCareerList[\${careerListSize}].resCareerName" maxlength="255" style="font-weight:400; width: 100%; border: none; background: transparent;" placeholder="회사명">
							</div>
							<div class="career_dept" style="margin-bottom:5px;">
								<input type="text" name="resumeCareerList[\${careerListSize}].resCareerDept" maxlength="255" style="font-size:16px; width: 100%; border: none; background: transparent;" placeholder="부서명">
							</div>
							<div class="career_dept" style="margin-bottom:5px;">
								<input type="text" name="resumeCareerList[\${careerListSize}].resCareerPosition" maxlength="255" style="font-size:16px; width: 100%; border: none; background: transparent;" placeholder="직책">
							</div>
							<div class="career_content" style="margin-bottom:5px;">
								<textarea name="resumeCareerList[\${careerListSize}].resCareerContent" maxlength="4000" placeholder="상세 업무 내용과 성과를 기입해주세요"
						 				  style="font-size: 16px; width: 700px; height: 154px; color: rgb(59, 61, 64); margin: 0px 3px; border: none; background: transparent;"></textarea>
							</div>
						</div>
						<div>
							<i class="bi bi-x-lg careerItemDeleteBtn"></i>
						</div>
					</div>
				</li>
				`;
            $("#careerList").append(careerItem);
	});
	
	// 경력 삭제
	$("#careerList").on("click", ".careerItemDeleteBtn", function(){
	    $(this).closest("li").remove();
	});
	
	// 자격증 추가
	let addCertificationBtn = $("#addCertificationBtn");
	addCertificationBtn.on("click", function(){
		let certificationListSize = $("#certificationList").find("li").length;	
		//console.log("자격증 추가하기 버튼 클릭 이벤트");
        let certificationItem = `
			<li class="certificationItem" style="padding:30px; 10px;">
				<div style="display:flex; margin-bottom: 15px;">
				<input type="hidden" name="certificationList[\${certificationListSize}].resumeNo" value="${param.resumeNo}"> 
					<div class="career_date_yn" style="flex:2; margin-right:10px;">
						<div class="career_date">
							<input style="width:120px; border: none; background: transparent;" name="certificationList[\${certificationListSize}].certDate" type="text" class="cert_date" placeholder="YYYY-MM-DD" value="">
						</div>
					</div>
					<div class="career_detail" style="flex:3;">
						<div class="cert_name">
							<input type="text" name="certificationList[\${certificationListSize}].certName" maxlength="255" style="width: 100%; border: none; background: transparent;" placeholder="자격증명" value="">
						</div>
						<div class="cert_serial_num">
							<input type="text" name="certificationList[\${certificationListSize}].certSerialNum" maxlength="255" style="width: 100%; border: none; background: transparent;" placeholder="자격증일련번호" value="">
						</div>
						<div class="cert_institution">
							<input type="text" name="certificationList[\${certificationListSize}].certInstitution" maxlength="255" style="width: 100%; border: none; background: transparent;" placeholder="시행부처" value="">
						</div>
					</div>
					<div>
						<i class="bi bi-x-lg cartificationItemDeleteBtn"></i>
					</div>
				</div>
			</li>
            `;
            $("#certificationList").append(certificationItem);
	});
	
	// 자격증 삭제
	$("#certificationList").on("click", ".cartificationItemDeleteBtn", function(){
	    $(this).closest("li").remove();
	});
	
	// 보유 스킬 삭제
	$(".originSkill").on("click", function(){
    	let skillName = $(this).text().trim();
        $(this).remove();
        $(".skillBtn").each(function(){
            if($(this).data("skill") === skillName){
                let icon = $(this).find("i");
                icon.removeClass('bi-check-lg').addClass('bi-plus-lg');
                $(this).removeClass('selected');
                $(this).removeClass("btn-success");
                $(this).addClass("btn-success-light");
            }
        });
	});

	// 스킬 추가 및 삭제
	$(".skillList").on("click",".skillBtn",function(){
		
		//console.log("click...!");
		let items = $("#seekerSkillList").find(".skillItem").find(".skillHiddenItem");
		let skCnt = items.length;
		console.log(skCnt);
		
	    if(!$(this).hasClass('selected')){
	    	
	        let icon = $(this).find("i");
	        icon.toggleClass('bi-plus-lg bi-check-lg');
	       
	        let resumeNoImsi = "${param.resumeNo}";
	        let skillName = $(this).data("skill");
	        let skillCode = $(this).data("code");
	        let html = "";
	        html += "<div class='skillItem'>";
	        html += "	<button type='button' class='btn btn-purple-light rounded-pill btn-wave mySkill addedSkillBtn' data-skillNo='"+skillCode+"' data-resumeNo='"+resumeNoImsi+"'>";
	        html += "		<span>"+skillName+"</span>";
	        html += "		<span><i class='bi bi-x-lg'></i></span>";
	        html += "	</button>";
	        html += "</div>";
	        $('#seekerSkillList').append(html);

	        $(this).addClass('selected');
	        $(this).removeClass("btn-success-light");
            $(this).addClass("btn-success");

            // 스킬 버튼 삭제
	        $(".addedSkillBtn").click(function(){
	            
	        	let skillName = $(this).closest('button').text().trim();
	            $(this).closest('button').remove();
	            $(".skillBtn").each(function(){
	                if($(this).data("skill") === skillName){
	                    let icon = $(this).find("i");
	                    icon.removeClass('bi-check-lg').addClass('bi-plus-lg');
	                    $(this).removeClass('selected');
	                    $(this).removeClass("btn-success");
	                    $(this).addClass("btn-success-light");
	                }
	            });
	        });
	    }
	});
	
	// 사진 썸네일 처리
	let resumeProfileUrl = $("#resumeProfileUrl");
	let uploadedProfile = $("#uploadedProfile");

	resumeProfileUrl.on("change", function(event){
		let file = event.target.files[0];
		
		if(isImageFile(file)){
			let reader = new FileReader();
			reader.onload = function(e){
				uploadedProfile.attr("src", e.target.result);
			}
			reader.readAsDataURL(file);
		}else{
            Swal.fire({
                title: "프로필 업로드 실패",
                 text: "이미지 파일을 선택해주세요 !",
                 icon: "error",
                 confirmButtonText: "확인"
             });
		}
		
	});
	
	// 기본 이력서 설정
	let basicResumeBtn = $("#basicResumeBtn");
	let basicResumeYn = $("#basicResumeYn");
	basicResumeBtn.on("click", function(){
		// value = Y
		basicResumeYn.val("Y");
		// 노출 문구 변경
		basicResumeBtn.closest("div").find("font").text("채용담당자에게 면접 제안을 받을 수 있는 기본 이력서입니다. 개인정보는 공개되지 않으니 안심하세요.");
		// badge 추가
		let newCont = $("<span style='font-weight:bold; color:#6600cc;'>기본 이력서 <i class='bi bi-patch-check'></i>&nbsp;&nbsp;</span>")
		basicResumeBtn.parent().prepend(newCont);
		// 버튼 삭제
		basicResumeBtn.remove();
	});
	
	let resumeDownBtn = $("#resumeDownBtn");
	resumeDownBtn.on("click", function(){
		console.log("다운로드 버튼 클릭...1");
		createPdf();
	});
	
	

});

function getBasicResumeInfo(resumeNo){
	$.ajax({
		url: "/resumeForm/basicInfo",
		type: "GET",
		data: {resumeNo: resumeNo},
		success: function(res){
			//console.log(res);
			$("#resumeName").val(res.resumeName);
			$("#resumeNo").val(res.resumeNo);
		},
		error:function(error){
			console.error("Error fetching resume title : ", error);
		}
	})
}

function createPdf(){
	
	$(".info-content").hide();
	$(".skillList").hide();
	$(".ignoreDiv").hide();
	
	html2canvas(document.querySelector("#capture"), {
	    scale: 2,
	    margin: 0
	}).then(canvas => {
		var imgData = canvas.toDataURL('image/png');
		var imgWidth = 180;
		var pageHeight = imgWidth * 1.414;
		var imgHeight = canvas.height * imgWidth / canvas.width;
		var heightLeft = imgHeight;
		var margin = 15;
		var doc = new jsPDF('p', 'mm', 'a4'); 
		var position = 20;
		
		doc.addImage(imgData, 'png', margin, position, imgWidth, imgHeight);
		heightLeft -= pageHeight; 
		
		// 추가 페이지 생성
		while(heightLeft >= 20){
			position = heightLeft - imgHeight;
			position = position - 20;
			doc.addPage();
			doc.addImage(imgData, 'png', margin, position, imgWidth, imgHeight);
			heightLeft -= pageHeight;
		}
		
		doc.save('resume.pdf');
		$(".info-content").show();
		$(".skillList").show();
		$(".ignoreDiv").show();
	});
}

//이미지 파일인지 체크
function isImageFile(file){
	let ext = file.name.split(".").pop().toLowerCase();
	return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
}
</script>