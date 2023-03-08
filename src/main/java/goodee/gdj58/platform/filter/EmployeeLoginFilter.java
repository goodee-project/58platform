package goodee.gdj58.platform.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import lombok.extern.slf4j.Slf4j;

@Slf4j // static Log log = new Log() 로그 객체를 선언하여 사용할 수 있게 함
@WebFilter("/employee/*")
public class EmployeeLoginFilter implements Filter{
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		log.debug("\u001B[31m" + "플랫폼 로그인 필터"); 
		
		// 웹 브라우저 요청 (get, post 방식의 요청만 접근 허용)
		if(request instanceof HttpServletRequest) { // request를 ServletRequest의 자식타입인 HttpServletRequest로 형변환 가능한지 확인(get 또는 post방식인지 확인) 
			HttpServletRequest req = (HttpServletRequest) request;
			HttpSession session = ((HttpServletRequest) request).getSession();
			if(session.getAttribute("loginEmp") == null) {
				((HttpServletResponse)response).sendRedirect(req.getContextPath() + "/login");
				return;
			}
		} else {
			log.debug("웹 브라우저 요청만 허용합니다."); 
			return;
		}

		// controller 전
		chain.doFilter(request, response);
		// controller 후
		
	}
}
