<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addEmployee</title>
	</head>
	<body>
		<h1>직원등록</h1>
		<form action="${pageContext.request.contextPath}/employee/addEmployee" method="post">
			<input type="hidden" name="employeeLevel" value="사원">
			<table>
				<tr>
					<td>ID</td>
					<td>
						<input type="text" name="employeeId">
					</td>
				</tr>
				<tr>
					<td>Pw</td>
					<td>
						<input type="password" name="employeePw">
					</td>
				</tr>
				<tr>
					<td>PwCheck</td>
					<td>
						<input type="password" name="employeePwCk">
					</td>
				</tr>
				<tr>
					<td>Name</td>
					<td>
						<input type="text" name="employeeName">
					</td>
				</tr>
				<tr>
					<td>Phone</td>
					<td>
						<input type="text" name="employeePhone">
					</td>
				</tr>
				<tr>
					<td>Email</td>
					<td>
						<input type="text" name="employeeEmail">
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">등록</button>
			</div>
		</form>
	</body>
</html>