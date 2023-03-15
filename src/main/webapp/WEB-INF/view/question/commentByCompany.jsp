<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>commentByCompany</title>
	</head>
	<body>
		<c:choose>
			<c:when test="${m.questionComment eq null}">
				<h1>답변작성</h1>
				${msg}
				<form action="${pageContext.request.contextPath}/employee/question/addCommentByCompany" method="post">
					<input type="hidden" name="questionNo" value="${m.questionNo}">
					<input type="hidden" name="serviceName" value="${m.serviceName}">
					<table border="1">
						<tr>
							<td>분류</td>
							<td>
								${m.serviceName}
							</td>
						</tr>
						<tr>
							<td>문의기업명</td>
							<td>
								${m.companyName}
							</td>
						</tr>
						<tr>
							<td>문의제목</td>
							<td>
								${m.questionTitle}
							</td>
						</tr>
						<tr>
							<td>문의내용</td>
							<td>
								${m.questionMemo}
							</td>
						</tr>
						<tr>
							<td>답변</td>
							<td>
								<textarea rows="10" cols="30" name="questionComment"></textarea>
							</td>
						</tr>
					</table>
					<div>
						<button type="submit">답변등록</button>
					</div>
				</form>
			</c:when>
			<c:when test="${m.questionComment ne null}">
				<h1>답변수정</h1>
				${msg}
				<form action="${pageContext.request.contextPath}/employee/question/modifyCommentByCompany" method="post">
					<input type="hidden" name="questionNo" value="${m.questionNo}">
					<input type="hidden" name="serviceName" value="${m.serviceName}">
					<table border="1">
						<tr>
							<td>분류</td>
							<td>
								${m.serviceName}
							</td>
						</tr>
						<tr>
							<td>문의기업명</td>
							<td>
								${m.companyName}
							</td>
						</tr>
						<tr>
							<td>문의제목</td>
							<td>
								${m.questionTitle}
							</td>
						</tr>
						<tr>
							<td>문의내용</td>
							<td>
								${m.questionMemo}
							</td>
						</tr>
						<tr>
							<td>답변</td>
							<td>
								<textarea rows="10" cols="30" name="questionComment">${m.questionComment}</textarea>
							</td>
						</tr>
					</table>
					<div>
						<button type="submit">답변수정</button>
					</div>
				</form>
			</c:when>
		</c:choose>
		
	</body>
</html>