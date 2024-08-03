<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
body{
	font-size : 16px;
}
#myTab2 li {
    width: 200px; /* 탭 버튼의 너비 조정 */
    height: 100px; /* 탭 버튼의 높이 조정 */
}
.tab-style-3 .nav-item .nav-link.guide:after {
    content: "0";
}
.recNtcPosition{
    font-size: 21px; 
	display:block;
}
a {
    text-decoration: none;
}
</style>
<input type="hidden" value="${recNtcVO.recNtcId }" name="recNtcId" id="recNtcId">
           	
<div class="" style="height: 1200px; margin-top: 100px;">
    
    <!-- 지원 공고 정보 시작 -->
    <span class="fs-24" style="text-align: center; display:block;">${recNtcVO.recNtcTitle }</span>
    <span class="fs-21" style="text-align: center; display:block;">- ${recNtcVO.positionCode } -</span>
    <!-- 지원 공고 정보 끝 -->
    
    <!-- 코딩테스트 부분 전체 -->
    <div class="" style="margin-top:30px;">
        
        <!-- 상단 네비게이션 시작-->
        <ul class="nav nav-tabs justify-content-center mb-5 tab-style-3" id="myTab2" role="tablist" style="font-weight: bold;">
            <li class="nav-item me-0" role="presentation">
                <button class="nav-link active show guide py-1" id="guide" data-bs-toggle="tab"
                    data-bs-target="#guide-tab-pane" type="button" role="tab"
                    aria-controls="guide-tab-pane" aria-selected="false" style="font-size: 18px;">안내사항</button>
            </li>
            <li class="nav-item me-0" role="presentation">
                <button class="nav-link home py-1" id="home-tab" data-bs-toggle="tab"
                    data-bs-target="#home-tab-pane" type="button" role="tab"
                    aria-controls="home-tab-pane" aria-selected="true" style="font-size: 18px;">문제1</button>
            </li>
            <li class="nav-item me-0" role="presentation">
                <button class="nav-link about py-1" id="profile-tab" data-bs-toggle="tab"
                    data-bs-target="#profile-tab-pane" type="button" role="tab"
                    aria-controls="profile-tab-pane" aria-selected="false" style="font-size: 18px;">문제2</button>
            </li>
            <li class="nav-item me-0" role="presentation">
                <button class="nav-link services py-1" id="contact-tab" data-bs-toggle="tab"
                    data-bs-target="#contact-tab-pane" type="button" role="tab"
                    aria-controls="contact-tab-pane" aria-selected="false" style="font-size: 18px;">문제3</button>
            </li>
        </ul>
        <!-- 상단 네비게이션 끝-->

        <!-- 내용 시작 -->
        <div class="tab-content" id="myTabContent1" style="height: 800px; margin: auto 150px;">
        	<!-- 0 : 안내사항 탭 시작 -->
            <div class="tab-pane show active" id="guide-tab-pane" role="tabpanel"
                aria-labelledby="guide-tab" tabindex="0" style="height: 800px;">
                <div class="margin-left: 30px;">
	                <!-- 제목 -->
	                <span class="fw-semibold fs-18"  style="display:block; padding-bottom:30px;">테스트 참가자 주의사항</span>
	                <!-- 제목 -->
	                <!-- 내용  -->
	                <div style="white-space: pre-wrap;">
테스트에서 진행될 모든 문제와 저작권은 CodeWorker에 있음을 안내드립니다.
				               
아래의 경우 형사처벌의 대상이 될 수 있으니 유의 바랍니다.
1. 회사의 허가없이 외부의 문제를 유출하실 경우
2. 회사의 허가없이 외부에 테스트 링크를 유출하실 경우
				
테스트문제의 입력은 참가자 개인이 평소 사용하는 IDE를 사용하실 수 있습니다.
다만 참가자 개인의 IDE의 사용으로 인한 불이익은 전적으로 참가자 본인에게 있음을 알려드립니다.
					<span style="color: red; font-weight: bold;">
