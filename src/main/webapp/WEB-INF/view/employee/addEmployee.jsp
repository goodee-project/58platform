<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<title>addEmployee</title>
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
		<script>
			$(document).ready(function() {
				
				// 비밀번호 보이기/숨기기
			    $('.pw i').on('click',function(){
			        $('#pw').toggleClass('active');
			        if($('#pw').hasClass('active')){
			            $(this).attr('class',"bi bi-unlock-fill")
			            $('#pw').attr('type',"text");
			        }else{
			            $(this).attr('class',"bi bi-lock-fill")
			            $('#pw').attr('type','password');
			        }
			    });
				
			 // 비밀번호확인 보이기/숨기기
		    $('.pwck i').on('click',function(){
		        $('#pwck').toggleClass('active');
		        if($('#pwck').hasClass('active')){
		            $(this).attr('class',"bi bi-unlock-fill")
		            $('#pwck').attr('type',"text");
		        }else{
		            $(this).attr('class',"bi bi-lock-fill")
		            $('#pwck').attr('type','password');
		        }
		    });
				
				//한글입력 안되게 처리
				$("input[name=id]").keyup(function(event){ 
					if (!(event.keyCode >=37 && event.keyCode<=40)) {
						var inputVal = $(this).val();
						$(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
					}
				});
				
				// restAPI로 아이디 중복검사
				$('#btn').click(function(){
					$.ajax({
						url:'${pageContext.request.contextPath}/employeeIdck'
						, type:'get'
						, data : {employeeId:$('#id').val()}
						, success:function(model){ // model : 'YES' / 'NO'
							if(model=='YES') {
								// 사용가능한 아이디
								$('#employeeId').val($('#id').val());
								$('#exampleModal').modal('hide');
							} else {
								// 사용중인 아이디
								alert($('#id').val()+'는 사용중인 아이디입니다.');
							}
						}
					});
				});
				
				
				
				// 유효성 검사
				
				// pw가 빈칸이면
				$('#pw').blur(function() {
					if($('#pw').val() == '') {
						$('#pwMsg').text('비밀번호를 입력해주세요.');
					} else if($('#pw').val() != '') {
						$('#pwMsg').text('');
					}
				});
				
				// pw와 pwck가 다르면
				$('#pwck').blur(function() {
					if($('#pw').val() != $('#pwck').val()) {
						$('#pwckMsg').text('비밀번호를 확인해주세요.');
					} else if($('#pw').val() == $('#pwck').val()) {
						$('#pwckMsg').text('');
					}
				});
				
			});
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
		
		<!--start wrapper-->
		<div class="wrapper">
		
		<!--start header -->
		<c:import url="/WEB-INF/inc/header.jsp"></c:import>
		<!--start sidebar -->
		<c:import url="/WEB-INF/inc/sideMenu.jsp"></c:import>    
			<!--start content-->
			<main class="authentication-content po2">
				<div class="container">
					<div class="mt-4">
						<div class="card rounded-0 overflow-hidden shadow-none bg-white border">
							<div class="row g-0">
								<div class="col-12 order-1 col-xl-8 d-flex align-items-center justify-content-center border-end">
								  <img src="/58platform/assets/images/error/auth-img-register3.png" class="img-fluid" alt="">
								</div>
								<div class="col-12 col-xl-4 order-xl-2">
									<div class="card-body p-4 p-sm-5">
										<h5 class="card-title">직원등록</h5>
										<form action="${pageContext.request.contextPath}/employee/emp/addEmployee" method="post" class="form-body">
											<div class="row g-3">
												<div class="col-12 ">
													<label for="inputName" class="form-label">ID</label>
													<div class="ms-auto position-relative">
														<div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-person-circle"></i></div>
														<!-- 아이디입력창 누르면 모달 -->
														<input type="text" class="form-control radius-30 ps-5" data-bs-toggle="modal" data-bs-target="#exampleModal" name="employeeId" id="employeeId" placeholder="ID를 입력해주세요." readonly="readonly" />
														<!-- Modal -->
														<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
															<div class="modal-dialog">
																<div class="modal-content">
																	<div class="modal-header">
																		<h5 class="modal-title" id="exampleModalLabel">ID중복검사</h5>
																		<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
																	</div>
																	<div class="modal-body" align="center">
																		ID : <input type="text" name="id" id="id" placeholder="ID를 입력해주세요.">
																	</div>
																	<div class="modal-footer">
																		<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
																		<button type="button" class="btn btn-primary" id="btn">중복확인</button>
																	</div>
																</div>
															</div>
														</div>
													</div>
													<span id="idMsg"></span>
												</div>
												<div class="col-12">
													<label for="inputChoosePassword" class="form-label">Pw</label>
													<div class="ms-auto position-relative">
														<div class="position-absolute top-50 translate-middle-y search-icon px-3 pw"><i class="bi bi-lock-fill"></i></div>
														<input type="password" name="employeePw" class="form-control radius-30 ps-5" id="pw" placeholder="비밀번호를 입력해주세요.">
													</div>
													<span id="pwMsg"></span>
												</div>
												<div class="col-12">
													<label for="inputChoosePassword" class="form-label">PwCheck</label>
													<div class="ms-auto position-relative">
														<div class="position-absolute top-50 translate-middle-y search-icon px-3 pwck"><i class="bi bi-lock-fill"></i></div>
														<input type="password" name="employeePwCk" class="form-control radius-30 ps-5" id="pwck" placeholder="비밀번호를 한번 더 입력해주세요.">
													</div>
													<span id="pwckMsg"></span>
												</div>
												<div class="col-12 ">
													<label for="inputName" class="form-label">Name</label>
													<div class="ms-auto position-relative">
														<div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-person-circle"></i></div>
														<input type="text" name="employeeName" class="form-control radius-30 ps-5" id="name" placeholder="이름을 입력해주세요.">
													</div>
												</div>
												<div class="col-12 ">
													<label for="inputName" class="form-label">Phone</label>
													<div class="ms-auto position-relative">
													<div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-telephone-fill"></i></div>
													<input type="text" name="employeePhone" class="form-control radius-30 ps-5" id="phone" placeholder="연락처를 입력해주세요.">
													</div>
												</div>
												<div class="col-12">
													<label for="inputEmailAddress" class="form-label">Email Address</label>
													<div class="ms-auto position-relative">
														<div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-envelope-fill"></i></div>
														<input type="email" name="employeeEmail" class="form-control radius-30 ps-5" id="email" placeholder="Email을 입력해주세요.">
													</div>
												</div>
												<div class="col-12">
													<div class="d-grid">
														<button type="submit" class="btn btn-primary radius-30">등록</button>
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
		<!--end wrapper-->
		
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