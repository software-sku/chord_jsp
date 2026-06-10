package dao;

import java.util.ArrayList;
import dto.chatroom;
public class RoomRepository {
	
	private ArrayList<chatroom> listOfChatrooms = new ArrayList<chatroom>();
	private static RoomRepository instance = new RoomRepository();

	public RoomRepository() {
		chatroom chatroom1 = new chatroom("rm0000001", "전체 체팅방", 0);
		chatroom1.setDescription("최초로 생성되는 채팅방이다.");
		chatroom1.setFilename("default.jpg");
		
		listOfChatrooms.add(chatroom1);
		
	}
	public static RoomRepository getInstance() {
		return instance;
	}
	public ArrayList<chatroom> getAllChatrooms(){
		return	listOfChatrooms;
	}
	
	public void addRoom(chatroom room) {
		listOfChatrooms.add(room);
	}
	public chatroom getRoomById(String roomId) {
        for (chatroom room : listOfChatrooms) {
            if (room.getRoomId().equals(roomId)) {
                return room;
            }
        }
        return null;
    }
}
