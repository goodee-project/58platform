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
				$('#ckBtn').click(function(){
					$.ajax({
						url:'${pageContext.request.contextPath}/employeeIdck'
						, type:'get'
						, data : {employeeId:$('#id').val()}
						, success:function(model){ // model : 'YES' / 'NO'
							if(model=='YES') {
								// 사용가능한 아이디
								$('#employeeId').val($('#id').val());
							} else {
								// 사용중인 아이디
								alert($('#id').val()+'는 사용중인 아이디입니다.');
							}
						}
					});
				});
			});
		</script>
	</head>
	<body class="bg-surface">

  <!--start wrapper-->
  <div class="wrapper">

       <header>
          <nav class="navbar navbar-expand-lg navbar-light bg-white rounded-0 border-bottom">
            <div class="container">
              <a class="navbar-brand" href="#"><img src="${pageContext.request.contextPath}/assets/images/brand-logo-2.png" width="140" alt=""/></a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mb-2 mb-lg-0 align-items-center">
                  <li class="nav-item">
                    <a class="nav-link" href="#">Home</a>
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
                  <a href="authentication-signin-with-header-footer.html" class="btn btn-white btn-sm px-4 radius-30">Login</a>
                  <a href="authentication-signup-with-header-footer.html" class="btn btn-primary btn-sm px-4 radius-30">Register</a>
                </div>
              </div>
            </div>
          </nav>
       </header>
    
       <!--start content-->
       <main class="authentication-content">
        <div class="container">
          <div class="mt-4">
            <div class="card rounded-0 overflow-hidden shadow-none bg-white border">
              <div class="row g-0">
                <div class="col-12 order-1 col-xl-8 d-flex align-items-center justify-content-center border-end">
                  <img src="${pageContext.request.contextPath}/assets/images/error/auth-img-register3.png" class="img-fluid" alt="">
                </div>
                <div class="col-12 col-xl-4 order-xl-2">
                  <div class="card-body p-4 p-sm-5">
                    <h5 class="card-title">Sign Up</h5>
                    <p class="card-text mb-4">See your growth and get consulting support!</p>
                     <form class="form-body">
                      
                        <div class="row g-3">
                          <div class="col-12 ">
                            <label for="inputName" class="form-label">ID</label>
                            <div class="ms-auto position-relative">
                              <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-person-circle"></i></div>
                              	<input type="email" class="form-control radius-30 ps-5" id="inputName" placeholder="Enter Id">
                            </div>
                          </div>
                          <div class="col-12">
                            <label for="inputEmailAddress" class="form-label">Email Address</label>
                            <div class="ms-auto position-relative">
                              <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-envelope-fill"></i></div>
                              <input type="email" class="form-control radius-30 ps-5" id="inputEmailAddress" placeholder="Email">
                            </div>
                          </div>
                          <div class="col-12">
                            <label for="inputChoosePassword" class="form-label">Enter Password</label>
                            <div class="ms-auto position-relative">
                              <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-lock-fill"></i></div>
                              <input type="password" class="form-control radius-30 ps-5" id="inputChoosePassword" placeholder="Password">
                            </div>
                          </div>
                          <div class="col-12">
                            <label for="inputChoosePassword" class="form-label">Enter Password</label>
                            <div class="ms-auto position-relative">
                              <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-lock-fill"></i></div>
                              <input type="password" class="form-control radius-30 ps-5" id="inputChoosePassword" placeholder="Password">
                            </div>
                          </div>
                          <div class="col-12">
                            <label for="inputChoosePassword" class="form-label">Enter Password</label>
                            <div class="ms-auto position-relative">
                              <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-lock-fill"></i></div>
                              <input type="password" class="form-control radius-30 ps-5" id="inputChoosePassword" placeholder="Password">
                            </div>
                          </div>
                          <div class="col-12">
                            <label for="inputChoosePassword" class="form-label">Enter Password</label>
                            <div class="ms-auto position-relative">
                              <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-lock-fill"></i></div>
                              <input type="password" class="form-control radius-30 ps-5" id="inputChoosePassword" placeholder="Password">
                            </div>
                          </div>
                          <div class="col-12">
                            <div class="d-grid">
                              <button type="submit" class="btn btn-primary radius-30">Sign Up</button>
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

       <footer class="bg-white border-top p-3 text-center">
        <p class="mb-0">Copyright © 2021. All right reserved.</p>
      </footer>

  </div>
  <!--end wrapper-->


  <!-- Bootstrap bundle JS -->
  <script src="assets/js/bootstrap.bundle.min.js"></script>

  <!--plugins-->
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/pace.min.js"></script>
		<h1>직원등록</h1>
		<div>
			<input type="text" id="id">
			<button type="button" id="ckBtn">중복검사</button>
		</div>
		<form action="${pageContext.request.contextPath}/employee/emp/addEmployee" method="post">
			<input type="hidden" name="employeeLevel" value="사원">
			<table>
				<tr>
					<td>ID</td>
					<td>
						<input type="text" name="employeeId" id="employeeId" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>Pw</td>
					<td>
						<input type="password" name="employeePw">
					</td>
				</tr>
				<tr>
					<td>PwCheck</td>
					<td>
						<input type="password" name="employeePwCk">
					</td>
				</tr>
				<tr>
					<td>Name</td>
					<td>
						<input type="text" name="employeeName">
					</td>
				</tr>
				<tr>
					<td>Phone</td>
					<td>
						<input type="text" name="employeePhone">
					</td>
				</tr>
				<tr>
					<td>Email</td>
					<td>
						<input type="text" name="employeeEmail">
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">등록</button>
			</div>
		</form>
	</body>
</html>