정해진 시간안에 문제를 풀어야합니다.
각 문제풀이의 순서는 상관없고 문제1부터 문제3까지 있습니다.
각 문제마다 제출을 많이 하실 수 있습니다.
각 문제마다 테스트(RUN)기능을 제공합니다.
3문제 다 제출버튼을 누르면 최종제출이 완료됩니다.

새로고침기능을 사용하면 제출하지 않은 입력값의 데이터가 날라갈수 있습니다.
새로고침을 사용하지 마세요.
					</span>
	                </div> 
	                <!-- 내용  -->
                </div>
            </div>
        	<!-- 0 : 안내사항 탭 끝 -->

            <!-- 1 : 문제 1번 시작  -->
  			<input type="hidden" value="${model0.coteNo }" name="coteNo" id="coteNo1">         
            <div class="tab-pane" id="home-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
                <div class="row">
                	<!-- 왼쪽 : 설명 부분 시작 -->
                    <div class="col-xl-4" style="padding-left:10px;">
                       <div>
                           <span class="fs-18 pb-4" style="display:block;"><i class="bi bi-asterisk"></i> ${model0.coteTitle }</span>
                       </div>
                       <br>
                       <div class="cote-q-description" style="margin-bottom:25px;">
                           <span class="fw-semibold fs-16 pb-1" style="display:block;">문제설명</span>
                           <span class="coteDescription">${model0.questionContent }</span>
                       </div>
                       
                       <div class="" style="margin-bottom:25px;">
                           <span class="fw-semibold fs-16 pb-1" style="display:block;">제약사항</span>
                           <span class="coteConstraints1">${model0.coteConstraints1 }</span><br>
                           <span class="coteConstraints2">${model0.coteConstraints2 }</span>
                       </div>
                       
                       <div class="" style="margin-bottom:25px;">
                           <span class="fw-semibold fs-16 pb-1" style="display:block;">입출력 예</span>
                           <span>${model0.exAnswer1 }</span><br>
                           <span>${model0.exAnswer2 }</span>
                       </div>
                    </div>
                	<!-- 왼쪽 : 설명 부분 끝 -->
                    <!-- 오른쪽 부분 -->
                    <div class="col-xl-8">
                    	<!-- 입력창 시작 -->
                        <div class="">
                          <div style="display: flex;">
	                          <select id="language1" name="language1" class="form-select" style="width: 120px; height: 40px;">
		                          <option value="">언어 선택</option>
		                          <option value="JAVA">JAVA</option>
		                          <option value="C">C</option>
		                          <option value="PYTHON">PYTHON</option>
		                          <option value="C++">C++</option>
		                          <option value="C#">C#</option>
	                          </select>
	                          <button type="button" id="autoBtn1" class="btn btn-light rounded-pill btn-wave">자동완성</button>
                          </div>
                          
                          
                          <br>
                       <span class="fs-16 fw-semibold" style="display:block;">입력창</span>
                          <div class="d-flex align-items-center flex-wrap justify-content-between gap-4 mb-3" style="    border: 1px solid #dee2e6;">
                          	<input type="hidden" value="${model0.exAnsnum1 }" id="model0ExAnsnum1">                                        
                          	<input type="hidden" value="${model0.exAnsnum2 }" id="model0ExAnsnum2">                                        
                          	    <div id="monaco1" style="width: 64%; height: 300px;">
                                <input type="hidden" value='' name="prctQuesAns" id="input1">
                                </div>
                          </div>
                        </div>
                    	<!-- 입력창 끝 -->
                    	<!-- 결과창 시작 -->
                        <div class="">
                           <span class="fs-16 fw-semibold" style="display:block;">결과창</span>
                           <input type="hidden" value="${model0.exResnum1 }" id="model0ExResnum1">                                        
                           <input type="hidden" value="${model0.exResnum2 }" id="model0ExResnum2">   
                           <div class="d-flex align-items-center flex-wrap justify-content-between gap-4 mb-3">
                               <textarea class="form-control" style="width: 1100px; height: 300px; overflow: auto;" id="output1"></textarea>
                           </div>
                        </div>
                    	<!-- 결과창 끝 -->
                    	<!-- 제출 버튼 시작 -->
                        <div style="display: flex; justify-content: right;">
                           <button id="runBtn1" class="btn btn-secondary btn-wave">RUN</button>&nbsp;&nbsp;
                           <button id="submitBtn1" class="btn btn-secondary btn-wave">제출</button>
                        </div>
                    	<!-- 제출 버튼 끝 -->
                    </div>
                    <!-- 오른쪽 부분 끝 -->
                    
                </div>
            </div>
            <!-- 1 : 문제 1번 끝  -->

            <!-- 2 : 문제 2번 시작  -->
			<input type="hidden" value="${model1.coteNo }" name="coteNo" id="coteNo2">         
            <div class="tab-pane" id="profile-tab-pane" role="tabpanel" aria-labelledby="profile-tab" tabindex="0">
                <div class="row">
                	 <!-- 왼쪽 : 설명 부분 시작 -->
                     <div class="col-xl-4" style="padding-left:10px;">
                       <div>
                           <span class="fs-18 pb-4" style="display:block;"><i class="bi bi-asterisk"></i> ${model1.coteTitle }</span>
                       </div>
                       <br>
                       <div class="cote-q-description" style="margin-bottom:25px;">
                           <span class="fw-semibold fs-16 pb-1" style="display:block;">문제설명</span>
                           <span class="coteDescription">${model1.questionContent }</span>
                       </div>
                       
                       <div class="" style="margin-bottom:25px;">
                           <span class="fw-semibold fs-16 pb-1" style="display:block;">제약사항</span>
                           <span class="coteConstraints1">${model1.coteConstraints1 }</span><br>
                           <span class="coteConstraints2">${model1.coteConstraints2 }</span>
                       </div>
                       
                       <div class="" style="margin-bottom:25px;">
                           <span class="fw-semibold fs-16 pb-1" style="display:block;">입출력 예</span>
                           <span>${model1.exAnswer1 }</span><br>
                           <span>${model1.exAnswer2 }</span>
                       </div>
                    </div>
                	<!-- 왼쪽 : 설명 부분 끝 -->
                    <!-- 오른쪽 부분  시작 -->
                    <div class="col-xl-8">
                    	<!-- 입력창 시작 -->
                        <div class="">
                        	<div style="display: flex;">
	                        	<select id="language2" name="language2" class="form-select" style="width: 120px; height: 40px;">
		                          <option value="">언어 선택</option>
		                          <option value="JAVA">JAVA</option>
		                          <option value="C">C</option>
		                          <option value="PYTHON">PYTHON</option>
		                          <option value="C++">C++</option>
		                          <option value="C#">C#</option>
	                           </select>
	                            <button type="button" id="autoBtn2" class="btn btn-light rounded-pill btn-wave">자동완성</button>
	                         </div>
                           <br>
                           <span class="fs-16 fw-semibold" style="display:block;">입력창</span>
      					   <div class="d-flex align-items-center flex-wrap justify-content-between gap-4 mb-3" style="    border: 1px solid #dee2e6;">
	                           <input type="hidden" value="${model1.exResnum1 }" id="model1ExResnum1">                                        
	                           <input type="hidden" value="${model1.exResnum2 }" id="model1ExResnum2">   
	                              <div id="monaco2" style="width: 64%; height: 300px;">
                                <input type="hidden" value='' name="prctQuesAns" id="input2">
                                </div>
      					   </div>
                        </div>      
                        <!-- 입력창 끝  -->
                        <!-- 결과창 시작 -->       
                        <div class="">
                           <span class="fs-16 fw-semibold" style="display:block;">결과창</span>
                           <input type="hidden" value="${model1.exAnsnum1 }" id="model1ExAnsnum1">                                        
                           <input type="hidden" value="${model1.exAnsnum2 }" id="model1ExAnsnum2">   
                           <div class="d-flex align-items-center flex-wrap justify-content-between gap-4 mb-3">
                            	<textarea  class="form-control" style="width: 1100px; height: 300px; overflow: auto;" id="output2"></textarea>
                           </div>
                        </div>
                        <!-- 결과창 끝 -->       
                        <div style="display: flex; justify-content: right;">
                           <button id="runBtn2" class="btn btn-secondary btn-wave">RUN</button>&nbsp;&nbsp;
                           <button id="submitBtn2" class="btn btn-secondary btn-wave">제출</button>
                        </div>
                        <!-- 결과창 끝 -->
                    </div>
                    <!-- 오른쪽 부분  끝-->
                </div>
            </div>
            <!-- 2 : 문제 2번 끝 -->
            <!-- 3 : 문제 3번 시작 -->
			<input type="hidden" value="${model2.coteNo }" name="coteNo" id="coteNo3">         
            <div class="tab-pane" id="contact-tab-pane" role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
                <div class="row">
                	<!-- 왼쪽 : 설명 부분 시작 -->
          			<div class="col-xl-4" style="padding-left:10px;">
                       <div>
                           <span class="fs-18 pb-4" style="display:block;"><i class="bi bi-asterisk"></i> ${model2.coteTitle }</span>
                       </div>
                       <br>
                       <div class="cote-q-description" style="margin-bottom:25px;">
                           <span class="fw-semibold fs-16 pb-1" style="display:block;">문제설명</span>
                           <span class="coteDescription">${model2.questionContent }</span>
                       </div>
                       
                       <div class="" style="margin-bottom:25px;">
                           <span class="fw-semibold fs-16 pb-1" style="display:block;">제약사항</span>
                           <span class="coteConstraints1">${model2.coteConstraints1 }</span><br>
                           <span class="coteConstraints2">${model2.coteConstraints2 }</span>
                       </div>
                       
                       <div class="" style="margin-bottom:25px;">
                           <span class="fw-semibold fs-16 pb-1" style="display:block;">입출력 예</span>
                           <span>${model2.exAnswer1 }</span><br>
                           <span>${model2.exAnswer2 }</span>
                       </div>
                    </div>
                	<!-- 왼쪽 : 설명 부분 끝 -->
                	
                	<!-- 오른쪽 부분 시작 -->
                    <div class="col-xl-8">
                    	<!-- 입력창 시작 -->
	                    <div class="">
	                    	<div style="display: flex;">
		                        <select id="language3" name="language3" class="form-select" style="width: 120px; height: 40px;">
		                          <option value="">언어 선택</option>
		                          <option value="JAVA">JAVA</option>
		                          <option value="C">C</option>
		                          <option value="PYTHON">PYTHON</option>
		                          <option value="C++">C++</option>
		                          <option value="C#">C#</option>
	                            </select>
	                            <button type="button" id="autoBtn3" class="btn btn-light rounded-pill btn-wave">자동완성</button>
	                          </div>  
                            <br>
                            <span class="fs-16 fw-semibold" style="display:block;">입력창</span>
                            <div class="d-flex align-items-center flex-wrap justify-content-between gap-4 mb-3" style="    border: 1px solid #dee2e6;">
                            	<input type="hidden" value="${model2.exResnum1 }" id="model2ExResnum1">                                        
                            	<input type="hidden" value="${model2.exResnum2 }" id="model2ExResnum2">  
                                  <div id="monaco3" style="width: 64%; height: 300px;">                           <input type="hidden" value='' name="prctQuesAns" id="myAns3">
                                <input type="hidden" value='' name="prctQuesAns" id="input3">
                                </div>
                            </div>
	                    </div>
	                    <!-- 입력창 끝 -->
	                    <!-- 결과창 시작 -->
                        <div class="">
                        	<span class="fs-16 fw-semibold" style="display:block;">결과창</span>
                        	<input type="hidden" value="${model2.exAnsnum1 }" id="model2ExAnsnum1">                                        
                         	<input type="hidden" value="${model2.exAnsnum2 }" id="model2ExAnsnum2">   
                         	<div class="d-flex align-items-center flex-wrap justify-content-between gap-4 mb-3">
                            	<textarea class="form-control" style="width: 1100px; height: 300px; overflow: auto;" id="output3"></textarea>
                         	</div>
                        </div>
	                    <!-- 결과창 끝 -->
	                    <!-- 제출 버튼 시작 -->
                        <div style="display: flex; justify-content: right;">
                           <button id="runBtn3" class="btn btn-secondary btn-wave">RUN</button>&nbsp;&nbsp;
                           <button id="submitBtn3" class="btn btn-secondary btn-wave">제출</button>&nbsp;&nbsp;
                           <button id="coteEndBtn" class="btn btn-danger btn-wave" style="font-size : 15px; font-weight: bold;">시험 종료</button>
                        </div>
	                    <!-- 제출 버튼 끝 -->
                    </div>
                	<!-- 오른쪽 부분 끝 -->
                </div>
            </div>
            <!-- 3 : 문제 3번 끝 -->
            
        </div>
    </div>
