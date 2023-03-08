<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" class="semi-dark">
	<head>
		<!-- Required meta tags -->
		<meta charset="utf-8">
		<title>employeeList</title>
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
				$('.changeLevel').change(function() {
					$(this.form).submit();
				});
			});
		</script>
	</head>
	<body>
		<!--start wrapper-->
		<div class="wrapper">
		   	<!--start header -->
			<c:import url="/WEB-INF/inc/header.jsp"></c:import>
			<!--start sidebar -->
			<c:import url="/WEB-INF/inc/sideMenu.jsp"></c:import>
			
			<!--start content-->
			<main class="page-content">
				<!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<div class="breadcrumb-title pe-3">직원</div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bi bi-megaphone-fill"></i></a>
									직원조회
								</li>
							</ol>
						</nav>
					</div>
				</div>
				
				<!--end breadcrumb-->
				<hr/>
				<!-- 직원리스트 -->
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<c:choose>
								<c:when test="${loginEmp.employeeLevel eq '총관리자' }">
									<table id="example" class="table table-striped table-bordered" style="width:100%">
										<thead>
											<tr>
												<th style="width : 15%">ID</th>
												<th style="width : 15%">이름</th>
												<th style="width : 15%">직위</th>
												<th style="width : 15%">상태</th>
												<th style="width : 15%">연락처</th>
												<th style="width : 15%">이메일</th>
												<th style="width : 15%">입사일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="e" items="${list}">
												<tr>
													<td>${e.employeeId}</td>
													<td>${e.employeeName}</td>
													<td>${e.employeeLevel}</td>
													<td>
														<form action="${pageContext.request.contextPath}/employee/emp/employeeList" method="get" id="changeForm">
															<input type="hidden" name="id" value="${e.employeeId}">
															<c:if test="${e.employeeLevel ne '총관리자'}">
																<div class="col-md-8">
																	<select name="changeLevel" class="changeLevel">
																		<c:if test="${e.totalIdActive eq '활성화'}">
																			<option value="활성화">활성화</option>
																			<option value="비활성화">비활성화</option>
																		</c:if>
																		<c:if test="${e.totalIdActive eq '비활성화'}">
																			<option value="활성화">활성화</option>
																			<option value="비활성화" selected="selected">비활성화</option>
																		</c:if>
																	</select>
																</div>
															</c:if>
														</form>
														<c:if test="${e.employeeLevel eq '총관리자'}">
															${e.totalIdActive}
														</c:if>
													</td>
													<td>${e.employeePhone}</td>
													<td>${e.employeeEmail}</td>
													<td>${e.createdate}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- 직원등록 -->
									<div>
										<button class="btn btn-outline-primary" onClick="location.href='${pageContext.request.contextPath}/employee/emp/addEmployee'">직원등록</button>
									</div>
								</c:when>
								<c:otherwise>
									<table id="example" class="table table-striped table-bordered" style="width:100%">
										<thead>
											<tr>
												<th style="width : 15%">ID</th>
												<th style="width : 15%">이름</th>
												<th style="width : 15%">직위</th>
												<th style="width : 15%">상태</th>
												<th style="width : 15%">연락처</th>
												<th style="width : 15%">이메일</th>
												<th style="width : 15%">입사일</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="e" items="${list}">
												<tr>
													<td>${e.employeeId}</td>
													<td>${e.employeeName}</td>
													<td>${e.employeeLevel}</td>
													<td>${e.totalIdActive}</td>
													<td>${e.employeePhone}</td>
													<td>${e.employeeEmail}</td>
													<td>${e.createdate}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</main>
			<!--start overlay-->
			<div class="overlay nav-toggle-icon"></div>
			<!--end overlay-->
			
			<!--Start Back To Top Button-->
			<a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
			<!--End Back To Top Button-->
		</div>
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
			$(document).ready(function () {
			      $('#example').DataTable({
			          order: [[6, 'desc']],
			      });
			});
		</script>
	</body>
</html>