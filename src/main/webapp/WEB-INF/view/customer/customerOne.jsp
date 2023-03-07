<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customerOne</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$('#active').change(function() {
			$('#changeForm').submit();
			alert('change')
		});
	});
</script>
</head>
<body>
	<table border="1">
	<tr>
		<th>ID</th>
		<th>이름</th>
		<th>닉네임</th>
		<th>회원등급</th>
		<th>잔여 페이머니</th>
		<th>회원 나이</th>
		<th>회원 성별</th>
		<th>가입일</th>
	</tr>
	<c:forEach var="c" items="${list}">
		<tr>
			<td>${c.customerId}</td> 
			<td>${c.customerName}</td>
			<td>${c.customerRank}</td>
			<td>				
				<form action="${pageContext.request.contextPath}/employee/customer/customerList" method="get" id="changeForm">
					<input type="hidden" name="customerId" value="${c.customerId}">
					<select name="active" id="active">
						<c:if test="${c.totalIdActive eq '활성화'}">
							<option value="활성화" selected="selected">활성화</option>
							<option value="비활성화">비활성화</option>
						</c:if>
						<c:if test="${c.totalIdActive eq '비활성화'}">
							<option value="활성화">활성화</option>
							<option value="비활성화" selected="selected">비활성화</option>
						</c:if>
					</select>
				</form>
			</td>
			<td>${c.createdate}</td>
			<td>
				<a type="button" href="${pageContext.request.contextPath}/customer/customerOne?customerId=${c.customerId}">보기</a>
			</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>