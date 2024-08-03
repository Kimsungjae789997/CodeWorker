<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<!DOCTYPE html>
<html lang="ko" xml:lang="ko" xmlns="http://www.w3.org/1999/xhtml"
	class="" translate="">
<head>
<script src="https://code.jquery.com/jquery.min.js"></script>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge">
<meta name="twitter:title" property="og:title" itemprop="title name"
	content="코딩테스트 연습 - 멸종위기의 대장균 찾기">
<meta name="og:title" property="og:title" itemprop="title name"
	content="코딩테스트 연습 - 멸종위기의 대장균 찾기">
<meta name="twitter:image" property="og:image"
	itemprop="image primaryImageOfPage"
	content="https://image.freepik.com/free-vector/landing-page-template-for-a-website_23-2147782747.jpg">
<meta name="og:image" property="og:image"
	itemprop="image primaryImageOfPage"
	content="https://image.freepik.com/free-vector/landing-page-template-for-a-website_23-2147782747.jpg">
<meta name="twitter:url" property="og:url"
	content="https://programmers.co.kr/">
<meta name="og:url" property="og:url"
	content="https://programmers.co.kr/">
<meta charset="utf-8">
<title>코딩테스트 연습 - 멸종위기의 대장균 찾기 | 프로그래머스 스쿨</title>
<link rel="shortcut icon" type="image/x-icon"
	href="https://school.programmers.co.kr/assets/icons/favicon-ec61d910396b5fc4d7418ea44281693172c34e31d437d074f9ab5470523990fb.png">
<link rel="apple-touch-icon" type="image/png"
	href="https://school.programmers.co.kr/assets/icons/apple-icon-8a32ac937e12475676c7102e99d34b7f908b3d1ac048d6eed0712ad111bfdd01.png">
<meta name="keywords"
	content="코딩 교육, 코딩, 프로그래밍, 실습, 생활코딩, 알고리즘, mysql, 영상/실습 강의, 추천 강의">
<meta property="fb:app_id" content="339079816467879">
<meta property="og:type" content="website">
<meta property="og:site_name" content="프로그래머스 스쿨">
<meta property="og:locale" content="ko_KR">
<meta name="twitter:card" content="summary">
<meta name="image"
	content="https://image.freepik.com/free-vector/landing-page-template-for-a-website_23-2147782747.jpg">
<meta name="csrf-param" content="authenticity_token" />
<meta name="csrf-token"
	content="rQwGjnyV6CfSyhNAIQre-HYf0X53XtvdF9hk42xQmLnj_tRHxUW_gpL2zuV25WZMUzstwzTyezYvoa7lMF4aJA" />
<meta name="action-cable-url"
	content="wss://ws.programmers.co.kr:443/cable" />
 <!-- 시큐리티 토큰 시작 -->
    <meta id="_csrf" name="_csrf" content="${_csrf.token }">
	<meta id="_csrf_header" name="_csrf_header" content="${_csrf.headerName }">
	<!-- 시큐리티 토큰 끝 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/monacoEditorLib/css/library.css"
	media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/monacoEditorLib/css/application.css"
	media="all" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/monacoEditorLib/css/school.css"
	media="all" />
<script type="text/javascript">
	var token = "";		// 시큐리티 인증 시, 사용할 토큰 정보
	var header = "";	// 시큐리티 인증 시, 사용할 토큰 키
	$(function(){
		token = $("meta[name='_csrf']").attr("content");
		header = $("meta[name='_csrf_header']").attr("content");
	});
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class="learn-lessons learn-lessons-show " data-ns="Learn"
	data-controller="lessons" data-action="show" data-defaultLocale="ko"
	data-locale="ko" data-signed-in="false">
