package goodee.gdj58.platform.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.platform.mapper.CustomerMapper;

@Service
@Transactional
public class CustomerService {
	@Autowired
	private CustomerMapper customerMapper;

	// 회원 목록
	public List<Map<String, Object>> getCustomerList() {
		return customerMapper.selectCustomerList();
	}
	
	// 회원 상세조회
	
	// 회원등급 수정
	public String modifyCustomerActive(String customerId, String active) {
		return customerMapper.updateCustomerActive(customerId, active);
	}
	
	// 회원 포인트 내역 조회
	public List<Map<String, Object>> getPointDetails(String customerId) {
		return customerMapper.selectPointDetails(customerId);
	}
	// 회원 잔여 포인트
	public int getsCustomerPointList(String customerId) {
		return customerMapper.selectCustomerPoint(customerId);
	}
	
	// 회원 페이머니 내역 조회
	public List<Map<String, Object>> getPayMoneyDetails(String customerId) {
		return customerMapper.selectPayMoneyDetails(customerId);
	}
	
	// 회원 잔여 페이머니
	public int getsCustomerPayMoneyList(String customerId) {
		return customerMapper.selectCustomerPayMoney(customerId);
	}
	// 탈퇴회원 조회
	
}