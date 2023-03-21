package goodee.gdj58.platform.vo;

import lombok.Data;

@Data
public class Chatting {
	private int chattingNo;
	private int chattingRoomNo;
	private String fromId;
	private String toId;
	private String chattingMemo;
	private String createdate;
}
