<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyFaq</title>
	</head>
	<body>
		<h1>FAQ 수정</h1>
		<form action="${pageContext.request.contextPath}/employee/question/modifyFaq" method="post">
			<input type="hidden" name="faqNo" value="${f.faqNo}">
			<table border="1">
				<tr>
					<td>분류</td>
					<td>
						${f.serviceName}
					</td>
				</tr>
				<tr>
					<td>질문</td>
					<td>
						<textarea rows="10" cols="30" name="faqQuestion">${f.faqQuestion}</textarea>
					</td>
				</tr>
				<tr>
					<td>답변</td>
					<td>
						<textarea rows="10" cols="30" name="faqAnswer">${f.faqAnswer}</textarea>
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">수정</button>
			</div>
		</form>
	</body>
</html>