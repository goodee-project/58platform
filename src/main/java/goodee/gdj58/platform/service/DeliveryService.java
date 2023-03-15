package goodee.gdj58.platform.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import goodee.gdj58.platform.mapper.DeliveryMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class DeliveryService {
	@Autowired
	private DeliveryMapper deliveryMapper;
	
	// 배송완료 (배송중 -> 배송완료 상태변경)
	public Integer modifyDeliveryStateComplete(int orderNo) {
		return deliveryMapper.updateDeliveryStateComplete(orderNo);
	}
	
	// 배송작업현황 (배송중/배송완료 목록 출력)
	public List<Map<String,Object>> getDeliveryStatusList() {
		return deliveryMapper.selectDeliveryStatusList();
	}
	
	// 배송시작 (배송준비 -> 배송중 상태변경)
	public Integer modifyDeliveryStateBegin(int orderNo) {
		return deliveryMapper.updateDeliveryStateBegin(orderNo);
	}
	
	// 배송접수목록 (배송준비상품들 출력)
	public List<Map<String,Object>> getDeliveryReceiveList() {
		return deliveryMapper.selectDeliveryReceiveList();
	}
}
