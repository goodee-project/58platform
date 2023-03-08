package goodee.gdj58.platform.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IntegrationController {
	
	@GetMapping("/integrationPage")
	public String integrationPage() {
		
		return "integrationPage";
	}
}
