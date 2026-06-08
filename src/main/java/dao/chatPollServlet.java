package dao;

import java.io.IOException;
import java.util.Enumeration;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dto.chat;
import dto.chatroom;

public class chatPollServlet extends HttpServlet {

	private static final long serialVersionUID = 7956004107068743954L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MultipartRequest multi = new MultipartRequest(req, "./", 1024, "utf-8", new DefaultFileRenamePolicy());

		String roomId = multi.getParameter("roomId");
		chatroom foundroom = RoomRepository.getRoom(roomId);
		resp.setContentType("(text/json);charset-UTF-8");

		if(foundroom == null || foundroom.getAllChats().size() == 0) {
			resp.getWriter().write("[");
			resp.getWriter().write("]");
			return;
		};
		resp.getWriter().write("[");
		for(chat Chat : foundroom.getAllChats()) {
			resp.getWriter().write("\"");
			resp.getWriter().write(Chat.getMessage().replace("\n", " "));
			resp.getWriter().write("\"");
			if(Chat != foundroom.getAllChats().get(foundroom.getAllChats().size()-1)) {resp.getWriter().write(",");} 
		}
		resp.getWriter().write("]");
	}

}
