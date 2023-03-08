<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en" class="semi-dark">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
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

  <title>Snacked - Bootstrap 5 Admin Template</title>
</head>

<body>
	

  <!--start wrapper-->
  <div class="wrapper">
       <!--start content-->
          <main class="">
          	<div class="card bg-purple text-center" style="color:white;font-size:40px">
          		구디아카데미 58기 파이널 프로젝트
          	</div>
             <div class="row row-cols-1 row-cols-lg-3 g-4">
               <div class="col">
                  <div class="card rounded-4">
                    <div class="card-body">
                       <div class="text-center">
                          <i class="bi bi-laptop-fill" style="font-size:130px"></i>
                       </div>
                      <div class="text-center">
                      	<form action="${pageContext.request.contextPath}/login" method="post">
                            <div class="ms-auto position-relative">
                              <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-person-fill"></i></div>
                              <input type="text" class="form-control radius-30 ps-5" id="inputEmailAddress" name="employeeId" placeholder="Enter ID">
                            </div>
                            <br>
                            <div class="ms-auto position-relative">
                              <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-lock-fill"></i></div>
                              <input type="password" class="form-control radius-30 ps-5" id="inputChoosePassword" name="employeePw" placeholder="Enter Password">
                            </div>
                            <br>
                            <button type="submit" class="btn btn-primary radius-30">플랫폼 직원 로그인</button>
                      	</form>
                      </div>
                    </div>
                  </div>
               </div>
               <div class="col">
                  <div class="card rounded-4">
                    <div class="card-body">
                       <div class="text-center">
                          <i class="bi bi-person-circle fa-4x" style="font-size:130px"></i>
                       </div>
                      <div class="text-center">
                      	<form action="http://3.38.82.69/58/58booking_c/log/loginCustomer" method="post">
                            <div class="ms-auto position-relative">
                              <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-person-fill"></i></div>
                              <input type="text" class="form-control radius-30 ps-5" id="inputEmailAddress" name="customerId" placeholder="Enter ID">
                            </div>
                            <br>
                            <div class="ms-auto position-relative">
                              <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-lock-fill"></i></div>
                              <input type="password" class="form-control radius-30 ps-5" id="inputChoosePassword" name="customerPw" placeholder="Enter Password">
                            </div>
                            <br>
                            <button type="submit" class="btn btn-primary radius-30">예약 고객 로그인</button>
                      	</form>
                      </div>
                    </div>
                  </div>
               </div>
               <div class="col">
                  <div class="card rounded-4">
                    <div class="card-body">
                       <div class="text-center">
                          <i class="bi bi-calendar-date fa-4x" style="font-size:130px"></i>
                       </div>
                      <div class="text-center">
                      	<form action="http://3.38.82.69/58/58booking_b/beforeLoin/loginCompany" method="post">
                            <div class="ms-auto position-relative">
                              <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-person-fill"></i></div>
                              <input type="email" class="form-control radius-30 ps-5" id="inputEmailAddress" name="companyId" placeholder="Enter ID">
                            </div>
                            <br>
                            <div class="ms-auto position-relative">
                              <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-lock-fill"></i></div>
                              <input type="password" class="form-control radius-30 ps-5" id="inputChoosePassword" name="companyPw" placeholder="Enter Password">
                            </div>
                            <br>
                            <button type="submit" class="btn btn-primary radius-30">예약 업체 로그인</button>
                      	</form>
                      </div>
                    </div>
                  </div>
               </div>
               <div class="col">
                  <div class="card rounded-4">
                    <div class="card-body">
                       <div class="text-center">
                          <i class="bi bi-person-circle fa-4x" style="font-size:130px"></i>
                       </div>
                      <div class="text-center">
                      	<form action="http://3.38.82.69/58/58shopping_c/login" method="post">
                            <div class="ms-auto position-relative">
                              <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-person-fill"></i></div>
                              <input type="email" class="form-control radius-30 ps-5" id="inputEmailAddress" name="customerId" placeholder="Enter ID">
                            </div>
                            <br>
                            <div class="ms-auto position-relative">
                              <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-lock-fill"></i></div>
                              <input type="password" class="form-control radius-30 ps-5" id="inputChoosePassword" name="customerPw" placeholder="Enter Password">
                            </div>
                            <br>
                            <button type="submit" class="btn btn-primary radius-30">쇼핑몰 고객 로그인</button>
                      	</form>
                      </div>
                    </div>
                  </div>
               </div>
               <div class="col">
                  <div class="card rounded-4">
                    <div class="card-body">
                       <div class="text-center">
                          <i class="bi bi-bag-check-fill" style="font-size:130px"></i>
                       </div>
                      <div class="text-center">
                      	<form action="http://3.38.82.69/58/58shopping_b/login" method="post">
                            <div class="ms-auto position-relative">
                              <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-person-fill"></i></div>
                              <input type="email" class="form-control radius-30 ps-5" id="inputEmailAddress" name="companyId" placeholder="Enter ID">
                            </div>
                            <br>
                            <div class="ms-auto position-relative">
                              <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-lock-fill"></i></div>
                              <input type="password" class="form-control radius-30 ps-5" id="inputChoosePassword" name="companyPw" placeholder="Enter Password">
                            </div>
                            <br>
                            <button type="submit" class="btn btn-primary radius-30">쇼핑몰 업체 로그인</button>
                      	</form>
                      </div>
                    </div>
                  </div>
               </div>
               <div class="col">
                  <div class="card rounded-4">
                    <div class="card-body">
                       <div class="text-center">
                          <i class="bi bi-badge-ad-fill" style="font-size:130px"></i>
                       </div>
                      <div class="text-center">
                      	<form action="http://3.38.82.69/58/58ad/login" method="post">
                            <div class="ms-auto position-relative">
                              <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-person-fill"></i></div>
                              <input type="email" class="form-control radius-30 ps-5" id="inputEmailAddress" name="customerId" placeholder="Enter ID">
                            </div>
                            <br>
                            <div class="ms-auto position-relative">
                              <div class="position-absolute top-50 translate-middle-y search-icon px-3"><i class="bi bi-lock-fill"></i></div>
                              <input type="password" class="form-control radius-30 ps-5" id="inputChoosePassword" name="customerPw" placeholder="Enter Password">
                            </div>
                            <br>
                            <button type="submit" class="btn btn-primary radius-30">광고 고객 로그인</button>
                      	</form>
                      </div>
                    </div>
                  </div>
               </div>
        </div><!--end row-->
          </main>
       <!--end page main-->

       <!--start overlay-->
        <div class="overlay nav-toggle-icon"></div>
       <!--end overlay-->

       <!--Start Back To Top Button-->
		     <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
       <!--End Back To Top Button-->

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
  <script src="assets/plugins/chartjs/js/Chart.min.js"></script>
  <script src="assets/plugins/chartjs/js/Chart.extension.js"></script>
  <script src="assets/plugins/apexcharts-bundle/js/apexcharts.min.js"></script>
   <!-- Vector map JavaScript -->
   <script src="assets/plugins/vectormap/jquery-jvectormap-2.0.2.min.js"></script>
   <script src="assets/plugins/vectormap/jquery-jvectormap-world-mill-en.js"></script>
  <!--app-->
  <script src="assets/js/app.js"></script>
  <script src="assets/js/index.js"></script>
  <script>
    new PerfectScrollbar(".review-list")
    new PerfectScrollbar(".chat-talk")
 </script>


</body>

</html>