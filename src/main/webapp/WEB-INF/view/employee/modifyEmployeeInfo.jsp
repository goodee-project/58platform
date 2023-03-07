<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyEmployeeInfo</title>
	</head>
	<body>
		직책 : ${m.employeeLevel}
		<h1>${loginEmp.employeeName}님의 개인정보</h1>
		<form action="${pageContext.request.contextPath}/employee/emp/modifyEmployeeInfo" method="post">
			<table border="1">
				<tr>
					<td>Phone</td>
					<td>
						<input type="text" name="employeePhone" value="${m.employeePhone}">
					</td>
				</tr>
				<tr>
					<td>e-mail</td>
					<td>
						<input type="text" name="employeeEmail" value="${m.employeeEmail}">
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">수정</button>
				<a href="${pageContext.request.contextPath}/employee/emp/employeeOne">취소</a>
			</div>
		</form>
	</body>
</html>