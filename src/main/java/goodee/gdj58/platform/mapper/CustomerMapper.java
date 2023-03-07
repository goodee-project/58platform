package goodee.gdj58.platform.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CustomerMapper {

	// 회원 목록
	List<Map<String, Object>> selectCustomerList();
	
	// 회원등급 수정
	String updateCustomerActive(String customerId, String active);
}