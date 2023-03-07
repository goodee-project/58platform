package goodee.gdj58.platform.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.platform.vo.Employee;
import goodee.gdj58.platform.vo.EmployeeInfo;
import goodee.gdj58.platform.vo.TotalId;

@Mapper
public interface EmployeeMapper {
	
	// 직원 비밀번호 변경
	int updateEmployeePw(Map<String, Object> paramMap);
	// 직원 비밀번호 변경을 위한 조회
	Employee selectEmployeePwByUpdate(String employeeId);
	
	// 직원 개인정보 변경
	int updateEmployeeInfo(EmployeeInfo employeeInfo);
	// 직원 개인정보 변경을 위한 조회
	Map<String, Object> selectEmployeeByUpdate(String employeeId);
	
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
	// 아이디 중복 체크 null을 반환하면 사용가능한 아이디, 아이디를 반환하면 사용불가능한 아이디
	public String selectTotalIdCk(String id);
	
	// 직원 목록
	List<Map<String, Object>> selectEmployeeList();
	
	// 직원 로그인
	Employee login(Employee employee);
}
