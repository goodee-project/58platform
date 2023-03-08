<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en" class="semi-dark">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
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
					<div class="breadcrumb-title pe-3">통계</div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">회원페이충전이력(표)</li>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
				<h6 class="mb-0 text-uppercase">모든 회원 일일 충전내역 총 출력</h6>
				<hr/>
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							
							<!-- 기간설정 -->
							<div>
								<form action="${pageContext.request.contextPath}/employee/sales/paySaveHistory">
									조회 기간
									<input type="date" name="startDate" value="${startDate}">
									~
									<input type="date" name="endDate" value="${endDate}">
									<input type="hidden" name="ymd" value="${ymd}">
									<button type="submit" class="btn btn-sm btn-success">조회</button>
									<a href="${pageContext.request.contextPath}/employee/sales/paySaveHistory" class="btn btn-sm btn-info">reset</a>
								</form>
								
							</div>
							<c:if test="${startDate != ''}">
								<div>
									총 '<fmt:formatNumber type="number" value="${map.ttlSum}"/>원'
									<br>'${map.ttlCnt}'건의 충전이 있었습니다. 
								</div>
							</c:if>
							<a href="${pageContext.request.contextPath}/employee/sales/payStatistics" class="btn btn-sm btn-danger">페이충전 누적액 조회</a>
							
							<table id="example" class="table table-striped table-bordered" style="width:100%">
								<thead>
									<tr>
										<th>회원ID</th>
										<th>회원이름</th>
										<th>충전페이머니</th>
										<th>날짜</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="p" items="${list}">
										<tr>
											<td>${p.customerId}</td>
											<td>${p.customerName}</td>
											<td>
												<fmt:formatNumber type="number" value="${p.price}"/>
											</td>
											<td>${p.date}</td>
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
  
</body>
</html>