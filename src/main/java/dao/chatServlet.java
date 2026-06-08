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

public class chatServlet extends HttpServlet {

	private static final long serialVersionUID = 7956004107068743954L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MultipartRequest multi = new MultipartRequest(req, "./", 5*1024*1024, "utf-8", new DefaultFileRenamePolicy());

		String roomId = multi.getParameter("roomId");
		String messageType = multi.getParameter("messageType");
		String message = multi.getParameter("message");
		long chatTime = Long.parseLong(multi.getParameter("chatTime"));
		resp.setContentType("(text/html);charset-UTF-8");
		switch(messageType) {
		case "text":
			RoomRepository.getRoom(roomId).addChat(new chat(roomId, messageType, message, chatTime));;
			break;
		case "image":
			break;
		case "video":
			break;
		case "file":
			break;
		}
	}

}
