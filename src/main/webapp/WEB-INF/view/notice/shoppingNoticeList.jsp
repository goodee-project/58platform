<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Shopping Notice List</title>
	</head>
	<body>
		<!-- 임시 메뉴바 -->
		<div>
		<input type="button" value="뒤로가기" onclick="history.back();">
		<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
		</div>
		
		<div>
			<a href="${pageContext.request.contextPath}/notice/noticeList?serviceName=${'쇼핑'}">쇼핑</a>
			<a href="${pageContext.request.contextPath}/notice/noticeList?serviceName=${'예약'}">예약</a>
		</div>
		
		<h1>Shopping Notice List</h1>
		
		<!-- Notice contents.. -->
		<table border="1">
			<tr>
				<th>번호</th>
				<th>분류</th>
				<th>제목</th>
				<th>작성일</th>
			</tr>
			<c:forEach var="e" items="${list}">
				<tr>
					<td>${e.noticeNo}</td>
					<td>${e.serviceName}</td>
					<td>${e.noticeTitle}</td>
					<td>${e.createdate}</td>
				</tr>
			</c:forEach>
		</table>
		
		
		
		<!-- 공지사항 추가-->
		<div>
			<a href="${pageContext.request.contextPath}/notice/addNotice">공지사항 등록</a>
		</div>
	</body>
</html>
