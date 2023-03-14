package goodee.gdj58.platform.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.platform.controller.CompanyContoroller;
import goodee.gdj58.platform.mapper.CompanyMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class CompanyService {
	@Autowired CompanyMapper companyMapper; 
	
	// 쇼핑 기업 주문 조회 (포인트 사용내역 포함)
	public List<Map<String, Object>> getShoppingOrderList(String companyName){
		
		List<Map<String, Object>> companyOrderList = companyMapper.selectShoppingOrderList(companyName);
		
		log.debug("\u001B[45m 주문리스트 companyOrderList  : "+ companyOrderList);
		int orderSheetNo = 0;
		for(Map<String,Object> keyMap : companyOrderList) {
			String key1 = keyMap.get("orderSheetNo").toString();
			orderSheetNo = Integer.parseInt(key1);
			int usePoint = companyMapper.selectShoppingOrderTotalPoint(orderSheetNo);
			keyMap.put("usePoint", usePoint);
			
		}
		
		log.debug("\u001B[45m 주문서번호 orderSheetNo  : "+ orderSheetNo);
		
		log.debug("\u001B[45m 주문리스트 companyOrderList  : "+ companyOrderList);
		
		return companyOrderList;	
	}
		
	// 예약 기업 주문 조회 
	public List<Map<String, Object>> getBookingOrderList(String companyName){
		
		List<Map<String, Object>> companyOrderList = companyMapper.selectBookingOrderList(companyName);
		
		return companyOrderList;	
	}
		
	// 쇼핑 기업 판매 상품 조회 
	public List<Map<String, Object>> getShoppingGoodsList(String companyName){
		
		List<Map<String, Object>> companySellList = companyMapper.selectShoppingGoodsList(companyName);
		
		return companySellList;	
	}
		
	// 예약 기업 판매 상품 조회 
	public List<Map<String, Object>> getBookingProductList(String companyName){
		
		List<Map<String, Object>> companySellList = companyMapper.selectBookingProductList(companyName);
		
		return companySellList;	
	}
	
	// 예약 기업 조회
	public List<Map<String, Object>> getBookingCompanyList(){
		
		List<Map<String, Object>> bookingCompanyList = companyMapper.selectBookingCompanyList();
		return bookingCompanyList;	
	}
	
	// 쇼핑몰 기업 조회
	public List<Map<String, Object>> getShoppingCompanyList(){
		
		List<Map<String, Object>> shoppingCompanyList = companyMapper.selectShoppingCompanyList();
		return shoppingCompanyList;
	}
	
	// 예약 기업 상세보기
	public Map<String, Object> getBookingCompanyOne(String companyName){
		
		Map<String, Object> BookingCompanyOne = companyMapper.selectBookingCompanyOne(companyName);
		return BookingCompanyOne;
		
	}
	// 쇼핑몰 기업 상세보기
	public Map<String, Object> getShoppingCompanyOne(String companyName){
		
		Map<String, Object> ShoppingCompanyOne = companyMapper.selectShoppingCompanyOne(companyName);
		return ShoppingCompanyOne;		
	}
}
