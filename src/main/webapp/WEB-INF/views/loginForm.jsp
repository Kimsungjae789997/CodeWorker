<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


    <style>
        .center-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; /* 뷰포트 높이 전체를 사용 */
        }
        .authentication-container {
            max-width: 1000px; /* 적절한 최대 너비 설정 */
            width: 100%;
        }
        .tab {
            cursor: pointer;
            padding: 10px 20px;
        }
        .tab.active {
            border-bottom: 3px solid blue;
        }
    </style>

<%-- 
<h3><c:out value="${error }"/></h3>		<!-- 에러 발생 시, 출력할 메세지 -->
<h3><c:out value="${logout }"/></h3>	<!-- 로그아웃 시, 출력할 메세지 --> 
--%>


<div class="center-container">
    <div class="col-xxl-8 col-xl-8 col-lg-8 authentication-container">
        <div class="row justify-content-center align-items-center h-100">
            <div class="col-xxl-6 col-xl-7 col-lg-7 col-md-7 col-sm-8 col-12">
                <div class="p-2">
                    <ul class="nav nav-pills nav-style-3 mb-3" role="tablist" style="justify-content: center; font-size: 20px;">
                        <li class="nav-item">
                            <a class="nav-link active" data-bs-toggle="tab" role="tab" aria-current="page" id="seekerBtn" href="#" aria-selected="true">일반회원</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-bs-toggle="tab" role="tab" aria-current="page" id="recruiterBtn" href="#" aria-selected="true">기업회원</a>
                        </li>
                    </ul>
                    
                    <div class="mb-3">
                        <a href="index.html">
                            <img src="../assets/images/brand-logos/desktop-logo.png" alt="" class="authentication-brand desktop-logo">
                            <img src="../assets/images/brand-logos/desktop-dark.png" alt="" class="authentication-brand desktop-dark">
                        </a>
                    </div>
                    <p class="h5 fw-semibold mb-2"></p>
                    <div class="text-center my-5 authentication-barrier">
                        <span></span>
                    </div>
                    
                    <form action="/login" method="post" id="signForm">
                        <div class="row gy-3">
                            <div class="col-xl-12 mt-0">
                                <label for="signin-username" class="form-label text-default">아이디</label>
                                <input type="text" class="form-control form-control-lg" id="memId" name="memId" placeholder="아이디를 입력하세요" value="${memId}">
                            </div>
                            <div class="col-xl-12 mb-3">
                                <label for="signin-password" class="form-label text-default d-block">비밀번호</label>
                                <div class="input-group">
                                    <input type="password" class="form-control form-control-lg" id="memPw" name="memPw" placeholder="비밀번호를 입력하세요" value="${memPw}">
                                </div>
                                <div class="mt-2">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck1" name="remember-me">
                                        <label class="form-check-label text-muted fw-normal" for="defaultCheck1">
                                            자동 로그인
                                        </label>
                                    </div>
                                </div>
                            </div>

                                <button type="button" id="signinBtn" class="btn btn-lg" style="background-color: blue; color: white;">로그인</button>

                        
                            <div class="text-center my-5 authentication-barrier">
                                <span>OR</span>
                            </div>
                        
                                <a id="signupBtn1" href="/signupForm.do" class="btn btn-lg" style="background-color: skyblue; color: white;">회원가입</a>

                                <a id="signupBtn2" href="/signupRecruiterForm.do" class="btn btn-lg" style="background-color: skyblue; color: white; display: none;">회원가입</a>

                        </div>
                        <sec:csrfInput/>
                    </form>
                    
                    <div class="text-center">
                        <p class="fs-12 text-muted mt-4"> <a href="sign-up-cover.html" class="text-primary" style="color: black;">아이디/비밀번호 찾기</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
$(function(){
    var signForm = $("#signForm");
    var signinBtn = $("#signinBtn");
    
    signinBtn.on("click", function(){
        var memId = $("#memId").val();
        var memPw = $("#memPw").val();
        
        if(memId == null || memId == ""){
            alert("아이디를 입력해주세요!");
            return false;
        }
        
        if(memPw == null || memPw == ""){
            alert("비밀번호를 입력해주세요!");
            return false;
        }
        
        signForm.submit();
    });
    
    // 초기 상태 설정
    $("#signupBtn2").hide();
    
    // 기업회원, 일반회원 버튼 클릭 이벤트 처리
    $("#seekerBtn").on("click", function(){
        $("#signupBtn1").show();
        $("#signupBtn2").hide();
        $(this).addClass("active");
        $("#recruiterBtn").removeClass("active");
    });

    $("#recruiterBtn").on("click", function(){
        $("#signupBtn1").hide();
        $("#signupBtn2").show();
        $(this).addClass("active");
        $("#seekerBtn").removeClass("active");
    });
});
</script>