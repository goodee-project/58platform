package goodee.gdj58.platform.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DeliveryMapper {
	
	Integer updateDeliveryStateBegin(int orderNo); // 배송시작 (배송준비 -> 배송중 변경)
	List<Map<String,Object>> selectDeliveryReceiveList(); // 배송요청목록
	
}
