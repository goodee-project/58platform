package goodee.gdj58.platform.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.platform.service.CompanyService;

@Controller
public class CompanyContoroller {
	@Autowired CompanyService companyService;
	
	// 기업 조회
	@GetMapping("/employee/company/companyList")
	public String companyList(Model model
		, @RequestParam(value="serviceName", defaultValue = "예약") String serviceName) {
		List<Map<String, Object>> companyList = null;
		
		if(serviceName.equals("예약")) { // 예약 기업
			companyList = companyService.getBookingCompanyList();
		} else if(serviceName.equals("쇼핑")) { // 쇼핑 기업
			companyList = companyService.getShoppingCompanyList();
		}
		
		model.addAttribute("companyList", companyList);
		model.addAttribute("serviceName", serviceName);
		
		return "company/companyList";
	}
	
	// 기업 상세조회
	@GetMapping("/employee/company/companyOne")
	public String companyOne(Model model
			, @RequestParam(value="serviceName", defaultValue = "예약") String serviceName
			, @RequestParam(value="companyName", defaultValue = "예약") String companyName) {
		Map<String, Object> company = null;
		
		if(serviceName.equals("예약")) {
			company = companyService.getBookingCompanyOne();
		} else if(serviceName.equals("쇼핑")) {
			company = companyService.getShoppingCompanyOne();
		}
		
		model.addAttribute("company", company);
		model.addAttribute("serviceName", serviceName);
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