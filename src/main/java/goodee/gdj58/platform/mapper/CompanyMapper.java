package goodee.gdj58.platform.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CompanyMapper {
	// 예약 기업 조회
	List<Map<String, Object>> selectBookingCompanyList();	
	// 쇼핑몰 기업 조회
	List<Map<String, Object>> selectShoppingCompanyList();
	
	// 예약 기업 상세보기
	Map<String, Object> selectBookingCompanyOne();
	// 쇼핑몰 기업 상세보기
	Map<String, Object> selectShoppingCompanyOne();
}
