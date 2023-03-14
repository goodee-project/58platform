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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
	<script>
		$(document).ready(function() {
			$("#AllCk").click(function(){
			    var checked = $('#AllCk').is(':checked');
			    
			    if(checked) {
			    	$('input:checkbox').prop('checked',true);
			    } else {
			    	$('input:checkbox').prop('checked',false);
			    }
			});
			
			$('#modifyBtn').click(function(){
				if($('.orderNo:checked').length < 1) {
					alert('하나 이상 체크해주세요');
					return;
				} else {
					$('#modifyForm').submit();
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
					<div class="breadcrumb-title pe-3">배송</div>
					<div class="ps-3">
						<nav aria-label="breadcrumb">
							<ol class="breadcrumb mb-0 p-0">
								<li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
								</li>
								<li class="breadcrumb-item active" aria-current="page">배송접수</li>
							</ol>
						</nav>
					</div>
				</div>
				<!--end breadcrumb-->
				<h6 class="mb-0 text-uppercase">배송접수현황 (요청)</h6>
				<hr/>
				<div class="card">
					<div class="card-body">
						<div class="table-responsive">
							<form id="modifyForm" method="post" action="${pageContext.request.contextPath}/employee/delivery/deliveryBegin">						
								<table id="example" class="table table-striped table-bordered" style="width:100%">
									<thead>
										<tr>
											<th>
												<!-- 전체선택 -->
												<input type="checkbox" id="AllCk">
											</th>
											<th>상품</th>
											<th>업체정보</th>
											<th>주문가격</th>
											<th>주문수량</th>
											<th>배송상태</th>
											<th>구매자정보</th>
											<th>주문날짜</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="d" items="${list}">
											<tr>
												<td style="width:30px;">
													<input type="checkbox" class="orderNo" name="orderNo" value="${d.orderNo}">
												</td>
												<td>
													<img src="${pageContext.request.contextPath}/img/${d.goodsImg}" style="width:150px;">
													<p>${d.goodsName}</p>
												</td>
												<td>
													${d.companyName}<br>
													${d.companyPhone}
												</td>
												<td>
													<fmt:formatNumber type="number" value="${d.orderPrice}"/> 원
												</td>
												<td>${d.orderQuantity}</td>
												<td>
													${d.orderState}
												</td>
												<td style="width:200px;">
													<div>
													ID(이름) : ${d.customerId} (${d.customerName}님)
													</div>
													<div>
													연락처 : ${d.customerPhone}
													</div>
													<p>
													<br>-주소-<br>
													${d.customerAddress} <br>
													${d.addressName}
													</p>
												</td>
												<td>${d.orderDate}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<button type="button" id="modifyBtn" class="btn btn-sm btn-danger">배송시작</button>
							</form>
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