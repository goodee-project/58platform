package goodee.gdj58.platform.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.platform.mapper.NoticeMapper;
import goodee.gdj58.platform.vo.Notice;

@Service
@Transactional
public class NoticeService {
	@Autowired private NoticeMapper noticeMapper;
	
	
	// 공지사항 제목 중복 체크 (제목 중복 체크 null을 반환하면 사용가능한 제목, 제목 반환하면 사용불가능한 제목)
	public String getNoticeTitleCk(String noticeTitle) {
		// null을 반환하면 사용가능한 아이디, 아이디를 반환하면 사용불가능한 아이디
		String resultStr = "NO";
		
		if(noticeMapper.selectNoticeTitleCk(noticeTitle) == null) {
			resultStr = "YES";
		}
		return resultStr;
	}
	
	// 공지사항 수정
	public int modifyNotice(Notice notice) {
		return noticeMapper.updateNotice(notice);
	}
	
	
	// 공지사항 삭제
	public int removeNotice(int noticeNo) {
		return noticeMapper.deleteNotice(noticeNo);
	}
	
	// 공지사항 상세보기
	public Notice getNoticeOne(int noticeNo) {
		return noticeMapper.selectNoticeOne(noticeNo);
	}
	
	// 공지사항 추가
	public int addNotice(Notice notice) {
		return noticeMapper.insertNotice(notice);
	}
	
	// 공지사항 리스트
	public List<Notice> getShoppingNoticeList(String serviceName) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		return noticeMapper.selectNoticeList(paramMap, serviceName);
	}
}
