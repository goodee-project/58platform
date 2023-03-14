package goodee.gdj58.platform.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.platform.vo.QuestionAnswer;


@Mapper
public interface QuestionMapper {
	
	// FAQ 리스트
	List<Map<String, Object>> selectFaqList(String serviceName);
	
	// 답변수정
	int updateCommentByCompany(QuestionAnswer questionAnswer);
	// 답변등록
	int insertCommentByCompany(QuestionAnswer questionAnswer);
	
	// 답변페이지 문의내용 조회 폼(예약)
	Map<String, Object> selectBookingQuestionByComment(int questionNo);
	// 답변페이지 문의내용 조회 폼(쇼핑)
	Map<String, Object> selectShoppingQuestionByComment(int questionNo);
	
	
	// 예약업체 문의사항 리스트
	List<Map<String, Object>> selectBookingQuestionList();
	// 쇼핑업체 문의사항 리스트
	List<Map<String, Object>> selectShoppingQuestionList();
}
