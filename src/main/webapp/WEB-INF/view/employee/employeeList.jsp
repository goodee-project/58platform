<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>employeeList</title>
	</head>
	<body>
		<a href="${pageContext.request.contextPath}/employee/addEmployee">직원등록</a>
		<h1>직원목록</h1>
		<table border="1">
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>직위</th>
				<th>상태</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>입사일</th>
			</tr>
			<c:forEach var="e" items="${list}">
				<tr>
					<td>${e.employeeId}</td>
					<td>${e.employeeName}</td>
					<td>${e.employeeLevel}</td>
					<td>${e.totalIdActive}</td>
					<td>${e.employeePhone}</td>
					<td>${e.employeeEmail}</td>
					<td>${e.createdate}</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>