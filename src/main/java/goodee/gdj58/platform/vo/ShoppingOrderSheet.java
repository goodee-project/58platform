package goodee.gdj58.platform.vo;

import lombok.Data;

@Data
public class ShoppingOrderSheet {
	private int orderSheetNo;
	private String companyId;
	private int customerAddressNo;
	private String customerId;
	private String orderSheetState;
	private String orderSheetWaybill;
	private int orderSheetPrice;
	private String createdate;
}
