package dto;

import java.io.Serializable;
import java.util.ArrayList;
public class chatroom implements Serializable {
		private static final long serialVersionUID=-4274700572038677000L;
		
		private String roomId;
		private String roomname;
		private String description;
		private String password;
		private int entry;
		private String filename;
		private ArrayList<chatroom> listOfSubChatrooms = new ArrayList<chatroom>();
		public chatroom() {
			super();
		}
		
		public chatroom(String roomId, String roomname, int entry) {
			this.roomId=roomId;
			this.roomname=roomname;
			
			this.entry = entry;
			this.roomId=roomId;
		}

		public String getRoomId() {
			return roomId;
		}

		public void setRoomId(String roomId) {
			this.roomId = roomId;
		}

		public String getRoomname() {
			return roomname;
		}

		public void setRoomname(String roomname) {
			this.roomname = roomname;
		}
		
		public String getPassword() {
			return password;
		}

		public void setPassword(String password) {
			this.password = password;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public int getEntry() {
			return entry;
		}

		public void setEntry(int entry) {
			this.entry = entry;
		}

		public String getFilename() {
			return filename;
		}

		public void setFilename(String filename) {
			this.filename = filename;
		}
		public ArrayList<chatroom> getAllSubChatrooms(){
			return	listOfSubChatrooms;
		}
}
