package dto;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import db.dbAccess;
public class chatroom implements Serializable {
		private static final long serialVersionUID=-4274700572038677000L;
		
		private String roomId;
		private String roomname;
		private String description;
		private int entry;
		private String filename;
		private ArrayList<chat> listOfChats = new ArrayList<chat>();
		public ArrayList<chat> getAllChats() {
			return listOfChats;
		}
		public void addChat(chat newChat)
		{
				try {
					Connection conn = dbAccess.connect();
					Statement stmt = conn.createStatement();
					String sql = "INSERT INTO chats VALUES(" + 
					"'" + newChat.getUId().toString() + "'," +
					"'" + newChat.getRoomId() + "'," +
					"'" + newChat.getMessageType() + "'," +
					"'" + newChat.getMessage() + "'," +
					"'" + newChat.getChatTime() + "'," +
					"'" + newChat.getId() + "'," +
					"'" + newChat.getName() + "'" +
							");";
					stmt.execute(sql);
					listOfChats.add(newChat);
					conn.close();
				} catch (SQLException ex) {
					System.err.print(ex.getMessage());
				}
		}
		public void removeChatroom(chat removedChat)
		{
			listOfChats.removeIf(Chat -> Chat.getUId() == removedChat.getUId());
		}
		public chatroom() {
			super();
		}
		
		public chatroom(String roomId, String roomname, int entry) {
			this.roomId=roomId;
			this.roomname=roomname;
			this.entry = entry;
			this.roomId=roomId;
			try {
			Connection conn = dbAccess.connect();
			String sql = "SELECT * FROM chats WHERE roomId = "+ "'" + roomId + "'";
			PreparedStatement stmt = conn.prepareStatement(sql);
			ResultSet result = stmt.executeQuery(sql);
			while(result.next())
			{
				chat newChat;
				newChat = new chat(
						result.getString("uid"), 
						result.getString("roomId"), 
						result.getString("messageType"), 
						result.getString("message"), 
						Long.parseLong(result.getString("chatTime")),
						result.getString("id"), 
						result.getString("name")
								);
				listOfChats.add(newChat);
			}
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
}
