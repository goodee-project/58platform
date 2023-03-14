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
	
	public Integer modifyDeliveryStateBegin(int orderNo) {
		return deliveryMapper.updateDeliveryStateBegin(orderNo);
	}
	
	public List<Map<String,Object>> getDeliveryReceiveList() {
		return deliveryMapper.selectDeliveryReceiveList();
	}
}
