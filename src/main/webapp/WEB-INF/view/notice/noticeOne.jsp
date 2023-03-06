<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>NoticeOne</title>
	</head>
	<body>
		<!-- 임시 메뉴바 -->
		<div>
			<input type="button" value="뒤로가기" onclick="history.back();">
			<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
		</div>
		
		<h1> NoticeOne</h1>
		
		<!-- NoticeOne contents.. -->
		<table border="1">
			<tr>
				<th>번호</th>
				<th>분류</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일</th>
				<th>수정일</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			<tr>
				<td>${n.noticeNo}</td>
				<td>${n.serviceName}</td>
				<td>${n.noticeTitle}</td>
				<td>${n.noticeMemo}</td>
				<td>${n.createdate}</td>
				<td>${n.updatedate}</td>
				<td>
					<a href="${pageContext.request.contextPath}/employee/notice/modifyNotice?noticeNo=${n.noticeNo}">
						수정
					</a>
				</td>
				<td>
					<a href="${pageContext.request.contextPath}/employee/notice/removeNotice?noticeNo=${n.noticeNo}">
						삭제
					</a>
				</td>
			</tr>
		</table>
	</body>
</html>