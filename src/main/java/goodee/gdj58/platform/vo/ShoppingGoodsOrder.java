package goodee.gdj58.platform.vo;

import lombok.Data;

@Data
public class ShoppingGoodsOrder {
	private int goodsOrderNo;
	private int orderSheetNo;
	private int goodsOptionNo;
	private int goodsOrderQuantity;
	private int goodsOrderPrice;
	private int goodsOrderUsePoint;
	private String goodsOrderState;
	private String createdate;
}
