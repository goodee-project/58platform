package goodee.gdj58.platform.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import goodee.gdj58.platform.vo.Chatting;

@Mapper
public interface ChatMapper {
	// 채팅방 생성하기
	int insertChattingRoom();
	
	// 채팅방 불러오기
	List<Map<String, Object>> selectChattingRoomList();
	
	// 메세지 보내기
	int insertChattingMsg(Chatting message);
	
	// 메세지 보낸 후 채팅방 업데이트
	int updateChattingRoomListTime(String chattingRoomName);
	
	// 메세지 불러오기
	List<Map<String, Object>> selectChattingList(String chattingRoomName);

}
