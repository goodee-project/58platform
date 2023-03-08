package goodee.gdj58.platform.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.platform.controller.CompanyContoroller;
import goodee.gdj58.platform.mapper.CompanyMapper;

@Service
@Transactional
public class CompanyService {
	@Autowired CompanyMapper companyMapper; 
	
	// 기업 판매 상품 조회 
	public List<Map<String, Object>> getCompanySellList(String companyName){
		
		List<Map<String, Object>> companySellList = companyMapper.selectCompanySellList(companyName);
		
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
