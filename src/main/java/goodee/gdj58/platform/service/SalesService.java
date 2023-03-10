package goodee.gdj58.platform.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.platform.mapper.SalesMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class SalesService {
	@Autowired
	private SalesMapper salesMapper;
	
	// 페이머니 관련
	// 상위 10명 vip 고객 출력
	public List<Map<String,Object>> getTopTenCustomer(String startDate, String endDate) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
		return salesMapper.selectTopTenCustomer(paramMap);
	}
	
	// 페이머니 충전 일괄출력
	public List<Map<String,Object>> getSavePayListByCustomer(String startDate, String endDate) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
		return salesMapper.selectSavePayListByCustomer(paramMap);
	}
	
	// 일월연별 충전금(페이머니) 목록출력
	public List<Map<String,Object>> getSavePayListByDate(String kind, String startDate, String endDate) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("kind", kind);
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
		return salesMapper.selectSavePayListByDate(paramMap);
	}
	// 기간동안의 총액 및 총건수
	public Map<String,Object> getCntAndSumByPeriod(String startDate, String endDate) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
		return salesMapper.selectCntAndSumByPeriod(paramMap);
	}
	// 누적 총 충전액 조회
	public int getTotalSavePayAllTime() {
		return salesMapper.selectTotalSavePayAllTime();
	}
}
