package goodee.gdj58.platform.vo;

import lombok.Data;

@Data
public class BookingProductOption {
	private int bookingProductOptionNo;
	private int bookingProductNo;
	private String bookingProductOptionName;
	private String bookingProductOptionMemo;
	private int bookingProductOptionPrice;
	private String createdate;
}
