package goodee.gdj58.platform.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.platform.service.SalesService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class SalesChartRestController {
	@Autowired SalesService salesService;
	
	@GetMapping("/payStatisticsChart")
	public List<Map<String, Object>> payStatisticsChart(Model model
			, @RequestParam(value="ymd", defaultValue="d") String ymd
			, @RequestParam(value="startDate", defaultValue="") String startDate
			, @RequestParam(value="endDate", defaultValue="") String endDate) {
		log.debug("\u001B[46m"+"rest/startDate : "+startDate);
		String kind = "%Y-%m-%d";
		if(ymd.equals("d")) {
			kind = "%Y-%m-%d";
		}
		if(ymd.equals("m")) {
			kind = "%Y-%m";
		}
		if(ymd.equals("y")) {
			kind = "%Y";
		}
		List<Map<String,Object>> list = salesService.getSavePayListByDate(kind, startDate, endDate);
		model.addAttribute("ymd",ymd);
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);
		model.addAttribute("list", list);
		
		return list;
	}
}