<input type="hidden" value="${recNtcVO.recNtcId }" name="recNtcId" id="recNtcId">
<div id="Btn1">
<input type="hidden" value="${model0.coteNo }" name="coteNo" id="coteNo1">  
	<div
		class="navbar navbar-dark navbar-expand-lg navbar-application navbar-breadcrumb">
		<a class="navbar-brand" href="#"> <img alt="logo" style="width: 120px;"
			src="${pageContext.request.contextPath}/resources/assets/images/recruiter/CodeWorkerWhite.png" />
		</a>
		<ol class="breadcrumb">
			<li style="color: white; font-weight: bold;">코딩테스트 문제</li>
			<li style="color: white;  font-weight: bold;">문제1</li>
			<li class="active">${model0.coteTitle }</li>
		</ol>

	</div>



	<div class="main theme-dark">

		<div class="lesson-content" data-course-slug="코딩테스트-연습"
			data-course-id="30" data-lesson-id="301651"
			data-lesson-type="Challenge" data-lesson-title="멸종위기의 대장균 찾기"
			data-lesson-ai-commentable="false" data-challenge-level="5"
			data-challenge-category="database"
			data-course-category="open_challenge" data-next-lesson-id="">



			<div class="challenge-nav nav nav-tabs nav-tabs-dark task-tab"
				id="tab" role="tablist">
				<div class="challenge-nav-left-menu">
					

					<div class="nav-item algorithm-nav-link algorithm-title">
						<span class="challenge-title" style="font-weight: bold;">${model0.coteTitle }</span>
					</div>
				</div>

				<div class="challenge-nav-right-menu">
						
					<div class="challenge-settings nav-item" style="width: 330px;     justify-content: space-around;">
							
						<div>
							<label for="language1" style="color: white; font-weight: bold;">언어 :</label>
	                          <select id="language1" name="language1" class="form-select dropdown-language   btn-dark" style=" font-weight:bold; width: 73px; height: 30px; text-align: center;">
		                          <option value="JAVA" selected="selected">JAVA</option>
		                          <option value="C">C</option>
		                          <option value="PYTHON">PYTHON</option>
		                          <option value="C++">C++</option>
		                          <option value="C#">C#</option>
	                          </select>
	                    </div>      
						<div>
							<button type="button"  class="btn btn-sm btn-outline-dark  btn-problem1 ">문제1</button>
							<button type="button"  class="btn btn-sm btn-outline-dark  btn-problem2">문제2</button>
							<button type="button"  class="btn btn-sm btn-outline-dark  btn-problem3">문제3</button>
						</div>   
					</div>

				</div>
			</div>

			<div class="challenge-content lesson-algorithm-main-section "
				data-challengeable-id="832" data-challengeable-type="database"
				data-algorithm-type="" data-language="mysql" data-user-id=""
				data-interface-type="" data-lesson-comment-activation-score="30"
				data-is-lesson="true">
				<div
					data-hackle-view="{&quot;key&quot;:&quot;school_lesson_challenge_viewed&quot;,&quot;properties&quot;:{&quot;course_id&quot;:30,&quot;challenge_title&quot;:&quot;멸종위기의 대장균 찾기&quot;,&quot;challenge_level&quot;:5,&quot;challenge_category&quot;:&quot;database&quot;}}"></div>


				<div class="main-section false">
					<div class="guide-section">
						<div class="false" id="tour2">
							<div class="guide-section-description">
								<h6 class="guide-section-title">문제 설명</h6>
								<div class="markdown solarized-dark">
									<p >
									${model0.questionContent }
									</p>
									


									<hr>

									<h5>제약사항</h5>

									<p>
										${model0.coteConstraints1 }
										${model0.coteConstraints2 }
									</p>

									<hr>

									<h5>입출력 예</h5>
									<p>
										${model0.exAnswer1 }<br>
										${model0.exAnswer2 }										
									</p>

								</div>
							</div>
						</div>


					</div>

					<div class="run-section">
						<div id="tour3" class="code-section"
							onkeyup="Hera.tryoutChallenges.resizeEditor(this);">
							<div class="editor">
								<ul class="nav nav-pills editor-nav-pills tap-form">

									<li class="nav-item"><a href="#"
										class="btn-tab nav-link active" data-id="74394"
										data-language="mysql"> solution.sql </a></li>
								</ul>
								<div id="container1" style="height: 400px; width: 90%;"></div>
								<input type="hidden" value='' name="prctQuesAns" id="input1">
          	                          	<input type="hidden" value="${model0.exAnsnum1 }" id="model0ExAnsnum1">                                        
                          	<input type="hidden" value="${model0.exAnsnum2 }" id="model0ExAnsnum2">   
	
							</div>
						</div>
						<br>
						<div class="output-section" id="tour6">
							<div class="tab-header">
								<div id="output-title" class="output-title output-only"
									data-toggle="tab">
										 <span style="color: white;">실행 결과</span> <span id="output-spinner" class="spinner hidden">
										<span class="bounce1"></span> <span class="bounce2"></span> <span
										class="bounce3"></span>
									</span>
								</div>
							</div>
                           <input type="hidden" value="${model0.exResnum1 }" id="model0ExResnum1">                                        
                           <input type="hidden" value="${model0.exResnum2 }" id="model0ExResnum2">  
							<div class="console tab-content">
								<div id="output"
									class="console-output tab-pane fade in active show banner">
									<div id="output1" style="overflow:auto; height: 200px;">
										실행 결과가 여기에 표시됩니다.

									</div>
								</div>

							</div>
						</div>
					</div>
				</div>


				<div class="button-section">
					<div class="testcase-button"><button type="button" id="autoBtn1" class="btn btn-light rounded-pill btn-wave">자동완성</button></div>

					<div class="func-buttons">
						<a id="runBtn1" class="btn btn-primary">RUN</a>
						<a id="submitBtn1" class="btn btn-primary">제출하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
  </div>	


