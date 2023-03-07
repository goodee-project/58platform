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

 		<title>Add Notice</title>
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
					
					
       <!--start content-->
       <main class="page-content">
				<div class="row">
					<div class="col-xl-9 mx-auto">
						<h6 class="mb-0 text-uppercase">공지사항 등록</h6>
						<hr/>
						<div class="card">
							<div class="card-body">
							
								<!-- Notice Form.. -->
								<form method="post" action="${pageContext.request.contextPath}/employee/notice/addNotice">
								<input class="form-control mb-3" type="text" name="serviceName" value="${serviceName}" readonly="readonly" aria-label="Disabled input example" disabled>
								<input class="form-control mb-3" type="text" name="noticeTitle" placeholder="제목을 입력하세요" aria-label="default input example">
								<textarea class="form-control form-control-sm mb-3" aria-label=".form-control-sm example" rows="5" cols="80" name="noticeMemo" placeholder="내용을 입력하세요"></textarea>
									<button type="submit" id="addBtn">공지 추가</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!--end row-->
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