package goodee.gdj58.platform.vo;

import lombok.Data;

@Data
public class ShoppingRefundHistory {
	private int goodsOrderNo;
	private String refundHistoryState;
	private String refundHistoryReason;
	private String updatedate;
	private String createdate;
}
