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
	
	
	// 공지사항 리스트
	public List<Notice> getShoppingNoticeList(String serviceName) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		return noticeMapper.selectShoppingNoticeList(paramMap, serviceName);
	}

	
}
