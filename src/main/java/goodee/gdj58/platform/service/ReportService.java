package goodee.gdj58.platform.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.platform.mapper.ReportMapper;

@Service
@Transactional
public class ReportService {
	@Autowired ReportMapper reportMapper;
	
	// 모든 신고 내역 조회 (쇼핑 / 예약)
	public List<Map<String, Object>> getReport(String reportCategory){
		List<Map<String, Object>> reportList = reportMapper.selectReport(reportCategory);
		
		return reportList;
	}
	
	// 특정 기업 신고 내역 조회
	
}
