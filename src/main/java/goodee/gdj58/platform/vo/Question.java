package goodee.gdj58.platform.vo;

import lombok.Data;

@Data
public class Question {
	private int questionNo;
	private String id;
	private String questionTitle;
	private String questionMemo;
	private String serviceName;
	private String createdate;
}
