package dao;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

public class chatServelet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		int roomId = Integer.parseInt(req.getParameter("roomId"));
		String messageType = req.getParameter("messageType");
		
		resp.setContentType("(text/html);charset-UTF-8");
		switch(messageType) {
		case "text":
			resp.getWriter().write(req.getParameter("message"));
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
