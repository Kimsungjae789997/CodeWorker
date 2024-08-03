<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<style>
@import url('https://fastly.jsdelivr.net/gh/wanteddev/wanted-sans@v1.0.1/packages/wanted-sans/fonts/webfonts/variable/split/WantedSansVariable.min.css');

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
		<form action="/resumeForm/insert" method="post" enctype="multipart/form-data" id="resumeForm">
		
		<div class="col-12">
		    <div class="basicResumeConfig" style="text-align: left;">
		        <span>기본 이력서로 설정 시 채용담당자에게 노출되어 채용 제안받을 확률이 높아집니다.</span>&nbsp;&nbsp;
		        <span id="basicResumeBtn" style="font-weight: bold; color: #0066cc; text-align: right; cursor:pointer">기본 이력서로 설정하기</span>
		        <input type="hidden" id="basicResumeYn" name="resumeYn" value="N"> 
		    </div>
		</div>
			<button type="button" id="autoBtn1" class="btn btn-light rounded-pill btn-wave">자동완성</button>
			<!-- 이력서 제목  시작 -->
			<input type="hidden" name="resumeNo" id="resumeNo">
			<input type="text" class="form-control" name="resumeName" id="resumeName" 
		           style="border: none; background: transparent; font-size:30px; font-weight:500;" 
		           placeholder="이력서 제목을 입력하세요" value="${resume.resumeName }">
		    <label for="resumeName" class="form-label"></label>
			<!-- 이력서 제목 끝 -->
			
			<!-- 이력서 사진 등록 form 시작 -->
			<div class="col-2 resume-profile">
				<!-- 사진 등록시 이미지 바꿔주기 -->
				<label for="resumeProfile">
				<img id="uploadedProfile" src="http://localhost/resources/assets/images/seeker/resume-profile-default.png" alt="#" width="150" height="190"/>
				</label>
				<!-- input type="file" => 파일객체 -->
				<input type="file" id="resumeProfile" name="resumeProfile" style="display:none;" />
			</div>
			
			<!-- 이력서 사진 등록 form 끝 -->
			
			<!-- 이력서 기본 정보 시작 -->
			<c:set value="${seekerVo }" var="seeker"></c:set>
			<input type="hidden" name="memId" value="${seeker.memId }" />
			<div class="resume-basic-info" style="margin-top:20px; margin-bottom:150px;">
				<div style="margin-bottom: 10px;" class="fw-semibold">
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
				<div class="info-content" style="background-color:#F3F9FE; padding:10px;">
					<p>
						• 본인의 업무 경험을 기반으로 핵심역량과 업무 스킬을 간단히 작성해주세요.<br/>
						• 3~5줄로 요약하여 작성하는 것을 추천합니다!
					</p>
				</div>
				<div>
				<label for="resumeIntroduction" class="form-label"></label>
				<textarea class="form-control" id="resumeIntroduction" name="resumeIntroduction"
						  maxlength="4000" style="font-size: 18px; height: 154px; margin: 0px 3px; border: none; background: transparent;">
					안녕하세요. 5년차 경영지원을 경험했습니다.				
				</textarea>
				</div>
			</div>
			<!-- 간단 소개 끝 -->
			
			<!-- 경력 시작 -->
			<div class="col-12" style="margin-bottom:30px;">
				<span class="fw-semibold" style="color:#909497">경력</span><hr>
				<div class="info-content" style="background-color:#F3F9FE; padding-left:10px; padding-top:5px;">
					<p>
						• 담당하신 업무 중 우선순위가 높은 업무를 선별하여 최신순으로 작성해주세요.<br/>
						• 신입의 경우, 직무와 관련된 대외활동, 인턴, 계약직 경력 등이 있다면 작성해주세요.<br/>
						• 업무 또는 활동 시 담당했던 역할과 과정, 성과에 대해 자세히 작성해주세요.
					</p>
				</div>
				<button type="button" class="btn btn-success" id="addCareer" style="font-size:18px; font-weight:500;"><i class="bi bi-plus-lg"></i>추가</button>
			</div>
			<div>
				<!-- 경력 추가 버튼 클릭시 form 추가되는 부분 -->
				<ul id="careerList" style="list-style: none;"></ul>
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
						<!-- 회원가입시 입력한 학력 정보 -->
						<li>
							<div style="display:flex;">
								<div class="edu_date_yn" style="flex:1;">
									<div class="edu_date" style="margin-bottom:5px;">
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
										<span>${education.eduName }</span>
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
				
				<div class="info-content" style="background-color:#F3F9FE; padding-left:10px; padding-top:5px;">
					<p>
						• 개발 스택, 디자인 툴, 마케팅 툴 등 가지고 있는 직무와 관련된 스킬을 추가해보세요.<br/>
						• 데이터 분석 툴이나 협업 툴 등의 사용해본 경험이 있으신 툴들도 추가해보세요.
					</p>
				</div>
				
				<div class="" style="background-color:#F3F9FE;">
					<div class="recommendedSkills" style="padding-left:10px; padding-top:5px;">
						<!-- Skill List -->
						<div style="margin:3px;">
							<c:forEach items="${skillList }" var="skill">
								<button type="button" class="btn btn-success-light rounded-pill btn-wave skillBtn" data-skill="${skill.skillstackName }" data-code="${skill.skillstackCode }">
									<span class="skillName" style="font-weight: 500;">${skill.skillstackName }</span>
									<span data-testid="plus"><i class="bi bi-plus-lg" style="font-size: 1.2em; font-weight: bold;"></i></span>
								</button>
							</c:forEach>
						</div>
						
					</div>
				</div>			
				<div style="margin-top: 20px;">				
					<!-- 보유 스킬 추가되는 곳 -->
					<div id="seekerSkillList" style="margin:3px;">
					</div>
				</div>
				
			</div>

			<div class="col-12" style="margin-bottom:50px;">
				<span class="fw-semibold" style="color:#909497">자격증</span><hr>
				<div class="info-content" style="background-color:#F1FBFF; padding-left:10px; padding-top:5px;">
					<p>
					• 직무 관련 자격증, 수료한 교육이나 참석한 외부활동 등이 있다면 간략히 작성해주세요.<br/>
					• 지원하는 회사에서 요구하는 경우가 아니라면 운전면허증과 같은 자격증은 생략하는 것이 좋습니다!
					</p>
				</div>
				<button type="button" class="btn btn-success" id="addCertificationBtn" style="font-size:18px; font-weight:500;"><i class="bi bi-plus-lg"></i>추가</button>
			</div>
			<div>
				<ul id="certificationList" style="list-style: none;">
				</ul>
			</div>
			<div class="submitBtn" style="text-align:center; margin-top:100px; margin-bottom: 50px;">
				<!-- <button type="submit" style="font-size:1.2em; font-weight:semi-bold; width:200px; height:50px;" class="btn btn-secondary btn-wave" id="resumeTempSaveBtn">임시저장</button> -->
				<button type="submit" style="font-size:1.2em; font-weight:semi-bold; width:200px; height:50px;" class="btn btn-secondary btn-wave" id="resumeSaveBtn">저장</button>
			</div>
			<sec:csrfInput/>
		</form>			
