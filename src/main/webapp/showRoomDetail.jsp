<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="dao.RoomRepository" %>
<%@ page import="dto.chatroom" %>

<%
String roomId = request.getParameter("roomId");
RoomRepository dao = RoomRepository.getInstance();
chatroom room = dao.getRoomById(roomId);
%>

<% if (room != null) { %>
    <div class="text-center mb-4">
        <img src="./resources/images/<%= room.getFilename() %>"
             alt="room image"
             style="width:120px; height:120px; object-fit:cover; border-radius:16px; margin:0 auto;">
    </div>

    <h2 class="mb-3"><%= room.getRoomname() %></h2>
    <p class="text-muted mb-2"><%= room.getDescription() %></p>
    <p class="mb-4">참여 인원: <strong><%= room.getEntry() %></strong>명</p>

    <form action="enterRoom.jsp" method="post">
        <input type="hidden" name="roomId" value="<%= room.getRoomId() %>">

        <% if (room.hasPassword()) { %>
            <div class="mb-3">
                <label for="password" class="form-label">비밀번호</label>
                <input type="password" id="password" name="password" class="form-control">
            </div>
        <% } %>

        <button type="submit" class="btn btn-primary">참가</button>
    </form>
<% } else { %>
    <p>존재하지 않는 채팅방입니다.</p>
<% } %>