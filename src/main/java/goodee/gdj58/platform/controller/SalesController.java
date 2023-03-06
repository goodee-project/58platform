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
	
	// 페이머니 충전 통계 (일/월/연/기간별 조회)
	@GetMapping("/employee/sales/payStatistics")
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
		
		// 기간설정된 경우 기간에따른 총 페이머니 및 건수 조회
		if(startDate != "" && endDate != "") {
			Map<String,Object> map = salesService.getCntAndSumByPeriod(startDate, endDate);
			model.addAttribute("map",map);
		}
		
		model.addAttribute("list",list);
		model.addAttribute("ymd",ymd);
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);
		model.addAttribute("totalSavePayAllTime",totalSavePayAllTime);
		return "sales/payStatistics";
	}
	
	// 회원의 페이머니 충전 내역 통계 (기간)
	@GetMapping("/employee/sales/paySaveHistory")
	public String getSavePayHistoryByCustomer(Model model
											, @RequestParam(value="startDate", defaultValue="") String startDate
											, @RequestParam(value="endDate", defaultValue="") String endDate) {
		// log.debug("\u001B[46m"+"테스트");
		log.debug("\u001B[46m"+"startDate : "+startDate);
		
		// 기간설정된 경우 기간에따른 총 페이머니 및 건수 조회
		if(startDate != "" && endDate != "") {
			Map<String,Object> map = salesService.getCntAndSumByPeriod(startDate, endDate);
			model.addAttribute("map",map);
		}
		
		List<Map<String,Object>> list = salesService.getSavePayListByCustomer(startDate, endDate);
		model.addAttribute("list",list);
		model.addAttribute("startDate",startDate);
		model.addAttribute("endDate",endDate);
		
		return "sales/paySaveHistory";
	}
	
}
