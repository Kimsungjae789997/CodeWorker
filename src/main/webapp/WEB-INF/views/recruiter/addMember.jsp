<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!--APP-CONTENT START-->
<div class="main-content app-content">
	
	<div class="container-fluid">
		<div class="container-lg">
		
			<!-- 페이지 제목 시작 -->
			<div class="d-md-flex d-block align-items-center justify-content-between my-4 page-header-breadcrumb">
				<h1 class="page-title fw-semibold fs-21 mb-0">멤버 관리</h1>
			</div>
			<!-- 페이지 제목 끝 -->
			<!-- 멤버 추가 card 시작 -->
			<div class="card custom-card">
				<div class="card-header">
					<div class="card-title"><font>멤버 추가</font></div>
					<button type="button" id="autoBtn1" class="btn btn-light btn-wave">자동 완성</button>
				</div>
				<div class="card-body">
					<form action="/corpMgmt/addMember" method="post" id="addMemberForm" class="row g-3 mt-0">
						<div class="col-md-4">
							<label for="addId" class="form-label">아이디</label> <input
								type="text" class="form-control" id="addId" name="memId"
								placeholder="Code Worker ID" aria-label="userId">
							<div id="idCheckResult"></div>
						</div>
						<div class="col-md-4">
							<label for="addName" class="form-label">이름</label> <input
								type="text" class="form-control" id="addName" name="memName"
								placeholder="이름 입력" aria-label="userName">
						</div>                     
						<div class="col-md-4">
							<label for="addPass" class="form-label">비밀번호</label> <input
								type="password" class="form-control" id="addPass" name="memPw"
								placeholder="비밀번호 입력">
						</div>
						<div class="col-md-4">
							<label for="recruiterEmail" class="form-label">이메일주소</label> <input
								type="email" class="form-control" id="recruiterEmail"
								name="recruitVO.rcrtEmail" placeholder="이메일 주소 입력">
						</div>
						<div class="col-md-4">
							<label for="recruiterPhone" class="form-label">휴대폰번호</label> <input
								type="text" class="form-control" id="recruiterPhone"
								name="recruitVO.rcrtTel" placeholder="010-0000-0000">
						</div>
						<div class="col-md-4">
							<label for="recruiterDept" class="form-label">부서/직책</label> <input
								type="text" class="form-control" id="recruiterDept"
								name="recruitVO.rcrtPosition" placeholder="부서/직책 입력">
						</div>
						<div class="col-12 d-flex justify-content-end">
							<input type="button" class="btn btn-success-light btn-wave"
								value="계정 생성" id="addMemberBtn">
						</div>
						<sec:csrfInput />
					</form>
				</div>
				<div class="card-footer d-none border-top-0"></div>
			</div>
			<!-- 멤버 추가 card 끝 -->
		</div>
	</div>	

	<div class="container-fluid">
		<div class="container-lg">
			<div class="card custom-card overflow-hidden">
					<div class="card-header justify-content-between">
						<div class="card-title">
							<font>멤버 목록</font>
						</div>
						<div class="card-tools">
						<!-- 검색/페이징 시작 -->
						<form class="input-group input-group-sm" id="searchForm"
							style="width: 440px;">
							<input type="hidden" name="page" id="page" />
							<sec:csrfInput />
						</form>
						<!-- 검색/페이징 끝 -->
						</div>
					</div>
					<div class="card-body p-0">
						<div class="table-responsive">
							<table class="table table-hover text-nowrap">
								<thead>
									<tr>
										<th scope="col">번호</th>
										<th scope="col">이름</th>
										<th scope="col">부서/직책</th>
										<th scope="col">아이디</th>
										<th scope="col">휴대폰번호</th>
										<th scope="col">이메일주소</th>
										<th scope="col">계정생성일</th>
										<th scope="col">계정관리</th>
									</tr>
								</thead>
								<tbody>
									<c:set value="${pagingVO.dataList }" var="memberList"></c:set>
									<c:choose>
										<c:when test="${empty memberList }">
											<tr>
												<td colspan="7"><div style="text-align: center;">가입된
														멤버가 없습니다.</div></td>
											</tr>
										</c:when>
										<c:otherwise>
											<c:forEach items="${memberList }" var="member">
												<tr>
													<td>${member.rnum }</td>
													<td>
														<div class="d-flex align-items-center">
															<a href="#" class="fw-semibold mb-0">${member.memName }</a>
														</div>
													</td>
													<td>${member.recruitVO.rcrtPosition }</td>
													<td>${member.memId }</td>
													<td>${member.recruitVO.rcrtTel }</td>
													<td>${member.recruitVO.rcrtEmail }</td>
													<td>${member.recruitVO.rcrtJoinDate }</td>
													<td>
														<button type="button" class="btn btn-danger-light btn-wave" id="memDelBtn"
														data-memid="${member.memId}">삭제</button>
													</td>
												</tr>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<!-- 삭제를 위한 form -->
							<form action="/corpMgmt/delMember" method="post" id="delForm">
								<input type="hidden" name="memId" value="${member.memId }" />
								<sec:csrfInput />
							</form>
							<!-- 삭제를 위한 form 끝 -->
						</div>
					</div>
					<div class="card-footer border-top-0">
						<div class="d-flex align-items-center flex-wrap overflow-auto">
							<%-- <div class="mb-2 mb-sm-0">
								Showing <b>${pagingVO.startRow}</b> to <b>${pagingVO.endRow}</b>
								of <b>${pagingVO.totalRecord}</b> entries 
								<i class="bi bi-arrow-right ms-2 fw-semibold"></i>
							</div> --%>
							<div class="mb-2 mb-sm-0 ms-auto" id="pagingArea">${pagingVO.pagingHTML }</div>
						</div>
					</div>
				</div>
		</div>
		<!-- End:: row-6 -->
	</div>
