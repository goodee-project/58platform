<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--start sidebar -->
        <aside class="sidebar-wrapper" data-simplebar="true">
          <div class="sidebar-header">
	            <div>
	              <img src="/58platform/assets/images/logo-icon.png" class="logo-icon" alt="logo icon">
	            </div>
	            <a href="${pageContext.request.contextPath}/employee/emp/main">
	              <h4 class="logo-text">Snacked</h4>
	            </a>
	            <div class="toggle-icon ms-auto"> <i class="bi bi-list"></i>
	            </div>
          </div>
          <!--navigation-->
          <ul class="metismenu" id="menu">
            <li class="menu-label">Pages</li>
            <li>
              <a class="has-arrow company" href="javascript:;">
                <div class="parent-icon"><i class="bi bi-person-fill"></i>
                </div>
                <div class="menu-title">회원</div>
              </a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/employee/customer/customerList"><i class="bi bi-circle"></i>회원조회</a></li>
                <li><a href="${pageContext.request.contextPath}/employee/customer/inactiveCustomerList"><i class="bi bi-circle"></i>탈퇴 회원조회</a></li>
              </ul>
            </li>
            <li>
              <a class="has-arrow company" href="javascript:;">
                <div class="parent-icon"><i class="bi fadeIn animated bx bx-buildings"></i>
                </div>
                <div class="menu-title">기업</div>
              </a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/employee/company/companyList"><i class="bi bi-circle"></i>기업조회</a></li>
                <li><a href="${pageContext.request.contextPath}/employee/company/companySignUpCheck"><i class="bi bi-circle"></i>기업 활성화 승인</a></li>
                <li><a href="${pageContext.request.contextPath}/employee/company/deleteCompanyList"><i class="bi bi-circle"></i>탈퇴 기업목록 조회</a></li>
              </ul>
            </li>
            <li>
              <a class="has-arrow employee" href="javascript:;">
                <div class="parent-icon"><i class="bi bi-file-person-fill"></i>
                </div>
                <div class="menu-title">직원</div>
              </a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/employee/emp/employeeList"><i class="bi bi-circle"></i>직원조회</a></li>
                <li><a href="${pageContext.request.contextPath}/employee/emp/addEmployee"><i class="bi bi-circle"></i>직원등록</a></li>
              </ul>
            </li>
            <li>
              <a class="has-arrow company" href="javascript:;">
                <div class="parent-icon"><i class="bi bi-truck"></i>
                </div>
                <div class="menu-title">배송</div>
              </a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/employee/delivery/deliveryReceive"><i class="bi bi-circle"></i>배송접수</a></li>
              	<li><a href="#" onclick="alert('구현중입니다.');return false;"><i class="bi bi-circle"></i>배송관리</a></li>
                <li><a href="#" onclick="alert('구현중입니다.');return false;"><i class="bi bi-circle"></i>환불관리</a></li>
              </ul>
            </li>
            <li>
              <a class="has-arrow report" href="javascript:;">
                <div class="parent-icon"><i class="bi bi-question-circle-fill"></i>
                </div>
                <div class="menu-title">문의</div>
              </a>
              <ul>
                <li><a href="#" onclick="alert('구현중입니다.');return false;"><i class="bi bi-circle"></i>1:1 채팅(고객)</a></li>
                <li><a href="${pageContext.request.contextPath}/employee/question/questionListByCompany"><i class="bi bi-circle"></i>문의조회(기업)</a></li>
                <li><a href="${pageContext.request.contextPath}/employee/question/faqList"><i class="bi bi-circle"></i>FAQ</a></li>
              </ul>
            </li>
            <li>
              <a class="has-arrow report" href="javascript:;">
                <div class="parent-icon"><i class="bi bi-exclamation-triangle-fill"></i>
                </div>
                <div class="menu-title">신고</div>
              </a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/employee/report/reportList?reportCategory=쇼핑"><i class="bi bi-circle"></i>신고조회(쇼핑)</a></li>
                <li><a href="${pageContext.request.contextPath}/employee/report/reportList?reportCategory=예약"><i class="bi bi-circle"></i>신고조회(예약)</a></li>
              </ul>
            </li>
            <li>
              <a class="has-arrow notice" href="javascript:;">
                <div class="parent-icon"><i class="bi bi-megaphone-fill"></i>
                </div>
                <div class="menu-title">공지사항</div>
              </a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/employee/notice/noticeList?serviceName=쇼핑"><i class="bi bi-circle"></i>공지사항(쇼핑)</a></li>
                <li><a href="${pageContext.request.contextPath}/employee/notice/noticeList?serviceName=예약"><i class="bi bi-circle"></i>공지사항(예약)</a></li>
              </ul>
            </li>
            <li>
              <a class="has-arrow company" href="javascript:;">
                <div class="parent-icon"><i class="bi bi-cash-coin"></i>
                </div>
                <div class="menu-title">정산</div>
              </a>
              <ul>
                <li><a href="#" onclick="alert('구현중입니다.');return false;"><i class="bi bi-circle"></i>쇼핑몰 정산(표)</a></li>
              	<li><a href="#" onclick="alert('구현중입니다.');return false;"><i class="bi bi-circle"></i>쇼핑몰 정산(차트)</a></li>
                <li><a href="#" onclick="alert('구현중입니다.');return false;"><i class="bi bi-circle"></i>예약 정산(표)</a></li>
              	<li><a href="#" onclick="alert('구현중입니다.');return false;"><i class="bi bi-circle"></i>예약 정산(차트)</a></li>
              </ul>
            </li>
            <li>
              <a class="has-arrow company" href="javascript:;">
                <div class="parent-icon"><i class="bi bi-bar-chart-line-fill"></i>
                </div>
                <div class="menu-title">통계</div>
              </a>
              <ul>
                <li><a href="${pageContext.request.contextPath}/employee/sales/payStatistics"><i class="bi bi-circle"></i>페이충전통계(표)</a></li>
                <li><a href="${pageContext.request.contextPath}/employee/sales/payStatisticsChart"><i class="bi bi-circle"></i>페이충전통계(차트)</a></li>
                <li><a href="${pageContext.request.contextPath}/employee/sales/paySaveHistory"><i class="bi bi-circle"></i>회원페이충전이력</a></li>
                <li><a href="${pageContext.request.contextPath}/employee/sales/vipCustomer"><i class="bi bi-circle"></i>큰손 회원 통계(VIP)</a></li>
              	<li><a href="#" onclick="alert('구현중입니다.');return false;"><i class="bi bi-circle"></i>광고매출통계(표)</a></li>
                <li><a href="#" onclick="alert('구현중입니다.');return false;"><i class="bi bi-circle"></i>광고매출통계(차트)</a></li>
              </ul>
            </li>
          </ul>
          <!--end navigation-->
       </aside>
       <!--end sidebar -->