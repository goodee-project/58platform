package goodee.gdj58.platform.restController;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.platform.service.CompanyService;

@RestController
public class CompanyRestController {
	@Autowired CompanyService companyService;
	
	@GetMapping("/getOrderOne")
	public List<Map<String, Object>> getOrderOne(
		@RequestParam(value = "reportCategory", defaultValue="쇼핑") String reportCategory
		, @RequestParam(value = "content", defaultValue="1") String content) {
		
		List<Map<String, Object>> list = null;
		
		if(reportCategory.equals("쇼핑")) {
			list = companyService.getShoppingOrderListOne(content);
		} else {
			list = companyService.getBookingOrderListOne(content);
		}
		
			return list;	
	}
}
