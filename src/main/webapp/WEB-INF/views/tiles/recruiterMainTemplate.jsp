<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<!-- <head>
<title>Code Worker</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head> -->
<head>
    <!-- Meta Data -->
    <meta charset="UTF-8">
    <title> Code Worker - it업계 잡 찾기  </title>

	<!-- 시큐리티 토큰 시작 -->
    <meta id="_csrf" name="_csrf" content="${_csrf.token }">
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName }">
	<!-- 시큐리티 토큰 끝 -->

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- Favicon -->
    <%-- <link rel="icon" href="${pageContext.request.contextPath}/resources/assets/images/brand-logos/favicon.ico" type="image/x-icon"> --%>

    <!-- Choices JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/libs/choices.js/public/assets/scripts/choices.min.js"></script>

    <!-- Main Theme Js -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/main.js"></script>

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
<!-- 시큐리티 토큰 끝 -->

<body>
			<!-- 헤더 시작 -->
            <tiles:insertAttribute name="header" />
			<!-- 헤더 끝 -->
			
			<!-- aside 시작 -->
			<tiles:insertAttribute name="aside"/>
			<!-- aside 끝 -->
			
			<!-- 메인page 시작 -->
			<tiles:insertAttribute name="content" />
			<!-- 메인page 끝 -->
			
			<!-- footer 시작-->
            <tiles:insertAttribute name="footer" />
			<!-- footer 끝 -->

</body>
    <script src="${pageContext.request.contextPath}/resources/assets/libs/flatpickr/flatpickr.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/date&time_pickers.js"></script>
</html>