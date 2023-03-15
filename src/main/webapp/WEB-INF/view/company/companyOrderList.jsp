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

  <title>기업 판매상품 조회</title>
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
					<div class="breadcrumb-title pe-3">주문 조회</div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bi bi-exclamation-triangle-fill"></i></a>
									기업 > 기업조회 > 주문 조회
								</li>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
				<hr/>
				<br><br>
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<c:if test = "${serviceName eq '예약'}">
							<table id="example" class="table table-striped table-bordered" style="width:100%">
								<thead>
									<tr>
										<th style="width : 10%">예약번호</th>
										<th style="width : 10%">고객ID</th>
										<th style="width : 15%">예약상품</th>
										<th style="width : 15%">
											<span>결제금액( 전체금액-</span>
											<span style="color:blue";>랭크할인</span> -
											<span style="color:red";>포인트</span> )
										</th>
										<th style="width : 10%">실 결제금액</th>
										<th style="width : 10%">예약상태</th>
										<th style="width : 15%">방문일</th>
										<th style="width : 15%">예약일</th>
									</tr>
								</thead>
							
								<tbody>
									<c:forEach var="s" items="${companyOrderList}">
										<tr>
											<td>${s.bookingNo}</td>
											<td>${s.customerId}</td>
											<td>
												<!-- Button trigger modal -->
												<a type="button" class="primary" data-bs-toggle="modal" data-bs-target="#exampleLargeModal">${s.bookingProductName}</a>
												<!-- Modal -->
												<div class="modal fade" id="exampleLargeModal" tabindex="-1" aria-hidden="true">
													<div class="modal-dialog modal-lg">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title">Modal title</h5>
																<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<table id="example" class="table table-striped table-bordered" style="width:100%">
																	<thead>
																		<tr>
																			<th style="width : 10%">주문번호</th>
																			<th style="width : 15%">운송장번호</th>
																			<th style="width : 15%">고객ID</th>
																			<th style="width : 20%">
																				<span>결제금액( 전체금액-</span>
																				<span style="color:blue";>랭크할인</span> -
																				<span style="color:red";>포인트</span> )
																			</th>
																			<th style="width : 10%">실 결제금액</th>
																			<th style="width : 15%">주문상태</th>
																			<th style="width : 15%">주문일</th>
																		</tr>
																	</thead>
																	
																	<tbody>
																		<tr>
																			<td>a</td>
																			<td>b</td>
																			<td>c</td>
																			<td>d</td>
																			<td>e</td>
																			<td>f</td>
																			<td>g</td>
																		</tr>
																		
																	</tbody>
																</table>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</td>
											<td>
												${s.bookingTotalPrice}
												- <span style="color:blue";>${s.rankDiscount}</span>
												- <span style="color:red";>${s.bookingUsePoint}</span>
											</td>
											<td>${s.pay}</td>
											<td>${s.bookingState}</td>
											<td>${s.bookingDate}</td>
											<td>${s.bookingRequestDate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							</c:if>
							<c:if test = "${serviceName eq '쇼핑'}">
							<table id="example" class="table table-striped table-bordered" style="width:100%">
								<thead>
									<tr>
										<th style="width : 10%">주문번호</th>
										<th style="width : 15%">운송장번호</th>
										<th style="width : 10%">고객ID</th>
										<th style="width : 15%">주문상품</th>
										<th style="width : 15%">
											<span>결제금액( 전체금액-</span>
											<span style="color:blue";>랭크할인</span> -
											<span style="color:red";>포인트</span> )
										</th>
										<th style="width : 10%">실 결제금액</th>
										<th style="width : 10%">주문상태</th>
										<th style="width : 15%">주문일</th>
									</tr>
								</thead>
							
								<tbody>
									<c:forEach var="s" items="${companyOrderList}">
										<tr>
											<td>${s.orderSheetNo}</td>
											<td>${s.orderSheetWaybill}</td>
											<td>${s.customerId}</td>
											<td>
												<!-- Button trigger modal -->
												<a type="button" class="primary" data-bs-toggle="modal" data-bs-target="#exampleLargeModal">
													${s.goodsNameTitle} 외 ${s.goodsNameETC} 종
												</a>
												<!-- Modal -->
												<div class="modal fade" id="exampleLargeModal" tabindex="-1" aria-hidden="true">
													<div class="modal-dialog modal-lg">
														<div class="modal-content">
															<div class="modal-header">
																<h5 class="modal-title">Modal title</h5>
																<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
															</div>
															<div class="modal-body">
																<table id="example" class="table table-striped table-bordered" style="width:100%">
																	<thead>
																		<tr>
																			<th style="width : 10%">주문번호</th>
																			<th style="width : 15%">운송장번호</th>
																			<th style="width : 15%">고객ID</th>
																			<th style="width : 20%">
																				<span>결제금액( 전체금액-</span>
																				<span style="color:blue";>랭크할인</span> -
																				<span style="color:red";>포인트</span> )
																			</th>
																			<th style="width : 10%">실 결제금액</th>
																			<th style="width : 15%">주문상태</th>
																			<th style="width : 15%">주문일</th>
																		</tr>
																	</thead>
																	
																	<tbody>
																		<tr>
																			<td>a</td>
																			<td>b</td>
																			<td>c</td>
																			<td>d</td>
																			<td>e</td>
																			<td>f</td>
																			<td>g</td>
																		</tr>
																		
																	</tbody>
																</table>
																<div class="modal-footer">
																	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
																</div>
															</div>
														</div>
													</div>
												</div>
											</td>
											<td>
												${s.orderSheetPrice}
												- <span style="color:blue";>${s.rankDiscount}</span>
												- <span style="color:red";>${s.usePoint}</span>
											</td>
											<td>${s.pay}</td>
											<td>${s.orderSheetState}</td>
											<td>${s.createdate}</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							</c:if>	
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
  <script>
     $(document).ready(function () {
           $('#example').DataTable({
               order: [[7, 'desc']],
           });
       });
  </script>
  <!--app-->
  <script src="/58platform/assets/js/app.js"></script>
</body>
</html>