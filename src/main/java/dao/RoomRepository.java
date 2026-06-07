package dao;

import java.util.ArrayList;
import dto.chatroom;

public class RoomRepository {
	
	private ArrayList<chatroom> listOfChatrooms = new ArrayList<chatroom>();

	private RoomRepository() {
		chatroom chatroom1 = new chatroom("rm0000001", "전체 체팅방", 0);
		chatroom1.setDescription("최초로 생성되는 채팅방이다.");
		chatroom1.setFilename("default.jpg");
		
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

}
