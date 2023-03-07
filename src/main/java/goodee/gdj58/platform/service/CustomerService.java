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

	// 고객 목록
	public List<Map<String, Object>> getCustomerList() {
		return customerMapper.selectCustomerList();
	}
	
	// 회원등급 수정
	public String modifyCustomerActive(String customerId, String active) {
		return customerMapper.updateCustomerActive(customerId, active);
	}
	
	
}