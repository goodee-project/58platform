<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>modifyEmployeePw</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				// 수정버튼 눌러서 비밀번호 이력테이블에 없으면 변경 있으면 변경불가
				$('#ckBtn').click(function(){
					$.ajax({
						url:'${pageContext.request.contextPath}/pwHistoryCk'
						, type:'get'
						, data : {id:$('#id').val(), password:$('#pw').val()} 
						, success:function(model){ // model : 'YES' / 'NO'
							if(model=='YES') {
								// 사용가능한 아이디
								$('#pwForm').submit();
							} else if(model=='NO' || $('#oldPw').val() == $('#pw').val()) {
								// pw_history에 있는 비밀번호
								alert('사용불가능한 비밀번호입니다.');
							}
						}
					});
				});
			});
		</script>
	</head>
	<body>
		직책 : ${e.employeeLevel}
		<h1>${loginEmp.employeeName}님의 개인정보</h1>
		<form action="${pageContext.request.contextPath}/employee/emp/modifyEmployeePw" method="post" id="pwForm">
			<input type="hidden" name="id" value="${loginEmp.employeeId}" id="id">
			<table border="1">
				<tr>
					<td>기존 비밀번호</td>
					<td>
						<input type="password" name="oldPw" id="oldPw">
					</td>
				</tr>
				<tr>
					<td>새 비밀번호</td>
					<td>
						<input type="password" name="newPw" id="pw">
					</td>
				</tr>
				<tr>
					<td>새 비밀번호 확인</td>
					<td>
						<input type="password" name="newPwCk">
					</td>
				</tr>
			</table>
			<div>
				<button type="button" id="ckBtn">수정</button>
				<a href="${pageContext.request.contextPath}/employee/emp/employeeOne">취소</a>
			</div>
		</form>
	</body>
</html>