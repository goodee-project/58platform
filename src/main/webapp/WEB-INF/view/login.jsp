<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" class="semi-dark">
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<title>login</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon" href="assets/images/favicon-32x32.png" type="image/png" />
		<!--plugins-->
		<link href="assets/plugins/vectormap/jquery-jvectormap-2.0.2.css" rel="stylesheet"/>
		<link href="assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
		<link href="assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
		<link href="assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
		<!-- Bootstrap CSS -->
		<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="assets/css/bootstrap-extended.css" rel="stylesheet" />
		<link href="assets/css/style.css" rel="stylesheet" />
		<link href="assets/css/icons.css" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
		
		<!-- loader-->
		<link href="assets/css/pace.min.css" rel="stylesheet" />
		
		 <!--Theme Styles-->
		<link href="assets/css/dark-theme.css" rel="stylesheet" />
		<link href="assets/css/light-theme.css" rel="stylesheet" />
		<link href="assets/css/semi-dark.css" rel="stylesheet" />
		<link href="assets/css/header-colors.css" rel="stylesheet" />
		<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
		<style>
			.po {
				position : relative;
				top : 180px;
			}
		</style>
	</head>
	<body class="bg-surface">
		<!--start wrapper-->
		<div class="wrapper">
			<!--start header -->
			<c:import url="/WEB-INF/inc/header.jsp"></c:import>
			<!--start sidebar -->
			<c:import url="/WEB-INF/inc/sideMenu.jsp"></c:import>  
			<!--start content-->
			<main class="authentication-content po">
				<div class="container">
					<div class="mt-4">
						<div class="card rounded-0 overflow-hidden shadow-none border mb-5 mb-lg-0">
							<div class="row g-0">
							<div class="col-12 order-1 col-xl-8 d-flex align-items-center justify-content-center border-end">
							  <img src="assets/images/error/auth-img-7.png" class="img-fluid" alt="">
							</div>
							<div class="col-12 col-xl-4 order-xl-2">
								<div class="card-body p-4 p-sm-5">
									<h5 class="card-title">Login</h5>
									<p class="card-text mb-4">안녕하세요 FTP조 Final Project입니다.</p>
									<form action="${pageContext.request.contextPath}/login" method="post" class="form-body" id="loginForm">
										<div class="row g-3">
											<div class="col-12">
											  <label for="inputEmailAddress" class="form-label">Employee Id</label>
											  <div class="ms-auto position-relative">
											    <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-arrow-return-right"></i></div>
											    <input type="text" name="employeeId" value="admin" class="form-control radius-30 ps-5" placeholder="ID를 입력해주세요." id="empId">
											    <span id="idMsg"></span>
											  </div>
											</div>
											<div class="col-12">
											  <label for="inputChoosePassword" class="form-label">Enter Password</label>
											  <div class="ms-auto position-relative">
											    <div class="position-absolute top-50 translate-middle-y search-icon px-3 password"><i class="bi bi-lock-fill"></i></div>
											    <input type="password" name="employeePw" value="1234" class="form-control radius-30 ps-5" placeholder="비밀번호를 입력해주세요." id="pwck">
											    <span id="pwMsg"></span>
											  </div>
											</div>
											<div class="col-6">
											  <div class="form-check form-switch">
											    <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
											    <label class="form-check-label" for="flexSwitchCheckChecked">Remember Me</label>
											  </div>
											</div>
											<div class="col-6 text-end">	
												<a href="authentication-forgot-password.html">Forgot Password ?</a>
											</div>
											<span class="text-danger">${msg}</span>
											<div class="col-12">
											  <div class="d-grid">
											    <button type="button" class="btn btn-primary radius-30" id="btn">Login</button>
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
		
		     <footer class="bg-white border-top p-3 text-center fixed-bottom">
		      <p class="mb-0">Copyright © 2023. Goodee GDJ58 FTP조.</p>
		    </footer>
		</div>
		<!--end wrapper-->
		
		<!-- Bootstrap bundle JS -->
		<script src="assets/js/bootstrap.bundle.min.js"></script>
		<!--plugins-->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/plugins/simplebar/js/simplebar.min.js"></script>
		<script src="assets/plugins/metismenu/js/metisMenu.min.js"></script>
		<script src="assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
		<script src="assets/js/pace.min.js"></script>
		<!--app-->
		<script src="assets/js/app.js"></script>
		
		<script>
		$(document).ready(function(){
			// 비밀번호 보이기/숨기기
		    $('.password i').on('click',function(){
		        $('#pwck').toggleClass('active');
		        if($('#pwck').hasClass('active')){
		            $(this).attr('class',"bi bi-unlock-fill")
		            $('#pwck').attr('type',"text");
		        }else{
		            $(this).attr('class',"bi bi-lock-fill")
		            $('#pwck').attr('type','password');
		        }
		    });
		    // 아이디, 비밀번호 유효성 검사
		    $('#btn').click(function() {
		    	if($('#empId').val() == '') {
		    		$('#idMsg').text('ID를 입력해주세요.');
		    	} else if($('#empId').val() != '' && $('#pwck').val() == '') {
		    		$('#pwMsg').text('비밀번호를 입력해주세요.');
		    	} else if($('#empId').val() != '' && $('#pwck').val() != '') {
		    		$('#loginForm').submit();
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
	</body>
</html>