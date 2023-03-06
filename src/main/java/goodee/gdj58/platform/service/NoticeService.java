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
	
		
	// 공지사항 수정
	public int modifyNotice(int noticeNo) {
		return noticeMapper.updateNotice(noticeNo);
	}
	
	
	// 공지사항 삭제
	public int removeNotice(int noticeNo) {
		return noticeMapper.deleteNotice(noticeNo);
	}
	
	// 공지사항 상세보기
	public List<Notice> noticeOne(int noticeNo) {
		return noticeMapper.selectNoticeOne(noticeNo);
	}
	
	// 공지사항 추가
	public int addNotice(Notice notice) {
		return noticeMapper.insertNotice(notice);
	}
	
	// 공지사항 리스트
	public List<Notice> getShoppingNoticeList(String serviceName) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		return noticeMapper.selectShoppingNoticeList(paramMap, serviceName);
	}
}
