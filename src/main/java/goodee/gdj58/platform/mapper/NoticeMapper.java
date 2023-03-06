package goodee.gdj58.platform.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.platform.vo.Notice;

@Mapper
public interface NoticeMapper {
	
	// 공지사항 리스트
	List<Notice> selectShoppingNoticeList(Map<String, Object> paramMap, String serviceName);
}
