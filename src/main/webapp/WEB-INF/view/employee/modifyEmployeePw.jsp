<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" class="semi-dark">
	<head>
		<meta charset="UTF-8">
		<title>modifyEmployeePw</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon" href="/58platform/assets/images/favicon-32x32.png" type="image/png" />
		<!--plugins-->
		<link href="/58platform/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
		<link href="/58platform/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
		<link href="/58platform/assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
		<link href="/58platform/assets/plugins/datatable/css/dataTables.bootstrap5.min.css" rel="stylesheet" />
		
		<!-- Bootstrap CSS -->
		<link href="/58platform/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="/58platform/assets/css/bootstrap-extended.css" rel="stylesheet" />
		<link href="/58platform/assets/css/style.css" rel="stylesheet" />
		<link href="/58platform/assets/css/icons.css" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
		
		<!-- loader-->
		<link href="/58platform/assets/css/pace.min.css" rel="stylesheet" />
		
		
		<!--Theme Styles-->
		<link href="/58platform/assets/css/dark-theme.css" rel="stylesheet" />
		<link href="/58platform/assets/css/light-theme.css" rel="stylesheet" />
		<link href="/58platform/assets/css/semi-dark.css" rel="stylesheet" />
		<link href="/58platform/assets/css/header-colors.css" rel="stylesheet" />
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function() {
				
				// 현재 비밀번호 보이기/숨기기
			    $('.oldPw i').on('click',function(){
			        $('#oldPw').toggleClass('active');
			        if($('#oldPw').hasClass('active')){
			            $(this).attr('class',"bi bi-unlock-fill")
			            $('#oldPw').attr('type',"text");
			        }else{
			            $(this).attr('class',"bi bi-lock-fill")
			            $('#oldPw').attr('type','password');
			        }
			    });
				
				
				// 새 비밀번호 보이기/숨기기
			    $('.newPw i').on('click',function(){
			        $('#newPw').toggleClass('active');
			        if($('#newPw').hasClass('active')){
			            $(this).attr('class',"bi bi-unlock-fill")
			            $('#newPw').attr('type',"text");
			        }else{
			            $(this).attr('class',"bi bi-lock-fill")
			            $('#newPw').attr('type','password');
			        }
			    });
					
				// 새 비밀번호확인 보이기/숨기기
			    $('.newPwCk i').on('click',function(){
			        $('#newPwCk').toggleClass('active');
			        if($('#newPwCk').hasClass('active')){
			            $(this).attr('class',"bi bi-unlock-fill")
			            $('#newPwCk').attr('type',"text");
			        }else{
			            $(this).attr('class',"bi bi-lock-fill")
			            $('#newPwCk').attr('type','password');
			        }
			    });
				
				// 수정버튼 눌러서 비밀번호 이력테이블에 없으면 변경 있으면 변경불가
				$('#btn').click(function(){
					$.ajax({
						url:'${pageContext.request.contextPath}/pwHistoryCk'
						, type:'get'
						, data : {id:$('#id').val(), password:$('#newPw').val()} 
						, success:function(model){ // model : 'YES' / 'NO'
							if(model=='YES') {
								// 사용가능한 비밀번호
								$('#pwForm').submit();
							} else if(model=='NO' || $('#oldPw').val() == $('#newPw').val()) {
								// pw_history에 있는 비밀번호
								alert('사용불가능한 비밀번호입니다.');
							}
						}
					});
				});
				// 유효성 검사
				// 현재 비밀번호 빈칸 검사
				$('#oldPw').blur(function() {
					if($('#oldPw').val() == '') {
						$('#oldPwMsg').text('현재 비밀번호를 입력해주세요.');
					} else if($('#oldPw').val() != '') {
						$('#oldPwMsg').text('');
					}
				});
				
				// 새 비밀번호 빈칸 검사
				$('#newPw').blur(function() {
					if($('#newPw').val() == '') {
						$('#newPwMsg').text('새 비밀번호를 입력해주세요.');
					} else if($('#newPw').val() != '') {
						$('#newPwMsg').text('');
					}
					
					// pw 빈칸 or 6자리~20자리 or 영문,숫자,특수문자 조합인지 검사 
					var password = $("#newPw").val();
					var num = password.search(/[0-9]/g);
					var eng = password.search(/[a-z]/ig);
					var spe = password.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

					if(password.length < 6 || password.length > 20) {
						$('#newPwMsg').text('6자리 ~ 20자리 이내로 입력해주세요.');
						return false;
					} else if (password.search(/\s/) != -1) {
						$('#newPwMsg').text('비밀번호는 공백 없이 입력해주세요.');
						return false;
					} else if (num < 0 || eng < 0 || spe < 0 ) {
						$('#newPwMsg').text('영문,숫자, 특수문자를 혼합하여 입력해주세요.');
						return false;
					} else {
						console.log("통과");
						return true;
					}
				});
				
				// 새 비밀번호확인 빈칸 검사
				$('#newPwCk').blur(function() {
					if($('#newPwCk').val() == '') {
						$('#newPwCkMsg').text('새 비밀번호확인을 입력해주세요.');
					} else if($('#newPwCk').val() != '') {
						$('#newPwCkMsg').text('');	
					}
				});
				
				// 새 비밀번호와 새 비밀번호 확인 검사
				$('#newPwCk').blur(function() {
					if($('#newPw').val() != $('#newPwCk').val()) {
						$('#newPwCkMsg').text('입력된 새 비밀번호와 일치하지 않습니다.');
					} else if($('#newPw').val() != $('#newPwCk').val()) {
						$('#newPwCkMsg').text('');
					}
				});
			});
			// 새로고침시 get 파라미터 제거
			$(document).keydown(function(e){
				key = (e)?e.keyCode:event.keyCode;
				//alert(key);
				if(key == 116 || (event.ctrlKey && event.keyCode == 82)) {
					history.replaceState({}, null, location.pathname);
				}
			})
		</script>
		<style>
			.po {
				position : relative;
				top : 300px;
			}
			
			.po2 {
				position : relative;
				top : 100px;
			}
		</style>
	</head>
	<body>
		<div class="wrapper">
			<!--start header -->
			<c:import url="/WEB-INF/inc/header.jsp"></c:import>
			<!--start sidebar -->
			<c:import url="/WEB-INF/inc/sideMenu.jsp"></c:import>
			<!--start content-->
			<main class="authentication-content">
				<div class="container-fluid">
					<div class="authentication-card">
						<div class="card shadow rounded-5 overflow-hidden">
							<div class="row g-0">
								<div class="col-lg-6 d-flex align-items-center justify-content-center border-end">
									<img src="https://img.freepik.com/free-vector/secure-data-concept-illustration_114360-2510.jpg?w=740&t=st=1662791352~exp=1662791952~hmac=d90f717a99823008ce52a92f59fc382488f46baa82e2bfb150908a693efadd4b" class="img-fluid" alt="">
								</div>
								<div class="col-lg-6">
									<div class="card-body p-4 p-sm-5">
										<h5 class="card-title">${loginEmp.employeeName}님의 비밀번호 변경</h5>
										<p class="card-text mb-5 text-danger">${msg}</p>
										<form class="form-body" action="${pageContext.request.contextPath}/employee/emp/modifyEmployeePw" method="post" id="pwForm">
											<input type="hidden" name="id" value="${loginEmp.employeeId}" id="id">
											<div class="row g-3">
												<div class="col-12">
													<label for="inputNewPassword" class="form-label">현재 비밀번호</label>
													<div class="ms-auto position-relative">
														<div class="position-absolute top-50 translate-middle-y search-icon px-3 oldPw"><i class="bi bi-lock-fill"></i></div>
														<input type="password" name="oldPw" id="oldPw" class="form-control radius-30 ps-5" placeholder="현재 비밀번호를 입력해주세요.">
													</div>
													<span id="oldPwMsg"></span>
												</div>
												<div class="col-12">
													<label for="inputNewPassword" class="form-label">새 비밀번호</label>
													<div class="ms-auto position-relative">
														<div class="position-absolute top-50 translate-middle-y search-icon px-3 newPw"><i class="bi bi-lock-fill"></i></div>
														<input type="password" name="newPw" id="newPw" class="form-control radius-30 ps-5" placeholder="새 비밀번호를 입력해주세요.">
													</div>
													<span id="newPwMsg"></span>
												</div>
												<div class="col-12">
													<label for="inputConfirmPassword" class="form-label">새 비밀번호 확인</label>
													<div class="ms-auto position-relative">
														<div class="position-absolute top-50 translate-middle-y search-icon px-3 newPwCk"><i class="bi bi-lock-fill"></i></div>
														<input type="password" name="newPwCk" id="newPwCk" class="form-control radius-30 ps-5" placeholder="새 비밀번호를 한번 더 입력해주세요">
													</div>
													<span id="newPwCkMsg"></span>
												</div>
												<div class="col-12">
													<div class="d-grid gap-3">
														<button type="button" class="btn btn-warning radius-30" id="btn">비밀번호 변경</button>
														<a class="btn btn-light radius-30" href="${pageContext.request.contextPath}/employee/emp/employeeOne">취소</a>
													</div>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</main>
			<!--end page main-->
		</div>
		
		<!-- Bootstrap bundle JS -->
		<script src="/58platform/assets/js/bootstrap.bundle.min.js"></script>
		<!--plugins-->
		<script src="/58platform/assets/js/jquery.min.js"></script>
		<script src="/58platform/assets/plugins/simplebar/js/simplebar.min.js"></script>
		<script src="/58platform/assets/plugins/metismenu/js/metisMenu.min.js"></script>
		<script src="/58platform/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
		<script src="/58platform/assets/js/pace.min.js"></script>
		<!--app-->
		<script src="/58platform/assets/js/app.js"></script>
	</body>
</html>