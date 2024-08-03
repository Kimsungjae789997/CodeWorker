<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!-- Start::app-sidebar -->
<aside class="app-sidebar sticky" id="sidebar">
   <sec:authentication property="principal.member" var="user"/>
   <%-- ${user.recruitVO } --%>

   <!-- Start::main-sidebar-header -->
   <div class="main-sidebar-header">
      <a href="/recruiter/main" class="header-logo"> 
         <img src="${pageContext.request.contextPath}/resources/assets/images/recruiter/codeWorker-logo.png"
             alt="logo" class="desktop-logo">
      </a>
   </div>
   <!-- End::main-sidebar-header -->

   <!-- Start::main-sidebar -->
   <div class="main-sidebar" id="sidebar-scroll">

      <!-- Start::nav -->
      <nav class="main-menu-container nav nav-pills flex-column sub-open">
         <div class="slide-left" id="slide-left">
            <!-- 아이콘 -->
            <svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24" height="24" viewBox="0 0 24 24"> 
            <path d="M13.293 6.293 7.586 12l5.707 5.707 1.414-1.414L10.414 12l4.293-4.293z"></path></svg>
         </div>

         <ul class="main-menu">
            <li class="slide__category"><span class="category-name">프로필</span></li>
            <div style="margin-left: 25px;">
               <img src="${pageContext.request.contextPath}/resources/images/${user.recruitVO.corporationVO.crpLogoUrl}" alt="${user.recruitVO.corporationVO.crpLogoUrl}" width="130px" style="margin-left: 40px;"> 
               <p style="text-align: center; font-weight: bold;">${user.recruitVO.corporationVO.crpName }</p>
               <hr>
               <div>
                  <p><font style="font-weight: bold;">${user.recruitVO.rcrtPosition}</font> ${user.memName }
                  <a href="/corpMgmt/member"><svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" fill="currentColor" 
                  class="bi bi-person-add" viewBox="0 0 16 16" style="float: right; margin-right: 25px;">
                  <path d="M12.5 16a3.5 3.5 0 1 0 0-7 3.5 3.5 0 0 0 0 7m.5-5v1h1a.5.5 0 0 1 0 1h-1v1a.5.5 0 0 1-1 0v-1h-1a.5.5 0 0 1 0-1h1v-1a.5.5 0 0 1 1 0m-2-6a3 3 0 1 1-6 0 3 3 0 0 1 6 0M8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4" />
                  <path d="M8.256 14a4.5 4.5 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10q.39 0 .74.025c.226-.341.496-.65.804-.918Q8.844 9.002 8 9c-5 0-6 3-6 4s1 1 1 1z" />
                  </svg></a></p>
               </div>
            </div>

            <!-- Start::slide__category 2-->
            <li class="slide__category"><span class="category-name">관리자 메뉴</span></li>
            <!-- End::slide__category 2 -->

            <!-- Start::slide -->
            <li class="slide has-sub">
               <a href="javascript:void(0);" class="side-menu__item">
               <i class="bx bx-task side-menu__icon"></i>
               <span class="side-menu__label">공고 관리<!-- <span class="badge bg-secondary-transparent ms-2">New</span> --></span>
               <i class="fe fe-chevron-right side-menu__angle"></i></a>
               <ul class="slide-menu child1">
                  <li class="slide side-menu__label1"><a href="javascript:void(0)">공고 관리</a></li>
                  <li class="slide"><a href="/recruitmentinsert/insertForm" class="side-menu__item">공고 등록</a></li>
                  <li class="slide"><a href="/recruitmentmanage/main.do" class="side-menu__item">공고 목록</a></li>
               </ul>
            </li>
            <!-- End::slide -->

            <!-- Start::slide -->
            <li class="slide has-sub">
               <a href="javascript:void(0);" class="side-menu__item">
               <i class="bx bx-task side-menu__icon"></i>
               <span class="side-menu__label">지원자 관리
               <!-- span class="badge bg-secondary-transparent ms-2">New</span> --></span>
               <i class="fe fe-chevron-right side-menu__angle"></i></a>
               <ul class="slide-menu child1">
                  <li class="slide side-menu__label1"><a href="javascript:void(0)">지원자 관리</a></li>
                  <li class="slide"><a href="/applicant/list" class="side-menu__item">지원자 목록</a></li>
                  <li class="slide"><a href="/statistics/main" class="side-menu__item">지원현황</a></li>
               </ul>
            </li>
            <!-- End::slide -->

            <!-- Start::slide -->
            <li class="slide has-sub">
               <a href="javascript:void(0);" class="side-menu__item"><i class="bx bx-task side-menu__icon"></i>
               <span class="side-menu__label">인재 찾기<!-- <span class="badge bg-secondary-transparent ms-2">New</span> --></span>
               <i class="fe fe-chevron-right side-menu__angle"></i></a>
               <ul class="slide-menu child1"> 
                  <li class="slide side-menu__label1"><a href="javascript:void(0)">인재 찾기</a></li>
                  <li class="slide"><a href="/proposal/searchMain" class="side-menu__item">인재 검색</a></li>
                  <li class="slide"><a href="/candidate/list" class="side-menu__item">후보자 관리</a></li>
               </ul>
            </li>
            <!-- End::slide -->

            <!-- Start::slide -->
            <li class="slide has-sub">
               <a href="javascript:void(0);" class="side-menu__item">
               <i class="bx bx-task side-menu__icon"></i>
               <span class="side-menu__label">우리기업 관리<!-- <span class="badge bg-secondary-transparent ms-2">New</span> --></span>
               <i class="fe fe-chevron-right side-menu__angle"></i>
               </a>
               <ul class="slide-menu child1">
                  <li class="slide side-menu__label1"><a href="javascript:void(0)">우리기업 관리</a></li>
                  <li class="slide"><a href="/corpMgmt/corpInfo" class="side-menu__item">기업 정보</a></li>
                  <li class="slide"><a href="/corpMgmt/member" class="side-menu__item">멤버 관리</a></li>
               </ul>
            </li>
            <!-- End::slide -->

         </ul>
         <div class="slide-right" id="slide-right">
            <svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24" height="24" viewBox="0 0 24 24">
            <path d="M10.707 17.707 16.414 12l-5.707-5.707-1.414 1.414L13.586 12l-4.293 4.293z"></path>
            </svg>
         </div>
      </nav>
      <!-- End::nav -->

   </div>
   <!-- End::main-sidebar -->

</aside>
<!-- End::app-sidebar -->

    <!-- Scroll To Top -->
    <div class="scrollToTop">
        <span class="arrow"><i class="ri-arrow-up-s-fill fs-20"></i></span>
    </div>
    <div id="responsive-overlay"></div>
    <!-- Scroll To Top -->

    <!-- Popper JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/libs/@popperjs/core/umd/popper.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Defaultmenu JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/defaultmenu.min.js"></script>

    <!-- Node Waves JS-->
    <script src="${pageContext.request.contextPath}/resources/assets/libs/node-waves/waves.min.js"></script>

    <!-- Sticky JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/sticky.js"></script>

    <!-- Simplebar JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/libs/simplebar/simplebar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/assets/js/simplebar.js"></script>

    <!-- Color Picker JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/libs/@simonwep/pickr/pickr.es5.min.js"></script>
        
    <!-- Job Post JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/jobs-post.js"></script>

    <!-- Custom-Switcher JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/custom-switcher.min.js"></script>

    <!-- Custom JS -->
    <script src="${pageContext.request.contextPath}/resources/assets/js/custom.js"></script>
