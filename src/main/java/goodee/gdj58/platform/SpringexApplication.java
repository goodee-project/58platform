package goodee.gdj58.platform;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@SpringBootApplication
@ServletComponentScan // Filter사용 설정
public class SpringexApplication implements WebMvcConfigurer { // 인터셉트 사용 인터페이스
	
}
