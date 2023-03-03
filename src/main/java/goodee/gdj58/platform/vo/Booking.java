package goodee.gdj58.platform.vo;

import lombok.Data;

@Data
public class Booking {
	private int bookingNo;
	private String customerId;
	private String bookingCompanyId;
	private String bookingDate;
	private String bookingRequestDate;
	private int productNo;
	private int optionNo;
	private int bookingPrice;
	private int bookingUsePoint;
	private int bookingRankDiscount;
	private int bookingTotalPrice;
	private String bookingState;
	private int bookingPeople;
}
