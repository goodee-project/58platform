package goodee.gdj58.platform.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.platform.mapper.ReportMapper;
import goodee.gdj58.platform.vo.Report;

@Service
@Transactional
public class ReportService {
	@Autowired ReportMapper reportMapper;
	
	// 모든 신고 내역 조회 (쇼핑 / 예약)
	List<Report> getReport(String reportCategory){
		List<Report> reportList = reportMapper.selectReport(reportCategory);
		
		return reportList;
		
	}
	
	// 특정 기업 신고 내역 조회
	
}
