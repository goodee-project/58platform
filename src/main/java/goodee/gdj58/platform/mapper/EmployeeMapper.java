package goodee.gdj58.platform.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.platform.vo.Employee;
import goodee.gdj58.platform.vo.EmployeeInfo;
import goodee.gdj58.platform.vo.PwHistory;
import goodee.gdj58.platform.vo.TotalId;

@Mapper
public interface EmployeeMapper {
	
	// 비밀번호 변경 이력 3개 쌓이면 pk가 가장 작은것 삭제
	int deletePwHistory(String id);
	// 직원 비밀번호 변경이력 개수 조회
	int selectPwHistoryCount(String id);
	// 직원 비밀번호 변경시 비밀번호 이력
	int insertPwHistoryByModifyEmployeePw(PwHistory pwHistory);
	// 직원 비밀번호 변경
	int updateEmployeePw(Map<String, Object> paramMap);
	// 직원 비밀번호 변경을 위한 조회
	Employee selectEmployeePwByUpdate(String employeeId);
	// 비밀번호 변경 이력 중복검사 null을 반환하면 사용가능한 비밀번호, 비밀번호를 반환하면 사용불가능한 비밀번호
	public String selectPwHistoryCk(PwHistory pwHistory);
	
	// 직원 개인정보 변경
	int updateEmployeeInfo(EmployeeInfo employeeInfo);
	/* 직원 개인정보 변경을 위한 조회
	Map<String, Object> selectEmployeeByUpdate(String employeeId);
	*/
	// 직원 개인정보
	Map<String, Object> selectEmployeeOne(String employeeId);
	
	// 직원 비활성화
	int updateEmployeeDeactive(String id);
	// 직원 활성화
	int updateEmployeeActive(String id);
	
	// 직원등록
	int insertEmployee(Employee employee);
	// 직원정보등록
	int insertEmployeeInfo(EmployeeInfo employeeInfo);
	// total아이디 등록
	int insertTotalId(TotalId totalId);
	// 직원등록시 pw_history 등록
	int insertPwHistory(PwHistory pwHistory);
	// 아이디 중복 체크 null을 반환하면 사용가능한 아이디, 아이디를 반환하면 사용불가능한 아이디
	public String selectTotalIdCk(String id);
	
	// 직원 목록
	List<Map<String, Object>> selectEmployeeList();

	// 로그인 비밀번호 체크
	Employee selectEmployeePw(String employeeId);
	// 직원 로그인
	Employee login(Employee employee);
}
