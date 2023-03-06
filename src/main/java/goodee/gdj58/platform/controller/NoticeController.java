package goodee.gdj58.platform.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.platform.service.NoticeService;
import goodee.gdj58.platform.vo.Notice;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {
	@Autowired NoticeService noticeService;
	
	
	
	// 공지사항 상세보기 
	
	// 공지사항 추가
	@GetMapping("/notice/addNotice") public String addNotice(Model model
																,@RequestParam(value="serviceName", defaultValue = "쇼핑") String serviceName) {
		model.addAttribute("serviceName",serviceName);
		return "notice/addNotice";
	}
	
	@PostMapping("/notice/addNotice") public String addNotice(Notice notice) {
		int row = noticeService.addNotice(notice); 
		if(row == 0) {
			return "/notice/addNotice"; 
		}
		
		log.debug("\u001B[31m 공지 추가 : "+notice.getServiceName());
		log.debug("\u001B[31m 공지 추가 : "+notice.getNoticeTitle());
		
		if(notice.getServiceName().equals("예약")) {
			return "notice/bookingNoticeList";	
		}
		return "redirect:/notice/noticeList"; 
	}
	
	
	// 공지사항 리스트 
	@GetMapping("/notice/noticeList")
	public String shoppingNoticeList(Model model
										,@RequestParam(value="serviceName", defaultValue = "쇼핑") String serviceName) {
		
		List<Notice> list = noticeService.getShoppingNoticeList(serviceName);
		
		model.addAttribute("list", list); 
		if(serviceName.equals("예약")) {
			log.debug("\u001B[31m 리스트 출력 : "+serviceName);
			model.addAttribute("serviceName",serviceName);
			return "notice/bookingNoticeList";	
		}
		
		return "notice/shoppingNoticeList";	
	}
}
