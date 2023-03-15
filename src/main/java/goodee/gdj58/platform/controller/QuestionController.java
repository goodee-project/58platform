package goodee.gdj58.platform.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.platform.service.QuestionService;
import goodee.gdj58.platform.vo.Faq;
import goodee.gdj58.platform.vo.QuestionAnswer;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QuestionController {
	@Autowired QuestionService questionService;
	
	// FAQ 수정 폼
	@GetMapping("/employee/question/modifyFaq")
	public String modifyFaq(Model model
								, @RequestParam(value="faqNo") int faqNo) {
		
		log.debug("\u001B[31m" + faqNo + "<-- faqNo 디버깅");
		
		model.addAttribute("faqNo", faqNo);
		
		return "question/modifyFaq";
	}
	
	// FAQ 등록 액션
	@PostMapping("/employee/question/addFaq")
	public String addFaq(Faq faq) {

		log.debug("\u001B[31m" + faq + "<-- faq 디버깅");
		
		return "redirect:/employee/question/faqList";
	}
	
	// FAQ 등록 폼
	@GetMapping("/employee/question/addFaq")
	public String addFaq() {
		return "question/addFaq";
	}
	
	// FAQ 목록
	@GetMapping("/employee/question/faqList")
	public String faqList(Model model
							, @RequestParam(value="serviceName", defaultValue = "쇼핑") String serviceName) {
		
		log.debug("\u001B[31m" + serviceName + "<-- serviceName 디버깅");
		
		List<Map<String, Object>> list = questionService.getFaqList(serviceName);
		
		model.addAttribute("list", list);		
		model.addAttribute("serviceName", serviceName);
		
		return "question/faqList";
	}
	
	// 업체 문의사항 답변수정 액션
	@PostMapping("/employee/question/modifyCommentByCompany")
	public String modifyCommentCompany(QuestionAnswer questionAnswer
										, @RequestParam(value="questionNo") int questionNo) {
		
		log.debug("\u001B[31m" + questionNo + "<-- 답변수정 액션 questionNo 디버깅");
		log.debug("\u001B[31m" + questionAnswer + "<-- 답변수정 액션 questionAnswer 디버깅");
		
		questionService.modifyCommentByCompany(questionAnswer);
		
		return "redirect:/employee/question/questionListByCompany";
		
	}
	
	// 업체 문의사항 답변작성 액션
	@PostMapping("/employee/question/addCommentByCompany")
	public String addCommentByCompany(QuestionAnswer questionAnswer
										, @RequestParam(value="questionNo") int questionNo) {
		
		log.debug("\u001B[31m" + questionNo + "<-- 답변작성 액션 questionNo 디버깅");
		
		// 답변작성 메서드 호출
		questionService.addCommentByCompany(questionAnswer);
		
		return "redirect:/employee/question/questionListByCompany";
	}
	
	// 업체 문의사항에 답변작성 폼
	@GetMapping("/employee/question/commentByCompany")
	public String commentByCompany(Model model
									, @RequestParam(value="questionNo") int questionNo
									, @RequestParam(value="serviceName") String serviceName) {
		
		log.debug("\u001B[31m" + questionNo + "<-- questionNo 디버깅");
		log.debug("\u001B[31m" + serviceName + "<-- serviceName 디버깅");
		
		Map<String, Object> map = null;
		
		if(serviceName.equals("쇼핑")) {
			map = questionService.getShoppingQuestionByComment(questionNo);
		} else if(serviceName.equals("예약")) {
			map = questionService.getBookingQuestionByComment(questionNo);
		}
		
		
		log.debug("\u001B[31m" + map + "<-- map 디버깅");
		
		model.addAttribute("m", map);
		
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
