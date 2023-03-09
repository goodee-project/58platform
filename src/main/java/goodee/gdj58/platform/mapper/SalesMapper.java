package goodee.gdj58.platform.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SalesMapper {
	
	// 페이머니
	List<Map<String,Object>> selectTopTenCustomer(Map<String,Object> paramMap); // 기간 내 상위 10명 VIP 
	List<Map<String,Object>> selectSavePayListByCustomer(Map<String,Object> paramMap); // 모든 회원의 충전내역 연대순 출력
	List<Map<String,Object>> selectSavePayListByDate(Map<String,Object> paramMap); // 일월연별 목록출력
	Map<String,Object> selectCntAndSumByPeriod(Map<String,Object> paramMap); // 기간동안의 총액 및 건수
	int selectTotalSavePayAllTime(); // 누적금액
}
