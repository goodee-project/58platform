<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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

 		<title>공지사항 등록</title>
 		
 		<!-- jQuery -->
		<!-- CDN 주소 추가 방식 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				
				// 제목 중복값 체크 
				$('#ckBtn').click(function(){
					$.ajax({
						url:'${pageContext.request.contextPath}/noticeTitleCk'
						, type:'get'
						, data : {noticeTitle:$('#noticeTitle').val()}
						, success:function(model){ // model : 'YES' / 'NO'
							if(model=='YES') {
								// 사용가능한 제목
								$('#noticeTitle').val($('#noticeTitle').val());
								alert($('#noticeTitle').val()+'는 사용가능한 제목입니다.');
							} else {
								// 사용중인 제목
								alert($('#noticeTitle').val()+'는 사용중인 제목입니다.');
								$('#noticeTitle').val("[${serviceName}]");
							}
						}
					});
				});
				// 등록 버튼 클릭시 확인 및 공백값 체크
				$('#addBtn').click(function(){
					var out = confirm('등록 하시겠습니까?');
					if(out == true){
							// 제목 미입력시
							if( ($('#noticeTitle').val().length) < 1 )  {
								alert('입력된값이 없습니다.');
								$('#noticeTitle').focus();
								return;
							}
							// 제목 공백만 입력시
							if($('#noticeTitle').val().trim() == '')  {
								alert('공백만 입력할 수 없습니다.');
								$('#noticeTitle').text('');
								$('#noticeTitle').focus();
								return;
							} 
							// 내용 미입력시
							if( ($('#noticeMemo').val().length) < 1 )  {
								alert('입력된값이 없습니다.');
								$('#noticeMemo').focus();
								return;
							}
							// 내용 공백만 입력시
							if($('#noticeMemo').val().trim() == '')  {
								alert('공백만 입력할 수 없습니다.');
								$('#noticeMemo').text('');
								$('#noticeMemo').focus();
								return;
							} 
							$('#addNoticeForm').submit();
							alert('등록되었습니다.')
					} else { 
						alert('취소되었습니다.')
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
							<div class="breadcrumb-title pe-3">공지사항</div>
							<div class="ps-3">
								<nav aria-label="breadcrumb">
									<ol class="breadcrumb mb-0 p-0">
										<li class="breadcrumb-item"><a href="javascript:;"><i class="bi bi-megaphone-fill"></i></a>
											공지사항
										</li>
										<c:if test="${serviceName == '쇼핑'}">
											<li class="breadcrumb-item active" aria-current="page">공지사항 등록(쇼핑)</li>
										</c:if>
										<c:if test="${serviceName == '예약'}">
											<li class="breadcrumb-item active" aria-current="page">공지사항 등록(예약)</li>
										</c:if>
									</ol>
								</nav>
							</div>
						</div>
						
						<!--end breadcrumb-->
						<hr/>
						<!--  step1 쇼핑/예약 리스트페이지로.. -->
						<c:if test="${serviceName == '쇼핑'}">
						<div class="btn-group">
							<button class="btn btn-primary" onClick="location.href='${pageContext.request.contextPath}/employee/notice/noticeList?serviceName=쇼핑'">쇼핑몰</button>
		           			<button class="btn btn-outline-primary" onClick="location.href='${pageContext.request.contextPath}/employee/notice/noticeList?serviceName=예약'">예약</button>
						</div>
						</c:if>
						<c:if test="${serviceName == '예약'}">
						<div class="btn-group"> 
							<button class="btn btn-outline-primary" onClick="location.href='${pageContext.request.contextPath}/employee/notice/noticeList?serviceName=쇼핑'">쇼핑몰</button>
		           			<button class="btn btn-primary" onClick="location.href='${pageContext.request.contextPath}/employee/notice/noticeList?serviceName=예약'">예약</button>
						</div>
						</c:if>
						<!--  step2 쇼핑/예약 등록페이지로.. -->
						<%-- <c:if test="${serviceName == '쇼핑'}">
						<div class="btn-group">
							<button class="btn btn-primary" onClick="location.href='${pageContext.request.contextPath}/employee/notice/addNotice?serviceName=쇼핑'">쇼핑몰</button>
		           			<button class="btn btn-outline-primary" onClick="location.href='${pageContext.request.contextPath}/employee/notice/addNotice?serviceName=예약'">예약</button>
						</div>
						</c:if>
						<c:if test="${serviceName == '예약'}">
						<div class="btn-group"> 
							<button class="btn btn-outline-primary" onClick="location.href='${pageContext.request.contextPath}/employee/notice/addNotice?serviceName=쇼핑'">쇼핑몰</button>
		           			<button class="btn btn-primary" onClick="location.href='${pageContext.request.contextPath}/employee/notice/addNotice?serviceName=예약'">예약</button>
						</div>
						</c:if> --%>
						
						<!--end page main-->
				      	<!--start content-->
				        <main class="page-content">
							<div class="row">
								<div class="col-xl-9 mx-auto">
									<h6 class="mb-0 text-uppercase">공지사항 등록</h6>
									<hr/>
									<div class="card">
										<div class="card-body">
											
											<!-- Notice Form.. -->
											<form id="addNoticeForm"method="post" action="${pageContext.request.contextPath}/employee/notice/addNotice">
												<input type="hidden" name="serviceName" value="${serviceName}">
												<div>
													<label class="float-label">분류</label>
													<input class="form-control mb-3" type="text" name="serviceName" value="${serviceName}" aria-label="Disabled input example" disabled readonly>
												</div>
												<div>
													<label class="float-label">제목</label>&nbsp;<button type="button" id="ckBtn">중복검사</button>
													<input class="form-control mb-3" type="text" id="noticeTitle" name="noticeTitle" placeholder="제목을 입력하세요" value="[${serviceName}]" aria-label="default input example">
												</div>
												<div>
													<label class="float-label">내용</label>
													<textarea class="form-control form-control-sm mb-3" id="noticeMemo" name="noticeMemo" aria-label=".form-control-sm example" rows="5" cols="80" placeholder="내용을 입력하세요"></textarea>
												</div>
												<button class="btn btn-outline-primary" id="addBtn" type="button">등록</button>
											</form>
										</div>
									</div>
								</div>
							</div>
							<!--end row-->
						</main>
	       				
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