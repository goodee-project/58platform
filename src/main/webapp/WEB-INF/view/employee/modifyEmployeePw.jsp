<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en" class="semi-dark">
	<head>
		<meta charset="UTF-8">
		<title>modifyEmployeePw</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="icon" href="/58platform/assets/images/favicon-32x32.png" type="image/png" />
		<!--plugins-->
		<link href="/58platform/assets/plugins/simplebar/css/simplebar.css" rel="stylesheet" />
		<link href="/58platform/assets/plugins/perfect-scrollbar/css/perfect-scrollbar.css" rel="stylesheet" />
		<link href="/58platform/assets/plugins/metismenu/css/metisMenu.min.css" rel="stylesheet" />
		<link href="/58platform/assets/plugins/datatable/css/dataTables.bootstrap5.min.css" rel="stylesheet" />
		
		<!-- Bootstrap CSS -->
		<link href="/58platform/assets/css/bootstrap.min.css" rel="stylesheet" />
		<link href="/58platform/assets/css/bootstrap-extended.css" rel="stylesheet" />
		<link href="/58platform/assets/css/style.css" rel="stylesheet" />
		<link href="/58platform/assets/css/icons.css" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
		
		<!-- loader-->
		<link href="/58platform/assets/css/pace.min.css" rel="stylesheet" />
		
		
		<!--Theme Styles-->
		<link href="/58platform/assets/css/dark-theme.css" rel="stylesheet" />
		<link href="/58platform/assets/css/light-theme.css" rel="stylesheet" />
		<link href="/58platform/assets/css/semi-dark.css" rel="stylesheet" />
		<link href="/58platform/assets/css/header-colors.css" rel="stylesheet" />
		
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
		<style>
			.po {
				positoin : relative;
				top : 500px;
			}
		</style>
	</head>
	<body>
		<div class="wrapper">
			<!--start header -->
			<c:import url="/WEB-INF/inc/header.jsp"></c:import>
			<!--start sidebar -->
			<c:import url="/WEB-INF/inc/sideMenu.jsp"></c:import>
			<div class="po" align="center">
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
			</div>
		</div>
	</body>
</html>