package goodee.gdj58.platform.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import goodee.gdj58.platform.service.NoticeService;

@RestController
public class NoticeRestController {
	@Autowired NoticeService noticeService;
	
	@GetMapping("/noticeTitleCk")
	public String idck(@RequestParam(value = "noticeTitle") String noticeTitle) {
		return noticeService.getNoticeTitleCk(noticeTitle);
	}
}
