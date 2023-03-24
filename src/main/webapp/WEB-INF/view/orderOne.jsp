<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>주문번호</th>
				<th>기업명</th>
				<th>고객ID</th>
				<th>상품명</th>
				<th>주문수량</th>
				<th>가격</th>
				<th>주문상태</th>
				<th>주문일</th>
		   	</tr>
		</thead>	
		
	   	<tbody>
			<c:forEach var="l" varStatus="vs" items="${list}">
				<tr>
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
		</tbody>
	</table>
</body>
</html>