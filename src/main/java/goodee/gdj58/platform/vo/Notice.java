package goodee.gdj58.platform.vo;

import lombok.Data;

@Data
public class Notice {
	private int NoticeNo;
	private String serviceName;
	private String noticeTitle;
	private String noticeMemo;
	private String createdate;
	private String updatedate;	
}