<div id="Btn2" style="display: none;">
<input type="hidden" value="${model1.coteNo }" name="coteNo" id="coteNo2">  
	<div
		class="navbar navbar-dark navbar-expand-lg navbar-application navbar-breadcrumb">
		<a class="navbar-brand" href="#"> <img alt="logo" style="width: 120px;"
			src="${pageContext.request.contextPath}/resources/assets/images/recruiter/CodeWorkerWhite.png" />
		</a>
		<ol class="breadcrumb">
			<li style="color: white; font-weight: bold;">코딩테스트 문제</li>
			<li style="color: white;  font-weight: bold;">문제2</li>
			<li class="active">${model1.coteTitle }</li>
		</ol>

	</div>



	<div class="main theme-dark">

		<div class="lesson-content" data-course-slug="코딩테스트-연습"
			data-course-id="30" data-lesson-id="301651"
			data-lesson-type="Challenge" data-lesson-title="멸종위기의 대장균 찾기"
			data-lesson-ai-commentable="false" data-challenge-level="5"
			data-challenge-category="database"
			data-course-category="open_challenge" data-next-lesson-id="">



			<div class="challenge-nav nav nav-tabs nav-tabs-dark task-tab"
				id="tab" role="tablist">
				<div class="challenge-nav-left-menu">
					

					<div class="nav-item algorithm-nav-link algorithm-title">
						<span class="challenge-title" style="font-weight: bold;">${model1.coteTitle }</span>
					</div>
				</div>

				<div class="challenge-nav-right-menu">

					<div class="challenge-settings nav-item" style="width: 330px;     justify-content: space-around;">
						<div>
							<label for="language2" style="color: white; font-weight: bold;">언어 :</label>&nbsp;&nbsp;
	                          <select id="language2" name="language2" class="form-select   btn-dark" style=" font-weight:bold; width: 73px; height: 30px;  text-align: center;">
		                             <option value="JAVA" selected="selected">JAVA</option>
		                          <option value="C">C</option>
		                          <option value="PYTHON">PYTHON</option>
		                          <option value="C++">C++</option>
		                          <option value="C#">C#</option>
	                          </select>
						</div>
						<div>
			
							<button type="button"  class="btn btn-sm btn-outline-dark btn-problem1">문제1</button>
							<button type="button"  class="btn btn-sm btn-outline-dark btn-problem2">문제2</button>
							<button type="button"  class="btn btn-sm btn-outline-dark btn-problem3">문제3</button>
						</div>
					</div>

				</div>
			</div>

			<div class="challenge-content lesson-algorithm-main-section "
				data-challengeable-id="832" data-challengeable-type="database"
				data-algorithm-type="" data-language="mysql" data-user-id=""
				data-interface-type="" data-lesson-comment-activation-score="30"
				data-is-lesson="true">
				<div
					data-hackle-view="{&quot;key&quot;:&quot;school_lesson_challenge_viewed&quot;,&quot;properties&quot;:{&quot;course_id&quot;:30,&quot;challenge_title&quot;:&quot;멸종위기의 대장균 찾기&quot;,&quot;challenge_level&quot;:5,&quot;challenge_category&quot;:&quot;database&quot;}}"></div>


				<div class="main-section false">
					<div class="guide-section">
						<div class="false" id="tour2">
							<div class="guide-section-description">
								<h6 class="guide-section-title">문제 설명</h6>
								<div class="markdown solarized-dark">
									<p >
									${model1.questionContent }
									</p>
									


									<hr>

									<h5>제약사항</h5>

									<p>
										${model1.coteConstraints1 }
										${model1.coteConstraints2 }
									</p>

									<hr>

									<h5>입출력 예</h5>
									<p>
										${model1.exAnswer1 }<br>
										${model1.exAnswer2 }										
									</p>

								</div>
							</div>
						</div>


					</div>

					<div class="run-section">
						<div id="tour3" class="code-section"
							onkeyup="Hera.tryoutChallenges.resizeEditor(this);">
							<div class="editor">
								<ul class="nav nav-pills editor-nav-pills tap-form">
									<li class="nav-item"><a href="#"
										class="btn-tab nav-link active" data-id="74394"
										data-language="mysql"> solution.sql </a></li>
								</ul>
								<div id="container2" style="height:400px; width: 90%;"></div>
								<input type="hidden" value='' name="prctQuesAns" id="input2">
	                           <input type="hidden" value="${model1.exResnum1 }" id="model1ExResnum1">                                        
	                           <input type="hidden" value="${model1.exResnum2 }" id="model1ExResnum2">  
							</div>
						</div>
				<br>
						<div class="output-section" id="tour6">
							<div class="tab-header">
								<div id="output-title" class="output-title output-only"
									data-toggle="tab">
								<span style="color: white;">실행 결과</span> <span id="output-spinner" class="spinner hidden">
										<span class="bounce1"></span> <span class="bounce2"></span> <span
										class="bounce3"></span>
									</span>
								</div>
							</div>
 							<input type="hidden" value="${model1.exAnsnum1 }" id="model1ExAnsnum1">                                        
                           <input type="hidden" value="${model1.exAnsnum2 }" id="model1ExAnsnum2">   
							<div class="console tab-content">
								<div id="output"
									class="console-output tab-pane fade in active show banner">
									<div id="output2" style="overflow:auto; height: 200px;">
										실행 결과가 여기에 표시됩니다.

									</div>
								</div>

							</div>
						</div>
					</div>
				</div>


				<div class="button-section">
					<div class="testcase-button"><button type="button" id="autoBtn2" class="btn btn-light rounded-pill btn-wave">자동완성</button></div>

					<div class="func-buttons">
						<a class="btn btn-primary" id="runBtn2">RUN</a>
						<a class="btn btn-primary"  id="submitBtn2" >제출하기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
  </div>
 
 <div id="Btn3" style="display: none;">
