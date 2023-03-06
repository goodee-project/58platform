package goodee.gdj58.platform.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.platform.service.EmployeeService;

@RestController
public class EmployeeRestController {
	@Autowired EmployeeService employeeService;
	
	@GetMapping("/employeeIdck")
	public String idck(@RequestParam(value = "employeeId") String employeeId) {
		return employeeService.getEmployeeIdCk(employeeId);
	}
}
