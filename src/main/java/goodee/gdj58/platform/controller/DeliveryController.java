package goodee.gdj58.platform.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import goodee.gdj58.platform.service.DeliveryService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class DeliveryController {
	@Autowired DeliveryService deliveryService;
	
	// 배송시작 변경 (배송준비 -> 배송중)
	@PostMapping("/employee/delivery/deliveryBegin")
	public String modifyDeliveryStateBegin(@RequestParam(value="orderNo") int[] orderNo) {
		log.debug("\u001B[46m"+"배송할 주문건수 : "+orderNo.length);
		log.debug("\u001B[46m"+"orderNo[0] : "+orderNo[0]);
		// log.debug("\u001B[46m"+"orderNo[1] : "+orderNo[1]);
		
		// check된 주문건에 대해서 배송상태 변경 (배송준비 -> 배송중)
		for(int i=0; i<orderNo.length; i++) {
			Integer modifyDeliveryBegin = deliveryService.modifyDeliveryStateBegin(orderNo[i]);
			if(modifyDeliveryBegin == null) {
				log.debug("\u001B[46m"+orderNo[i]+"번 주문 배송시작");
			} 
		}
		
		return "redirect:/employee/delivery/deliveryReceive";
	}
	
	// 배송요청 리스트 출력
	@GetMapping("/employee/delivery/deliveryReceive")
	public String getDeliveryRequestList(Model model) {
		List<Map<String,Object>> list = deliveryService.getDeliveryReceiveList();
		
		model.addAttribute("list",list);
		return "delivery/deliveryReceive";
	}
}
