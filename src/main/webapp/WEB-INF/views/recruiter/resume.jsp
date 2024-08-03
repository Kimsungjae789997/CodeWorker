<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.4/jspdf.min.js"></script>
<style>
#capture{
	background-color: transparent !important;
}
head {
	font-size: 14px;
	font-family: "맑은 고딕", sans-serif;
} 
.header {
	background-color: #EEF1F4;
	width: 500x;
	height: 400px;
	width: 1000px;
	margin: auto;
}
.header .left {
	width: 10%;
	display: inline-block;
	height: 400px;
	box-sizing: border-box;
}
.header .right {
	width: 70%;
	display: inline-block;
	height: 10px;
	box-sizing: border-box;
	vertical-align: bottom;
	text-align: right;
}
.body {
	font-size: 20px;
	font-family: "맑은 고딕", sans-serif;
	margin: auto;
}
.body-container {
	padding: 20px;
}
.table {
	width: 100%;
	border-collapse: collapse;
	border : 0;
	margin-top: 30px;
}
.table tr {
	border-bottom: 1px solid #ccc;
	font-size: 16px;
	font-weight: 400;
}
.table thead tr:first-child {
	border-bottom: 3px solid #333;
}
.table th, .table td {
	padding: 6px 0;
	border: none;
	border-left: none;
	border-right: none;
}
</style>
</head>
<body>
<div id="capture">

	<!-- 이력서  Header -->
	<c:set value="${basicResumeVO }" var="basicResume" />
	<div class="header" style="margin: 0 auto;">
		<!-- 프로필 사진 -->
		<div>
			<img src="${basicResume.resumeProfileUrl }" 
			     alt="${basicResume.resumeProfileUrl }" width="200"
				style="padding-top: 50px; padding-left: 30px; float: left;" />
		</div>
		<!-- 프로필 사진 끝 -->
		<!-- 이력서 제목, 지원자 이름 시작 -->
		<div style="width: 500px; height: 200px; text-align: right; padding-top: 200px; padding-right: 60px; float: right">
			<p style="text-align: right">
				<span style="font-size: 38px; font-weight: 700;">${basicResume.resumeName }</span><br /> 
				<span style="font-size: 35px; font-weight: 400;">${basicResume.seekerVO.seekerName }</span><br><br>
				<button type="button" class="btn btn-outline-dark btn-wave" data-html2canvas-ignore="true" id="resumePdfDownBtn">PDF 다운로드</button>
			</p>
		</div>
		<!-- 이력서 제목, 지원자 이름  끝-->
	</div>
	<!-- 이력서  Header -->
	
	<!-- 이력서 내용 시작 -->
	<div class="body-container" style="width: 1000px; margin: 0 auto;">
		<div class="body-container" style="width: 460px; float: left;">

			<table class="table" border="1" style="width: 460px; height: 170px">
				<thead>
					<tr>
						<td width="100" style="font-size: 20px; font-weight: 700">기본사항</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td width="100"><i class="fa-solid fa-user"></i>
						<font>생년월일 :</font>&nbsp;${basicResume.seekerVO.seekerBirth }</td>
					</tr>
					<tr>
						<td width="100"><i class="fa-solid fa-phone"></i>
						<font>연락처 :</font>&nbsp;${basicResume.seekerVO.seekerTel }</td>
					</tr>
					<tr>
						<td width="100"><i class="fa-solid fa-envelope"></i>
						<font>이메일 :</font>&nbsp;${basicResume.seekerVO.seekerEmail }</td>
					</tr>
				</tbody>
			</table>

			<table class="table" border="1" style="width: 460px; height: 170px">
				<thead>
					<tr>
						<td width="100" colspan="4" 
							style="font-size: 20px; font-weight: 700">최종학력</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align: center">과정</td>
						<td style="text-align: center">학교명</td>
						<td style="text-align: center">전공</td>
						<td style="text-align: center">졸업일자</td>
					</tr>
					<tr>
						<td style="text-align: center">${basicResume.eduType }</td>
						<td style="text-align: center">${basicResume.educationVO.eduName }</td>
						<td style="text-align: center">${basicResume.educationVO.eduMajor }</td>
						<td style="text-align: center">${basicResume.educationVO.eduGraduatedDate }</td>
					</tr>
				</tbody>

			</table>
		</div>
		<div class="body-container" style="float: left; width: 460px;">
			<table class="table" border="1" style="width: 460px; height: 170px">
				<thead>
					<tr>
						<td width="100" colspan="3"
							style="font-size: 20px; font-weight: 700">자격증</td>
					</tr>
				</thead>
				<tbody>
				<tr>
					<td style="text-align: center">자격증명</td>
					<td style="text-align: center">취득일자</td>
					<td style="text-align: center">발행처</td>
				</tr>
				<c:forEach items="${certificationVO }" var="certification">
				<c:choose>
					<c:when test="${empty certification}">
					<tr>
						<td>보유한 자격증이 없습니다.</td>
					</tr>
					</c:when>
					<c:otherwise>
					<tr>
						<td width="100" style="text-align: center">${certification.certName }</td>
						<td width="100" style="text-align: center">${certification.certDate }</td>
						<td width="100" style="text-align: center">${certification.certInstitution }</td>
					</tr>
					</c:otherwise>
				</c:choose>
				</c:forEach>
				</tbody>
			</table>

			<table class="table" border="1" style="width: 460px; height: 170px">
				<thead>
					<tr>
						<td width="100" colspan="3"
							style="font-size: 20px; font-weight: 700">기술</td>
					</tr>
				</thead>
				<tbody>
				<tr>
					<td width="100" style="text-align: center">보유기술</td>
				</tr>
				<c:forEach items="${resumeSkillVO }" var="skill">
					<c:choose>
						<c:when test="${empty skill}">
						<tr>
							<td style="text-align: center">신입 입니다.</td>
						</tr>
						</c:when>	
						<c:otherwise>
						<tr>
							<td width="100" style="text-align: center">${skill.skillstackName }</td>
						</tr>
						</c:otherwise>				
					</c:choose>
				</c:forEach>
				</tbody>
			</table>
		</div>

		<div class="body-container">

			<table class="table" border="1" style="width: 980px; margin: auto;">
				<thead>
					<tr>
						<td width="100" colspan="3"
							style="font-size: 20px; font-weight: 700;">경력사항</td>
					</tr>
				</thead>
				<tbody>
				<tr>
					<td style="text-align: center; width:20%;">직장명 (직무 ·직급)</td>
					<td style="text-align: center; width:20%;">입사일자</td>
					<td style="text-align: center; width:20%;">퇴사일자</td>
					<td style="text-align: center; width:40%;">내용</td>
				</tr>
				<c:forEach items="${resumeCareerVO }" var="career">
					<tr>
						<td style="text-align: left; width:20%;">${career.resCareerName }<br/>(${career.resCareerDept } · ${career.resCareerPosition })</td>
						<td style="text-align: center; width:20%;">${career.resCareerJoinDate }</td>
						<td style="text-align: center; width:20%;">${career.resCareerOutDate }</td>
						<td style="text-align: left; width:40%;">${career.resCareerContent }</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
