package goodee.gdj58.platform.vo;

import lombok.Data;

@Data
public class Notice {
	private int noticeNo;
	private String serviceName;
	private String noticeTitle;
	private String noticeMemo;
	private String createdate;
	private String updatedate;	
}
