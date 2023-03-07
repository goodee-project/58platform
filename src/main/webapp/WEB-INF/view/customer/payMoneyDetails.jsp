<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>customerList</title>
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
		<th>잔여포인트</th>		
	</tr>
	<tr>
		<td>${p.customerPoint}</td>
	</tr>
	<tr>
		<th>no</th>
		<th>페이머니</th>
		<th>사용처</th>
		<th>내역</th>
		<th>날짜</th>
	</tr>
	<c:forEach var="p" items="${list}">
		<tr>
			<td>${p.no}</td>
			<td>${p.price}</td>
			<td>${p.payHistoryCategory}</td>
			<td>${p.payHistoryContent}</td>
			<td>${p.createdate}</td>
		</tr>
	</c:forEach>
	</table>
</body>
</html>