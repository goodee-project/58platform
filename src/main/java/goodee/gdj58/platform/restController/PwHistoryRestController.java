package goodee.gdj58.platform.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.platform.service.EmployeeService;
import goodee.gdj58.platform.vo.PwHistory;

@RestController
public class PwHistoryRestController {
	@Autowired EmployeeService employeeService;
	
	@GetMapping("/pwHistoryCk")
	public String pwck(PwHistory pwHistory) {
		return employeeService.getPwHistoryCk(pwHistory);
	}
}