<!--APP-CONTENT CLOSE-->
</div>

<script>
$(function() {
	
	let msg = "${msg}"
	
	if (msg === "mem-insert-success"){
        Swal.fire({
            title: "계정 생성 성공",
             text: "멤버 계정 생성에 성공하였습니다.",
             icon: "success",
             confirmButtonText: "확인"
         });
	}
	
	if (msg === "mem-del-success"){
        Swal.fire({
            title: "계정 삭제 성공",
             text: "멤버 계정 삭제에 성공하였습니다.",
             icon: "success",
             confirmButtonText: "확인"
         });
	}
	
	
	let memDelBtn = $("#memDelBtn");
	let delForm = $("#delForm");

	memDelBtn.on("click", function() {
	    let memId = $(this).data("memid");

	    Swal.fire({
	        title: '삭제 확인',
	        text: "정말로 삭제하시겠습니까?",
	        icon: 'question',
	        showCancelButton: true, // 취소 버튼 표시
	        confirmButtonText: '삭제',
	        cancelButtonText: '취소'
	    }).then((result) => {
	        if (result.isConfirmed) {
	            delForm.find("input[name='memId']").val(memId);
	            delForm.submit();
	        } else {
	            Swal.fire({
	                title: '취소됨',
	                text: '삭제 작업이 취소되었습니다.',
	                icon: 'info',
	                confirmButtonText: '확인'
	            });
	        }
	    });
	});

	$(document).on('click', '.page-link', function(e) {
		e.preventDefault();
		var page = $(this).data('page');
		$('#page').val(page);
		$('#searchForm').submit();
	});

	// 중복 체크
	var addId = $("#addId");
	var idCheckFlag = false;

	addId.on('keyup', function() {
		var id = $('#addId').val(); // 아이디 입력 값
		var idPattern = /^[a-zA-Z0-9!@#$%^&*]{4,20}$/; // 아이디 정규식
		if (!idPattern.test(id)) {
			$('#idCheckResult').html("영대소문자 4-20자리를 올바르게 입력하세요").css(
					"color", "red");
		} else {
			var data = {
				memId : id
			};
			$.ajax({
				url : "/corpMgmt/idCheck.do",
				type : "post",
				data : JSON.stringify(data),
				beforeSend : function(xhr) { // 데이터 전송 전, 헤더에 csrf 값 설정
					xhr.setRequestHeader(header, token);
				},
				contentType : "application/json;charset=utf-8",
				success : function(res) {
					//alert(res);
					if (res == "NOTEXIST") {
						$('#idCheckResult').html("사용 가능한 아이디입니다!").css(
								'color', 'blue');
						idCheckFlag = true;
					} else {
						$("#idCheckResult").html("이미 사용중인 아이디입니다!").css(
								"color", "red");
						idCheckFlag = false;
					}
				}
			});
		}
	});

	var addMemberBtn = $("#addMemberBtn");
	var addMemberForm = $("#addMemberForm");

	addMemberBtn.on("click", function() {
		let addId = $("#addId").val();
		let addName = $("#addName").val();
		let addPass = $("#addPass").val();
		let recruiterEmail = $("#recruiterEmail").val();
		let recruiterPhone = $("#recruiterPhone").val();
		let recruiterDept = $("#recruiterDept").val();

		let emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

		if (addName == null || addName == "") {
			alert("이름을 입력해주세요!");
			return false;
		}

		if (addPass == null || addPass == "") {
			alert("비밀번호를 올바르게 입력해주세요!");
			return false;
		}

		if (recruiterEmail == null || recruiterEmail == ""
				|| !emailPattern.test(recruiterEmail)) {
			alert("이메일주소를 올바르게 입력해주세요!");
			return false;
		}

		if (recruiterPhone == null || recruiterPhone == "") {
			alert("휴대폰번호를 올바르게 입력해주세요! ('-'빼고 숫자만 입력, 10~11자리)");
			return false;
		}

		if (idCheckFlag) {
			addMemberForm.submit();

		} else {
			alert("계정 추가 실패! 다시 확인해보세요");
			$("#addId").focus();
		}

	});


	$('#autoBtn1').on('click',function(){
		$('#addName').val("김대덕");
		$('#addPass').val(1234);
		$('#recruiterEmail').val("elmo987789@naver.com");
		$('#recruiterPhone').val("010-4440-8450");
		$('#recruiterDept').val("개발6팀");
	});
	
});
</script>