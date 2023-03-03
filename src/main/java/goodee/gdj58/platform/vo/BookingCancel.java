package goodee.gdj58.platform.vo;

import lombok.Data;

@Data
public class BookingCancel {
	private int bookingNo;
	private String cancelMemo;
	private String cancelSubject;
	private String createdate;
}
