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

  <title>신고조회</title>
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
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<div class="breadcrumb-title pe-3">Tables</div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bi bi-exclamation-triangle-fill"></i></a>
									신고
								</li>
								<c:if test="${reportCategory == '쇼핑'}">
									<li class="breadcrumb-item active" aria-current="page">신고 조회(쇼핑)</li>
								</c:if>
								<c:if test="${reportCategory == '예약'}">
									<li class="breadcrumb-item active" aria-current="page">신고 조회(예약)</li>
								</c:if>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
				<hr/>
				<c:if test="${reportCategory == '쇼핑'}">
				<div class="btn-group">
					<button class="btn btn-primary" onClick="location.href='${pageContext.request.contextPath}/employee/report/reportList?reportCategory=쇼핑'">쇼핑몰</button>
					<button class="btn btn-outline-primary" onClick="location.href='${pageContext.request.contextPath}/employee/report/reportList?reportCategory=예약'">예약</button>
				</div>
				</c:if>
				<c:if test="${reportCategory == '예약'}">
				<div class="btn-group">
					<button class="btn btn-outline-primary" onClick="location.href='${pageContext.request.contextPath}/employee/report/reportList?reportCategory=쇼핑'">쇼핑몰</button>
					<button class="btn btn-primary" onClick="location.href='${pageContext.request.contextPath}/employee/report/reportList?reportCategory=예약'">예약</button>
				</div>
				</c:if>
				<br><br>
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<table id="example" class="table table-striped table-bordered" style="width:100%">
								<thead>
									<tr>
										<th style="width : 10%">신고 번호</th>
										<th style="width : 10%">서비스 종류</th>
										<th style="width : 15%">신고 기업</th>
										<th style="width : 10%">고객 ID</th>
										<th style="width : 10%">주문/예약 번호</th>
										<th style="width : 35%">신고 사유</th>
										<th style="width : 10%">신고일</th>
									</tr>
								</thead>
							
								<tbody>
									<c:forEach var="l" varStatus="vs" items="${reportList}">
										<tr>
											<td>${l.reportNo}</td>
											<td>${l.reportCategory}</td>
											<td>${l.companyName}</td>
											<td>${l.customerId}</td>
											<td><a href="${pageContext.request.contextPath}/employee/company/getOrderOne?reportCategory=${reportCategory}&content=${l.reportContent}" 
	onclick="window.open(this.href, '_blank', 'width=1400, height=500'); return false;">${l.reportContent}</a></td>
											<td>${l.reportMemo}</td>
											<td>${l.createdate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
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
  <script>
	$(document).ready(function() {
		$('#example').DataTable({
            order: [[6, 'desc']],
        });
	});
  </script>
</body>
</html>