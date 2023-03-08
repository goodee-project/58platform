package goodee.gdj58.platform.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.platform.vo.Notice;

@Mapper
public interface NoticeMapper {
	
	// 공지사항 제목 중복 체크 ( null을 반환하면 사용가능한 제목, 제목을 반환하면 사용불가능한 제목)
	public String selectNoticeTitleCk(String noticeTitle);
	
	// 공지시항 수정
	int updateNotice(Notice notice);
	
	// 공ㅈ시항 삭제
	int deleteNotice(int noticeNo);
	
	// 공지사항 상세보기
	Notice selectNoticeOne(int noticeNo);
	
	// 공지사항 등록
	int insertNotice(Notice notice);
	
	// 공지사항 리스트
	List<Notice> selectNoticeList(Map<String, Object> paramMap, String serviceName);
}
