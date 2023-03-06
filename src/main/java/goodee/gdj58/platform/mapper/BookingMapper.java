package goodee.gdj58.platform.mapper;

import java.util.List;
import java.util.Map;

public interface BookingMapper {
	// 예약번호로 상세정보 조회하기
	List<Map<String, Object>> selectBooking(int bookingNo);
}
