<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Start::app-content -->
<div class="main-content app-content">
    <div class="container-fluid">
        <!-- Page Header -->
        <div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
            <h1 class="page-title fw-semibold fs-18 mb-0">우리기업 정보</h1>
        </div>
        <!-- Page Header Close -->

        <!-- Start::row-1 -->
        <div class="row" style="justify-content: center;">
            <div class="col-xxl-4 col-xl-12">
                <div class="card custom-card overflow-hidden">
                    <div class="card-body p-0">
                        <div class="d-sm-flex align-items-top p-4 border-bottom-0 main-profile-cover">
                            <div>
                                <span class="avatar avatar-xxl avatar-rounded online me-3">
                                    <img src="../assets/images/faces/9.jpg" alt="로고.png">
                                </span>
                            </div>
                            <div class="flex-fill main-profile-info">
                                <div class="d-flex align-items-center justify-content-between">
                                    <h6 class="fw-semibold mb-1 text-fixed-white">우아한 형제들</h6>
                                    <button class="btn btn-light btn-wave"><i class="ri-add-line me-1 align-middle d-inline-block"></i>수정</button>
                                </div>
                                <p class="mb-1 text-muted text-fixed-white op-7">CRP_TYPE_CODE / CRP_INDUSTRY_CODE</p>
                                <div class="d-flex mb-0">
                                    <div class="me-4">
                                        <p class="fw-bold fs-20 text-fixed-white text-shadow mb-0">CRP_EMP_NUMBER</p>
                                        <p class="mb-0 fs-11 op-5 text-fixed-white">사원수</p>
                                    </div>
                                    <div class="me-4">
                                        <p class="fw-bold fs-20 text-fixed-white text-shadow mb-0">CRP_CAPITALSTOCK</p>
                                        <p class="mb-0 fs-11 op-5 text-fixed-white">자본금</p>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="p-4 border-bottom border-block-end-dashed">
                            <div class="mb-4">
                                <p class="fs-15 mb-2 fw-semibold">기업 소개</p>
                                <p class="fs-12 text-muted op-7 mb-0">
                                   	 기업소개에 대한 내용을 작성하시오.
                                </p>
                            </div>   
                            <div class="mb-0">
                                <p class="fs-15 mb-2 fw-semibold">홈페이지 주소</p>
                                <div class="mb-0">
                                    <p class="mb-1">
                                        <a href="https://www.woowahan.com/" class="text-primary"><u>https://www.woowahan.com/</u></a>
                                    </p>
                                </div>
                            </div>
                        </div>  
                        <div class="p-4 border-bottom border-block-end-dashed">
                            <p class="fs-15 mb-2 me-4 fw-semibold">연락 가능한 정보</p>
                            <div class="text-muted">
                                <p class="mb-2">
                                    <span class="avatar avatar-sm avatar-rounded me-2 bg-light text-muted">
                                        <i class="ri-mail-line align-middle fs-14"></i>
                                    </span>
                                    	메일 주소		
                                </p>
                                <p class="mb-2">
                                    <span class="avatar avatar-sm avatar-rounded me-2 bg-light text-muted">
                                        <i class="ri-phone-line align-middle fs-14"></i>
                                    </span>
                                    	전화번호
                                </p>
                                <p class="mb-0">
                                    <span class="avatar avatar-sm avatar-rounded me-2 bg-light text-muted">
                                        <i class="ri-map-pin-line align-middle fs-14"></i>
                                    </span>
                                    	우편번호 / 주소1 / 주소2
                                </p>
                            </div>
                        </div>

                        <div class="p-4">
                            <p class="fs-15 mb-2 me-4 fw-semibold">가입 정보 :</p>
                            <ul class="list-group">

                                <li class="list-group-item">
                                    <div class="d-sm-flex align-items-top">
                                        <div class="ms-sm-2 ms-0 mt-sm-0 mt-1 fw-semibold flex-fill">
                                            <p class="mb-0 lh-1">법인등록번호</p>
                                            <span class="fs-11 text-muted op-7">CRP_REG_NO</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="d-sm-flex align-items-top">
                                        <div class="ms-sm-2 ms-0 mt-sm-0 mt-1 fw-semibold flex-fill">
                                            <p class="mb-0 lh-1">사업자등록번호</p>
                                            <span class="fs-11 text-muted op-7">CRP_LICENSE_NO</span>
                                        </div>
                                    </div>
                                </li>
                                <li class="list-group-item">
                                    <div class="d-sm-flex align-items-top">
                                        <div class="ms-sm-2 ms-0 mt-sm-0 mt-1 fw-semibold flex-fill">
                                            <p class="mb-0 lh-1">개업일자</p>
                                            <span class="fs-11 text-muted op-7">CRP_OPENING_DAY</span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- start row 끝 -->
    </div>
</div>
<!-- End::app-content -->