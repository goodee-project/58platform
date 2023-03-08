<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
	
	<!-- chart 	-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<!-- 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
	 -->

	
	<script src="/58platform/assets/plugins/chartjs/js/Chart.min.js"></script>
	<script src="/58platform/assets/plugins/chartjs/js/Chart.extension.js"></script>
    <script src="/58platform/assets/plugins/chartjs/js/chartjs-custom.js"></script>
    
	<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.4.120/pdf.min.js" integrity="sha512-ml/QKfG3+Yes6TwOzQb7aCNtJF4PUyha6R3w8pSTo/VJSywl7ZreYvvtUso7fKevpsI+pYVVwnu82YO0q3V6eg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.debug.js"></script>
	<title>Insert title here</title>
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
							<li class="breadcrumb-item active" aria-current="page">페이충전통계(차트)</li>
						</ol>
					</nav>
				</div>
			</div>
			<!--end breadcrumb-->
			<div class="row">
				<div class="col-xl-9 mx-auto">
					<h6 class="mb-0 text-uppercase">일별/월별/연별/기간별 페이충전금액 차트</h6>
					<hr/>
					<div class="card">
						<div class="card-body">
							<div class="chart-container1">
								<!-- PDF/EXCEL 추출 -->
								<div class="text-end">
									<button onclick="downloadPDF()" class="btn btn-sm btn-danger">PDF</button>
								</div>

								<!-- 기간설정 -->
								<div>									
									<form method="post" id="form">
										조회 기간
										<input type="date" name="startDate" value="${startDate}">
										~
										<input type="date" name="endDate" value="${endDate}">
										<input type="hidden" name="ymd" value="${ymd}">
										<button type="button" id="btn2" class="btn btn-sm btn-success">조회</button>
										<a href="${pageContext.request.contextPath}/employee/sales/payStatisticsChart" class="btn btn-sm btn-info">reset</a>
									</form>
								</div>
								
								<div id="canvas">
									<canvas id="payChart" class="chartjs-render-monitor"></canvas>
								</div>
								<!-- 차트 모델값을 가져오는 코드 -->
								<script>
									// 모델 데이터 가져온 후에 아래 차트가 그려져야 한다 -> 동기로 처리해야 한다
									// async값을 false로 변경  참고 => https://api.jquery.com/jQuery.ajax/
									let xModel = []; // 키배열
									let yModel = []; // 합배열
									$.ajax({
										async : false
										, url : '/58platform/payStatisticsChart'
										, type : 'get'
										, success : function(model) { // model : /restapi/monthData 백엔드에서 객체로 반환 -> 변환이 필요
											for(let attr in model) { // attr에는 키(속성)값 {1:500, 2:400}
												xModel.push(model[attr].date);
												yModel.push(model[attr].totalSavePay);
											}
										}
									});
								</script>
								
								<!-- 차트를 그리는 코드 -->
								<script>
								var xValues = xModel;
								var yValues = yModel;
								
								
								new Chart("payChart", {
									type: "bar",
									data: {
										labels: xValues,
										datasets: [{
											label: '일일 페이충전금',
											barPercentage: .5,
											backgroundColor: "#6CC0FF",
									     	data: yValues
									    }]
									},
									options: {
										tooltips: {
											enabled: true
										},
										scales: {
											xAxes: [{
												barPercentage: .4,
												ticks: {
													beginAtZero: true,
													fontColor: '#585757'
												},
												gridLines: {
													display: true,
													color: "rgba(0, 0, 0, 0.07)"
												},
											}],
											yAxes: [{
												ticks: {
													beginAtZero: true,
													fontColor: '#585757'
												},
												gridLines: {
													display: true,
													color: "rgba(0, 0, 0, 0.07)"
												},
											}]
										},

										legend: {
											display: true,
											labels: {
												fontColor: '#585757',
												boxWidth: 40
											}
										},
									}
								});
								
								// PDF 추출
								function downloadPDF(){
									const canvas = document.getElementById('payChart');
									// 이미지생성
									const canvasImg = canvas.toDataURL('image/jpeg', 1.0);
									console.log(canvasImg)
									
									let pdf = new jsPDF('landscape');
									pdf.setFontSize(20);
									pdf.addImage(canvasImg, 'JPEG', 15, 15, 280, 150);
									pdf.save('myChart.pdf');
								}
								</script>
																
								<script>
								$('#btn2').click(function() {
									let xModel = []; // 키배열
									let yModel = []; // 합배열
									
									$.ajax({
										async : false
										, url : '/58platform/payStatisticsChart'
										, data : $('#form').serialize()
										, type : 'get'
										, success : function(model) { // model : /restapi/monthData 백엔드에서 객체로 반환 -> 변환이 필요
											for(let attr in model) { // attr에는 키(속성)값 {1:500, 2:400}
												xModel.push(model[attr].date);
												yModel.push(model[attr].totalSavePay);
											}
										}
									});
									
									var xValues = xModel;
									var yValues = yModel;
									var barColors = '#6CC0FF';
									
									$('#payChart').remove();
									$('.chartjs-hidden-iframe').remove();
									$('#canvas').append('<canvas id="payChart"><canvas>');
									
									new Chart("payChart", {
									  type: "bar",
									  data: {
									    labels: xValues,
									    datasets: [{
									      backgroundColor: barColors,
									      data: yValues
									    }]
									  },
									  options: {
										scales: {
											yAxes: [{
												ticks: {
												}
											}]
										},
									    legend: {display: false},
									    title: {
									      display: true,
									      text: "페이충전현황"
									    }
									  }
									});
								})
								</script>
							</div>
						</div>
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