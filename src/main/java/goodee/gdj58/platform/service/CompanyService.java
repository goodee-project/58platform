package goodee.gdj58.platform.service;

import java.util.ArrayList;
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
	
	// 쇼핑 기업 주문 조회 (랭크할인 및 포인트 사용내역 포함)
	public List<Map<String, Object>> getShoppingOrderList(String companyName){
		
		List<Map<String, Object>> companyOrderList = companyMapper.selectShoppingOrderList(companyName);
		log.debug("\u001B[45m 주문리스트 companyOrderList  : "+ companyOrderList);
		
		int orderSheetNo = 0; // 주문서 하나의 번호
		int orderSheetPrice = 0; // 주문서 하나의 총 금액
		double  discountRate = 0; // 등급별 할인율
 		
		String customerId = companyOrderList.get(0).get("customerId").toString();
		log.debug("\u001B[45m 주문리스트 customerId  : "+ customerId);
		
		// 랭크 조회 및 랭크별 할인율
		String customerRank = companyMapper.selectCustomerRank(customerId);
		
		if(customerRank.equals("일반")) {
			discountRate = 0;
		} else if(customerRank.equals("브론즈")) {
			discountRate = 0.01;
		} else if(customerRank.equals("실버")) {
			discountRate = 0.02;
		} else if(customerRank.equals("골드")) {
			discountRate = 0.03;
		}
		
		// 주문서의 상품 외 갯수 ( 쿼리에서 상품조회할것인가 서비스에서 하나더 만들것인가)
		String [] arr = companyOrderList.get(0).get("goodsName").toString().split(",");
		log.debug("\u001B[45m 주문리스트 arr[]  : "+ arr);
		int goodsNameETC = arr.length-1; 
		String goodsNameTitle = arr[0];
		
		
		for(Map<String,Object> keyMap : companyOrderList) {
			String key1 = keyMap.get("orderSheetNo").toString();
			String key2 = keyMap.get("orderSheetPrice").toString();
			
			orderSheetNo = Integer.parseInt(key1);
			orderSheetPrice = Integer.parseInt(key2);
			
			int rankDiscount = (int)((int)orderSheetPrice*(double)discountRate);
			log.debug("\u001B[45m 주문리스트 rankDiscount  : "+ rankDiscount);
			
			int usePoint = companyMapper.selectShoppingOrderTotalPoint(orderSheetNo);
			
			int pay =orderSheetPrice-rankDiscount-usePoint;
			
			keyMap.put("usePoint", usePoint);
			keyMap.put("rankDiscount", rankDiscount);
			keyMap.put("pay", pay);
			keyMap.put("goodsNameETC", goodsNameETC);
			keyMap.put("goodsNameTitle", goodsNameTitle);
			
		}
		
		log.debug("\u001B[45m 주문서번호 orderSheetNo  : "+ orderSheetNo);
		
		log.debug("\u001B[45m 주문리스트 companyOrderList  : "+ companyOrderList);
		
		return companyOrderList;	
	}
		
	// 예약 기업 주문 조회 (랭크할인 및 포인트 사용내역 포함)
	public List<Map<String, Object>> getBookingOrderList(String companyName){
		
		List<Map<String, Object>> companyOrderList = companyMapper.selectBookingOrderList(companyName);
		
		int bookingTotalPrice = 0; // 총 예약금액
		double  discountRate = 0; // 등급별 할인율
		int bookingUsePoint =0; // 예약에 사용된 포인트
		
		String customerId = companyOrderList.get(0).get("customerId").toString();
		String usePoint = companyOrderList.get(0).get("bookingUsePoint").toString();
		bookingUsePoint = Integer.parseInt(usePoint);
		
		log.debug("\u001B[45m 주문리스트 customerId  : "+ customerId);
		
		// 랭크 조회 및 랭크별 할인율
		String customerRank = companyMapper.selectCustomerRank(customerId);
		
		if(customerRank.equals("일반")) {
			discountRate = 0;
		} else if(customerRank.equals("브론즈")) {
			discountRate = 0.01;
		} else if(customerRank.equals("실버")) {
			discountRate = 0.02;
		} else if(customerRank.equals("골드")) {
			discountRate = 0.03;
		}
		
		for(Map<String,Object> keyMap : companyOrderList) {
			String key1 = keyMap.get("bookingTotalPrice").toString();
			
			bookingTotalPrice = Integer.parseInt(key1);
			
			int rankDiscount = (int)((int)bookingTotalPrice*(double)discountRate);
			log.debug("\u001B[45m 주문리스트 rankDiscount  : "+ rankDiscount);
			
			int pay = bookingTotalPrice-rankDiscount-bookingUsePoint;
			
			keyMap.put("rankDiscount", rankDiscount);
			keyMap.put("pay", pay);
			
		}
		
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
