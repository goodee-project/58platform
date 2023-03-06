package goodee.gdj58.platform.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import goodee.gdj58.platform.service.CustomerService;

@Controller
public class CustomerController {
	@Autowired CustomerService customerService;
	
	// 회원조회
	@GetMapping("/employee/customer/customerList")
	public String customerList() {
		
		return "customer/customerList";
	}
	
	// 회원조회 상세
	@GetMapping("/employee/customer/customerOne")
	public String customerOne() {
		
		return "customer/customerOne";
	}
	
	// 회원 포인트 내역조회
	@GetMapping("/employee/customer/pointDetails")
	public String pointDetails() {
		
		return "customer/pointDetails";
	}
	
	// 회원 페이머니 내역조회
	@GetMapping("/employee/customer/paymoneyDetails")
	public String paymoneyDetails() {
		
		return "customer/paymoneyDetails";
	}
	
	// 탈퇴 회원조회
	@GetMapping("/employee/customer/inactiveCustomerList")
	public String inactiveCustomerList() {
		
		return "customer/inactiveCustomerList";
	}
}
