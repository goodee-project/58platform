package goodee.gdj58.platform.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import lombok.extern.slf4j.Slf4j;

@Slf4j // static Log log = new Log() 로그 객체를 선언하여 사용할 수 있게 함
@WebFilter("*")
public class EncodingFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		log.debug("\u001B[31m"+"EncodingFilter");
		
		request.setCharacterEncoding("utf-8");
		
		chain.doFilter(request, response);
	}
	
}