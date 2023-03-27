package goodee.gdj58.platform.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import goodee.gdj58.platform.service.ChatService;
import goodee.gdj58.platform.vo.Employee;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ChatController {
	@Autowired
	private final ChatService chatService;	
	
	// 채팅방 목록 조회
	@GetMapping("/employee/question/chat")
	public ModelAndView rooms(HttpSession session
					, @RequestParam(value="chattingRoomNo", defaultValue = "0") int chattingRoomNo) {
		log.debug("\u001B[44m" + "모든 채팅방 보여주기");
		ModelAndView mv = new ModelAndView("question/chat");
		Employee name = (Employee) session.getAttribute("loginEmp");
		
		
		log.debug("\u001B[44m" + name.getEmployeeId() + "loginEmp");
		

		session.setAttribute("login", name.getEmployeeId());
		mv.addObject("chattingRoomNo", chattingRoomNo);
		mv.addObject("roomList", chatService.findAllRooms());
		mv.addObject("chatList", chatService.getChattingList(chattingRoomNo));
		log.debug("\u001B[44m" + chatService.findAllRooms() + "roomList");
		log.debug("\u001B[44m" + chatService.getChattingList(chattingRoomNo) + "chatList");
		
		return mv;
	}
	
	// 채팅방 개설
    @PostMapping("/employee/question/chat")
    public String create(){
    	chatService.addChattingRoom();
        return "redirect:/employee/question/chat";
    }
}