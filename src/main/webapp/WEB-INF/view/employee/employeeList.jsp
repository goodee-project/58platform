<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>employeeList</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('.changeLevel').change(function() {
					$(this.form).submit();
				});
			});
		</script>
	</head>
	<body>
		<c:if test="${loginEmp != null}">
			<a href="${pageContext.request.contextPath}/employee/emp/employeeOne">${loginEmp.employeeName}(${loginEmp.employeeLevel})</a>
			<a href="${pageContext.request.contextPath}/employee/emp/logout">로그아웃</a>
		</c:if>
		<a href="${pageContext.request.contextPath}/employee/emp/addEmployee">직원등록</a>
		<a href="${pageContext.request.contextPath}/login">뒤로</a>
		<h1>직원목록</h1>
		<c:choose>
			<c:when test="${loginEmp.employeeLevel eq '총관리자'}">
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
							<td>
								<form action="${pageContext.request.contextPath}/employee/emp/employeeList" method="get" id="changeForm">
									<input type="hidden" name="id" value="${e.employeeId}">
									<c:if test="${e.employeeLevel ne '총관리자'}">
										<select name="changeLevel" class="changeLevel">
											<c:if test="${e.totalIdActive eq '활성화'}">
												<option value="활성화">활성화</option>
												<option value="비활성화">비활성화</option>
											</c:if>
											<c:if test="${e.totalIdActive eq '비활성화'}">
												<option value="활성화">활성화</option>
												<option value="비활성화" selected="selected">비활성화</option>
											</c:if>
										</select>
									</c:if>
								</form>
								<c:if test="${e.employeeLevel eq '총관리자'}">
									${e.totalIdActive}
								</c:if>
							</td>
							<td>${e.employeePhone}</td>
							<td>${e.employeeEmail}</td>
							<td>${e.createdate}</td>
						</tr>
					</c:forEach>
				</table>
			</c:when>
			<c:otherwise>
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
			</c:otherwise>
		</c:choose>
	</body>
</html>