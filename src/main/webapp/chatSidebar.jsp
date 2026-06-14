<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dao.RoomRepository" %>
<%@ page import="dto.chatroom" %>

<%
RoomRepository dao = RoomRepository.getInstance();
ArrayList<chatroom> roomList = dao.getAllChatrooms();
%>

<div class="d-flex flex-column h-100 p-3">
    <div class="pb-3 border-bottom">
        <h5 class="mb-3">채팅방</h5>
        <input type="text" class="form-control" placeholder="채팅방 검색">
    </div>

	<%
	String url = request.getRequestURL().toString();
	url = url.substring(url.lastIndexOf("/"), url.length());
	out.print(url);
	%>

    <nav class="flex-grow-1 overflow-auto pt-3" aria-label="채팅방 목록">
        <div class="list-group list-group-flush">
            <a href="./createChatroom.jsp" class="list-group-item list-group-item-action <%=url.equals("/mainpage.jsp") ? "active":"" %>">채팅방 만들기</a>
            <a href="./findChatroom.jsp" class="list-group-item list-group-item-action <%=url.equals("/findChatroom.jsp") ? "active":"" %>">전체 채팅방</a>
        <div class="list-group list-group-flush mb-3">
            <a href="./createChatroom.jsp" class="list-group-item list-group-item-action active">채팅방 만들기</a>
        </div>
        <div class="list-group list-group-flush">
            <% for(chatroom room : roomList) { %>
                <a href="mainpage.jsp?roomId=<%= room.getRoomId() %>" class="list-group-item list-group-item-action d-flex align-items-center gap-2">
                    <img src="./resources/images/<%= room.getFilename() %>"alt="room" style="width:40px; height:40px; object-fit:cover; border-radius:8px;">
                    <div class="flex-grow-1">
                        <div class="fw-semibold">
                            <%= room.getRoomname() %>
                            <% if(room.hasPassword()) { %>
                                🔒
                            <% } %>
                        </div>
                        <small class="text-muted"><%= room.getDescription() %></small>
                    </div>
                </a>
            <% } %>
        </div>
        <div class="flex-grow-1 overflow-auto pt-3">
        	<a href="logout.jsp" class="btn btn-sm btn-success pull right">logout</a>
        </div>
    </nav>
</div>