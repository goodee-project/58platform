package goodee.gdj58.platform.vo;

import lombok.Data;

@Data
public class Faq {
	private int faqNo;
	private String serviceName;
	private String faqQuestion;
	private String faqAnswer;
	private String createdate;
	private String updatedate;
}
