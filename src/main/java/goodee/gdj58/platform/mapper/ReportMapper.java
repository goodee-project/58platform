package goodee.gdj58.platform.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.platform.vo.Report;

@Mapper
public interface ReportMapper {
	// 신고리스트 조회
	List<Report> selectReport(String reportCategory);
	// 특정 기업 신고리스트 조회
}
