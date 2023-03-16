package goodee.gdj58.platform.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import goodee.gdj58.platform.service.EmployeeService;
import goodee.gdj58.platform.vo.Employee;
import goodee.gdj58.platform.vo.EmployeeInfo;
import goodee.gdj58.platform.vo.PwHistory;
import goodee.gdj58.platform.vo.TotalId;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EmployeeController {
	@Autowired EmployeeService employeeService;
	
	// 직원 비밀번호 변경 액션
	@PostMapping("/employee/emp/modifyEmployeePw")
	public String modifyEmployeePw(HttpSession session, PwHistory pwHistory, Model model
									, @RequestParam(value="newPw") String newPw
									, @RequestParam(value="oldPw") String oldPw) {
		
		// 비밀번호 2개 디버깅
		log.debug("\u001B[31m" + newPw + "<-- newPw 디버깅");
		log.debug("\u001B[31m" + oldPw + "<-- oldPw 디버깅");
		
		// 세션정보 불러오기
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		String employeeId = loginEmp.getEmployeeId();
		String id = loginEmp.getEmployeeId();
		
		// 비밀번호 변경 디버깅
		log.debug("\u001B[31m" + employeeId + "<-- employeeId 디버깅");
		// 비밀번호 변경시 이력 테이블에 들어갈 id 디버깅
		log.debug("\u001B[31m" + id + "<-- id 디버깅");
		
		// pwHistory vo 타입에 olePw, employeeId 저장
		pwHistory.setPassword(newPw);
		pwHistory.setId(employeeId);
		
		Employee emp = employeeService.getEmployeePwCkByModify(employeeId, oldPw);
		if(emp == null) {
			model.addAttribute("msg", "현재 비밀번호를 확인해주세요.");
			return "employee/modifyEmployeePw";
		}
		log.debug("\u001B[31m" + emp + "<-- emp 디버깅");
		
		// 비밀번호 수정 메서드 호출
		int row = employeeService.modifyEmployeePw(newPw, employeeId, oldPw, id, pwHistory);
		
		log.debug("\u001B[31m" + row + "<-- row 디버깅");
		
		return "redirect:/employee/emp/logout";		
	}
	
	// 직원 비밀번호 변경 폼
	@GetMapping("/employee/emp/modifyEmployeePw")
	public String modifyEmployeePw(Model model, HttpSession session) {
		
		// 세션정보 불러오기
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		String employeeId = loginEmp.getEmployeeId();
		
		// 직원 비밀번호 수정을 위한 조회 메서드 호출
		Employee employee = employeeService.getEmployeePwByModify(employeeId);
		
		model.addAttribute("e", employee);
		
		return "employee/modifyEmployeePw";
	}
	
	// 직원 개인정보 수정 액션
	@PostMapping("/employee/emp/modifyEmployeeInfo")
	public String modifyEmployee(EmployeeInfo employeeInfo, HttpSession session) {
		
		// 디버깅
		log.debug("\u001B[31m" + employeeInfo + "<-- changeLevel 디버깅");
		
		// 세션 정보 불러오기
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		String employeeId = loginEmp.getEmployeeId();
		
		// employeeInfo vo에 employeeId 지정
		employeeInfo.setEmployeeId(employeeId);
		
		// 직원 개인정보 수정 메서드 호출
		employeeService.modifyEmployeeInfo(employeeInfo);
		
		return "redirect:/employee/emp/employeeOne";
	}
	
	/* 직원 개인정보 수정폼
	@GetMapping("/employee/emp/modifyEmployeeInfo")
	public String modifyEmployee(Model model, HttpSession session) {
		
		// 세션정보 불러오기
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		String employeeId = loginEmp.getEmployeeId();
		
		// 직원 개인정보 수정을 위한 조회 메서드 호출
		Map<String, Object> map = employeeService.getEmployeeByModify(employeeId);
		
		model.addAttribute("m", map);
		
		return "employee/modifyEmployeeInfo";
	}
	*/
	
	// 직원 myPage
	@GetMapping("/employee/emp/employeeOne")
	public String employeeOne(Model model, String employeeId, HttpSession session) {
		
		// 세션정보 불러오기
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		employeeId = loginEmp.getEmployeeId();
		
		// 직원 개인정보 메서드 호출
		Map<String, Object> map = employeeService.getEmployeeOne(employeeId);
		
		model.addAttribute("m", map);
		
		return "employee/employeeOne";
	}
	
	// 직원등록 폼
	@GetMapping("/employee/emp/addEmployee")
	public String addEmployee(HttpSession session, Model model
								, @RequestParam(value="msg", required = false) String msg) {
		
		// 세션정보 불러오기
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		if(!loginEmp.getEmployeeLevel().equals("총관리자")) {
			model.addAttribute("msg", "사원은 접근불가");
			model.addAttribute("url", "/58platform/employee/emp/employeeList");
			return "alert";
		}
		
		if(msg != null) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/58platform/employee/emp/addEmployee");
			return "alert";
		}
		
		
		return "employee/addEmployee";
	}
	
	// 직원등록 액션
	@PostMapping("/employee/emp/addEmployee")
	public String addEmployee(ServletRequest request, RedirectAttributes redirectAttributes
								, Employee employee
								, EmployeeInfo employeeInfo
								, TotalId totalId
								, PwHistory pwHistory) throws UnsupportedEncodingException {
		
		log.debug("\u001B[31m" + employee + "<-- employee 디버깅");
		log.debug("\u001B[31m" + employeeInfo + "<-- employeeInfo 디버깅");
		
		String msg = "필수정보를 전부 입력해주세요.";
		
		// redirect시 보낼 파라미터
		redirectAttributes.addAttribute("msg", msg);
		
		// null, 공백 체크
		if(employee.getEmployeeId() == null || employee.getEmployeeId().equals("")
				|| employee.getEmployeeName() == null || employee.getEmployeeName().equals("")
				|| employee.getEmployeePw() == null || employee.getEmployeePw().equals("")
				|| employeeInfo.getEmployeeEmail() == null || employeeInfo.getEmployeeEmail().equals("")
				|| employeeInfo.getEmployeePhone() == null || employeeInfo.getEmployeePhone().equals("")
				|| totalId.getId() == null || totalId.getId().equals("")) {
			return "redirect:/employee/emp/addEmployee";
		}
		
		// 직원 아이디 통합아이디에 저장
		String id = employee.getEmployeeId();
		totalId.setId(id);
		
		// pw_history에 넣을 데이터 저장
		pwHistory.setId(employee.getEmployeeId());
		pwHistory.setPassword(employee.getEmployeePw());
		
		// 직원등록 메서드 호출
		employeeService.addEmployee(totalId, employee, employeeInfo, pwHistory);
		
		return "redirect:/employee/emp/employeeList";
	}
	
	// 직원 목록
	@GetMapping("/employee/emp/employeeList")
	public String employeeList(Model model, HttpSession session
								, @RequestParam(value="changeLevel", defaultValue = "") String changeLevel
								, @RequestParam(value="id", defaultValue = "") String id) {
		// 세션정보 불러오기
		Employee loginEmp = (Employee)session.getAttribute("loginEmp");
		String employeeLevel = loginEmp.getEmployeeLevel();
		log.debug("\u001B[31m" + changeLevel + "<-- changeLevel 디버깅");
		log.debug("\u001B[31m" + id + "<-- id 디버깅");
		
		// 활성화가 들어오면 활성화시키기 비활성화가 들어오면 비활성화시
		if(changeLevel.equals("활성화")) {
			employeeService.modifyEmployeeActive(id);
		} else if(changeLevel.equals("비활성화")) {
			employeeService.modifyEmployeeDeactive(id);
		}
		log.debug("\u001B[31m" + changeLevel + "<-- changeLevel 디버깅");
		
		// 직원목록 메서드 호출
		List<Map<String, Object>> list = employeeService.getEmployeeList();
		
		model.addAttribute("list", list);
		model.addAttribute("employeeLevel", employeeLevel);
		return "employee/employeeList";
	}
	
	// 로그아웃
	@GetMapping("/employee/emp/logout")
	public String logout(HttpSession session) {
		
		// 세션 삭제
		session.invalidate();
		
		return "redirect:/login";
	}
	
	// 통합페이지
	@GetMapping("/employee/emp/logout/integrationPage")
	public String logoutIntegrationPage(HttpSession session) {
		
		// 세션 삭제
		session.invalidate();
		
		return "redirect:/integrationPage";
	}
	
	
	// 직원 로그인 폼
	@GetMapping("/login")
	public String login(Model model
							, @RequestParam(value="msg", required = false) String msg) {
		
		if(msg != null) {
			model.addAttribute("msg", msg);
			model.addAttribute("url", "/58platform/login");
			return "alert";
		}
		
		return "login";
	}
	
	// 직원 로그인 액션
	@PostMapping("/login")
	public String login(HttpSession session, Employee employee, Model model, RedirectAttributes redirectAttributes) {
		
		log.debug("\u001B[31m" + employee + "<-- employee 로그인 할때 디버깅");
		
		String msg = "필수정보를 입력해주세요.";
		
		// redirect시 보낼 파라미터
		redirectAttributes.addAttribute("msg", msg);
		
		// null, 공백체크
		if(employee.getEmployeeId() == null || employee.getEmployeeId().equals("")
				|| employee.getEmployeePw() == null || employee.getEmployeePw().equals("")) {
			return "redirect:/login";
		}
		
		// 로그인 정보 불러오는 메서드 호출
		Employee loginEmp = employeeService.login(employee);
		
		// 로그인 실패시 메시지와 함께 redirect
		if(loginEmp == null) {
			model.addAttribute("msg", "존재하지않는 아이디거나 패스워드가 일치하지않습니다.");
			return "login";
		}
		
		// 세션에 저장
		session.setAttribute("loginEmp", loginEmp);
		
		return "redirect:/employee/emp/main";
	}
	
	// main(로그인테스트용)
	@GetMapping("/employee/emp/main")
	public String main(HttpSession session) {
		
		return "main";
	}
}
