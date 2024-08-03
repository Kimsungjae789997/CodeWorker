<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>  
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<style>
body{
	font-size:16px;
}
.one-resume-box card-body{
	background-color : #BFC7C7;
}
.resume-info-group{
	margin-left: 10px;
	margin-top: 5px;
}
.resumeName{
	font-size:21px;
	font-weight:600;
}
.resumeDate{
	font-size:21px;
}
.resume-card-footer{
	margin-left: 10px;
	margin-right: 10px;
	vertical-align: center;
}
.resume-card-footer-title{
	font-size:18px;
	font-weight:600;
	color:gray;
}
</style>


<div style="margin-top:120px;">
    <img src="${pageContext.request.contextPath}/resources/images/resume-top-new.png" width="100%;">
</div>

<br><br>
<!-- <h5 style="font-weight: bold; color: #3561bb;">Code Worker 이력서 소개 <i class="bi bi-exclamation-circle"></i></h5> -->
<br><br>

<div class="row mb-3" style="height: 650px;" id="mainResume">
<!--     <div class="col-xxl-3 col-xl-6 col-lg-6 col-md-6" style="height: 230px; cursor: pointer;" id="addBtn">
        <div class="card border custom-card shadow-none" style="height: 230px;">
            <div class="card-body bg-primary-transparent d-flex flex-column align-items-center justify-content-center">
                <div class="mb-4 folder-svg-container text-center d-flex flex-column align-items-center">
                    <div style="width: 100px; height: 100px; border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                        <i style="font-size: 50px; color: white;" class="bi bi-subtract"></i>
                    </div>
                    <br>
                    <span>새 이력서 작성</span>
                </div>
            </div>
        </div>
    </div>
    
    <div class="col-xxl-3 col-xl-6 col-lg-6 col-md-6" style="height: 230px; cursor: pointer;">
        <div class="card border custom-card shadow-none" style="height: 230px;">
             파일 업로드
            <input type="file" id="fileInput" name="" style="display: none;">
             파일 업로드 끝
            <div class="card-body bg-primary-transparent d-flex flex-column align-items-center justify-content-center" id="uploadBtn">
                <div class="mb-4 folder-svg-container text-center d-flex flex-column align-items-center">
                    <div style="width: 100px; height: 100px; border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                        <i style="font-size: 50px; color: white;" class="bi bi-box-arrow-up"></i>
                    </div>
                    <br>
                    <h4 style="font-weight: bold;">파일 업로드</h4>  
                </div>
            </div>
        </div>
    </div> -->
    <!-- 이력서 추가하는 곳 -->
</div>


<sec:authorize access="hasRole('ROLE_SEEKER')">
    <sec:authentication property="principal.member.memName" var="memName"/>
    <sec:authentication property="principal.member.memId" var="memId"/>
    <input type="hidden" id="memName" value="${memName}">
    <input type="hidden" id="memId" value="${memId}">
</sec:authorize>

