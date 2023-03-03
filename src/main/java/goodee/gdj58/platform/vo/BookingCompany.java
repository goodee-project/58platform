package goodee.gdj58.platform.vo;

import lombok.Data;

@Data
public class BookingCompany {
	private String bookingCompanyId;
	private String bookingCompanyPw;
	private String bookingCompanyName;
	private String bookingCompanyCeo;
	private String bookingCompanyAddress;
	private String bookingCompanyPhone;
	private String bookingCompanyEmail;
	private String bookingCompanyBank;
	private String bookingCompanyAccount;
	private String bookingCompanyNumber;
	private String bookingCompanyActive;
	private String bookingCompanyInfoAgree;
	private int bookingCompanyFailLoginCount;
	private double bookingCompanyLatitude;
	private double bookingCompanyLongtitude;
}
