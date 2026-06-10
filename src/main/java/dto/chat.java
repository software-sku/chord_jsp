package dto;

import java.io.Serializable;
import java.util.UUID;
public class chat implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6042147643639310541L;
	
	public String getRoomId() {
		return roomId;
	}
	public String getMessageType() {
		return messageType;
	}
	public String getMessage() {
		return message;
	}
	
	public long getChatTime() {
		return chatTime;
	}
	public chat(String roomId, String messageType, String message, long chatTime, String id, String name) {
		super();
		this.roomId = roomId;
		this.messageType = messageType;
		this.message = message;
		this.chatTime = chatTime;
		this.name = name;
		this.id = id;
	}
	
	public chat(String uid, String roomId, String messageType, String message, long chatTime, String id, String name) {
		super();
		this.UId = UUID.fromString(uid);
		this.roomId = roomId;
		this.messageType = messageType;
		this.message = message;
		this.chatTime = chatTime;
		this.name = name;
		this.id = id;
	}

	public UUID getUId() {
		return UId;
	}
	private UUID UId = UUID.randomUUID();
	private String roomId="0";
	private String messageType = "none";
	private String message = "";
	private long chatTime = 0;
	private String id ="";
	private String name ="";

	public String getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	 
}