<script>
$(function(){
	
	let resumePdfDownBtn = $("#resumePdfDownBtn");
	resumePdfDownBtn.on("click", function(){
		console.log("다운로드 버튼 클릭...@ ");
		createPdf();
	});
	
});

function createPdf(){
	// html2canvas를 사용하여 ID가 "capture"인 요소의 내용을 캡쳐
	html2canvas(document.querySelector("#capture")).then(canvas => {

		var imgData = canvas.toDataURL('image/png');
		// PDF의 초기 매개변수를 설정
		var imgWidth = 210;
		var pageHeight = imgWidth * 1.414;
		var imgHeight = canvas.height * imgWidth / canvas.width;
		var heightLeft = imgHeight;
		var margin = 0;
		var doc = new jsPDF('p', 'mm', 'a4', true);
		var position = 0;
		
		// 첫 페이지에 이미지 추가
		doc.addImage(imgData, 'png', margin, position, imgWidth, imgHeight);
		heightLeft -= pageHeight; // 남은 높이 갱신
		
		// 이미지 높이가 페이지 높이보다 클 경우 추가 페이지를 생성
		while(heightLeft >= 20){
			position = heightLeft - imgHeight;
			doc.addPage();
			doc.addImage(imgData, 'jpeg', margin, position, imgWidth, imgHeight);
			heightLeft -= pageHeight;
		}
		
		// 생성된 PDF를 저장
		doc.save('resume.pdf');
	});
}

</script>
</html>