</div>

<script>
$(function() { 
	
    let editor1, editor2, editor3;
    function initMonacoEditor() {
//         const bootstrapLink = document.getElementById('style');
//         if (bootstrapLink) {
//             bootstrapLink.parentNode.removeChild(bootstrapLink);
//         }
        const script = document.createElement('script');
        script.src = "${pageContext.request.contextPath}/resources/monacoEditorLib/min/vs/loader.js";
        script.onload = function() {
            require.config({ paths: { vs: '/resources/monacoEditorLib/min/vs' } });
            require(['vs/editor/editor.main'], function () {
                editor1 = monaco.editor.create(document.getElementById('monaco1'), {
                    value: [$('#input1').val()].join('\n'),
                    language: 'java',
                    theme: 'vs',
                    minimap: { enabled: false },
                    fontSize: 20
                });
                editor2 = monaco.editor.create(document.getElementById('monaco2'), {
                    value: [$('#input2').val()].join('\n'),
                    language: 'java',
                    theme: 'vs',
                    minimap: { enabled: false },
                    fontSize: 20
                });
                editor3 = monaco.editor.create(document.getElementById('monaco3'), {
                    value: [$('#input3').val()].join('\n'),
                    language: 'java',
                    theme: 'vs',
                    minimap: { enabled: false },
                    fontSize: 20
                });
                
//                 const newBootstrapLink = document.createElement('link');
//                 newBootstrapLink.id = 'style';
//                 newBootstrapLink.href = "${pageContext.request.contextPath}/resources/assets/libs/bootstrap/css/bootstrap.min.css";
//                 newBootstrapLink.rel = 'stylesheet';
//                 document.head.appendChild(newBootstrapLink);
                
            });
        };
        document.body.appendChild(script);
    }
    // 부트스트랩 탭 이벤트와 함께 모나코 에디터 초기화
    $('a[data-bs-toggle="tab"]').on('shown.bs.tab', function (e) {
        initMonacoEditor();
    });
    // 페이지 로드 시 모나코 에디터 초기화
    initMonacoEditor();
	
	
	
	
	
// select JAVA 누르면 나오는 것
  const templates = {
        "JAVA": "public class Solution {\n    public static int solution(int num) {\n\n    }\n}",
        "C": "#include <stdio.h>\n\nint main() {\n    return 0;\n}",
        "PYTHON": "def main():\n\nif __name__ == \"__main__\":\n    main()",
        "C++": "#include <iostream>\n\nint main() {\n    return 0;\n}",
        "C#": "using System;\n\nclass Program {\n    static void Main(string[] args) {\n    }\n}"
    };
    function populateTemplate(selectElement, editor) {
        const language = selectElement.value;
        editor.setValue(templates[language] || "");
    }
    // Attach change event listener to each language dropdown
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
                   $('#output1').val(res);
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
                   $('#output2').val(res);
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
                   $('#output3').val(res);
               }
           });   
    });
    
 // 문제 1번 제출
    $('#submitBtn1').on('click', function(e) {
        e.preventDefault();
        console.log("문제 1번 제출...!");

        var output = editor1.getModel().getValue();
        var coteNo = $('#coteNo1').val();
        var recNtcId = $('#recNtcId').val();

        var data = {
            output: output,
            coteNo: coteNo,
            recNtcId: recNtcId
        }

        // SweetAlert2를 사용한 확인 대화상자
        Swal.fire({
            title: '문제 1번을 제출하시겠습니까?',
            text: "",
            icon: 'question',
            showCancelButton: true, // 취소 버튼 표시
            confirmButtonText: '제출하기',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                // 사용자가 '제출하기' 버튼을 클릭한 경우
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
                        Swal.fire({
                            title: '제출 완료',
                            text: '문제 1번 제출에 성공하셨습니다!',
                            icon: 'success',
                            confirmButtonText: '확인'
                        });
                    },
                    error: function(err) {
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
                    text: '문제 제출이 취소되었습니다.',
                    icon: 'info',
                    confirmButtonText: '확인'
                });
            }
        });
    });
    
    
    
 // 문제 2번 제출
    $('#submitBtn2').on('click', function(e) {
        e.preventDefault();
        var output = editor2.getModel().getValue();
        var coteNo = $('#coteNo2').val();
        var recNtcId = $('#recNtcId').val();

        var data = {
            output: output,
            coteNo: coteNo,
            recNtcId: recNtcId
        }

        // SweetAlert2를 사용한 확인 대화상자
        Swal.fire({
            title: '문제 2번을 제출하시겠습니까?',
            text: "",
            icon: 'question',
            showCancelButton: true, // 취소 버튼 표시
            confirmButtonText: '제출하기',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                // 사용자가 '제출하기' 버튼을 클릭한 경우
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
                        Swal.fire({
                            title: '제출 완료',
                            text: '문제 2번 제출에 성공하셨습니다!',
                            icon: 'success',
                            confirmButtonText: '확인'
                        });
                    },
                    error: function(err) {
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
                    text: '문제 제출이 취소되었습니다.',
                    icon: 'info',
                    confirmButtonText: '확인'
                });
            }
        });
    });
    
    
 // 문제 3번 제출
    $('#submitBtn3').on('click', function(e) {
        e.preventDefault();
        var output = editor3.getModel().getValue();
        var coteNo = $('#coteNo3').val();
        var recNtcId = $('#recNtcId').val();

        var data = {
            output: output,
            coteNo: coteNo,
            recNtcId: recNtcId
        }

        // SweetAlert2를 사용한 확인 대화상자
        Swal.fire({
            title: '문제 3번을 제출하시겠습니까?',
            text: "",
            icon: 'question',
            showCancelButton: true, // 취소 버튼 표시
            confirmButtonText: '제출하기',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                // 사용자가 '제출하기' 버튼을 클릭한 경우
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
                        Swal.fire({
                            title: '제출 완료',
                            text: '문제 3번 제출에 성공하셨습니다!',
                            icon: 'success',
                            confirmButtonText: '확인'
                        });
                    },
                    error: function(err) {
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
                    text: '문제 제출이 취소되었습니다.',
                    icon: 'info',
                    confirmButtonText: '확인'
                });
            }
        });
    });
    
 // 시험 종료 버튼
    $('#coteEndBtn').on('click', function(e) {
        e.preventDefault();

        // SweetAlert2를 사용한 확인 대화상자
        Swal.fire({
            title: '시험을 종료하시겠습니까?',
            text: "시험 종료 후에는 더 이상 문제를 제출할 수 없습니다.",
            icon: 'question',
            showCancelButton: true, // 취소 버튼 표시
            confirmButtonText: '종료하기',
            cancelButtonText: '취소'
        }).then((result) => {
            if (result.isConfirmed) {
                // 사용자가 '종료하기' 버튼을 클릭한 경우
                location.href = "/apply/main.do?tab=documentSuccess";
            } else {
                // 사용자가 '취소' 버튼을 클릭한 경우
                Swal.fire({
                    title: '취소됨',
                    text: '시험 종료가 취소되었습니다.',
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
                       "        answer = (year - age) + 2;\n" +
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
    
});
</script>



