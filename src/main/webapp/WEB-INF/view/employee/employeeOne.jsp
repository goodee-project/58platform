<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" class="semi-dark">
	<head>
		<meta charset="UTF-8">
		<title>employeeOne</title>
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
				$('#btn').click(function() {
					$('#updateForm').submit();
				});
				
				// 연락처 유효성 검사
				$('#phone').blur(function() {
					if($('#phone').val().length != 11) {
						$('#phoneMsg').text('연락처를 확인해주세요.');
					}
				});
			});
		</script>
		<style>
			.po {
				position : relative;
				top : 200px;
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
			<main class="page-content">
				<!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center">
					<div class="breadcrumb-title pe-3 text-white">MyPage</div>
				</div>
				<!--end breadcrumb-->
				<div class="profile-cover bg-dark"></div>
				<div class="row">
					<div class="col-12 col-lg-8">
						<div class="col-12 col-lg-4">
							<div class="card shadow-sm border-0 overflow-hidden">
								<div class="card-body">
									<div class="profile-avatar text-center">
									  <img src="${pageContext.request.contextPath}/assets/images/avatars/avatar-1.png" class="rounded-circle shadow" width="120" height="120" alt="">
									</div>
									<div class="text-center mt-4">
										<p class="mb-0 text-secondary">직책:${m.employeeLevel}</p>
										<h4 class="mb-1">이름:${loginEmp.employeeName}</h4>
										<p class="mb-0 text-secondary">since ${m.createdate}(입사일)</p>
										<div class="mt-4"></div>
										<h6 class="mb-1">연락처 - ${m.employeePhone}</h6>
										<p class="mb-0 text-secondary">e-mail : ${m.employeeEmail}</p>
									</div>
								</div>
							</div>
						</div>
						<div class="card shadow-sm border-0">
							<div class="card-body">
								<h5 class="mb-0">나의 정보</h5>
								<hr>
								<div class="card shadow-none border">
									<div class="card-header">
										<h6 class="mb-0">정보변경</h6>
									</div>
									<div class="card-body">
										<form action="${pageContext.request.contextPath}/employee/emp/modifyEmployeeInfo" method="post" class="row g-3" id="updateForm">
											<div class="col-6">
												<label class="form-label">phone</label>
												<input type="text" class="form-control" name="employeePhone" value="${m.employeePhone}" id="phone">
												<span id="phoneMsg"></span>
											</div>
											<div class="col-6">
												<label class="form-label">e-mail</label>
												<input type="email" class="form-control" name="employeeEmail" value="${m.employeeEmail}">
											</div>
											<div class="text-start">
												<button type="submit" class="btn btn-primary px-4">변경</button>
											</div>
										</form>
									</div>
								</div>
								<div>
									<a href="${pageContext.request.contextPath}/employee/emp/modifyEmployeePw">비밀번호수정</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			     <!--end row-->
			</main>
			<!--end page main-->
			
			<!--start overlay-->
			<div class="overlay nav-toggle-icon"></div>
			<!--end overlay-->

			<!--Start Back To Top Button-->
			<a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
			<!--End Back To Top Button-->
        
			<!--start switcher-->
			<div class="switcher-body">
			<button class="btn btn-primary btn-switcher shadow-sm" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling" aria-controls="offcanvasScrolling"><i class="bi bi-paint-bucket me-0"></i></button>
				<div class="offcanvas offcanvas-end shadow border-start-0 p-2" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1" id="offcanvasScrolling">
					<div class="offcanvas-header border-bottom">
						<h5 class="offcanvas-title" id="offcanvasScrollingLabel">Theme Customizer</h5>
						<button type="button" class="btn-close text-reset" data-bs-dismiss="offcanvas"></button>
					</div>
					<div class="offcanvas-body">
						<h6 class="mb-0">Theme Variation</h6>
						<hr>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="inlineRadioOptions" id="LightTheme" value="option1">
							<label class="form-check-label" for="LightTheme">Light</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="inlineRadioOptions" id="DarkTheme" value="option2">
							<label class="form-check-label" for="DarkTheme">Dark</label>
						</div>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="inlineRadioOptions" id="SemiDarkTheme" value="option3" checked>
							<label class="form-check-label" for="SemiDarkTheme">Semi Dark</label>
						</div>
						<hr>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="inlineRadioOptions" id="MinimalTheme" value="option3">
							<label class="form-check-label" for="MinimalTheme">Minimal Theme</label>
						</div>
						<hr/>
						<h6 class="mb-0">Header Colors</h6>
						<hr/>
						<div class="header-colors-indigators">
							<div class="row row-cols-auto g-3">
								<div class="col">
									<div class="indigator headercolor1" id="headercolor1"></div>
								</div>
								<div class="col">
									<div class="indigator headercolor2" id="headercolor2"></div>
								</div>
								<div class="col">
									<div class="indigator headercolor3" id="headercolor3"></div>
								</div>
								<div class="col">
									<div class="indigator headercolor4" id="headercolor4"></div>
								</div>
								<div class="col">
									<div class="indigator headercolor5" id="headercolor5"></div>
								</div>
								<div class="col">
									<div class="indigator headercolor6" id="headercolor6"></div>
								</div>
								<div class="col">
									<div class="indigator headercolor7" id="headercolor7"></div>
								</div>
								<div class="col">
									<div class="indigator headercolor8" id="headercolor8"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--end switcher-->
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