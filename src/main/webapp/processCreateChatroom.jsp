<%@ page contentType="text/html; charset = utf-8" pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.chatroom" %>
<%@ page import="dao.RoomRepository" %>
<%@ page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String filename="";
	String realFolder="C:\\Users\\hjs\\git\\chord_jsp\\src\\main\\webapp\\resources\\css\\image";
	int maxSize=5 * 1024 * 1024;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder,maxSize, encType, new DefaultFileRenamePolicy());
	
	String roomId=multi.getParameter("roomid");
	String roomname=multi.getParameter("roomname");
	String description=multi.getParameter("description");
	String usePassword = multi.getParameter("usePassword");
	String password = multi.getParameter("password");
	
	Enumeration files=multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	if (fileName == null) {
	    fileName = "default.jpg";
	}

	chatroom room = new chatroom();
	room.setRoomId(roomId);
	room.setRoomname(roomname);
	room.setDescription(description);
	room.setFilename(fileName);
	room.setEntry(0);

	if (usePassword != null && password != null && !password.trim().equals("")) {
	    room.setPassword(password);
	} else {
	    room.setPassword("");
	}

	RoomRepository dao = RoomRepository.getInstance();
	dao.addRoom(room);
	
	response.sendRedirect("mainpage.jsp");
%>