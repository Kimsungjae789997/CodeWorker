<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<header class="app-header">
	<div class="main-header-container container-fluid">
		<div class="header-content-left"></div>

		<div class="header-content-right">

			<div class="header-element notifications-dropdown">
<!-- 				<a href="javascript:void(0);" class="header-link dropdown-toggle" -->
<!-- 					data-bs-toggle="dropdown" data-bs-auto-close="outside" -->
<!-- 					id="messageDropdown" aria-expanded="false"> <i -->
<!-- 					class="bx bx-bell header-link-icon"></i> <span -->
<!-- 					class="badge bg-secondary rounded-pill header-icon-badge pulse pulse-secondary" -->
<!-- 					id="notification-icon-badge">5</span> -->
<!-- 				</a> -->
				<div class="main-header-dropdown dropdown-menu dropdown-menu-end"
					data-popper-placement="none">
					<div class="p-3">
						<div class="d-flex align-items-center justify-content-between">
							<p class="mb-0 fs-17 fw-semibold">Notifications</p>
							<span class="badge bg-secondary-transparent"
								id="notifiation-data">5 Unread</span>
						</div>
					</div>
					<div class="dropdown-divider"></div>
					<ul class="list-unstyled mb-0" id="header-notification-scroll">
						<li class="dropdown-item">
							<div class="d-flex align-items-start">
								<div class="pe-2">
									<span class="avatar avatar-md bg-primary-transparent avatar-rounded">
										<i class="ti ti-gift fs-18"></i>
									</span>
								</div>
								<div
									class="flex-grow-1 d-flex align-items-center justify-content-between">
									<div>
										<p class="mb-0 fw-semibold">
											<a href="notifications.html">Your Order Has Been Shipped</a>
										</p>
										<span class="text-muted fw-normal fs-12 header-notification-text">Order No: 123456 Has Shipped To Your Delivery Address</span>
									</div>
									<div>
										<a href="javascript:void(0);" class="min-w-fit-content text-muted me-1 dropdown-item-close1">
											<i class="ti ti-x fs-16"></i>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="dropdown-item">
							<div class="d-flex align-items-start">
								<div class="pe-2">
									<span class="avatar avatar-md bg-secondary-transparent avatar-rounded">
										<i class="ti ti-discount-2 fs-18"></i>
									</span>
								</div>
								<div class="flex-grow-1 d-flex align-items-center justify-content-between">
									<div>
										<p class="mb-0 fw-semibold">
											<a href="notifications.html">Discount Available</a>
										</p>
										<span class="text-muted fw-normal fs-12 header-notification-text">Discount Available On Selected Products</span>
									</div>
									<div>
										<a href="javascript:void(0);" class="min-w-fit-content text-muted me-1 dropdown-item-close1">
											<i class="ti ti-x fs-16"></i>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="dropdown-item">
							<div class="d-flex align-items-start">
								<div class="pe-2">
									<span class="avatar avatar-md bg-pink-transparent avatar-rounded">
										<i class="ti ti-user-check fs-18"></i>
									</span>
								</div>
								<div
									class="flex-grow-1 d-flex align-items-center justify-content-between">
									<div>
										<p class="mb-0 fw-semibold">
											<a href="notifications.html">Account Has Been Verified</a>
										</p>
										<span class="text-muted fw-normal fs-12 header-notification-text">Your Account Has Been Verified Sucessfully</span>
									</div>
									<div>
										<a href="javascript:void(0);" class="min-w-fit-content text-muted me-1 dropdown-item-close1">
											<i class="ti ti-x fs-16"></i>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="dropdown-item">
							<div class="d-flex align-items-start">
								<div class="pe-2">
									<span class="avatar avatar-md bg-warning-transparent avatar-rounded">
										<i class="ti ti-circle-check fs-18"></i>
									</span>
								</div>
								<div class="flex-grow-1 d-flex align-items-center justify-content-between">
									<div>
										<p class="mb-0 fw-semibold">
											<a href="notifications.html">Order Placed 
												<span class="text-warning">ID: #1116773</span>
											</a>
										</p>
										<span class="text-muted fw-normal fs-12 header-notification-text">Order Placed Successfully</span>
									</div>
									<div>
										<a href="javascript:void(0);" class="min-w-fit-content text-muted me-1 dropdown-item-close1">
											<i class="ti ti-x fs-16"></i>
										</a>
									</div>
								</div>
							</div>
						</li>
						<li class="dropdown-item">
							<div class="d-flex align-items-start">
								<div class="pe-2">
									<span class="avatar avatar-md bg-success-transparent avatar-rounded">
										<i class="ti ti-clock fs-18"></i>
									</span>
								</div>
								<div class="flex-grow-1 d-flex align-items-center justify-content-between">
									<div>
										<p class="mb-0 fw-semibold">
											<a href="notifications.html">Order Delayed 
												<span class="text-success">ID: 7731116</span>
											</a>
										</p>
										<span class="text-muted fw-normal fs-12 header-notification-text">Order Delayed Unfortunately</span>
									</div>
									<div>
										<a href="javascript:void(0);" class="min-w-fit-content text-muted me-1 dropdown-item-close1">
											<i class="ti ti-x fs-16"></i>
										</a>
									</div>
								</div>
							</div>
						</li>
					</ul>
					<div class="p-3 empty-header-item1 border-top">
						<div class="d-grid">
							<a href="notifications.html" class="btn btn-primary">View All</a>
						</div>
					</div>
					<div class="p-5 empty-item1 d-none">
						<div class="text-center">
							<span
								class="avatar avatar-xl avatar-rounded bg-secondary-transparent">
								<i class="ri-notification-off-line fs-2"></i>
							</span>
							<h6 class="fw-semibold mt-3">No New Notifications</h6>
						</div>
					</div>
				</div>
				<!-- End::main-header-dropdown -->
			</div>

			<!-- Start::header-element -->
			<div class="header-element">
				<!-- Start::header-link|dropdown-toggle -->
				<a href="javascript:void(0);" class="header-link dropdown-toggle"
					id="mainHeaderProfile" data-bs-toggle="dropdown"
					data-bs-auto-close="outside" aria-expanded="false">
					<div class="d-flex align-items-center">
						<div class="me-sm-2 me-0">
							<img
								src="${pageContext.request.contextPath}/resources/assets/images/faces/admin-logo.jpg"
								alt="img" width="45" height="45" class="rounded-circle">
						</div>
						<div class="d-sm-block d-none">
							<p class="fw-semibold mb-0 lh-1">ADMIN</p>
