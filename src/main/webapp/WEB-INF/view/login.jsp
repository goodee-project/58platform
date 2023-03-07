<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
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
	</head>
	<body class="bg-surface">
		<!--start wrapper-->
		<div class="wrapper">
			<header>
			   <nav class="navbar navbar-expand-lg navbar-light bg-white rounded-0 border-bottom">
			     <div class="container">
			       <a class="navbar-brand" href="${pageContext.request.contextPath}/employee/emp/main"><img src="assets/images/brand-logo-2.png" width="140" alt=""/></a>
			       <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			         <span class="navbar-toggler-icon"></span>
			       </button>
			       <div class="collapse navbar-collapse" id="navbarSupportedContent">
			         <ul class="navbar-nav mb-2 mb-lg-0 align-items-center">
			           <li class="nav-item">
			             <a class="nav-link" href="${pageContext.request.contextPath}/employee/emp/main">Home</a>
			           </li>
			           <li class="nav-item">
			             <a class="nav-link" href="javascript:;">About</a>
			           </li>
			           <li class="nav-item dropdown">
			             <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" href="#" data-bs-toggle="dropdown">
			                Services <i class="bi bi-chevron-down align-middle ms-2"></i>
			             </a>
			             <ul class="dropdown-menu">
			               <li><a class="dropdown-item" href="#">Action</a></li>
			               <li><a class="dropdown-item" href="#">Another action</a></li>
			               <li><hr class="dropdown-divider"></li>
			               <li><a class="dropdown-item" href="#">Something else here</a></li>
			             </ul>
			           </li>
			           <li class="nav-item">
			             <a class="nav-link" href="javascript:;">Contact Us</a>
			           </li>
			         </ul>
			
			         <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
			           <li class="nav-item dropdown">
			             <a class="nav-link dropdown-toggle dropdown-toggle-nocaret" href="#" data-bs-toggle="dropdown">
			               English
			             </a>
			             <ul class="dropdown-menu">
			               <li><a class="dropdown-item" href="#">Action</a></li>
			               <li><a class="dropdown-item" href="#">Another action</a></li>
			               <li><hr class="dropdown-divider"></li>
			               <li><a class="dropdown-item" href="#">Something else here</a></li>
			             </ul>
			           </li>
			           <li class="nav-item">
			             <a class="nav-link" href="javascript:;">Support</a>
			           </li>
			         </ul>
			         <div class="d-flex ms-3 gap-3">
			           <a href="${pageContext.request.contextPath}/login" class="btn btn-primary btn-sm px-4 radius-30">Login</a>
			           <a href="${pageContext.request.contextPath}/employee/emp/addEmployee" class="btn btn-white btn-sm px-4 radius-30">Register</a>
			         </div>
			       </div>
			     </div>
			   </nav>
			</header>
		  
			<!--start content-->
			<main class="authentication-content">
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
									<form action="${pageContext.request.contextPath}/login" method="post" class="form-body">
										<div class="row g-3">
											<div class="col-12">
											  <label for="inputEmailAddress" class="form-label">Employee Id</label>
											  <div class="ms-auto position-relative">
											    <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-arrow-return-right"></i></div>
											    <input type="text" name="employeeId" value="admin" class="form-control radius-30 ps-5" placeholder="ID를 입력해주세요." id="empId">
											  </div>
											</div>
											<div class="col-12">
											  <label for="inputChoosePassword" class="form-label">Enter Password</label>
											  <div class="ms-auto position-relative">
											    <div class="position-absolute top-50 translate-middle-y search-icon px-3 password"><i class="bi bi-lock-fill"></i></div>
											    <input type="password" name="employeePw" value="1234" class="form-control radius-30 ps-5" placeholder="비밀번호를 입력해주세요." id="pwck">
											  </div>
											</div>
											<div class="col-6">
											  <div class="form-check form-switch">
											    <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" checked="">
											    <label class="form-check-label" for="flexSwitchCheckChecked">Remember Me</label>
											  </div>
											</div>
											<div class="col-6 text-end">	<a href="authentication-forgot-password.html">Forgot Password ?</a>
											</div>
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
		<script src="assets/js/pace.min.js"></script>
		<script>
		$(document).ready(function(){
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
		    
		    $('#btn').click(function() {
		    	if($('#empId').val() == '') {
		    		alert('아이디를 입력해주세요.');
		    	} else if($('#empId').val() != '' && $('#pwck').val() == '') {
		    		alert('비밀번호를 입력해주세요.');
		    	}
		    });
		});
		</script>
	</body>
</html>