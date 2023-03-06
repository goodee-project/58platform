package goodee.gdj58.platform.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ReportMapper {
	// 신고리스트 조회
	List<Map<String, Object>> selectReport(String reportCategory);
	// 특정 기업 신고리스트 조회
}
