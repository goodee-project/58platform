package goodee.gdj58.platform.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.platform.service.QuestionService;
import goodee.gdj58.platform.vo.Question;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QuestionController {
	@Autowired QuestionService questionService;
	
	// 업체 문의사항에 답변달기
	@GetMapping("/employee/question/commentByCompany")
	public String commentByCompany(Model model
									, @RequestParam(value="questionNo") int questionNo) {
		
		log.debug("\u001B[31m" + questionNo + "<-- questionNo 디버깅");
		
		Question q = questionService.getQuestionByComment(questionNo);
		
		model.addAttribute("q", q);
		
		return "question/commentByCompany";
	}
	
	// 업체 문의사항 목록
	@GetMapping("/employee/question/questionListByCompany")
	public String questionList(Model model
								, @RequestParam(value = "serviceName", defaultValue = "쇼핑") String serviceName) {
		
		
		// serviceName이 쇼핑이면 쇼핑메서드, 예약이면 예약메서드 호출
		List<Map<String, Object>> list = null;
		
		if(serviceName.equals("쇼핑")) {
			list = questionService.getShoppingQuestionList();
		} else if (serviceName.equals("예약")) {
			list = questionService.getBookingQuestionList();
		}
		
		model.addAttribute("list", list);
		model.addAttribute("serviceName", serviceName);
		
		return "question/questionListByCompany";
	}
}
