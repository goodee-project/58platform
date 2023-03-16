package goodee.gdj58.platform.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import goodee.gdj58.platform.mapper.EmployeeMapper;
import goodee.gdj58.platform.vo.Employee;
import goodee.gdj58.platform.vo.EmployeeInfo;
import goodee.gdj58.platform.vo.PwHistory;
import goodee.gdj58.platform.vo.TotalId;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class EmployeeService {
	@Autowired 
	private EmployeeMapper employeeMapper;
	
	// 직원 비밀번호 변경시 현재 비밀번호 틀림체크
	public Employee getEmployeePwCkByModify(String employeeId, String oldPw) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("employeeId", employeeId);
		paramMap.put("oldPw", oldPw);
		return employeeMapper.selectEmployeePwCkByUpdate(paramMap);
	}
		
	// 직원 비밀번호 변경
	public int modifyEmployeePw(String newPw, String employeeId, String oldPw, String id, PwHistory pwHistory) {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("newPw", newPw);
		paramMap.put("employeeId", employeeId);
		paramMap.put("oldPw", oldPw);
		employeeMapper.updateEmployeePw(paramMap);
		int count = employeeMapper.selectPwHistoryCount(id);
		// System.out.println(count + "<--비밀번호 변경이력 디버깅");
		if(count > 2) {
			employeeMapper.deletePwHistory(id);
		}
		
		return employeeMapper.insertPwHistoryByModifyEmployeePw(pwHistory);
	}
	
	// 직원 비밀번호 변경을 위한 조회
	public Employee getEmployeePwByModify(String employeeId) {
		return employeeMapper.selectEmployeePwByUpdate(employeeId);
	}
	
	// 비밀번호 변경 이력 중복검사 null을 반환하면 사용가능한 비밀번호, 비밀번호를 반환하면 사용불가능한 비밀번호
	public String getPwHistoryCk(PwHistory pwHistory) {
		// null을 반환하면 사용가능한 비밀번호, 비밀번호를 반환하면 사용불가능한 비밀번호
		String resultStr = "NO";
		
		if(employeeMapper.selectPwHistoryCk(pwHistory) == null) {
			resultStr = "YES";
		}
		return resultStr;
	}
	
	// 직원 개인정보 변경
	public int modifyEmployeeInfo(EmployeeInfo employeeInfo) {
		return employeeMapper.updateEmployeeInfo(employeeInfo);
	}
	
	/* 직원 개인정보 변경을 위한 조회
	public Map<String, Object> getEmployeeByModify(String employeeId) {
		return employeeMapper.selectEmployeeByUpdate(employeeId);
	}
	*/
	
	// 직원 myPage
	public Map<String, Object> getEmployeeOne(String employeeId) {
		return employeeMapper.selectEmployeeOne(employeeId);
	}
	
	// 직원 비활성화
	public int modifyEmployeeDeactive(String id) {
		return employeeMapper.updateEmployeeDeactive(id);
	}
	// 직원 활성화
	public int modifyEmployeeActive(String id) {
		return employeeMapper.updateEmployeeActive(id);
	}
	
	// 직원등록
	public int addEmployee( TotalId totalId, Employee employee, EmployeeInfo employeeInfo, PwHistory pwHistory) {
		employeeMapper.insertTotalId(totalId);
		employeeMapper.insertEmployee(employee);
		employeeMapper.insertEmployeeInfo(employeeInfo);
		return employeeMapper.insertPwHistory(pwHistory);
	}
	
	// 아이디 중복 체크 null을 반환하면 사용가능한 아이디, 아이디를 반환하면 사용불가능한 아이디
	public String getEmployeeIdCk(String employeeId) {
		// null을 반환하면 사용가능한 아이디, 아이디를 반환하면 사용불가능한 아이디
		String resultStr = "NO";
		
		if(employeeMapper.selectTotalIdCk(employeeId) == null) {
			resultStr = "YES";
		}
		return resultStr;
	}
	
	// 직원 목록
	public List<Map<String, Object>> getEmployeeList() {
		return employeeMapper.selectEmployeeList();
	}
	
	// 로그인 비밀번호 체크
	public Employee getEmployeePw(String employeeId) {
		return employeeMapper.selectEmployeePw(employeeId);
	}
	
	// 직원 로그인
	public Employee login(Employee employee) {
		return employeeMapper.login(employee);
	}
}