</div>

<script>
let skillCounter = 0;
let certCounter = 0;
let careerCounter = 0;

$(function(){

	
	// 쿼리스트링에서 resumeNo 받아서 이력서 제목 뿌리기
	let urlParams = new URLSearchParams(window.location.search);
	let resumeNo = urlParams.get("resumeNo");
	
	getBasicResumeInfo(resumeNo);
	
	// 자기소개글 공백 제거
    let text = $('#resumeIntroduction').val().trim();
    $('#resumeIntroduction').val(text);

	// 경력 추가 
	let addCareer = $("#addCareer");
	addCareer.on("click", function(){
		//console.log("경력 추가하기 버튼 클릭 이벤트");
		let isCareerChecked = $(".isCareerCheckBtn").is(":checked");
		let careerType = isCareerChecked ? "재직중" : "퇴사";
		
		let careerItem = `
				<li class="careerItem" style="padding:30px; 10px;">
				<input type="hidden" class="careerResumeNo" name="resumeCareerList[`+careerCounter+`].resumeNo" value="${param.resumeNo}"> 
					<div style="display:flex;">
						<div class="career_date_yn" style="flex:2; margin-right:10px;">
							<div class="career_date" style="margin-bottom:10px;">
								<input style="font-weight:550; font-size:16px; width:120px; border: none; background: transparent;" name="resumeCareerList[`+careerCounter+`].resCareerJoinDate" type="text" placeholder="YYYY-MM-DD">-<input style="font-weight:550; font-size:16px; width:120px; border: none; background: transparent;" name="resumeCareerList[`+careerCounter+`].resCareerOutDate" type="text" placeholder="YYYY-MM-DD">
							</div>
							<div class="isCareer_yn">
								<input class="form-check-input isCareerCheckBtn" type="checkbox" name="resumeCareerList[`+careerCounter+`].resCareerType">
								<label for="" class="form-check-label" style="color:#909497">현재 재직중</label>
							</div>
						</div>
						<div class="career_detail" style="flex:3;">
							<div class="career_name" style="margin-bottom:5px;">
								<input type="text" name="resumeCareerList[`+careerCounter+`].resCareerName" maxlength="255" style="font-weight:400; width: 100%; border: none; background: transparent;" placeholder="회사명">
							</div>
							<div class="career_dept" style="margin-bottom:5px;">
								<input type="text" name="resumeCareerList[`+careerCounter+`].resCareerDept" maxlength="255" style="font-size:16px; width: 100%; border: none; background: transparent;" placeholder="부서명">
							</div>
							<div class="career_dept" style="margin-bottom:5px;">
								<input type="text" name="resumeCareerList[`+careerCounter+`].resCareerPosition" maxlength="255" style="font-size:16px; width: 100%; border: none; background: transparent;" placeholder="직책">
							</div>
							<div class="career_content" style="margin-bottom:5px;">
								<textarea name="resumeCareerList[`+careerCounter+`].resCareerContent" maxlength="4000" placeholder="상세 업무 내용과 성과를 기입해주세요"
						 				  style="font-size: 16px; width: 700px; height: 154px; color: rgb(59, 61, 64); margin: 0px 3px; border: none; background: transparent;"></textarea>
							</div>
						</div>
						<div>
							<i class="bi bi-x-lg careerItemDeleteBtn"></i>
						</div>
					</div>
				</li>
				`;
				careerCounter++;
            $("#careerList").append(careerItem);
	});
	
	// 경력 삭제
	$("#careerList").on("click", ".careerItemDeleteBtn", function(){
	    $(this).closest("li").remove();
	});
	
	// 자격증 추가
	let addCertificationBtn = $("#addCertificationBtn");
	addCertificationBtn.on("click", function(){
		console.log("자격증 추가하기 버튼 클릭 이벤트");
        let certificationItem = `
			<li class="certificationItem" style="padding:30px; 10px;">
				<div style="display:flex; margin-bottom: 15px;">
				<input type="hidden" name="certificationList[`+certCounter+`].resumeNo" value="${param.resumeNo}"> 
					<div class="career_date_yn" style="flex:2; margin-right:10px;">
						<div class="career_date">
							<input style="width:120px; border: none; background: transparent;" name="certificationList[`+certCounter+`].certDate" type="text" class="cert_date" placeholder="YYYY-MM-DD" value="">
						</div>
					</div>
					<div class="career_detail" style="flex:3;">
						<div class="cert_name">
							<input type="text" name="certificationList[`+certCounter+`].certName" maxlength="255" style="width: 100%; border: none; background: transparent;" placeholder="자격증명" value="">
						</div>
						<div class="cert_serial_num">
							<input type="text" name="certificationList[`+certCounter+`].certSerialNum" maxlength="255" style="width: 100%; border: none; background: transparent;" placeholder="자격증일련번호" value="">
						</div>
						<div class="cert_institution">
							<input type="text" name="certificationList[`+certCounter+`].certInstitution" maxlength="255" style="width: 100%; border: none; background: transparent;" placeholder="시행부처" value="">
						</div>
					</div>
					<div>
						<i class="bi bi-x-lg cartificationItemDeleteBtn"></i>
					</div>
				</div>
			</li>
            `;
            certCounter++;
            $("#certificationList").append(certificationItem);
	});
	
	// 자격증 삭제
	$("#certificationList").on("click", ".cartificationItemDeleteBtn", function(){
	    $(this).closest("li").remove();
	});

	// 스킬 추가 및 삭제
	$(".skillBtn").click(function(){
		
	    if(!$(this).hasClass('selected')){
	    	
	        let icon = $(this).find("i");
	        icon.toggleClass('bi-plus-lg bi-check-lg');
			
	        let resumeNoImsi = "${param.resumeNo}";
	        let skillName = $(this).data("skill");
	        let skillCode = $(this).data("code");
	        let newButton = $('<button>').addClass('btn btn-purple-light rounded-pill btn-wave mySkill').html(skillName+' <i class="bi bi-x-lg"></i');
			let hiddenInput = $("<input type='hidden'>").attr('name', 'resumeSkillList['+skillCounter+'].skillstackCode').val(skillCode);
			let hiddenInput2 = $("<input type='hidden'>").attr('name', 'resumeSkillList['+skillCounter+'].resumeNo').val(resumeNoImsi);
	        
			skillCounter++;
			
	        $('#seekerSkillList').append(newButton).append(hiddenInput);
	        $('#seekerSkillList').append(newButton).append(hiddenInput2);

	        $(this).addClass('selected');

	        newButton.click(function(){
	            let skillName = $(this).closest('button').text().trim();
	            $(this).closest('button').remove();
	            $(".skillBtn").each(function(){
	                if($(this).data("skill") === skillName){
	                    let icon = $(this).find("i");
	                    icon.removeClass('bi-check-lg').addClass('bi-plus-lg');
	                    $(this).removeClass('selected');
	                }
	            });
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
	
	
	// 사진 썸네일 처리
	let resumeProfile = $("#resumeProfile");
	let uploadedProfile = $("#uploadedProfile");

	resumeProfile.on("change", function(event){
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

	
	 $('#autoBtn1').on('click', function(){
	        // 이력서 제목 및 소개글 자동완성
	        $('#resumeName').val("최고의 개발자가 되겠습니다!");
	        $('#resumeIntroduction').val("3년 이상의 개발 경험을 보유한 소프트웨어 엔지니어입니다. Java와 Python에 능숙하며, 복잡한 문제 해결과 효율적인 코드 작성에 집중합니다. 다양한 프로젝트를 통해 프론트엔드와 백엔드 개발 모두에 익숙하며, 데이터베이스 설계와 관리에도 경험이 있습니다. 최신 기술 트렌드를 지속적으로 학습하여 실무에 적용하고 있으며, 특히 클라우드 컴퓨팅과 머신러닝 분야에 큰 관심을 가지고 있습니다.협업과 커뮤니케이션에 능하여 다양한 팀과의 협업을 통해 성공적인 결과를 도출해왔습니다. 코드 리뷰와 테스트 자동화를 통해 코드 품질을 높이는 데 주력하며, 지속적인 개선을 추구합니다. 문제 해결에 대한 창의적인 접근법과 새로운 도전에 대한 열정으로, 혁신적인 솔루션을 제공하는 데 최선을 다하고 있습니다. 귀사의 발전에 기여하며 함께 성장할 수 있기를 기대합니다.");

	        // 경력 자동완성
	        let careerItem = `
	            <li class="careerItem" style="padding:30px; 10px;">
	                <input type="hidden" class="careerResumeNo" name="resumeCareerList[0].resumeNo" value="${param.resumeNo}">
	                <div style="display:flex;">
	                    <div class="career_date_yn" style="flex:2; margin-right:10px;">
	                        <div class="career_date" style="margin-bottom:10px;">
	                            <input style="font-weight:550; font-size:16px; width:120px; border: none; background: transparent;" name="resumeCareerList[0].resCareerJoinDate" type="text" placeholder="YYYY-MM-DD" value="2018-01-01">-<input style="font-weight:550; font-size:16px; width:120px; border: none; background: transparent;" name="resumeCareerList[0].resCareerOutDate" type="text" placeholder="YYYY-MM-DD" value="2021-12-31">
	                        </div>
	                        <div class="isCareer_yn">
	                            <input class="form-check-input isCareerCheckBtn" type="checkbox" name="resumeCareerList[0].resCareerType" >
	                            <label for="" class="form-check-label" style="color:#909497">현재 재직중</label>
	                        </div>
	                    </div>
	                    <div class="career_detail" style="flex:3;">
	                        <div class="career_name" style="margin-bottom:5px;">
	                            <input type="text" name="resumeCareerList[0].resCareerName" maxlength="255" style="font-weight:400; width: 100%; border: none; background: transparent;" placeholder="회사명" value="대덕개발인재학원">
	                        </div>
	                        <div class="career_dept" style="margin-bottom:5px;">
	                            <input type="text" name="resumeCareerList[0].resCareerDept" maxlength="255" style="font-size:16px; width: 100%; border: none; background: transparent;" placeholder="부서명" value="개발팀">
	                        </div>
	                        <div class="career_dept" style="margin-bottom:5px;">
	                            <input type="text" name="resumeCareerList[0].resCareerPosition" maxlength="255" style="font-size:16px; width: 100%; border: none; background: transparent;" placeholder="직책" value="소프트웨어 엔지니어">
	                        </div>
	                        <div class="career_content" style="margin-bottom:5px;">
	                            <textarea name="resumeCareerList[0].resCareerContent" maxlength="4000" placeholder="상세 업무 내용과 성과를 기입해주세요" style="font-size: 16px; width: 700px; height: 154px; color: rgb(59, 61, 64); margin: 0px 3px; border: none; background: transparent;">주요 프로젝트 관리 및 개발, 코드 리뷰, 테스트 자동화 도입</textarea>
	                        </div>
	                    </div>
	                    <div>
	                        <i class="bi bi-x-lg careerItemDeleteBtn"></i>
	                    </div>
	                </div>
	            </li>
	        `;
	        $("#careerList").append(careerItem);

	        // 자격증 자동완성
	        let certificationItem = `
	            <li class="certificationItem" style="padding:30px; 10px;">
	                <div style="display:flex; margin-bottom: 15px;">
	                    <input type="hidden" name="certificationList[0].resumeNo" value="${param.resumeNo}">
	                    <div class="career_date_yn" style="flex:2; margin-right:10px;">
	                        <div class="career_date">
	                            <input style="width:120px; border: none; background: transparent;" name="certificationList[0].certDate" type="text" class="cert_date" placeholder="YYYY-MM-DD" value="2020-06-15">
	                        </div>
	                    </div>
	                    <div class="career_detail" style="flex:3;">
	                        <div class="cert_name">
	                            <input type="text" name="certificationList[0].certName" maxlength="255" style="width: 100%; border: none; background: transparent;" placeholder="자격증명" value="정보처리기사">
	                        </div>
	                        <div class="cert_serial_num">
	                            <input type="text" name="certificationList[0].certSerialNum" maxlength="255" style="width: 100%; border: none; background: transparent;" placeholder="자격증일련번호" value="123456789">
	                        </div>
	                        <div class="cert_institution">
	                            <input type="text" name="certificationList[0].certInstitution" maxlength="255" style="width: 100%; border: none; background: transparent;" placeholder="시행부처" value="한국산업인력공단">
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
	
	
	
});

//이미지 파일인지 체크
function isImageFile(file){
	let ext = file.name.split(".").pop().toLowerCase();
	return ($.inArray(ext, ["jpg", "jpeg", "gif", "png"]) === -1) ? false : true;
}

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


</script>