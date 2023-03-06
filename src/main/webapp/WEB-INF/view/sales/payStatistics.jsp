<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>페이머니 조회</h1>
	
	<!-- 누적총액확인 -->
	<div>
		누적충전금액(All Time) : 
		<fmt:formatNumber type="number" value="${totalSavePayAllTime}"/> (￦)
	</div>
	
	<!-- 일/월/연별 조회하기 -->
	<div>
		<a href="${pageContext.request.contextPath}/sales/payStatistics?ymd=d&startDate=${startDate}&endDate=${endDate}">일별</a>
		<a href="${pageContext.request.contextPath}/sales/payStatistics?ymd=m&startDate=${startDate}&endDate=${endDate}">월별</a>
		<a href="${pageContext.request.contextPath}/sales/payStatistics?ymd=y&startDate=${startDate}&endDate=${endDate}">연별</a>
	</div>
	
	<!-- 기간설정 -->
	<div>
		<form action="${pageContext.request.contextPath}/sales/payStatistics">
			조회 기간
			<input type="date" name="startDate" value="${startDate}">
			~
			<input type="date" name="endDate" value="${endDate}">
			<input type="hidden" name="ymd" value="${ymd}">
			<button type="submit">조회</button>
		</form>
	</div>
	
	<!-- 목록출력 -->
	<table border="1">
		<thead>
			<tr>
				<th>일/월/연</th>
				<th>충전총액(￦)</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="p" items="${list}">
				<tr>
					<td>${p.date}</td>
					<td>${p.totalSavePay}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
</body>
</html>