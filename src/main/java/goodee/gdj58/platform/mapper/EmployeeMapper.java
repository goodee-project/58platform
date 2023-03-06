package goodee.gdj58.platform.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.platform.vo.Employee;
import goodee.gdj58.platform.vo.EmployeeInfo;
import goodee.gdj58.platform.vo.TotalId;

@Mapper
public interface EmployeeMapper {
	
	// 직원등록
	int insertEmployee(Employee employee);
	// 직원정보등록
	int insertEmployeeInfo(EmployeeInfo employeeInfo);
	// total아이디 등록
	int insertTotalId(TotalId totalId);
	
	// 직원 목록
	List<Map<String, Object>> selectEmployeeList();
	
	// 직원 로그인
	Employee login(Employee employee);
}
