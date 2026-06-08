package dao;

import java.util.ArrayList;

import dto.chat;
import dto.chatroom;

public class RoomRepository {
	
	private ArrayList<chatroom> listOfChatrooms = new ArrayList<chatroom>();

	private RoomRepository() {
		chatroom chatroom1 = new chatroom("rm0000001", "전체 체팅방", 0);
		chatroom1.setDescription("최초로 생성되는 채팅방이다.");
		chatroom1.setFilename("default.jpg");
		chatroom1.addChat(new chat("rm0000001", "text", "hello. world!", 0));
		
		listOfChatrooms.add(chatroom1);
		
	}
	private static RoomRepository singleton = null;
	public static RoomRepository get()
	{
		if(singleton == null)
		{
			singleton = new RoomRepository();
		}
		return singleton;
	}
	public ArrayList<chatroom> getAllChatrooms(){
		return	listOfChatrooms;
	}
	
	public void addChatroom(chatroom newChatroom)
	{
			listOfChatrooms.add(newChatroom);
	}
	public void removeChatroom(chatroom removedChatroom)
	{
		listOfChatrooms.removeIf(room -> room.getRoomId() == removedChatroom.getRoomId());
	}
	public static chatroom getRoom(String roomId) {
		for(chatroom room : RoomRepository.get().getAllChatrooms()) {
			if(room.getRoomId().equals(roomId)) {
				return room;
			}
		}
		return null;
	}

}
