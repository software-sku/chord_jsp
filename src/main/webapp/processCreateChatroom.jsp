<%@ page contentType="text/html; charset = utf-8" pageEncoding="UTF-8"%>
<%@ page import= "java.sql.*"%>
<%@ page import="java.util.*" %>
<%@ page import="com.oreilly.servlet.*, com.oreilly.servlet.multipart.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	
	String filename="";
	String realFolder="C:\\Users\\hjs\\workspace_webSever\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Final_project\\resources\\image";
	int maxSize=5 * 1024 * 1024;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder,maxSize, encType, new DefaultFileRenamePolicy());
	
	String bookId=multi.getParameter("roomid");
	String name=multi.getParameter("roomname");
	String description=multi.getParameter("description");
	
	Enumeration files=multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	response.sendRedirect("mainpage.jsp");
%>