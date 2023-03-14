package goodee.gdj58.platform.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.platform.mapper.QuestionMapper;
import goodee.gdj58.platform.vo.QuestionAnswer;

@Service
@Transactional
public class QuestionService {
	@Autowired 
	private QuestionMapper questionMapper;
	
	// FAQ 리스트
	public List<Map<String, Object>> getFaqList(String serviceName) {
		return questionMapper.selectFaqList(serviceName);
	}
	
	// 답변수정
	public int modifyCommentByCompany(QuestionAnswer questionAnswer) {
		return questionMapper.updateCommentByCompany(questionAnswer);
	}
	
	// 답변등록
	public int addCommentByCompany(QuestionAnswer questionAnswer) {
		return questionMapper.insertCommentByCompany(questionAnswer);
	}
	
	// 답변페이지 문의내용 조회 폼(예약)
	public Map<String, Object> getBookingQuestionByComment(int questionNo) {
		return questionMapper.selectBookingQuestionByComment(questionNo);
	}
	
	// 답변페이지 문의내용 조회 폼(쇼핑)
	public Map<String, Object> getShoppingQuestionByComment(int questionNo) {
		return questionMapper.selectShoppingQuestionByComment(questionNo);
	}
	
	// 예약업체 문의사항 목록
	public List<Map<String, Object>> getBookingQuestionList() {
		return questionMapper.selectBookingQuestionList();
	}
	
	// 쇼핑업체 문의사항 목록
	public List<Map<String, Object>> getShoppingQuestionList() {
		return questionMapper.selectShoppingQuestionList();
	}
}
