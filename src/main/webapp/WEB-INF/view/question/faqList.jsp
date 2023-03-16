<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" class="semi-dark">
	<head>
		<meta charset="UTF-8">
		<title>faqList</title>
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
				// 삭제 버튼 클릭시 confirm창
				$('#removeBtn').click(function() {
					var result = confirm('삭제하시겠습니까?');
					
					if(result == true) {
						alert('삭제되었습니다.');
					} else {
						return false;
					}
				});
			});
		</script>
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
					<div class="breadcrumb-title pe-3">문의</div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<c:if test="${serviceName == '쇼핑'}">
									<li class="breadcrumb-item"><a href="javascript:;"><i class="bi bi-question-circle-fill"></i></a>
										&nbsp;FAQ(쇼핑)
									</li>
								</c:if>
								<c:if test="${serviceName == '예약'}">
									<li class="breadcrumb-item"><a href="javascript:;"><i class="bi bi-question-circle-fill"></i></a>
										&nbsp;FAQ(예약)
									</li>
								</c:if>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
				<hr/>
				<c:if test="${serviceName == '쇼핑'}">
					<div class="btn-group">
						<button class="btn btn-primary" onClick="location.href='${pageContext.request.contextPath}/employee/question/faqList?serviceName=쇼핑'">쇼핑몰</button>
						<button class="btn btn-outline-primary" onClick="location.href='${pageContext.request.contextPath}/employee/question/faqList?serviceName=예약'">예약</button>
					</div>
				</c:if>
				<c:if test="${serviceName == '예약'}">
					<div class="btn-group">
						<button class="btn btn-outline-primary" onClick="location.href='${pageContext.request.contextPath}/employee/question/faqList?serviceName=쇼핑'">쇼핑몰</button>
						<button class="btn btn-primary" onClick="location.href='${pageContext.request.contextPath}/employee/question/faqList?serviceName=예약'">예약</button>
					</div>
				</c:if>
				<br><br>
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<table id="example" class="table table-striped table-bordered" style="width:100%">
								<thead>
									<tr>
										<th class="sorting" style="width : 5%">분류</th>
										<th style="width : 30%">질문</th>
										<th style="width : 45%">답변</th>
										<th style="width : 5%">생성일</th>
										<th style="width : 5%">수정일</th>
										<th style="width : 5%">수정</th>
										<th style="width : 5%">삭제</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="l" items="${list}">
										<tr>
											<td>${l.serviceName}</td>
											<td>${l.faqQuestion}</td>
											<td>${l.faqAnswer}</td>
											<td>${l.createdate}</td>
											<td>${l.updatedate}</td>
											<td>
												<a href="${pageContext.request.contextPath}/employee/question/modifyFaq?faqNo=${l.faqNo}&serviceName=${serviceName}">수정</a>
											</td>
											<td>
												<a id="removeBtn" href="${pageContext.request.contextPath}/employee/question/removeFaq?faqNo=${l.faqNo}">삭제</a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<!-- FAQ등록 -->
							<div>
								<a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/employee/question/addFaq?serviceName=${serviceName}">FAQ등록</a>
							</div>
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
		             order: [[3, 'desc']],
		         });
		     });
		</script>
		<!--app-->
		<script src="/58platform/assets/js/app.js"></script>
	</body>
</html>