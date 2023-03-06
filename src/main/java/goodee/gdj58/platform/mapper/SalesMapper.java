package goodee.gdj58.platform.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SalesMapper {
	
	// 페이머니
	List<Map<String,Object>> selectSavePayListByDate(Map<String,Object> paramMap); // 일월연별 목록출력
	int selectTotalSavePayAllTime();
}
