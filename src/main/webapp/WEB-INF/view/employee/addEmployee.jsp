<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>addEmployee</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<script>
			$(document).ready(function() {
				$('#ckBtn').click(function(){
					$.ajax({
						url:'${pageContext.request.contextPath}/employeeIdck'
						, type:'get'
						, data : {employeeId:$('#id').val()}
						, success:function(model){ // model : 'YES' / 'NO'
							if(model=='YES') {
								// 사용가능한 아이디
								$('#employeeId').val($('#id').val());
							} else {
								// 사용중인 아이디
								alert($('#id').val()+'는 사용중인 아이디입니다.');
							}
						}
					});
				});
			});
		</script>
	</head>
	<body>
		<h1>직원등록</h1>
		<div>
			<input type="text" id="id">
			<button type="button" id="ckBtn">중복검사</button>
		</div>
		<form action="${pageContext.request.contextPath}/employee/emp/addEmployee" method="post">
			<input type="hidden" name="employeeLevel" value="사원">
			<table>
				<tr>
					<td>ID</td>
					<td>
						<input type="text" name="employeeId" id="employeeId" readonly="readonly">
					</td>
				</tr>
				<tr>
					<td>Pw</td>
					<td>
						<input type="password" name="employeePw">
					</td>
				</tr>
				<tr>
					<td>PwCheck</td>
					<td>
						<input type="password" name="employeePwCk">
					</td>
				</tr>
				<tr>
					<td>Name</td>
					<td>
						<input type="text" name="employeeName">
					</td>
				</tr>
				<tr>
					<td>Phone</td>
					<td>
						<input type="text" name="employeePhone">
					</td>
				</tr>
				<tr>
					<td>Email</td>
					<td>
						<input type="text" name="employeeEmail">
					</td>
				</tr>
			</table>
			<div>
				<button type="submit">등록</button>
			</div>
		</form>
	</body>
</html>