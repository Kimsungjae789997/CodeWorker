<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en" dir="ltr" data-nav-layout="vertical" data-theme-mode="light" data-header-styles="light" data-menu-styles="light" loader="disable" data-vertical-style="overlay" style="">

<head>

    <!-- Meta Data -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title> codeworker </title>
    <meta name="Description" content="Bootstrap Responsive Admin Web Dashboard HTML5 Template">
    <meta name="Author" content="Spruko Technologies Private Limited">
	<meta name="keywords" content="admin,admin dashboard,admin panel,admin template,bootstrap,clean,dashboard,flat,jquery,modern,responsive,premium admin templates,responsive admin,ui,ui kit.">

	<!-- 시큐리티 meta -->
	<meta id="_csrf" name="_csrf" content="${_csrf.token }">
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName }">

    <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/images/brand-logos/favicon.ico" type="image/x-icon">
    <script src="${pageContext.request.contextPath}/resources/assets/libs/choices.js/public/assets/scripts/choices.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>
    <link id="style" href="${pageContext.request.contextPath}/resources/assets/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet" >
    <link href="${pageContext.request.contextPath}/resources/assets/css/styles.min.css" rel="stylesheet" >
    <link href="${pageContext.request.contextPath}/resources/assets/css/icons.css" rel="stylesheet" >
    <link href="${pageContext.request.contextPath}/resources/assets/libs/node-waves/waves.min.css" rel="stylesheet" >
    <link href="${pageContext.request.contextPath}/resources/assets/libs/simplebar/simplebar.min.css" rel="stylesheet" >
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/flatpickr/flatpickr.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/@simonwep/pickr/themes/nano.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/choices.js/public/assets/styles/choices.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/jsvectormap/css/jsvectormap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/libs/swiper/swiper-bundle.min.css">
	
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	
	<!-- 제이쿼리 cdn 추가 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
	<script src="${pageContext.request.contextPath }/resources/ckeditor/ckeditor.js"></script>
	
	<link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/dataTables.bootstrap5.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.3.0/css/responsive.bootstrap.min.css">
	<link rel="stylesheet" href="https://cdn.datatables.net/buttons/2.2.3/css/buttons.bootstrap5.min.css">
    <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.12.1/js/dataTables.bootstrap5.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.3.0/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/dataTables.buttons.min.js"></script>
</head>


<!-- 시큐리티 토큰 -->
<script type="text/javascript">
	var token = "";		// 시큐리티 인증 시, 사용할 토큰 정보
	var header = "";	// 시큐리티 인증 시, 사용할 토큰 키
	$(function(){
		token = $("meta[name='_csrf']").attr("content");
		header = $("meta[name='_csrf_header']").attr("content");
	});
</script>


<body>

    <!-- Loader -->
    <div id="loader" >
        <img src="${pageContext.request.contextPath}/resources/assets/images/media/loader.svg" alt="">
    </div>

    <div class="page">
         <tiles:insertAttribute name="header"/>

        <div class="main-content app-content">
            <div class="container-fluid">
				<tiles:insertAttribute name="content"/>
            </div>
        </div>
        
		<tiles:insertAttribute name="footer"/>

    </div>
    
    <div class="scrollToTop">
        <span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
    </div>
    <div id="responsive-overlay"></div>

    <script src="${pageContext.request.contextPath}/resources/assets/libs/@popperjs/core/umd/popper.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/defaultmenu.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/libs/node-waves/waves.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/sticky.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/libs/simplebar/simplebar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/simplebar.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/libs/@simonwep/pickr/pickr.es5.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/libs/jsvectormap/js/jsvectormap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/libs/jsvectormap/maps/world-merc.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/libs/apexcharts/apexcharts.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/libs/chart.js/chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/hrm-dashboard.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/crm-dashboard.js"></script>
    
    <!-- ↓ 기업 가입 요청 리스트 페이지 -->
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.print.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/2.2.3/js/buttons.html5.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/datatables.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/custom.js"></script>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.6/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
    
    <!-- ↓ 기업 가입 요청 리스트 페이지 모달 -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/modal.js"></script>
    
    <!-- ↓ 관리자 메인 페이지 대시보드 -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/sales-dashboard.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
</body>

</html>