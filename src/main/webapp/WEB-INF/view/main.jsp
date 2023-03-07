<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>main</title>
	</head>
	<body>
		<a href="${pageContext.request.contextPath}/employee/emp/employeeOne">
			${loginEmp.employeeName}
		</a>
		
		로그인
		<c:if test="${loginEmp != null}">
			<a href="${pageContext.request.contextPath}/employee/emp/logout">로그아웃</a>
			<a href="${pageContext.request.contextPath}/employee/emp/employeeList">직원관리</a>
		</c:if>
	</body>
</html>