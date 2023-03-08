<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en" class="semi-dark">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
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
	  function calculateAge() {
		  const birthDate = new Date(${c.customerBirth});

		// 생일로부터 오늘까지의 시간 차이를 계산합니다.
		const timeDiff = Date.now() - birthDate.getTime();

		// 연도로 변환합니다.
		const ageDate = new Date(timeDiff);

		// 계산된 나이를 가져옵니다.
		const calculatedAge = Math.abs(ageDate.getUTCFullYear() - 1970);

		// 나이를 보여줄 HTML 엘리먼트를 선택하여 텍스트를 변경합니다.
		$('#customerBirth').text(calculatedAge);
		
		/* 
		  var birthdate = document.getElementById("customerBirth").value;
		  var today = new Date();
		  var age = today.getFullYear() - new Date(birthdate).getFullYear() + 1;
		  
		  // 만 나이 계산
		  var koreanAge = age;
		  if (new Date(birthdate).getMonth() > today.getMonth()) {
		    koreanAge -= 1;
		  } else if (new Date(birthdate).getMonth() == today.getMonth() && new Date(birthdate).getDate() > today.getDate()) {
		    koreanAge -= 1;
		  }
  		  ${'#customerBirth'}.text(koreanAge);
		 */
		}
  </script>
  <title>고객 상세조회</title>
</head>

<body>


  <!--start wrapper-->
  <div class="wrapper">
       	<!--start header -->
		<c:import url="/WEB-INF/inc/header.jsp"></c:import>
		<!--end header -->
		
		<!--start sidebar -->
		<c:import url="/WEB-INF/inc/sideMenu.jsp"></c:import>
		<!--end sidebar -->

		<!--breadcrumb-->
		<div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
			<div class="breadcrumb-title pe-3">Tables</div>
			<div class="ps-3">
				<nav aria-label="breadcrumb">
					<ol class="breadcrumb mb-0 p-0">
						<li class="breadcrumb-item"><a href="javascript:;"><i class="bi bi-exclamation-triangle-fill"></i></a>
							회원관리
						</li>
						<li class="breadcrumb-item active" aria-current="page">회원상세정보</li>
					</ol>
				</nav>
			</div>
		</div>
		<!--end breadcrumb-->
		
       	<!--start content-->
        <main class="page-content">            
        	<div class="row">        		
				<c:forEach var="c" items="${list}">
					<div class="col-12 col-lg-4">
						<div class="card shadow-sm border-0 overflow-hidden">
							<div class="card-body">
								<div class="profile-avatar text-center">
									<img src="/58platform/assets/images/avatars/${c.customerImgSaveName}" class="rounded-circle shadow" width="120" height="120" alt="">
								</div>
								<div class="text-center mt-4">
									<h4 class="mb-1">${c.customerName}, <span id="customerBirth"><input type="text" value="${c.customerBirth}">${c.customerBirth}</span>, ${c.customerGender}</h4>
									<div class="mt-4"></div>
								</div>
								<hr>								
								<label class="form-label">잔여 포인트</label>
								<div class="input-group col-12">
									<input type="text" class="form-control" value="${c.customerPoint}" aria-label="customerPoint" aria-describedby="pointDetails">
									<a href="${pageContext.request.contextPath}/employee/customer/pointDetails?customerId=${c.customerId}">
										<button class="btn btn-outline-secondary" id="pointDetails">내역</button>
									</a>
								</div>								
								<label class="form-label mt-3">잔여 페이머니</label>
								<div class="input-group col-12">
									<input type="text" class="form-control" value="${c.customerPay}" aria-label="customerPay" aria-describedby="payMoneydetails">
									<a href="${pageContext.request.contextPath}/employee/customer/payMoneyDetails?customerId=${c.customerId}">
										<button class="btn btn-outline-secondary" id="payMoneydetails">내역</button>
									</a>
								</div>
							</div>
						</div>
					</div>
	            	<div class="col-12 col-lg-8">
						<div class="card shadow-sm border-0">
							<div class="card-body">
								<h5 class="mb-0">My Account</h5>
								<hr>
								<div class="card shadow-none border">
									<div class="card-header">
										<h6 class="mb-0">USER INFORMATION</h6>
									</div>
									<div class="card-body">
										<form class="row g-3">
											<div class="col-6">
												<label class="form-label">회원 아이디</label>
												<input type="text" class="form-control" value="${c.customerId}">
											</div>
											<div class="col-6">
												<label class="form-label">회원 닉네임</label>
												<input type="text" class="form-control" value="${c.customerNickname}">
											</div>
											<div class="col-6">
												<label class="form-label">회원등급</label>
												<input type="text" class="form-control" value="${c.customerRank}">
											</div>
											<div class="col-6">
												<label class="form-label">가입일</label>
												<input type="text" class="form-control" value="${c.createdate}">
											</div>
										</form>
									</div>
								</div>                      
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!--end row-->

  		</main>
       <!--end page main-->


       <!--start overlay-->
        <div class="overlay nav-toggle-icon"></div>
       <!--end overlay-->

        <!--Start Back To Top Button-->
        <a href="javaScript:;" class="back-to-top"><i class='bx bxs-up-arrow-alt'></i></a>
        <!--End Back To Top Button-->
        
  </div>
  <!--end wrapper-->


  <!-- Bootstrap bundle JS -->
  <script src="/58platform/assets/js/bootstrap.bundle.min.js"></script>
  <!--plugins-->
  <script src="/58platform/assets/js/jquery.min.js"></script>
  <script src="/58platform/assets/plugins/simplebar/js/simplebar.min.js"></script>
  <script src="/58platform/assets/plugins/metismenu/js/metisMenu.min.js"></script>
  <script src="/58platform/assets/plugins/perfect-scrollbar/js/perfect-scrollbar.js"></script>
  <script src="/58platform/assets/js/pace.min.js"></script>
  <!--app-->
  <script src="/58platform/assets/js/app.js"></script>
</body>
</html>