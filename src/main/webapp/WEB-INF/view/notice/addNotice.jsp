<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Add Notice</title>
</head>
	<body>
		<h1>공지 등록</h1>
		<form method="post" action="${pageContext.request.contextPath}/notice/addNotice">
			<table border="1">
				<tr>
					<th>분류</th>
					<td>
						<input type="text" name="serviceName" value="${serviceName}">
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="noticeTitle" placeholder="제목을 입력하세요">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea rows="5" cols="80" name="serviceName" placeholder="내용을 입력하세요"></textarea>
					</td>
				</tr>
			</table>
			<button type="submit" id="addBtn">공지 추가</button>
		</form>
	</body>
</html>
