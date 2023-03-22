package goodee.gdj58.platform.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.platform.mapper.CompanyMapper;
import goodee.gdj58.platform.service.CompanyService;
import goodee.gdj58.platform.service.ReportService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CompanyContoroller {
	@Autowired CompanyService companyService;
	@Autowired ReportService reportService;
	
	// 기업 주문정보 조회
	@GetMapping("/employee/company/companyOrderList")
	public String companyOrderList(Model model
			, @RequestParam(value="serviceName", defaultValue = "예약") String serviceName
			, @RequestParam(value="companyName", defaultValue = "예약") String companyName) {
		
		log.debug("\u001B[45m 기업 serviceName  : "+ serviceName);
		log.debug("\u001B[45m 기업 companyName  : "+ companyName);
		
		List<Map<String, Object>> companyOrderList = null;
		if(serviceName.equals("예약")) {
			companyOrderList = companyService.getBookingOrderList(companyName);
		} else if(serviceName.equals("쇼핑")) {
			companyOrderList = companyService.getShoppingOrderList(companyName);
			companyOrderList = companyService.getShoppingOrderList(companyName);
		}
		
		
		log.debug("\u001B[45m 기업주문 List  : "+ companyOrderList);
		
		model.addAttribute("companyOrderList", companyOrderList);
		model.addAttribute("serviceName", serviceName);
		
		return "company/companyOrderList";
	}
		
	// 기업 판매상품 조회
	@GetMapping("/employee/company/companySellList")
	public String companySellList(Model model
			, @RequestParam(value="serviceName", defaultValue = "예약") String serviceName
			, @RequestParam(value="companyName", defaultValue = "예약") String companyName) {
		
		log.debug("\u001B[45m 기업 serviceName  : "+ serviceName);
		log.debug("\u001B[45m 기업 companyName  : "+ companyName);
		
		List<Map<String, Object>> companySellList = null;
		if(serviceName.equals("예약")) {
			companySellList = companyService.getBookingProductList(companyName);
		} else if(serviceName.equals("쇼핑")) {
			companySellList = companyService.getShoppingGoodsList(companyName);
		}
		
		
		log.debug("\u001B[45m 기업판매 List  : "+ companySellList);
		
		model.addAttribute("companySellList", companySellList);
		model.addAttribute("serviceName", serviceName);
		
		return "company/companySellList";
	}
	
	// 신규등록 기업 조회
	@GetMapping("/employee/company/newCompanyList")
	public String newCompanyList(Model model
		, @RequestParam(value="serviceName", defaultValue = "쇼핑") String serviceName
		, @RequestParam(value="active", defaultValue = "") String active
        , @RequestParam(value="companyId", defaultValue = "") String companyId
        , @RequestParam(value="deactiveMemo", defaultValue = "") String deactiveMemo) {
		
		// 활성화, 비활성화 변경용
        log.debug("\u001B[43m" + active + "<-- active 디버깅");
        log.debug("\u001B[43m" + companyId + "<-- customerId customerList디버깅");

        if(active != null) {
        	companyService.modifyCompanyActive(companyId, active, deactiveMemo);
        }
        
		List<Map<String, Object>> newCompanyList = null;
		if(serviceName.equals("예약")) { // 예약 기업
			newCompanyList = companyService.getNewBookingCompanyList();
		} else if(serviceName.equals("쇼핑")) { // 쇼핑 기업
			newCompanyList = companyService.getNewShoppingCompanyList();
		}
		
		model.addAttribute("newCompanyList",newCompanyList);
		model.addAttribute("serviceName",serviceName);
		
		return "company/newCompanyList";	
	}
	
	// 기업 조회
	@GetMapping("/employee/company/companyList")
	public String companyList(Model model
		, @RequestParam(value="serviceName", defaultValue = "쇼핑") String serviceName) {
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
	@SuppressWarnings("null")
	@GetMapping("/employee/company/companyOne")
	public String companyOne(Model model
			, @RequestParam(value="serviceName", defaultValue = "쇼핑") String serviceName
			, @RequestParam(value="companyId", defaultValue = "") String companyId
			, @RequestParam(value="companyName", defaultValue = "") String companyName) {
		Map<String, Object> company = null;
		
		if(serviceName.equals("예약")) {
			company = companyService.getBookingCompanyOne(companyName);
			String companyAddtionService = (String) company.get("companyAddtionService");
			String [] arr = companyAddtionService.split(",");
			
			List<String> companyAddtionServiceList = new ArrayList<>();
			for(int i=0; i<arr.length; i++) { // 부가서비스 리스트
				companyAddtionServiceList.add(arr[i]);
				log.debug("\u001B[31m 서비스 종류 : "+companyAddtionServiceList.get(i));
			}
			
			
			model.addAttribute("companyAddtionServiceList", companyAddtionServiceList);
		} else if(serviceName.equals("쇼핑")) {
			company = companyService.getShoppingCompanyOne(companyName);
		}
		
		List<Map<String, Object>> reportList = reportService.getReportListForCompanyOne(serviceName, companyId);
		
		model.addAttribute("reportList", reportList);
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