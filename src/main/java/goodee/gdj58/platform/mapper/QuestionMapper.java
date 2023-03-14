package goodee.gdj58.platform.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.platform.vo.Question;

@Mapper
public interface QuestionMapper {
	
	
	// 답변페이지 문의내용 조회 폼
	Question selectQuestionByComment(int questionNo);
	
	// 쇼핑업체 문의사항 리스트
	List<Map<String, Object>> selectShoppingQuestionList();
	// 예약업체 문의사항 리스트
	List<Map<String, Object>> selectBookingQuestionList();
}
