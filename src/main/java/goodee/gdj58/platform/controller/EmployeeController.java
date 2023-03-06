package goodee.gdj58.platform.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.platform.service.EmployeeService;
import goodee.gdj58.platform.vo.Employee;
import goodee.gdj58.platform.vo.EmployeeInfo;
import goodee.gdj58.platform.vo.TotalId;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	
	
	// 직원등록 폼
	@GetMapping("/employee/emp/addEmployee")
	public String addEmployee() {
		
		return "employee/addEmployee";
	}
	
	// 직원등록 액션
	@PostMapping("/employee/emp/addEmployee")
	public String addEmployee(ServletRequest request, Employee employee, EmployeeInfo employeeInfo, TotalId totalId) throws UnsupportedEncodingException {
		
		String id = employee.getEmployeeId();
		totalId.setId(id);
		
		employeeService.addEmployee(employee, employeeInfo, totalId);
		
		return "redirect:/employee/emp/employeeList";
	}
	
	// 직원 목록
	@GetMapping("/employee/emp/employeeList")
	public String employeeList(Model model) {
		
		List<Map<String, Object>> list = employeeService.getEmployeeList();
		
		model.addAttribute("list", list);
		
		return "employee/employeeList";
	}
	
	// 로그아웃
	@GetMapping("/employee/emp/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		return "redirect:/login";
	}
	
	// 직원 로그인 폼
	@GetMapping("/login")
	public String login() {
		
		return "login";
	}
	
	// 직원 로그인 액션
	@PostMapping("/login")
	public String login(HttpSession session, Employee employee) {
		
		Employee loginEmp = employeeService.login(employee);
		session.setAttribute("loginEmp", loginEmp);
		return "redirect:/employee/emp/main";
	}
	
	// main(로그인테스트용)
	@GetMapping("/employee/emp/main")
	public String main(HttpSession session) {
		
		return "main";
	}
}
