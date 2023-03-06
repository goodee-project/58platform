package goodee.gdj58.platform.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.platform.mapper.EmployeeMapper;
import goodee.gdj58.platform.vo.Employee;
import goodee.gdj58.platform.vo.EmployeeInfo;
import goodee.gdj58.platform.vo.TotalId;

@Service
@Transactional
public class EmployeeService {
	@Autowired 
	private EmployeeMapper employeeMapper;
	
	// 직원 비활성화
	public int modifyEmployeeDeactive(TotalId totalId) {
		return employeeMapper.updateEmployeeDeactive(totalId);
	}
	// 직원 활성화
	public int modifyEmployeeActive(TotalId totalId) {
		return employeeMapper.updateEmployeeActive(totalId);
	}
	
	// 직원등록
	public int addEmployee(Employee employee, EmployeeInfo employeeInfo, TotalId totalId) {
		employeeMapper.insertEmployee(employee);
		employeeMapper.insertEmployeeInfo(employeeInfo);
		return employeeMapper.insertTotalId(totalId);
	}
	
	// 직원 목록
	public List<Map<String, Object>> getEmployeeList() {
		return employeeMapper.selectEmployeeList();
	}
	
	// 직원 로그인
	public Employee login(Employee employee) {
		return employeeMapper.login(employee);
	}
}
