package goodee.gdj58.platform.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.platform.controller.CompanyContoroller;
import lombok.extern.slf4j.Slf4j;


@Mapper
public interface CompanyMapper {
	
	// 쇼핑몰 고객 랭크 조회
	String selectCustomerRank(String customerId);
		
	// 쇼핑몰 주문서당 포인트 사용내역 조회  
	int selectShoppingOrderTotalPoint(int orderSheetNo);
	
	// 쇼핑몰 주문 조회  
	List<Map<String, Object>> selectShoppingOrderList(String companyName);
	// 예약 주문 조회  
	List<Map<String, Object>> selectBookingOrderList(String companyName);
		
	// 쇼핑몰 판매 상품 조회  
	List<Map<String, Object>> selectShoppingGoodsList(String companyName);
	// 예약 판매 상품 조회  
	List<Map<String, Object>> selectBookingProductList(String companyName);
	
	// 예약 기업 조회
	List<Map<String, Object>> selectBookingCompanyList();	
	// 쇼핑몰 기업 조회
	List<Map<String, Object>> selectShoppingCompanyList();
	
	// 예약 기업 상세보기
	Map<String, Object> selectBookingCompanyOne(String companyName);
	// 쇼핑몰 기업 상세보기
	Map<String, Object> selectShoppingCompanyOne(String companyName);
}
