package goodee.gdj58.platform.vo;

import lombok.Data;

@Data
public class Chatting {
	private int chattingNo;
	private String chattingRoomName;
	private String fromId;
	private String toId;
	private String chattingMemo;
	private String createdate;
}
