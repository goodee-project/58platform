<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

  <title>주문조회</title>
</head>
<body>
	<table class="table mb-0" style="text-align:center">	
   		<c:if test="${reportCategory eq '쇼핑'}">
   			<thead class="table-dark">
				<tr>
					<th>상품이미지</th>
					<th>주문번호</th>
					<th>기업명</th>
					<th>고객ID</th>
					<th>상품명</th>
					<th>주문수량</th>
					<th>
						<span>결제금액( 전체금액 -</span>
						<span style="color:blue">랭크할인</span> -
						<span style="color:red">포인트</span>)
					</th>
					<th>주문상태</th>
					<th>주문일</th>
			   	</tr>
			</thead>
			
   			<tbody>
	   			<c:forEach var="l" varStatus="vs" items="${list}">
					<tr>
						<td><img src="${pageContext.request.contextPath}/img/${l.goodsImgSaveName}" style="width:150px;"></td>
						<td>${l.orderSheetNo}</td>
						<td>${l.companyName}</td>
						<td>${l.customerId}</td>
						<td>${l.goodsName}</td>
						<td>${l.goodsOrderQuantity}</td>
						<td><fmt:formatNumber value="${(l.goodsOrderPrice * (100 - l.reward) * 0.01) - l.goodsOrderUsePoint}"/> (<fmt:formatNumber value="${l.goodsOrderPrice}"/> - <fmt:formatNumber value="${l.goodsOrderPrice * l.reward * 0.01}" /> - <fmt:formatNumber value="${l.goodsOrderUsePoint}"/>)</td>
						<td>${l.orderSheetState}</td>
						<td>${l.createdate}</td>
					</tr>
			</c:forEach>
   		</c:if>
	   		
   		<c:if test="${reportCategory eq '예약'}">
  			<thead class="table-dark">
				<tr>
					<th>예약번호</th>
					<th>기업명</th>
					<th>예약명</th>
					<th>예약옵션</th>
					<th>예약인원</th>
					<th>
						<span>결제금액( 전체금액 -</span>
						<span style="color:blue">랭크할인</span> -
						<span style="color:red">포인트</span>)
					</th>
					<th>예약일</th>
					<th>주문상태</th>
					<th>고객ID</th>
					<th>주문일</th>
			   	</tr>
			</thead>
		
  			<tbody>
	   			<c:forEach var="l" varStatus="vs" items="${list}">
					<tr>
						<td>${l.bookingNo}</td>
						<td>${l.companyName}</td>
						<td>${l.bookingProductName}</td>
						<td>${l.bookingProductOptionMemo}</td>
						<td>${l.bookingPeople}</td>
						<td>
							<span>${l.bookingTotalPrice}( ${l.bookingPrice} - </span>
							<span style="color:blue">${l.bookingRankDiscount}</span> - 
							<span style="color:red">${l.bookingUsePoint}</span> )
						</td>
						<td>${l.bookingDate}</td>
						<td>${l.bookingState}</td>
						<td>${l.customerId}</td>
						<td>${l.bookingRequestDate}</td>
					</tr>
				</c:forEach>
			</tbody>
   		</c:if>
	</table>
	
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
	$(document).ready(function() {
		
	});
  </script>
</body>
</html>