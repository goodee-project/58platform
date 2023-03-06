package goodee.gdj58.platform.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.platform.vo.Notice;

@Mapper
public interface NoticeMapper {
	
	// 공지시항 수정
	int updateNotice(int noticeNo);
	
	// 공ㅈ시항 삭제
	int deleteNotice(int noticeNo);
	
	// 공지사항 상세보기
	List<Notice> selectNoticeOne(int noticeNo);
	
	// 공지사항 등록
	int insertNotice(Notice notice);
	
	// 공지사항 리스트
	List<Notice> selectShoppingNoticeList(Map<String, Object> paramMap, String serviceName);
}
