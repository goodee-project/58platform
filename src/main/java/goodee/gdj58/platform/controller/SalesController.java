package goodee.gdj58.platform.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.platform.service.SalesService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class SalesController {
	@Autowired SalesService salesService;
	
	@GetMapping("/sales/payStatistics")
	public String getSavePayList(Model model
									// ymd : year/month/date (연별/월별/일별)
									, @RequestParam(value="ymd", defaultValue="d") String ymd
									, @RequestParam(value="startDate", defaultValue="") String startDate
									, @RequestParam(value="endDate", defaultValue="") String endDate) {
		// log.debug("\u001B[46m"+"sales컨트롤러진입");
		log.debug("\u001B[46m"+"ymd : "+ymd);
		log.debug("\u001B[46m"+"startDate : "+startDate);
		log.debug("\u001B[46m"+"endDate : "+endDate);
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
		int totalSavePayAllTime = salesService.getTotalSavePayAllTime();
		
		model.addAttribute("list",list);
		model.addAttribute("ymd",ymd);
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);
		model.addAttribute("totalSavePayAllTime",totalSavePayAllTime);
		return "sales/payStatistics";
	}
}
