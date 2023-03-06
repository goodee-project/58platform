package goodee.gdj58.platform.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.platform.service.ReportService;

@Controller
public class ReportController {
	@Autowired ReportService reportService;
	
	@GetMapping("/employee/report/reportList")
	public String getReport(Model model
		, @RequestParam(value="reportCategory", defaultValue="예약") String reportCategory) {
		
		
		List<Map<String, Object>> reportList = reportService.getReport(reportCategory);
		
		model.addAttribute("reportCategory", reportCategory);
		model.addAttribute("reportList", reportList);
		
		return "report/getReport";
	}
}
