<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en" class="semi-dark">
	<head>
		<meta charset="UTF-8">
		<title>main</title>
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
					<div class="breadcrumb-title pe-3">메인</div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">플랫폼 개요</li>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
				<h6 class="mb-0 text-uppercase">GDJ58 - FTP팀의 파이널팀프로젝트 플랫폼 개요</h6>
				<hr/>
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							
							<h5>구디아카데미 58기 파이널 팀 프로젝트</h5><hr>
							제목 : 통합플랫폼 (쇼핑몰,예약업체,광고업체)<br>
							구성원(6명) : 김태환(팀장),곽효상,강지훈,김수곤,이호민,조건희<br>
							개발내용 : SpringFramework 기반의 통합플랫폼 구현<br><hr>
							
							<h6>과정</h6>
							1) 쇼핑몰 및 예약업체 팀들과 협업하여 통합된 요구사항 도출/분석/설계<br>
							2) oven(ppt제작프로그램)을 활용한 UI/UX 사전제작 <button type="button" class="btn btn-sm btn-outline-primary" onclick="window.open('${pageContext.request.contextPath}/assets/iframe/FTP조 UI_UX 스토리보드.pdf')">UI/UX</button><br>
							3) 통합 DB 구성 <button type="button" class="btn btn-sm btn-secondary" onclick="window.open('${pageContext.request.contextPath}/assets/iframe/erd.png')">ERD</button><br>
							4) 각 팀별 코딩작업 착수<br>
							<hr>
							<h6>플랫폼 역할</h6>
							쇼핑몰/예약업체/광고업체를 총괄 (승인/탈퇴/조회/통계/배송 등)
							
							<hr>
							<h6>세부기능</h6>
							1) 직원<br>
							 - 플랫폼 직원의 회원가입/로그인/정보수정/탈퇴<br>
							 - 직원의 직위는 매니저와 사원 두개로 구분<br>
							 - 매니저의 권한 : 직원의 재직상태 및 직위 변경가능<br>
							 - 사원의 권한 : FAQ 및 배송처리, 각종 정보 조회가능<br>
							<br>
							2) 회원관리<br>
							 - 통합회원을 조회 및 활성화/비활성화 수정<br>
							 - 탈퇴회원 조회 <br>
							 - 회원포인트내역 조회<br>
							 <br>
							3) 기업관리<br>
							 - 기업의 가입요청을 확인 후 승인하여 활성화<br>
							 - 기업목록 및 기업상세를 조회<br>
							 - 기업 정보수정요청을 확인 후 수정승인절차 진행<br>
							 - 탈퇴기업 조회<br>
							 <br>
							4) 통계관리<br>
							 - 페이머니 충전내역 및 충전통계치 조회(일/월/연/기간별)(표/차트)
							 - 광고의 매출 조회 (표/차트)
							 <br>
							5) 정산관리<br>
							 - 각 사이트별 입점한 기업들의 정산내역 조회<br>
							 <br>
							6) 배송관리<br>
							 - 쇼핑몰 주문건에 대한 배송절차 진행<br>
							 - 쇼핑몰 환불건에 대한 환불절차 진행<br>
							 <br>
							7) 신고관리<br>
							 - 사이트별 접수된 신고목록 확인<br>
							 - 업체별 신고 현황 파악<br>
							 <br>
							8) 공지관리<br>
							 - 사이트별 공지 CRUD 진행<br>
							 <br>
							9) 문의관리<br>
							 - 플랫폼 대 기업 게시판형태로 문의 접수 및 답변<br>
							 - 플랫폼 대 고객 1:1 채팅서비스로 문의 접수 및 답변<br>
							 <br>
							10) 컨텐츠관리<br>
							 - 포인트를 활용할 수 있는 간단한 오락컨텐츠 제작 및 배포<br>
							 - 확률/보상 상세수치 설정<br>
							 <br>
							11) 광고관리<br>
							 - 광고신청 건에 대해 관리(게시/반려/마감/완료)<br>
							 - 광고이력 조회<br>
							 - 광고분석 (사이트별/배너위치별/연령/성별 빈도측정)<br>
							<br>
							12) 광고업체(독립된 별개의 웹페이지 사이트)<br>
							 - 광고회원가입 및 로그인<br>
							 - 광고신청 배너위치 및 단가 확인<br>						 
							<br>
							
							<h5 class="text-center">★★ 제작자 소개 ★★</h5>
							<div class="row">
								<div class="col-2 text-center">
									<img src="${pageContext.request.contextPath}/assets/iframe/kth_ace.jpg" style="width:120px; height:150px; margin-bottom:20px;">
									<br>김태환(팀장)
								</div>
								<div class="col-2 text-center">
									<img src="${pageContext.request.contextPath}/assets/iframe/khs.png" style="width:120px; height:150px; margin-bottom:20px;">
									<br>곽효상
								</div>
								<div class="col-2 text-center">
									<img src="${pageContext.request.contextPath}/assets/iframe/kjh.png" style="width:120px; height:150px; margin-bottom:20px;">
									<br>강지훈
								</div>
								<div class="col-2 text-center">
									<img src="${pageContext.request.contextPath}/assets/iframe/ksg.jpg" style="width:120px; height:150px; margin-bottom:20px;">
									<br>김수곤
								</div>
								<div class="col-2 text-center">
									<img src="${pageContext.request.contextPath}/assets/iframe/lhm.png" style="width:120px; height:150px; margin-bottom:20px;">
									<br>이호민
								</div>
								<div class="col-2 text-center">
									<img src="${pageContext.request.contextPath}/assets/iframe/jkh.jpg" style="width:120px; height:150px; margin-bottom:20px;">
									<br>조건희
								</div>
							</div>
							
							<br><br><br><br><br><br><br><br>
						</div>
					</div>
				</div>
			</main>
		
		<!-- 
		<a href="${pageContext.request.contextPath}/employee/emp/employeeOne">
			${loginEmp.employeeName}
		</a>
		
		로그인
		<c:if test="${loginEmp != null}">
			<a href="${pageContext.request.contextPath}/employee/emp/logout">로그아웃</a>
			<a href="${pageContext.request.contextPath}/employee/emp/employeeList">직원관리</a>
		</c:if>
		 -->
		
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