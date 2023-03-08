package goodee.gdj58.platform.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.platform.service.CustomerService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CustomerController {
	@Autowired CustomerService customerService;
	
	// 회원조회	
    @GetMapping("/employee/customer/customerList")
    public String customerList(Model model
                                , @RequestParam(value="active", defaultValue = "") String active
                                , @RequestParam(value="customerId", defaultValue = "") String customerId) {

        log.debug("\u001B[44m" + active + "<-- active 디버깅");
        log.debug("\u001B[44m" + customerId + "<-- customerId customerList디버깅");

        if(active != null) {
        	customerService.modifyCustomerActive(customerId, active);
        }
        List<Map<String, Object>> list = customerService.getCustomerList();
        model.addAttribute("list", list);

        return "customer/customerList";
    }
	
	// 회원 상세조회
	@GetMapping("/employee/customer/customerOne")
	public String customerOne(Model model
								, @RequestParam(value="customerId", defaultValue = "") String customerId) {
        log.debug("\u001B[44m" + customerId + "<-- customerId pointDetails디버깅");
        
        customerId = "cus1"; //임시 이후 httpSession으로 변경예정
        List<Map<String, Object>> list = customerService.getCustomerOne(customerId);
        model.addAttribute("list", list);        
		
		return "customer/customerOne";
	}
	
	// 회원 포인트 내역조회
	@GetMapping("/employee/customer/pointDetails")
	public String pointDetails(Model model
    							, @RequestParam(value="customerId", defaultValue = "") String customerId) {
        log.debug("\u001B[44m" + customerId + "<-- customerId pointDetails디버깅");

        customerId = "cus1"; //임시 이후 httpSession으로 변경예정
        int customerPoint = customerService.getsCustomerPointList(customerId);
        List<Map<String, Object>> list = customerService.getPointDetails(customerId);
        model.addAttribute("customerPoint", customerPoint);
        model.addAttribute("list", list);
        
		return "customer/pointDetails";
	}
	
	// 회원 페이머니 내역조회
	@GetMapping("/employee/customer/payMoneyDetails")
	public String paymoneyDetails(Model model
    							, @RequestParam(value="customerId", defaultValue = "") String customerId) {
        log.debug("\u001B[44m" + customerId + "<-- customerId paymoneyDetails디버깅");
        
        customerId = "cus1"; //임시 이후 httpSession으로 변경예정
        int customerPayMoney = customerService.getsCustomerPayMoneyList(customerId);
        List<Map<String, Object>> list = customerService.getPayMoneyDetails(customerId);
        model.addAttribute("customerPayMoney", customerPayMoney);
        model.addAttribute("list", list);
        
		return "customer/payMoneyDetails";
	}
	
	// 탈퇴 회원조회
	@GetMapping("/employee/customer/inactiveCustomerList")
	public String inactiveCustomerList(Model model) {

        List<Map<String, Object>> list = customerService.getInactiveCustomerList();
        model.addAttribute("list", list);
		
		return "customer/inactiveCustomerList";
	}
}