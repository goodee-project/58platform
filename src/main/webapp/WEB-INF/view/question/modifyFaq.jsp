<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" class="semi-dark">
	<head>
		<meta charset="UTF-8">
		<title>modifyFaq</title>
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
				
				$('#shopBtn').click(function() {
					// 질문or답변 공백 체크
					if($('#shopFaq').val() == "" || $('#shopAnswer').val() == "") {
						alert('정보가 입력되지 않았습니다.');
					} else {
						$('#shopForm').submit();
					}
					
				});
				
				$('#bookingBtn').click(function() {
					// 질문or답변 공백 체크
					if($('#bookingFaq').val() == "" || $('#bookingAnswer').val() == "") {
						alert('정보가 입력되지 않았습니다.');
					} else {
						$('#bookingForm').submit();
					}
					
				});
				
				
				// 취소버튼 클릭시 확인/취소 버튼(쇼핑)
				$('#shopCancelBtn').click(function() {
					var result = confirm('입력하신 내용이 저장되지 않습니다.');
					
					if(result == true) {
		    			$(location).attr("href", "${pageContext.request.contextPath}/employee/question/faqList?serviceName=${serviceName}");	
		    		} else {
		    			return false;
		    		}
				});
				
				// 취소버튼 클릭시 확인/취소 버튼(예약)
				$('#bookingCancelBtn').click(function() {
					var result = confirm('입력하신 내용이 저장되지 않습니다.');
					
					if(result == true) {
		    			$(location).attr("href", "${pageContext.request.contextPath}/employee/question/faqList?serviceName=${serviceName}");	
		    		} else {
		    			return false;
		    		}
				});
			});
		</script>
		<style>
			.po {
				position : relative;
				top : 30px;
			}
		</style>
	</head>
	<body>
		<!-- start wrapper -->
		<div class="wrapper">
			<!--start header -->
			<c:import url="/WEB-INF/inc/header.jsp"></c:import>
			<!--start sidebar -->
			<c:import url="/WEB-INF/inc/sideMenu.jsp"></c:import>
			
			<!--start content-->
			<main class="page-content">
				<!--breadcrumb-->
				<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
					<div class="breadcrumb-title pe-3">문의</div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<c:if test="${serviceName eq '쇼핑'}">
									<li class="breadcrumb-item">
										<a href="${pageContext.request.contextPath}/employee/question/faqList?serviceName=쇼핑">
											<i class="bi bi-question-circle-fill"></i>&nbsp;FAQ(쇼핑)
										</a>
									</li>
								</c:if>
								<c:if test="${serviceName eq '예약'}">
									<li class="breadcrumb-item">
										<a href="${pageContext.request.contextPath}/employee/question/faqList?serviceName=예약">
											<i class="bi bi-question-circle-fill"></i>&nbsp;FAQ(예약)
										</a>
									</li>
								</c:if>
								<li class="breadcrumb-item active" aria-current="page">FAQ 등록</li>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
				<c:choose >
					<c:when test="${serviceName eq '쇼핑'}">
						<!-- serviceName이 쇼핑 -->
						<div class="row po">
							<div class="col-lg-8 mx-auto">
								<div class="card">
									<div class="card-header py-3 bg-transparent"> 
										<h5 class="mb-0">자주 묻는 질문[쇼핑]</h5>
									</div>
									<div class="card-body">
										<div class="border p-3 rounded">
											<form class="row g-3" action="${pageContext.request.contextPath}/employee/question/modifyFaq" method="post" id="shopForm">
												<input type="hidden" name="faqNo" value="${f.faqNo}">
												<div class="col-12">
													<label class="form-label">분류</label>
													<input type="text" class="form-control" value="${serviceName}" name="serviceName" readonly="readonly">
												</div>   
												<div class="col-12">
													<label class="form-label">자주 묻는 질문</label>
													<textarea class="form-control" name="faqQuestion" placeholder="질문을 입력해주세요." rows="6" cols="4" id="shopFaq">${f.faqQuestion}</textarea>
												</div>
												<div class="col-12">
													<label class="form-label">답변</label>
													<textarea class="form-control" name="faqAnswer" placeholder="답변을 입력해주세요." rows="6" cols="4" id="shopAnswer">${f.faqAnswer}</textarea>
												</div>
												<div class="col-12">
													<button class="btn btn-primary px-4" type="button" id="shopBtn">수정</button>
													<a id="shopCancelBtn" class="btn btn-primary px-4">취소</a>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--end row-->
					</c:when>
					<c:when test="${serviceName eq '예약'}">
						<!-- serviceName이 예약 -->
						<div class="row">
							<div class="col-lg-8 mx-auto">
								<div class="card">
									<div class="card-header py-3 bg-transparent"> 
										<h5 class="mb-0">자주 묻는 질문[예약]</h5>
									</div>
									<div class="card-body">
										<div class="border p-3 rounded">
											<form class="row g-3" action="${pageContext.request.contextPath}/employee/question/modifyFaq" method="post" id="bookingForm">
												<input type="hidden" name="faqNo" value="${f.faqNo}">
												<div class="col-12">
													<label class="form-label">분류</label>
													<input type="text" class="form-control" name="serviceName" value="${serviceName}" readonly="readonly">
												</div>   
												<div class="col-12">
													<label class="form-label">자주 묻는 질문</label>
													<textarea class="form-control" name="faqQuestion" placeholder="질문을 입력해주세요." rows="6" cols="4" id="bookingFaq">${f.faqQuestion}</textarea>
												</div>
												<div class="col-12">
													<label class="form-label">답변</label>
													<textarea class="form-control" name="faqAnswer" placeholder="답변을 입력해주세요." rows="6" cols="4" id="bookingAnswer">${f.faqAnswer}</textarea>
												</div>
												<div class="col-12">
													<button class="btn btn-primary px-4" type="button" id="bookingBtn">수정</button>
													<a id="bookingCancelBtn" class="btn btn-primary px-4">취소</a>
												</div>
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!--end row-->
					</c:when>
				</c:choose>
				
			
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
	</body>
</html>