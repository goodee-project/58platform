package goodee.gdj58.platform.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CustomerMapper {

	// 회원 목록
	List<Map<String, Object>> selectCustomerList();
	
	// 회원 상세조회
	
	// 회원등급 수정
	String updateCustomerActive(String customerId, String active);
	
	// 회원 포인트 내역 조회
	List<Map<String, Object>> selectPointDetails(String customerId);
	// 회원 잔여포인트
	int selectCustomerPoint(String customerId);
	
	// 회원 페이머니 내역 조회
	List<Map<String, Object>> selectPayMoneyDetails(String customerId);
	// 회원 잔여 페이머니
	int selectCustomerPayMoney(String customerId);
	
	// 탈퇴 회원조회
}