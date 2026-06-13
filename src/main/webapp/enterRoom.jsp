<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.RoomRepository" %>
<%@ page import="dto.chatroom" %>

<%
request.setCharacterEncoding("UTF-8");

String roomId = request.getParameter("roomId");
String inputPassword = request.getParameter("password");

RoomRepository dao = RoomRepository.getInstance();
chatroom room = dao.getRoomById(roomId);

if (room == null) {
    out.println("<script>alert('존재하지 않는 채팅방입니다.'); location.href='mainpage.jsp';</script>");
    return;
}

if (room.hasPassword()) {
    if (inputPassword == null || !room.getPassword().equals(inputPassword)) {
        out.println("<script>alert('비밀번호가 틀렸습니다.'); location.href='mainpage.jsp?roomId=" + roomId + "';</script>");
        return;
    }
}

room.setEntry(room.getEntry() + 1);
response.sendRedirect("chatRoom.jsp?roomId=" + roomId);
%>