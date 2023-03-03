package goodee.gdj58.platform.vo;

import lombok.Data;

@Data
public class ShoppingCategory {
	private int shoppingTypeNo;
	private String shopppingTypeContent;
	private int parentNo;
	private int groupNo;
	private int sequence;
	private int depth;
	private String createdate;
}
