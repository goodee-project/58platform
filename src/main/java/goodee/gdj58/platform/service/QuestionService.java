package goodee.gdj58.platform.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.platform.mapper.QuestionMapper;
import goodee.gdj58.platform.vo.Question;

@Service
@Transactional
public class QuestionService {
	@Autowired 
	private QuestionMapper questionMapper;
	
	// 답변페이지 문의내용 조회 폼
	public Question getQuestionByComment(int questionNo) {
		return questionMapper.selectQuestionByComment(questionNo);
	}
	
	// 쇼핑업체 문의사항 목록
	public List<Map<String, Object>> getShoppingQuestionList() {
		return questionMapper.selectShoppingQuestionList();
	}
	
	// 예약업체 문의사항 목록
	public List<Map<String, Object>> getBookingQuestionList() {
		return questionMapper.selectBookingQuestionList();
	}
	
}
