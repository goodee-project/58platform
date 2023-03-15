package goodee.gdj58.platform.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import goodee.gdj58.platform.service.QuestionService;
import goodee.gdj58.platform.vo.Faq;
import goodee.gdj58.platform.vo.QuestionAnswer;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class QuestionController {
	@Autowired QuestionService questionService;
	
	// FAQ 삭제 액션
	@GetMapping("/employee/question/removeFaq")
	public String removeFaq(int faqNo) {
	
		log.debug("\u001B[31m" + faqNo + "<-- faqNo 컨트롤러 삭제번호 디버깅");
		
		questionService.removeFaq(faqNo);
		
		return "redirect:/employee/question/faqList";
	}
	
	// FAQ 수정 액션
	@PostMapping("/employee/question/modifyFaq")
	public String modifyFaq(Faq faq, RedirectAttributes redirectAttributes) {
		
		log.debug("\u001B[31m" + faq + "<-- faq 컨트롤러 디버깅");
		
		String msg = "FAQ등록실패";
		
		redirectAttributes.addAttribute("faqNo", faq.getFaqNo());
		redirectAttributes.addAttribute("msg", msg);
		
		// null이나 공백 넘어오면 addFaq로 redirect및 메시지 출력
		if(faq.getServiceName() == null || faq.getServiceName().equals("")
				|| faq.getFaqQuestion() == null || faq.getFaqQuestion().equals("")
				|| faq.getFaqAnswer() == null || faq.getFaqAnswer().equals("")) {
			return "redirect:/employee/question/modifyFaq";
		}
		
		questionService.modifyFaq(faq);
		
		return "redirect:/employee/question/faqList";
	}
	
	// FAQ 수정 폼
	@GetMapping("/employee/question/modifyFaq")
	public String modifyFaq(Model model
								, @RequestParam(value="faqNo") int faqNo) {
		
		log.debug("\u001B[31m" + faqNo + "<-- faqNo 컨트롤러 디버깅");
		
		Faq faq = questionService.getFaq(faqNo);

		model.addAttribute("f", faq);
		model.addAttribute("msg", msg);
		
		return "question/modifyFaq";
	}
	
	// FAQ 등록 액션
	@PostMapping("/employee/question/addFaq")
	public String addFaq(Faq faq, RedirectAttributes redirectAttributes) {

		log.debug("\u001B[31m" + faq + "<-- faq 컨트롤러 디버깅");
		
		String msg = "FAQ등록실패";
		
		redirectAttributes.addAttribute("msg", msg);
		
		// null이나 공백 넘어오면 addFaq로 redirect및 메시지 출력
		if(faq.getServiceName() == null || faq.getServiceName().equals("")
				|| faq.getFaqQuestion() == null || faq.getFaqQuestion().equals("")
				|| faq.getFaqAnswer() == null || faq.getFaqAnswer().equals("")) {
			return "redirect:/employee/question/addFaq";
		}
		// FAQ등록 메서드 호출
		questionService.addFaq(faq); 
		 
		return "redirect:/employee/question/faqList";
	}
	
	// FAQ 등록 폼
	@GetMapping("/employee/question/addFaq")
	public String addFaq(Model model
							, @RequestParam(value="msg", required = false) String msg) {
		
		model.addAttribute("msg", msg);
		
		return "question/addFaq";
	}
	
	// FAQ 목록
	@GetMapping("/employee/question/faqList")
	public String faqList(Model model
							, @RequestParam(value="serviceName", defaultValue = "쇼핑") String serviceName) {
		
		log.debug("\u001B[31m" + serviceName + "<-- serviceName 컨트롤러 디버깅");
		
		List<Map<String, Object>> list = questionService.getFaqList(serviceName);
		/*
		ArrayList<Faq> subList = null;
		
		for(int i=0; i<list.size(); i++) {
			subList = new ArrayList<Faq>();
			Faq f = new Faq();
			String subAnswer = list.get(i).get("faqAnswer").toString().substring(5);
			f.setFaqAnswer(subAnswer);
			log.debug("\u001B[31m" + subAnswer + "<-- subAnswer 디버깅");
			subList.add(f);
		}
		log.debug("\u001B[31m" + subList + "<-- subList 디버깅");
		*/
		model.addAttribute("list", list);
		// model.addAttribute("subList", subList);
		model.addAttribute("serviceName", serviceName);
		
		return "question/faqList";
	}
	
	// 업체 문의사항 답변수정 액션
	@PostMapping("/employee/question/modifyCommentByCompany")
	public String modifyCommentCompany(QuestionAnswer questionAnswer, RedirectAttributes redirectAttributes
										, @RequestParam(value="questionNo") int questionNo
										, @RequestParam(value="serviceName") String serviceName) {
		
		log.debug("\u001B[31m" + questionNo + "<-- 답변수정 액션 questionNo 컨트롤러 디버깅");
		log.debug("\u001B[31m" + questionAnswer + "<-- 답변수정 액션 questionAnswer 컨트롤러 디버깅");
		
		String msg = "수정실패";
		
		// redirect시 보낼 파라미터
		redirectAttributes.addAttribute("questionNo", questionNo);
		redirectAttributes.addAttribute("serviceName", serviceName);
		redirectAttributes.addAttribute("msg", msg);
		
		
		// 답변이 공백으로 넘어올 시 답변 수정 창으로 redirect
		if(questionAnswer.getQuestionComment() == null 
				|| questionAnswer.getQuestionComment().equals("")) {
			return "redirect:/employee/question/commentByCompany";
		}
		
		
		// 답변 수정 메서드 호출
		questionService.modifyCommentByCompany(questionAnswer);
		
		return "redirect:/employee/question/questionListByCompany";
		
	}
	
	// 업체 문의사항 답변작성 액션
	@PostMapping("/employee/question/addCommentByCompany")
	public String addCommentByCompany(QuestionAnswer questionAnswer, RedirectAttributes redirectAttributes
										, @RequestParam(value="questionNo") int questionNo
										, @RequestParam(value="serviceName") String serviceName) {
		
		log.debug("\u001B[31m" + questionNo + "<-- 답변작성 액션 questionNo 컨트롤러 디버깅");
		log.debug("\u001B[31m" + serviceName + "<-- 답변작성 액션 serviceName 컨트롤러 디버깅");
		log.debug("\u001B[31m" + questionAnswer.getQuestionComment() + "<-- 답변작성 액션 questionAnswer.getQuestionComment() 컨트롤러 디버깅");
		
		String msg = "등록실패";
		
		// redirect시 보낼 파라미터
		redirectAttributes.addAttribute("questionNo", questionNo);
		redirectAttributes.addAttribute("serviceName", serviceName);
		redirectAttributes.addAttribute("msg", msg);
		// 답변이 null이나 공백으로 넘어올시 답변 입력창으로 redirect
		if(questionAnswer.getQuestionComment() == null 
				|| questionAnswer.getQuestionComment().equals("")) {
			return "redirect:/employee/question/commentByCompany";
		}
		
		// 답변작성 메서드 호출
		questionService.addCommentByCompany(questionAnswer);
		
		
		
		return "redirect:/employee/question/questionListByCompany";
	}
	
	// 업체 문의사항에 답변작성 폼
	@GetMapping("/employee/question/commentByCompany")
	public String commentByCompany(Model model
									, @RequestParam(value="questionNo") int questionNo
									, @RequestParam(value="serviceName") String serviceName
									, @RequestParam(value="msg", required = false) String msg) {
		
		log.debug("\u001B[31m" + questionNo + "<-- questionNo 컨트롤러 디버깅");
		log.debug("\u001B[31m" + serviceName + "<-- serviceName 컨트롤러 디버깅");
		
		Map<String, Object> map = null;
		
		if(serviceName.equals("쇼핑")) {
			map = questionService.getShoppingQuestionByComment(questionNo);
		} else if(serviceName.equals("예약")) {
			map = questionService.getBookingQuestionByComment(questionNo);
		}
		
		
		log.debug("\u001B[31m" + map + "<-- map 컨트롤러 디버깅");
		
		model.addAttribute("m", map);
		model.addAttribute("msg", msg);
		
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
