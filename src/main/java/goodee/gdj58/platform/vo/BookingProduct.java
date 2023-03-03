package goodee.gdj58.platform.vo;

import lombok.Data;

@Data
public class BookingProduct {
	private int bookingProductNo;
	private String bookingCompanyId;
	private String bookingProductName;
	private int bookingProductPrice;
	private String bookingProductOpen;
	private int bookingProductMaxPeople;
	private int bookingProductMinPeople;
	private String createdate;
}
