package goodee.gdj58.platform.vo;

import lombok.Data;

@Data
public class paySaveHistory {
	private int paySaveHistoryNo;
	private String paySaveHistoryCategory;
	private int paySaveHistoryContent;
	private String customerId;
	private int price;
	private String creatdate;
}