<!-- 							<span class="op-7 fw-normal d-block fs-11">Web Designer</span> -->
						</div>
					</div>
				</a>
				<ul class="main-header-dropdown dropdown-menu pt-0 overflow-hidden header-profile-dropdown dropdown-menu-end" aria-labelledby="mainHeaderProfile">
					<li><a id="logoutBtn" class="dropdown-item d-flex" href="#"><i class="ti ti-logout fs-18 me-2 op-7"></i>로그아웃</a></li>
				</ul>

			</div>
		</div>
	</div>
</header>


<!-- 로그아웃하기위한 hiddenForm 만들기 -->
<form action="/logout" method="post" id="logoutForm">
	<sec:csrfInput/>
</form>

<script>
$(function(){
	var logoutBtn = $('#logoutBtn');
	var logoutForm = $('#logoutForm');
	// 로그아웃하기
	logoutBtn.on('click',function(){
		logoutForm.submit();
	});
	
	
});	
</script>


<aside class="app-sidebar sticky" id="sidebar">

	<div class="main-sidebar-header">
		<a href="/admin/main" class="header-logo"> 
			<img src="${pageContext.request.contextPath}/resources/assets/images/brand-logos/codeWorker-logo_noback.png" alt="logo" class="desktop-logo"> 
			<img src="${pageContext.request.contextPath}/resources/assets/images/brand-logos/codeWorker-logo_noback.png" alt="logo" class="desktop-dark"> 
			<img src="${pageContext.request.contextPath}/resources/assets/images/brand-logos/codeWorker-logo_noback.png" alt="logo" class="desktop-white">
		</a>
	</div>

	<div class="main-sidebar" id="sidebar-scroll">

		<nav class="main-menu-container nav nav-pills flex-column sub-open">
			<div class="slide-left" id="slide-left">
				<svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24" height="24" viewBox="0 0 24 24"> 
                	<path d="M13.293 6.293 7.586 12l5.707 5.707 1.414-1.414L10.414 12l4.293-4.293z"></path> 
                </svg>
			</div>
			<ul class="main-menu">
				<div style="margin-left: 25px;">
					<hr>
					<div>
						<p>
							<font style="font-weight: bold; font-size: 25px;">관리자님!</br>
								환영합니다
							</font>
						</p>
					</div>
				</div>

				<li class="slide__category">
					<span class="category-name">
						<font style="font-size: 20px;">관리자 메뉴</font>
					</span>
				</li>

				<li class="slide has-sub">
					<a href="javascript:void(0);" class="side-menu__item"> 
						<i class="bx bx-task side-menu__icon"></i>
							<span class="side-menu__label">회원 관리</span> 
						<i class="fe fe-chevron-right side-menu__angle"></i>
					</a>
					<ul class="slide-menu child1">
						<li class="slide side-menu__label1">
							<a href="javascript:void(0)">회원 관리</a>
						</li>
						<li class="slide">
							<a href="/admin/seekerList" class="side-menu__item">구직회원 관리</a>
						</li>
						<li class="slide">
							<a href="/admin/recruiterList" class="side-menu__item">구인회원 관리</a>
						</li>
					</ul>
				</li>

				<li class="slide has-sub">
					<a href="javascript:void(0);" class="side-menu__item"> 
						<i class="bx bx-task side-menu__icon"></i>
							<span class="side-menu__label">기업 관리</span> 
						<i class="fe fe-chevron-right side-menu__angle"></i>
					</a>
					<ul class="slide-menu child1">
						<li class="slide side-menu__label1">
							<a href="javascript:void(0)">기업 관리</a>
						</li>
						<li class="slide">
							<a href="/admin/crpRequestJoinList" class="side-menu__item">기업회원 가입요청</a>
						</li>
						<li class="slide">
							<a href="/admin/crpList" class="side-menu__item">기업회원 목록</a>
						</li>
					</ul>
				</li>

				<li class="slide has-sub">
					<a href="javascript:void(0);" class="side-menu__item">
						<i class="bx bx-task side-menu__icon"></i>
							<span class="side-menu__label">게시판 관리</span> 
						<i class="fe fe-chevron-right side-menu__angle"></i>
					</a>
					<ul class="slide-menu child1">
						<li class="slide side-menu__label1">
							<a href="javascript:void(0)">게시판 관리</a>
						</li>
						<li class="slide">
							<a href="/admin/noticeList" class="side-menu__item">공지사항 관리</a>
						</li>
						<li class="slide">
							<a href="/admin/communityList" class="side-menu__item">커뮤니티 관리</a>
						</li>
						<li class="slide">
							<a href="/admin/faqList" class="side-menu__item">FAQ 관리</a>
						</li>
<!-- 						<li class="slide"> -->
<!-- 							<a href="/admin/questionList" class="side-menu__item">문의사항 관리</a> -->
<!-- 						</li> -->
					</ul>
				</li>
			</ul>
			<div class="slide-right" id="slide-right">
				<svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191" width="24" height="24" viewBox="0 0 24 24"> 
					<path d="M10.707 17.707 16.414 12l-5.707-5.707-1.414 1.414L13.586 12l-4.293 4.293z"></path> 
				</svg>
			</div>
		</nav>

	</div>

</aside>