<input type="hidden" value="${model2.coteNo }" name="coteNo" id="coteNo3">  
	<div
		class="navbar navbar-dark navbar-expand-lg navbar-application navbar-breadcrumb">
		<a class="navbar-brand" href="#"> <img alt="logo" style="width: 120px;"
			src="${pageContext.request.contextPath}/resources/assets/images/recruiter/CodeWorkerWhite.png" />
		</a>
		<ol class="breadcrumb">
			<li style="color: white; font-weight: bold;">코딩테스트 문제</li>
			<li style="color: white;  font-weight: bold;">문제3</li>
			<li class="active">${model2.coteTitle }</li>
		</ol>

	</div>



	<div class="main theme-dark">

		<div class="lesson-content" data-course-slug="코딩테스트-연습"
			data-course-id="30" data-lesson-id="301651"
			data-lesson-type="Challenge" data-lesson-title="멸종위기의 대장균 찾기"
			data-lesson-ai-commentable="false" data-challenge-level="5"
			data-challenge-category="database"
			data-course-category="open_challenge" data-next-lesson-id="">



			<div class="challenge-nav nav nav-tabs nav-tabs-dark task-tab"
				id="tab" role="tablist">
				<div class="challenge-nav-left-menu">
					

					<div class="nav-item algorithm-nav-link algorithm-title">
						<span class="challenge-title" style="font-weight: bold;">${model2.coteTitle }</span>
					</div>
				</div>

				<div class="challenge-nav-right-menu">

					<div class="challenge-settings nav-item" style="width: 330px;     justify-content: space-around;">
							<div>
							<label for="language3" style="color: white; font-weight: bold;">언어 :</label>&nbsp;&nbsp;
	                          <select id="language3" name="language3" class="form-select   btn-dark" style=" font-weight:bold; width: 73px; height: 30px;  text-align: center;">
		                            <option value="JAVA" selected="selected">JAVA</option>
		                          <option value="C">C</option>
		                          <option value="PYTHON">PYTHON</option>
		                          <option value="C++">C++</option>
		                          <option value="C#">C#</option>
	                          </select>
							</div>
							
						<div>
							<button type="button"  class="btn btn-sm btn-outline-dark btn-problem1">문제1</button>
							<button type="button"  class="btn btn-sm btn-outline-dark btn-problem2">문제2</button>
							<button type="button"  class="btn btn-sm btn-outline-dark btn-problem3">문제3</button>
						</div>
					</div>

				</div>
			</div>

			<div class="challenge-content lesson-algorithm-main-section "
				data-challengeable-id="832" data-challengeable-type="database"
				data-algorithm-type="" data-language="mysql" data-user-id=""
				data-interface-type="" data-lesson-comment-activation-score="30"
				data-is-lesson="true">
				<div
					data-hackle-view="{&quot;key&quot;:&quot;school_lesson_challenge_viewed&quot;,&quot;properties&quot;:{&quot;course_id&quot;:30,&quot;challenge_title&quot;:&quot;멸종위기의 대장균 찾기&quot;,&quot;challenge_level&quot;:5,&quot;challenge_category&quot;:&quot;database&quot;}}"></div>


				<div class="main-section false">
					<div class="guide-section">
						<div class="false" id="tour2">
							<div class="guide-section-description">
								<h6 class="guide-section-title">문제 설명</h6>
								<div class="markdown solarized-dark">
									<p >
									${model2.questionContent }
									</p>
									


									<hr>

									<h5>제약사항</h5>

									<p>
										${model2.coteConstraints1 }
										${model2.coteConstraints2 }
									</p>

									<hr>

									<h5>입출력 예</h5>
									<p>
										${model2.exAnswer1 }<br>
										${model2.exAnswer2 }										
									</p>

								</div>
							</div>
						</div>


					</div>

					<div class="run-section">
						<div id="tour3" class="code-section"
							onkeyup="Hera.tryoutChallenges.resizeEditor(this);">
							<div class="editor">
								<ul class="nav nav-pills editor-nav-pills tap-form">
								
									<li class="nav-item"><a href="#"
										class="btn-tab nav-link active" data-id="74394"
										data-language="mysql"> solution.sql </a></li>
								</ul>
								<div id="container3" style="height:400px; width: 90%;"></div>
								<input type="hidden" value='' name="prctQuesAns" id="input3">
                            	<input type="hidden" value="${model2.exResnum1 }" id="model2ExResnum1">                                        
                            	<input type="hidden" value="${model2.exResnum2 }" id="model2ExResnum2"> 
							</div>
						</div>
						<br>
						<div class="output-section" id="tour6">
							<div class="tab-header">
								<div id="output-title" class="output-title output-only"
									data-toggle="tab">
									<span style="color: white;">실행 결과</span> <span id="output-spinner" class="spinner hidden">
										<span class="bounce1"></span> <span class="bounce2"></span> <span
										class="bounce3"></span>
									</span>
								</div>
							</div>
                        	<input type="hidden" value="${model2.exAnsnum1 }" id="model2ExAnsnum1">                                        
                         	<input type="hidden" value="${model2.exAnsnum2 }" id="model2ExAnsnum2">   
							<div class="console tab-content">
								<div id="output"
									class="console-output tab-pane fade in active show banner">
									<div id="output3" style="overflow:scroll; height: 200px;">
										실행 결과가 여기에 표시됩니다.
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>


				<div class="button-section">
					<div class="testcase-button"><button type="button" id="autoBtn3" class="btn btn-light rounded-pill btn-wave">자동완성</button></div>

					<div class="func-buttons">
						<a class="btn btn-primary" id="runBtn3">RUN</a>
						<a class="btn btn-primary" id="submitBtn3">제출하기</a>
						<button id="coteEndBtn" class="btn btn-danger btn-wave" style="font-size : 15px; font-weight: bold;">시험 종료</button>
					</div>
				</div>
			</div>
		</div>
	</div>
  </div>
  
