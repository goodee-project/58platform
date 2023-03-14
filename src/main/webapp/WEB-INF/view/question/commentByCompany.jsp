<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>commentByCompany</title>
	</head>
	<body>
		<h1>답변작성</h1>
		<form action="${pageContext.request.contextPath}/employee/question/commentByCompany" method="post">
			<table border="1">
				<tr>
					<td>문의제목</td>
					<td>
						${q.questionTitle}
					</td>
				</tr>
				<tr>
					<td>문의내용</td>
					<td>
						<textarea rows="10" cols="10">${q.questionMemo}</textarea>
					</td>
				</tr>
				<tr>
					<td>답변</td>
					<td>
						<textarea rows="10" cols="10" name="questionComment"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>