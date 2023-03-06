<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>
	</head>
	<body>
		<h1>로그인</h1>
		<form action="${pageContext.request.contextPath}/login" method="post">
			<table border="1">
				<tr>
					<td>ID</td>
					<td>
						<input type="text" name="employeeId" value="admin">
					</td>
				</tr>
				<tr>
					<td>PW</td>
					<td>
						<input type="password" name="employeePw" value="1234">
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">Login</button>
			</div>
		</form>
	</body>
</html>