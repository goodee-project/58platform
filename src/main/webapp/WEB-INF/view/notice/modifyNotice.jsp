<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Modify Notice</title>
</head>
	<body>
		<h1>공지 수정</h1>
		
		<div>
			<input type="button" value="뒤로가기" onclick="history.back();">
		</div>
		
		<div>
		<!-- Notice modfiy Form.. -->
		<form method="post" action="${pageContext.request.contextPath}/employee/notice/modifyNotice">
			<table border="1">
				<input type="hidden" name="noticeNo" value="${n.noticeNo}">
				<tr>
					<th>분류</th>
					<td>
						<input type="text" name="serviceName" value="${n.serviceName}" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>
						<input type="text" name="noticeTitle" value="${n.noticeTitle}" placeholder="제목을 입력하세요">
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<textarea rows="5" cols="80" name="noticeMemo" placeholder="내용을 입력하세요">${n.noticeMemo}</textarea>
					</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>
						<input type="text" name="createdate" value="${n.createdate}" readonly="readonly">
					</td>
				</tr>	
				<tr>
					<th>최종 수정일</th>
					<td>
						<input type="text" name="updatedate" value="${n.updatedate}" readonly="readonly">
					</td>
				</tr>
			</table>
			<button type="submit" id="addBtn">공지 수정</button>
		</form>
		</div>
	</body>
</html>
