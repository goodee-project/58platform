package goodee.gdj58.platform.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import goodee.gdj58.platform.service.CompanyService;

@Controller
public class CompanyContoroller {
	@Autowired CompanyService companyService;
	
	// 기업 조회
	@GetMapping("/employee/company/companyList")
	public String companyList() {
		
		return "company/companyList";
	}
	
	// 기업 상세조회
	@GetMapping("/employee/company/companyOne")
	public String companyOne() {
		
		return "company/companyOne";
	}
	
	// 기업 활성화 승인
	@GetMapping("/employee/company/companySignUpCheck")
	public String companySignUpCheck() {
		
		return "company/companySignUpCheck";
	}
	
	// 탈퇴 기업 목록
	@GetMapping("/employee/company/deleteCompanyList")
	public String deleteCompanyList() {
		
		return "company/deleteCompanyList";
	}
	
	// 기업 정보변경 요청
	@GetMapping("/employee/company/updateCompanyList")
	public String updateCompanyList() {
		
		return "company/updateCompanyList";
	}
}