</body>

<script src="${pageContext.request.contextPath }/resources/monacoEditorLib/min/vs/loader.js"></script>
<script type="text/javascript">
    $(function() {
        require.config({ paths: { 'vs': '/resources/monacoEditorLib/min/vs' } });

        var editor1, editor2, editor3;

        // 에디터 생성 함수
        function createEditor(containerId, initialValue) {
            if (containerId === 'container1' && editor1) {
                editor1.dispose();
            } else if (containerId === 'container2' && editor2) {
                editor2.dispose();
            } else if (containerId === 'container3' && editor3) {
                editor3.dispose();
            }

            require(["vs/editor/editor.main"], function () {
                var editor = monaco.editor.create(document.getElementById(containerId), {
                    value: initialValue,
                    language: 'java',
                    theme: 'vs-dark',
                    minimap: { enabled: false },
                    scrollBeyondLastLine: false,
                    fontSize: 20
                });

                if (containerId === 'container1') {
                    editor1 = editor;
                } else if (containerId === 'container2') {
                    editor2 = editor;
                } else if (containerId === 'container3') {
                    editor3 = editor;
                }
            });
        }

        // 초기값 설정
        const initialValue1 = "public class Solution {\n    public static int solution(int num) {\n\n    }\n}";
        const initialValue2 = "public class Solution {\n    public static int solution(int num) {\n\n    }\n}";
        const initialValue3 = "public class Solution {\n    public static int solution(int num) {\n\n    }\n}";

        // 에디터 초기화
        createEditor('container1', initialValue1);
        createEditor('container2', initialValue2);
        createEditor('container3', initialValue3);

        // 버튼 클릭 시 에디터 전환
        $('.btn-problem1').on('click', function() {
            $('#Btn1').show();
            $('#Btn2').hide();
            $('#Btn3').hide();
            createEditor('container1', initialValue1);
        });
        
        $('.btn-problem2').on('click', function() {
            $('#Btn2').show();
            $('#Btn1').hide();
            $('#Btn3').hide();
            createEditor('container2', initialValue2);
        });
        
        $('.btn-problem3').on('click', function() {
            $('#Btn3').show();
            $('#Btn1').hide();
            $('#Btn2').hide();
            createEditor('container3', initialValue3);
        });

        // 템플릿 설정
        const templates = {
            "JAVA": "public class Solution {\n    public static int solution(int num) {\n\n    }\n}",
            "C": "#include <stdio.h>\n\nint main() {\n    return 0;\n}",
            "PYTHON": "def main():\n    pass\n\nif __name__ == '__main__':\n    main()",
            "C++": "#include <iostream>\n\nint main() {\n    return 0;\n}",
            "C#": "using System;\n\nclass Program {\n    static void Main(string[] args) {\n        // Your code here\n    }\n}"
        };

        // 선택된 언어에 따라 템플릿 설정
        function populateTemplate(selectElement, editor) {
            const language = selectElement.value;
            editor.setValue(templates[language] || "");
        }

        // 언어 선택 드롭다운에 이벤트 리스너 추가
        document.getElementById("language1").addEventListener("change", function() {
            populateTemplate(this, editor1);
        });
        document.getElementById("language2").addEventListener("change", function() {
            populateTemplate(this, editor2);
        });
        document.getElementById("language3").addEventListener("change", function() {
            populateTemplate(this, editor3);
        });
        
        
        // 컴파일 RUN1 실행하기
        $('#runBtn1').on('click',function(){
        	
           var code = editor1.getModel().getValue();
           console.log(code);
           
           var data = {
                 code : code,
                 exAnsnum1 : $('#model0ExAnsnum1').val(),
                 exAnsnum2 : $('#model0ExAnsnum2').val(),
                 exResnum1 : $('#model0ExResnum1').val(),
                 exResnum2 : $('#model0ExResnum2').val()
           }
           console.log($('#model0ExAnsnum1').val());
           console.log($('#model0ExAnsnum2').val());
           
            $.ajax({
                   type: "POST",
                   url: "/apply/compileCode",
                   data: JSON.stringify(data),
                   contentType: "application/json;charset=utf-8",
                      beforeSend: function(xhr) {
                          xhr.setRequestHeader(header, token);
                      },
                   success: function(res) {
                      console.log(res);
                       if (res.includes('오류: 기본 클래스 dynamic.Compiler을(를) 찾거나 로드할 수 없습니다.')) {
                           $('#output1').css("color", "red");
                       }
                       $('#output1').html(res);
                   }
               });   
            
        });
        
        
        
        
        // 컴파일 RUN2 실행하기
        $('#runBtn2').on('click',function(){
           var code = editor2.getModel().getValue();
           console.log(code);
           
           var data = {
                 code : code,
                 exAnsnum1 : $('#model1ExAnsnum1').val(),
                 exAnsnum2 : $('#model1ExAnsnum2').val(),
                 exResnum1 : $('#model1ExResnum1').val(),
                 exResnum2 : $('#model1ExResnum2').val()
           }
           console.log($('#model1ExAnsnum1').val());
           console.log($('#model1ExAnsnum2').val());
           
            $.ajax({
                   type: "POST",
                   url: "/apply/compileCode",
                   data: JSON.stringify(data),
                   contentType: "application/json;charset=utf-8",
                      beforeSend: function(xhr) {
                          xhr.setRequestHeader(header, token);
                      },
                   success: function(res) {
                      console.log(res);
                       if (res.includes('오류: 기본 클래스 dynamic.Compiler을(를) 찾거나 로드할 수 없습니다.')) {
                           $('#output2').css("color", "red");
                       }
                       $('#output2').html(res);
                   }
               });   
        });
        
        
        
        
        // 컴파일 RUN3 실행하기
        $('#runBtn3').on('click',function(){
           var code = editor3.getModel().getValue();
           console.log(code);
           
           var data = {
                 code : code,
                 exAnsnum1 : $('#model2ExAnsnum1').val(),
                 exAnsnum2 : $('#model2ExAnsnum2').val(),
                 exResnum1 : $('#model2ExResnum1').val(),
                 exResnum2 : $('#model2ExResnum2').val()
           }
           console.log($('#model2ExAnsnum1').val());
           console.log($('#model2ExAnsnum2').val());
           
            $.ajax({
                   type: "POST",
                   url: "/apply/compileCode",
                   data: JSON.stringify(data),
                   contentType: "application/json;charset=utf-8",
                      beforeSend: function(xhr) {
                          xhr.setRequestHeader(header, token);
                      },
                   success: function(res) {
                      console.log(res);
                       if (res.includes('오류: 기본 클래스 dynamic.Compiler을(를) 찾거나 로드할 수 없습니다.')) {
                           $('#output3').css("color", "red");
                       }                    
                       $('#output3').html(res);
                   }
               });   
        });
        
     // 문제 1번 제출
        $('#submitBtn1').on('click', function() {
            // SweetAlert2를 사용한 확인 대화상자
            Swal.fire({
                title: '문제를 제출하시겠습니까?',
                text: "",
                icon: 'question',
                showCancelButton: true, // 취소 버튼 표시
                confirmButtonText: '제출하기',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    // 사용자가 '제출하기' 버튼을 클릭한 경우
                    console.log("문제 1번 제출...!");
                    
                    var output = editor1.getModel().getValue();
                    var coteNo = $('#coteNo1').val();
                    var recNtcId = $('#recNtcId').val();

                    var data = {
                        output: output,
                        coteNo: coteNo,
                        recNtcId: recNtcId
                    };
                    
                    $.ajax({
                        url: "/apply/coteInsert",
                        type: "post",
                        data: JSON.stringify(data),
                        contentType: "application/json;charset=utf-8",
                        beforeSend: function(xhr) {
                            xhr.setRequestHeader(header, token);
                        },
                        success: function(res) {
                            console.log(res);
                            // 제출 성공 후 메시지 표시
                            Swal.fire({
                                title: '제출 완료!',
                                text: '문제 1번 제출에 성공하셨습니다!',
                                icon: 'success',
                                confirmButtonText: '확인'
                            });
                        },
                        error: function(err) {
                            // 오류 발생 시 메시지 표시
                            Swal.fire({
                                title: '오류 발생!',
                                text: '문제 제출 중 오류가 발생했습니다.',
                                icon: 'error',
                                confirmButtonText: '확인'
                            });
                        }
                    });
                } else {
                    // 사용자가 '취소' 버튼을 클릭한 경우
                    Swal.fire({
                        title: '취소됨',
                        text: '문제 제출 작업이 취소되었습니다.',
                        icon: 'info',
                        confirmButtonText: '확인'
                    });
                }
            });
        });
        
        
        
     // 문제 2번 제출
        $('#submitBtn2').on('click', function() {
            // SweetAlert2를 사용한 확인 대화상자
            Swal.fire({
                title: '문제를 제출하시겠습니까?',
                text: "",
                icon: 'question',
                showCancelButton: true, // 취소 버튼 표시
                confirmButtonText: '제출하기',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    // 사용자가 '제출하기' 버튼을 클릭한 경우
                    var output = editor2.getModel().getValue();
                    var coteNo = $('#coteNo2').val();
                    var recNtcId = $('#recNtcId').val();

                    var data = {
                        output: output,
                        coteNo: coteNo,
                        recNtcId: recNtcId
                    };
                    
                    $.ajax({
                        url: "/apply/coteInsert",
                        type: "post",
                        data: JSON.stringify(data),
                        contentType: "application/json;charset=utf-8",
                        beforeSend: function(xhr) {
                            xhr.setRequestHeader(header, token);
                        },
                        success: function(res) {
                            console.log(res);
                            // 제출 성공 후 메시지 표시
                            Swal.fire({
                                title: '제출 완료!',
                                text: '문제 2번 제출에 성공하셨습니다!',
                                icon: 'success',
                                confirmButtonText: '확인'
                            });
                        },
                        error: function(err) {
                            // 오류 발생 시 메시지 표시
                            Swal.fire({
                                title: '오류 발생!',
                                text: '문제 제출 중 오류가 발생했습니다.',
                                icon: 'error',
                                confirmButtonText: '확인'
                            });
                        }
                    });
                } else {
                    // 사용자가 '취소' 버튼을 클릭한 경우
                    Swal.fire({
                        title: '취소됨',
                        text: '문제 제출 작업이 취소되었습니다.',
                        icon: 'info',
                        confirmButtonText: '확인'
                    });
                }
            });
        });
        
        
     // 문제 3번 제출
        $('#submitBtn3').on('click', function() {
            // SweetAlert2를 사용한 확인 대화상자
            Swal.fire({
                title: '문제를 제출하시겠습니까?',
                text: "",
                icon: 'question',
                showCancelButton: true, // 취소 버튼 표시
                confirmButtonText: '제출하기',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    // 사용자가 '제출하기' 버튼을 클릭한 경우
                    var output = editor3.getModel().getValue();
                    var coteNo = $('#coteNo3').val();
                    var recNtcId = $('#recNtcId').val();

                    var data = {
                        output: output,
                        coteNo: coteNo,
                        recNtcId: recNtcId
                    };
                    
                    $.ajax({
                        url: "/apply/coteInsert",
                        type: "post",
                        data: JSON.stringify(data),
                        contentType: "application/json;charset=utf-8",
                        beforeSend: function(xhr) {
                            xhr.setRequestHeader(header, token);
                        },
                        success: function(res) {
                            console.log(res);
                            // 제출 성공 후 메시지 표시
                            Swal.fire({
                                title: '제출 완료!',
                                text: '문제 3번 제출에 성공하셨습니다!',
                                icon: 'success',
                                confirmButtonText: '확인'
                            });
                        },
                        error: function(err) {
                            // 오류 발생 시 메시지 표시
                            Swal.fire({
                                title: '오류 발생!',
                                text: '문제 제출 중 오류가 발생했습니다.',
                                icon: 'error',
                                confirmButtonText: '확인'
                            });
                        }
                    });
                } else {
                    // 사용자가 '취소' 버튼을 클릭한 경우
                    Swal.fire({
                        title: '취소됨',
                        text: '문제 제출 작업이 취소되었습니다.',
                        icon: 'info',
                        confirmButtonText: '확인'
                    });
                }
            });
        });
        
     // 시험 종료 버튼
        $('#coteEndBtn').on('click', function(e) {
            e.preventDefault(); // 기본 동작 방지
            
            // SweetAlert2를 사용한 확인 대화상자
            Swal.fire({
                title: '시험을 종료하시겠습니까?',
                text: "",
                icon: 'question',
                showCancelButton: true, // 취소 버튼 표시
                confirmButtonText: '종료하기',
                cancelButtonText: '취소'
            }).then((result) => {
                if (result.isConfirmed) {
                    // 사용자가 '종료하기' 버튼을 클릭한 경우
                    location.href = "/apply/main.do?tab=documentSuccess"; // 페이지 리디렉션
                } else {
                    // 사용자가 '취소' 버튼을 클릭한 경우
                    Swal.fire({
                        title: '취소됨',
                        text: '시험 종료 작업이 취소되었습니다.',
                        icon: 'info',
                        confirmButtonText: '확인'
                    });
                }
            });
        });
       
        
        $('#autoBtn1').on('click', function() {
            var newValue = "public class Solution {\n" +
                           "    public static int solution(int age) {\n" +
                           "        int answer = 0;\n" +
                           "        int year = 2022;\n" +
                           "        answer = (year - age) + 1;\n" +
                           "        return answer;\n" +
                           "    }\n" +
                           "}\n";
            editor1.getModel().setValue(newValue);
        });
        
        
        $('#autoBtn2').on('click', function() {
            var newValue = "public class Solution {\n" +
                           "    public static int solution(int n) {\n" +
                           "        int answer = 0;\n" +
                           "        for(int i=1; i<=n ; i++){\n" +
                           "            int cnt = 0;\n" +
                           "            for(int j=1; j<=n; j++ ){\n" +
                           "                if(i%j == 0) {\n" +
                           "                    cnt++; }\n" +
                           "            }\n" +
                           "            if(3<=cnt) answer++;\n" +
                           "        }\n" +
                           "        return answer;\n" +
                           "    }\n" +
                           "}\n";
            editor2.getModel().setValue(newValue);
        });
        
        
        $('#autoBtn3').on('click', function() {
            var newValue = "public class Solution {\n" +
                           "    public static int solution(int n) {\n" +
                           "        int answer = 0;\n" +
                           "        while(n>0){\n" +
                           "            answer+=n%10;\n" +
                           "            n/=10;\n" +
                           "        }\n" +
                           "        return answer;\n" +
                           "    }\n" +
                           "}\n";
            editor3.getModel().setValue(newValue);
        });
        
        
        
        
        
        
        
}); // function() 끝
</script>
</html>
