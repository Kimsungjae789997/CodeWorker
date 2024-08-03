<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>seeker</title>
    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- 시큐리티 토큰 시작 -->
    <meta id="_csrf" name="_csrf" content="${_csrf.token }">
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName }">
	<!-- 시큐리티 토큰 끝 -->
	
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="Description" content="Bootstrap Responsive Admin Web Dashboard HTML5 Template">
    <meta name="Author" content="Spruko Technologies Private Limited">
	<meta name="keywords" content="admin,admin dashboard,admin panel,admin template,bootstrap,clean,dashboard,flat,jquery,modern,responsive,premium admin templates,responsive admin,ui,ui kit.">

 <!-- Favicon -->
<%--     <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/images/brand-logos/favicon.ico" type="image/x-icon"> --%>


    <!-- Bootstrap Css -->
    <link id="style" href="${pageContext.request.contextPath}/resources/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet" > 

    <!-- Style Css -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/styles.min.css" rel="stylesheet" > 

    <!-- Icons Css -->
    <link href="${pageContext.request.contextPath}/resources/assets/css/icons.css" rel="stylesheet" >
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css"> 

    <!-- Simplebar Css -->
    <link href="${pageContext.request.contextPath}/resources/assets/libs/simplebar/simplebar.min.css" rel="stylesheet" >

    <!-- Color Picker Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/flatpickr/flatpickr.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/@simonwep/pickr/themes/nano.min.css">

    <!-- Choices Css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/choices.js/public/assets/styles/choices.min.css">

    <!-- Choices JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/libs/choices.js/public/assets/scripts/choices.min.js"></script>

    <!-- Main Theme Js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
	
	<!-- ↓ 커뮤니티 리스트 띄울때 필요한 cdn - 명환 -->
	<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.bootstrap5.min.css">
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
</head>


<!-- 시큐리티 토큰 시작 -->
<script type="text/javascript">
	var token = "";		// 시큐리티 인증 시, 사용할 토큰 정보
	var header = "";	// 시큐리티 인증 시, 사용할 토큰 키
	$(function(){
		token = $("meta[name='_csrf']").attr("content");
		header = $("meta[name='_csrf_header']").attr("content");
	});
</script>
<!--  시큐리티 토큰 끝 -->


<style>
.app-header-custom {
  max-width: 100%;
  height: 3.75rem;
  z-index: 100;
  position: fixed;
  inset-block-start: 0;
  inset-inline: 0;
  background: #fff;
  border-block-end: 1px solid #f3f3f3;
  transition: all 0.1s ease;
}
.app-header-custom .dropdown-toggle {
    position: relative;
}
.app-content-custom{
	margin-block-start: 3.75rem;
}
.header-content-left,.header-content-right{
	margin-left: auto;
	margin-right: auto;
} 

body{
	font-family: "Pretendard", "Malgun Gothic", dotum, gulim, sans-serif;
}
</style>


<%-- <c:if test="${not empty message }">
	<script type="text/javascript">
		alert("${message}");
		<c:remove var="message" scope="request"/>
	</script>
</c:if>    
 --%>

<body style="background-color: white;">
	<div class="page">
		<!-- 헤더 시작 -->
		<tiles:insertAttribute name="header" />
		<!-- 헤더 끝 -->

		<div class="main-content app-content-custom">
            <!-- <div class="container-lg" style="max-width:800px;"> -->
             <div class="container-lg" style="max-width:1300px;">
				<tiles:insertAttribute name="content" />
            </div>
        </div>
		<!-- 메인page 시작 -->
		<!-- 메인page 끝 -->
		
		<!-- footer 시작-->
		<tiles:insertAttribute name="footer" />
		<!-- footer 끝 -->
	
	</div>


	<!-- Scroll To Top -->
    <div class="scrollToTop">
        <span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
    </div>
    <div id="responsive-overlay"></div>

    <!-- Popper JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/libs/@popperjs/core/umd/popper.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Node Waves JS-->
    <script src="${pageContext.request.contextPath}/resources/assets/libs/node-waves/waves.min.js"></script>


    <!-- Color Picker JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/libs/@simonwep/pickr/pickr.es5.min.js"></script>
        
    <!-- Job Post JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/jobs-post.js"></script>

	<!-- ↓ 커뮤니티 리스트 띄울때 필요한 cdn - 명환 -->
<!-- 	<script src="https://code.jquery.com/jquery-3.6.1.min.js" integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous"></script> -->
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/datatables.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/custom.js"></script>
    
</body>

</html>