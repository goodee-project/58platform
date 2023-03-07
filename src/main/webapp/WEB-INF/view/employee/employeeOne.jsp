<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>employeeOne</title>
	</head>
	<body>
		직책 : ${m.employeeLevel}
		<h1>${loginEmp.employeeName}님의 개인정보</h1>
		<div>since ${m.createdate}(입사일)</div>
		<div>연락처 : ${m.employeePhone}</div>
		<div>e-mail : ${m.employeeEmail}</div>
		<a href="${pageContext.request.contextPath}/employee/emp/modifyEmployeeInfo">정보수정</a>
		<a href="${pageContext.request.contextPath}/employee/emp/modifyEmployeePw">비밀번호수정</a>
	</body>
</html>