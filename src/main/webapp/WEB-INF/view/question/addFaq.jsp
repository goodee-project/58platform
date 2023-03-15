<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addFaq</title>
	</head>
	<body>
		<h1>FAQ 등록</h1>
		<form action="${pageContext.request.contextPath}/employee/question/addFaq" method="post">
			<table border="1">
				<tr>
					<td>분류</td>
					<td>
						<select name="serviceName">
							<option>==분류선택==</option>
							<option value="쇼핑">쇼핑</option>
							<option value="예약">예약</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>질문</td>
					<td>
						<textarea rows="10" cols="30" name="faqQuestion"></textarea>
					</td>
				</tr>
				<tr>
					<td>답변</td>
					<td>
						<textarea rows="10" cols="30" name="faqAnswer"></textarea>
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">등록</button>
			</div>
		</form>
	</body>
</html>