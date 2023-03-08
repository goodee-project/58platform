package goodee.gdj58.platform.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import goodee.gdj58.platform.service.NoticeService;
import goodee.gdj58.platform.vo.Notice;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class NoticeController {
	@Autowired NoticeService noticeService;

	
	// 공지사항 수정 
	@PostMapping("/employee/notice/modifyNotice") 
	public String modifyNotice(Model model, Notice notice) {
		
	   log.debug("\u001B[45m 수정공지번호 : "+ notice);
	    
	   model.addAttribute("notice", notice); 
	   
	   int row = noticeService.modifyNotice(notice);
	   if(row == 0) {
	      return "redirect:/employee/notice/modifyNotice?noticeNo="+notice.getNoticeNo();
	      
	   } 
	   return "redirect:/employee/notice/noticeOne?noticeNo="+notice.getNoticeNo(); 
 }
	
	
	// 공지사항 삭제
	@GetMapping("/employee/notice/removeNotice") 
	public String removeNotice(Model model, RedirectAttributes redirectAttributes
									,@RequestParam(value="noticeNo") int noticeNo
									,@RequestParam(value="serviceName", defaultValue = "쇼핑") String serviceName) {
		log.debug("\u001B[45m 삭제공지번호 : "+ noticeNo);
		redirectAttributes.addAttribute("serviceName", serviceName);
		
		int row = noticeService.removeNotice(noticeNo);
		if(row == 0) {
			return "notice/noticeOne"; 
		}
		
		return "redirect:/employee/notice/noticeList";
	}
	
	// 공지사항 상세보기 
	@GetMapping("/employee/notice/noticeOne") 
	public String noticeOne(Model model
								,@RequestParam(value="noticeNo") int noticeNo
								,@RequestParam(value="serviceName", defaultValue = "쇼핑") String serviceName) {
		log.debug("\u001B[45m 상세공지번호 : "+ noticeNo);
		
		Notice notice = noticeService.getNoticeOne(noticeNo);
		model.addAttribute("serviceName", serviceName); 
		model.addAttribute("n", notice); 
		return "notice/noticeOne";
	}
	
	// 공지사항 추가
	@GetMapping("/employee/notice/addNotice") 
	public String addNotice(Model model
								,@RequestParam(value="serviceName", defaultValue = "쇼핑") String serviceName) {
		log.debug("\u001B[45m 서비스명 : "+ serviceName);
		model.addAttribute("serviceName",serviceName);
		return "notice/addNotice";
	}
	@PostMapping("/employee/notice/addNotice") 
	public String addNotice(Model model, Notice notice, RedirectAttributes redirectAttributes
								,@RequestParam(value="serviceName", defaultValue = "쇼핑") String serviceName) {
		
		log.debug("\u001B[45m 공지 추가 : "+notice.getServiceName());
		log.debug("\u001B[45m 공지 추가 : "+notice.getNoticeTitle());
		
		model.addAttribute("serviceName",serviceName);
		int row = noticeService.addNotice(notice); 
		if(row == 0) {
			return "redirect:/employee/notice/addNotice"; 
		}
		
		log.debug("\u001B[45m 다시보낼 공지 : "+serviceName);
		redirectAttributes.addAttribute("serviceName", serviceName);
		return "redirect:/employee/notice/noticeList"; 
	}
	
	
	// 공지사항 리스트 
	@GetMapping("/employee/notice/noticeList")
	public String shoppingNoticeList(Model model
										,@RequestParam(value="serviceName", defaultValue = "쇼핑") String serviceName) {
		
		log.debug("\u001B[45m 리스트 출력 : "+serviceName);
		List<Notice> list = noticeService.getShoppingNoticeList(serviceName);
		
		model.addAttribute("serviceName",serviceName);
		model.addAttribute("list", list); 
		return "notice/noticeList";
	}
	
}
