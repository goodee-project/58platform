package goodee.gdj58.platform.vo;

import lombok.Data;

@Data
public class ShoppingStockHistory {
	private int stockHistoryNo;
	private int goodsOptionNo;
	private int stockHistoryQuantity;
	private String stockHistoryState;
	private String stockHistoryMemo;
	private String createdate;
}