<script>
$(function(){    
	
	// 이력서 성공시 alert 메시지
	let msg = "${msg}";
	
	if (msg === "success"){
        Swal.fire({
            title: "수정 성공",
             text: "이력서 수정에 성공하였습니다.",
             icon: "success",
             confirmButtonText: "확인"
         });
	}

	if (msg === "insert-success"){
        Swal.fire({
            title: "등록 성공",
             text: "이력서 등록 성공하였습니다.",
             icon: "success",
             confirmButtonText: "확인"
         });
	}
	
    // 파일업로드 클릭
    $(document).on('click','#uploadBtn', function(){
        $('#fileInput').click();
    });
    
    // 새 이력서 추가
    $(document).on('click', '#addBtn', function(){
        var memName = $('#memName').val();
        var memId = $('#memId').val();

        // 이력서 목록을 먼저 가져와서 갯수를 셉니다.
        var data = {
            memId: memId
        };

        $.ajax({
            url: "/resume/getResumes",
            type: "post",
            data: JSON.stringify(data),
            contentType: "application/json;charset=utf-8",
            beforeSend: function (xhr) {
                xhr.setRequestHeader(header, token);
            },
            success: function (res) {
                // 기존 이력서 갯수를 가져와서 +1 한 값을 새 이력서 이름에 추가합니다.
                var resumeCount = res.length;
                var newResumeName = memName + (resumeCount + 1);

                var newData = {
                    memName: newResumeName,
                    memId: memId
                };

                // 새 이력서를 추가하는 AJAX 호출
                $.ajax({
                    url: "/resume/resumeAdd",
                    type: "post",
                    data: JSON.stringify(newData),
                    contentType: "application/json;charset=utf-8",
                    beforeSend: function (xhr) {
                        xhr.setRequestHeader(header, token);
                    },
                    success: function (res) {
                    	console.log(res);
                        location.href = "/resumeForm/form?resumeNo="+res.resumeNo;
                    }
                }); // 새 이력서 추가 AJAX 끝
            }
        }); // 기존 이력서 목록 가져오기 AJAX 끝
    }); // 새 이력서 추가 끝
    
    // 파일 업로드
    $(document).on('change', '#fileInput', function(event){
    	var files = event.target.files;
    	var file = files[0];
        var memId = $('#memId').val();
        
        if (file) {
            var formData = new FormData();
            formData.append('file', file);
            formData.append('memId', memId);
            
            $.ajax({
                url: '/resume/uploadFile', 
                type: 'post',
                data: formData,
                processData: false,
                contentType: false,
                beforeSend: function (xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success: function (res) {
                    console.log(res);
					location.reload();
                }
            });// ajax 끝
        }
    });// 파일 업로드 끝
    
    
    // 페이지 로드 시 서버에서 이력서 목록 가져오기
    var memId = $('#memId').val();
    var data = {
        memId: memId
    };
    
    $.ajax({
        url: "/resume/getResumes",
        type: "post",
        data: JSON.stringify(data),
        contentType: "application/json;charset=utf-8",
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (res) {
            console.log(res);
            var html = "";
                
            html += '<div class="col-xxl-3 col-xl-6 col-lg-6 col-md-6" style="height: 230px; cursor: pointer;" id="addBtn">';
            html += '    <div class="card shadow-none one-resume-box" style="background-color: #FEFBEC; height: 230px;">';
            html += '        <div class="card-body d-flex flex-column align-items-center justify-content-center">';
            html += '            <div class="mb-4 folder-svg-container text-center d-flex flex-column align-items-center">';
            html += '                <div style="width: 100px; height: 100px; border-radius: 50%; background-color: #DC782F; display: flex; align-items: center; justify-content: center;">';
            html += '                    <i style="font-size: 42px; color: white;" class="bi bi-subtract"></i>';
            html += '                </div>';
            html += '                <br>';
            html += '                <span style="font-color:black; font-size:21px; font-weight:600;">새 이력서 작성</span>';
            html += '            </div>';
            html += '        </div>';
            html += '    </div>';
            html += '</div>';

            html += '<div class="col-xxl-3 col-xl-6 col-lg-6 col-md-6" style="height: 230px; cursor: pointer;">';
            html += '    <div class="card shadow-none one-resume-box" style="background-color: #FEFBEC;  height: 230px;">';
            html += '        <input type="file" id="fileInput" name="" style="display: none;">';
            html += '        <div class="card-body d-flex flex-column align-items-center justify-content-center" id="uploadBtn">';
            html += '            <div class="mb-4 folder-svg-container text-center d-flex flex-column align-items-center">';
            html += '                <div style="width: 100px; height: 100px; border-radius: 50%; background-color: #DC782F; display: flex; align-items: center; justify-content: center;">';
            html += '                    <i style="font-size: 42px; color: white;" class="bi bi-box-arrow-up"></i>';
            html += '                </div>';
            html += '                <br>';
            html += '                <span style="font-color: black; font-size:21px; font-weight:600;">파일 업로드</span>';
            html += '            </div>';
            html += '        </div>';
            html += '    </div>';
            html += '</div>';

	            $.each(res, function(i, v) {
	            	if(v.fileYn == 'Y'){
		                html += '<div class="col-xxl-3 col-xl-6 col-lg-6 col-md-6" style="height: 230px;">';
		                html += '<div class="card shadow-none one-resume-box" style="background-color: #FEFBEC; height: 230px; cursor: pointer;">';
		                html += '<div class="card-body" style="display:flex; flex-direction: column; justify-content: space-between;">';
		                html += '<div class="mb-4 folder-svg-container resume-info-group">';
		                html += '<input type="hidden" id="resumeNo-' + v.resumeNo + '" data-resumeNo="' + v.resumeNo + '" value="' + v.resumeNo + '">';
		                html += '<div class="resumeName" id="resumeName-' + v.resumeNo + '">' + v.resumeName + '</div>';
		                html += '<div  onclick="download('+ v.fileNo +')">'
		                html += '<div class="resumeDate">' + v.resumeRegDate + '</div>';
		                html += '</div></div>';
		                html += '<div>';
		                html += '<div class="dropdown">';
		                html += '<div class="resume-card-footer" style="display: flex; justify-content: space-between;">';
		                html += '<span class="resume-card-footer-title">첨부 완료</span>';
		                html += '<button class="btn btn-danger-light btn-wave" type="button" data-bs-toggle="dropdown" aria-expanded="false">';
		                html += '<i class="ri-more-2-fill"></i>';
		                html += '</button>';
		                html += '<ul class="dropdown-menu">';
		                html += '<li><a class="dropdown-item resumeNameUpdate" href="javascript:void(0);" data-resumeNo="' + v.resumeNo + '">이력서 이름 변경</a></li>';
		                html += '<li onclick="download('+ v.fileNo +')"><a class="dropdown-item resumedown"  >이력서 다운</a></li>';
		                html += '<li><a class="dropdown-item resumeDelete" href="javascript:void(0);" data-resumeNo="' + v.resumeNo + '">이력서 삭제</a></li>';
		                html += '</ul>';
		                html += '</div>';
		                html += '</div>';
		                html += '</div>';
		                html += '</div>';
		                html += '</div>';
		                html += '</div>';
	            	}else{
		                html += '<div class="col-xxl-3 col-xl-6 col-lg-6 col-md-6" style="height: 230px;">';
		                html += '<div class="card shadow-none one-resume-box" style="background-color: #FEFBEC; height: 230px; cursor: pointer;">';
		                html += '<div class="card-body" style="display:flex; flex-direction: column; justify-content: space-between;">';
		                html += '<div class="mb-4 folder-svg-container resume-info-group" >';
		                html += '<input type="hidden" id="resumeNo-' + v.resumeNo + '" data-resumeNo="' + v.resumeNo + '" value="' + v.resumeNo + '">';
		                if (v.resumeYn === 'Y') {
		                    html += '<div class="badge bg-primary-transparent">기본 이력서</div>';
		                }
		                html += '<div class="resumeName" id="resumeName-' + v.resumeNo + '">' + v.resumeName + '</div>';
		                html += '<div onclick="location.href=\'/resume/detail?resumeNo=' + v.resumeNo + '\'">'
		                html += '<div class="resumeDate">' + v.resumeRegDate + '</div>';
		                html += '</div></div>';
		                html += '<div>';
		                html += '<div class="dropdown">';
		                html += '<div class="resume-card-footer" style="display: flex; justify-content: space-between;">';
		                html += '<span class="resume-card-footer-title">' + v.resumeWriteYn + '</span>';
		                html += '<button class="btn btn-danger-light btn-wave" type="button" data-bs-toggle="dropdown" aria-expanded="false">';
		                html += '<i class="ri-more-2-fill"></i>';
		                html += '</button>';
		                html += '<ul class="dropdown-menu">';
		                html += '<li><a class="dropdown-item resumeNameUpdate" href="javascript:void(0);" data-resumeNo="' + v.resumeNo + '">이력서 이름 변경</a></li>';
		                html += '<li><a class="dropdown-item resumedown" href="javascript:void(0);" data-resumeNo="' + v.resumeNo + '">이력서 다운</a></li>';
		                html += '<li><a class="dropdown-item resumeDelete" href="javascript:void(0);" data-resumeNo="' + v.resumeNo + '">이력서 삭제</a></li>';
		                html += '</ul>';
		                html += '</div>';
		                html += '</div>';
		                html += '</div>';
		                html += '</div>';
		                html += '</div>';
		                html += '</div>';
	            	}

	            });  
            
                
            $('#mainResume').html(html);
        } // success 끝
    }); // ajax 끝
    
    // 이력서 이름 변경
    $(document).on('click', '.resumeNameUpdate', function() {
        var resumeNo = $(this).data('resumeno');
        var resumeNameElement = $('#resumeName-' + resumeNo);
        var resumeName = resumeNameElement.text();
        resumeNameElement.replaceWith('<textarea id="resumeName-' + resumeNo + '" haserror="0" style="border:none; font-size:24px; width:215px;">' + resumeName + '</textarea>');
    });
    
    // 엔터키를 누르면 이력서 이름 업데이트
    $(document).on('keypress', 'textarea[id^="resumeName-"]', function(e) {
        if (e.which == 13) { // 엔터키 코드
            e.preventDefault();
            var resumeNo = $(this).attr('id').split('-')[1];
            var resumeName = $(this).val();

            var data = {
                resumeNo: parseInt(resumeNo),
                resumeName: resumeName
            };

            $.ajax({
                url: "/resume/resumeNameUpdate",
                type: "post",
                data: JSON.stringify(data),
                contentType: "application/json;charset=utf-8",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader(header, token);
                },
                success: function(res) {
                    console.log(res);
                    var resumeNameTextarea = $('#resumeName-' + resumeNo);
                    resumeNameTextarea.replaceWith('<p class="resumeName" id="resumeName-' + res.resumeNo + '" style="font-weight:bold;">' + res.resumeName + '</p>');
                }
            }); // ajax 끝
        }
    }); // 엔터키 누르기 끝
    

	// 이력서 삭제
	$(document).on('click', '.resumeDelete', function(){
	    var resumeNo = $(this).data('resumeno');
	    
	    var data = {
	        resumeNo: resumeNo
	    };
	    
	    // SweetAlert2를 사용한 확인 대화상자
	    Swal.fire({
	        title: '이력서를 삭제하시겠습니까?',
	        text: "이 작업은 되돌릴 수 없습니다.",
	        icon: 'question',
	        showCancelButton: true, // 취소 버튼 표시
	        confirmButtonText: '삭제',
	        cancelButtonText: '취소'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            // 사용자가 '삭제' 버튼을 클릭한 경우
	            $.ajax({
	                url: "/resume/resumeDelete",
	                type: "post",
	                data: JSON.stringify(data),
	                contentType: "application/json;charset=utf-8",
	                beforeSend: function(xhr) {
	                    xhr.setRequestHeader(header, token);
	                },
	                success: function(res) {
	                    console.log(res);
	                    Swal.fire({
	                        title: '삭제 완료',
	                        text: '이력서가 성공적으로 삭제되었습니다.',
	                        icon: 'success',
	                        confirmButtonText: '확인'
	                    }).then(() => {
	                        location.reload();
	                    });
	                },
	                error: function(err) {
	                    Swal.fire({
	                        title: '오류 발생!',
	                        text: '이력서 삭제 중 오류가 발생했습니다.',
	                        icon: 'error',
	                        confirmButtonText: '확인'
	                    });
	                }
	            });
	        } else {
	            // 사용자가 '취소' 버튼을 클릭한 경우
	            Swal.fire({
	                title: '취소됨',
	                text: '삭제 작업이 취소되었습니다.',
	                icon: 'info',
	                confirmButtonText: '확인'
	            });
	        }
	    });
	});// 이력서 삭제 끝
}); // function({}) 끝

// 파일 이력서 다운로드 클릭
/* function download(fileNo){
	var fileNo = fileNo;
	console.log(fileNo);

	var data = {
		fileNo : fileNo
	}
	
	$.ajax({
		url :"/resume/download",
		  type: "post",
          data: JSON.stringify(data),
          contentType: "application/json;charset=utf-8",
          beforeSend: function(xhr) {
              xhr.setRequestHeader(header, token);
          },
          success : function(res){
              console.log(res);
              var blob = new Blob([res], { type: 'application/octet-stream' });
              var url = window.URL.createObjectURL(blob);
              var a = document.createElement('a');
              a.href = url;
              a.download = 'filename.extension'; 
              document.body.appendChild(a);
              a.click();
              window.URL.revokeObjectURL(url);
          }
	});
} */

//파일 이력서 다운로드 클릭
function download(fileNo) {
	console.log(fileNo);
    location.href = '/resume/download?fileNo=' + fileNo;
}

</script>