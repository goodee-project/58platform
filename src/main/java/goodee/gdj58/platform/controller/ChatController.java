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
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ChatController {
	@Autowired
	private final ChatService chatService;
	
	@GetMapping("/test/login")
	public String login() {
		log.debug("\u001B[44m" + "@GetMapping 로그인");
		
		return "login2";
	}
	
	@PostMapping("/test/login")
	public String login(@RequestParam String name, HttpSession session) {
		log.debug("\u001B[44m" + name + " 로그인");
		session.setAttribute("login", name);
		
		return "redirect:/question/rooms";
	}
	
	// 채팅방 목록 조회
	@GetMapping("/question/rooms")
	public ModelAndView rooms() {
		log.debug("\u001B[44m" + "모든 채팅방 보여주기");
		ModelAndView mv = new ModelAndView("/question/rooms");
		
		mv.addObject("list", chatService.findAllRooms());
		
		return mv;
	}
	
	// 채팅방 개설
    @PostMapping("/question/rooms")
    public String create(){
    	chatService.addChattingRoom();
        return "redirect:/question/rooms";
    }
	
	// 채팅방 조회
    @GetMapping("/chat")
    public String getChat(@RequestParam int chattingRoomNo, Model model){
    	log.debug("\u001B[44m" + chattingRoomNo + "번 채팅방 입장");
    	log.debug("\u001B[44m" + chattingRoomNo + "번 채팅방 정보");

		System.out.println(chatService.getChattingList(chattingRoomNo) + "ddddddddddddd" + chattingRoomNo + ".NO");
        model.addAttribute("chatList", chatService.getChattingList(chattingRoomNo));
        model.addAttribute("chattingRoomNo", chattingRoomNo);
                
        return "chat";
    }	
}