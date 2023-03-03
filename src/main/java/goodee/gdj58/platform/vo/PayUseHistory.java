package goodee.gdj58.platform.vo;

import lombok.Data;

@Data
public class PayUseHistory {
	private int payUseHistoryNo;
	private String payUseHistoryCategory;
	private int payUseHistoryContent;
	private String customerId;
	private int price;
	private String creatdate;
	
}
