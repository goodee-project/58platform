<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" class="semi-dark">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
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

  <title>기업 상세보기</title>
</head>

<body>


  <!--start wrapper-->
  <div class="wrapper">
       	<!--start header -->
		<c:import url="/WEB-INF/inc/header.jsp"></c:import>
		<!--end header -->
		
		<!--start sidebar -->
		<c:import url="/WEB-INF/inc/sideMenu.jsp"></c:import>
		<!--end sidebar -->

       <!--start content-->
          <main class="page-content">

            <!--breadcrumb-->
            <div class="page-breadcrumb d-none d-sm-flex align-items-center">
              <div class="breadcrumb-title pe-3 text-white">Pages</div>
              <div class="ps-3">
                <nav aria-label="breadcrumb">
                  <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt text-white"></i></a>
                    </li>
                    <li class="breadcrumb-item active text-white" aria-current="page">User Profile</li>
                  </ol>
                </nav>
              </div>
            </div>
            <!--end breadcrumb-->
           
            <div class="profile-cover bg-dark"></div>

            <div class="row">
              <div class="col-12 col-lg-8">
                <div class="card shadow-sm border-0">
                  <div class="card-body">
                      <h5 class="mb-0">COMPANY INFORMATION</h5>
                      <hr>
                      <div class="card shadow-none border">
                        <div class="card-body">
                          <form class="row g-3">
                             <div class="col-4">
                                <label class="form-label">COMPANY ID</label>
                                <input type="text" class="form-control" value="${company.companyId}" disabled="disabled">
                             </div>
                             <div class="col-4">
                                <label class="form-label">COMPANY NAME</label>
                                <input type="text" class="form-control" value="${company.companyName}" disabled="disabled">
                             </div>
                             <div class="col-4">
                              <label class="form-label">CEO</label>
                              <input type="text" class="form-control" value="${company.companyCeo}" disabled="disabled">
                             </div>
                             <div class="col-6">
                              <label class="form-label">PHONE</label>
                              <input type="text" class="form-control" value="${company.companyPhone}" disabled="disabled">
                             </div>
                             <div class="col-6">
                              <label class="form-label">Email</label>
                              <input type="text" class="form-control" value="${company.companyEmail}" disabled="disabled">
                             </div>
                          </form>
                        </div>
                      </div>
                      <div class="card shadow-none border">
                        <div class="card-header">
                          <h6 class="mb-0">CONTACT INFORMATION</h6>
                        </div>
                        <div class="card-body">
                          <form class="row g-3">
                            <div class="col-12">
                                <label class="form-label">ADDRESS</label>
                                <input type="text" class="form-control" value="${company.companyAddress}" disabled="disabled">
                             </div>
                             <div class="col-6">
                                <label class="form-label">BANK</label>
                                <input type="text" class="form-control" value="${company.companyBank}" disabled="disabled">
                             </div>
                             <div class="col-6">
                              <label class="form-label">ACCOUNT</label>
                              <input type="text" class="form-control" value="${company.companyAccount}" disabled="disabled">
                            </div>
                              <div class="col-12">
                                <label class="form-label">BUSINESS LIENSE NUMBER</label>
                                <input type="text" class="form-control" value="${company.companyNumber}" disabled="disabled">
                            </div>
                            <div class="col-12">
                                <label class="form-label">ADDITION SERVICE</label><br>
                                <c:forEach var="list" items="${companyAddtionServiceList}">
                                	<span class="badge bg-dark rounded-pill" style="width:auto%;font-size:20px">${list}</span>
                                </c:forEach>
                            </div>
                          </form>
                        </div>
                      </div>
                  </div>
                </div>
              </div>
              <c:if test="${serviceName eq '예약'}">
	              <div class="col-12 col-lg-4">
	                <div class="card shadow-sm border-0 overflow-hidden">
	                  <div class="card-body">
	                      <div class="profile-avatar text-center">
	                        <img src="assets/images/avatars/avatar-1.png" class="rounded-circle shadow" width="120" height="120" alt="">
	                      </div>
	                      <div class="d-flex align-items-center justify-content-around mt-5 gap-3">
	                          <div class="text-center">
	                            <h4 class="mb-0">${company.companyName}</h4>
	                            <p class="mb-0 text-secondary">${serviceName}업체(${company.companyTypeContent})</p>
	                          </div>
	                      </div>
	                      <div class="text-center mt-4">
	                        <h4 class="mb-1">${company.totalPrice}￦</h4>
	                        <p class="mb-0 text-secondary">누적 판매금액</p>
	                        <div class="mt-4"></div>
	                      </div>
	                      <hr>
	                      <div class="text-start">
	                      	<div class="row g-3">
		                      <div class="col-6">
		                          <label class="form-label">OPEN TIME</label>
		                          <input type="time" class="form-control" value="${company.companyOpenTime}" disabled="disabled">
		                       </div>           
		                	<div class="col-6">
		                 		<label class="form-label">CLOSE TIME</label>
		                    	<input type="time" class="form-control" value="${company.companyCloseTime}" disabled="disabled">
		                   	</div>
		                 	</div>
	                     </div>
	                  </div>
	                  <ul class="list-group list-group-flush">	
	                  	<li class="list-group-item d-flex justify-content-between align-items-center bg-transparent border-top">
		                	<a href="#"><span class="badge bg-primary" style="width:auto%;font-size:20px">&nbsp;&nbsp;매출 통계&nbsp;&nbsp;</span></a>
		                	<a href="${pageContext.request.contextPath}/employee/company/companySellList?companyName=${company.companyName}&serviceName=${serviceName}"><span class="badge bg-primary" style="width:auto%;font-size:20px">&nbsp;&nbsp;판매 상품&nbsp;&nbsp;</span></a>
		                	<a href="#"><span class="badge bg-primary" style="width:auto%;font-size:20px">&nbsp;&nbsp;예약 정보&nbsp;&nbsp;</span></a>
	                  	</li>
	                  </ul>   
	                </div>
	              </div>
              </c:if>
              <c:if test="${serviceName eq '쇼핑'}">
	              <div class="col-12 col-lg-4">
	                <div class="card shadow-sm border-0 overflow-hidden">
	                  <div class="card-body">
	                      <div class="profile-avatar text-center">
	                        <img src="assets/images/avatars/avatar-1.png" class="rounded-circle shadow" width="120" height="120" alt="">
	                      </div>
	                      <div class="d-flex align-items-center justify-content-around mt-5 gap-3">
	                          <div class="text-center">
	                            <h4 class="mb-0">${company.companyName}</h4>
	                            <p class="mb-0 text-secondary">${serviceName}업체(${company.companyTypeContent})</p>
	                          </div>
	                      </div>
	                      <div class="text-center mt-4">
	                        <h4 class="mb-1">${company.totalPrice}￦</h4>
	                        <p class="mb-0 text-secondary">누적 판매금액</p>
	                        <div class="mt-4"></div>
	                      </div>
	                      <hr>
	                  </div> 
	                </div>
	              </div>
              </c:if>
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
  <script src="/58platform/assets/js/bootstrap.bundle.min.js"></script>
  <!--plugins-->
  <script src="/58platform/assets/js/jquery.min.js"></script>
  <script src="/58platform/assets/plugins/simplebar/js/simplebar.min.js"></script>
  <script src="/58platform/assets/plugins/metismenu/js/metisMenu.min.js"></script>
  <script src="/58platform/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
  <script src="/58platform/assets/js/pace.min.js"></script>
  <script src="/58platform/assets/plugins/datatable/js/jquery.dataTables.min.js"></script>
  <script src="/58platform/assets/plugins/datatable/js/dataTables.bootstrap5.min.js"></script>
  <script src="/58platform/assets/js/table-datatable.js"></script>
	
  <!--app-->
  <script src="/58platform/assets/js/app.js"></script>
</body>
</html>