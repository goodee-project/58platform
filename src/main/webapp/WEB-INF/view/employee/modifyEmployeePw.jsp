<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyEmployeePw</title>
	</head>
	<body>
		직책 : ${e.employeeLevel}
		<h1>${loginEmp.employeeName}님의 개인정보</h1>
		<form action="${pageContext.request.contextPath}/employee/emp/modifyEmployeePw" method="post">
			<table border="1">
				<tr>
					<td>기존 비밀번호</td>
					<td>
						<input type="password" name="oldPw">
					</td>
				</tr>
				<tr>
					<td>새 비밀번호</td>
					<td>
						<input type="password" name="newPw">
					</td>
				</tr>
				<tr>
					<td>새 비밀번호 확인</td>
					<td>
						<input type="password" name="newPwCk">
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