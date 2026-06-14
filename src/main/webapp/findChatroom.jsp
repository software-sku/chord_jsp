<%@ page contentType="text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@ page import="dao.RoomRepository" %>
<%@ page import="dto.chatroom" %>
<%@ page import="java.util.ArrayList" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>servers</title>
    <link href="./resources/css/bootstrap.min.css" rel="stylesheet">
</head>

<body class="d-flex flex-column min-vh-100 bg-light">
<fmt:setLocale value='<%= request.getParameter("language") %>' />
<fmt:bundle basename = "bundle.message"/>
    <%@ include file="menu.jsp" %>
    <main class="container-fluid flex-grow-1 px-0">
        <div class="row g-0 h-100">
            
            <aside class="col-3 border-end bg-white d-flex flex-column">
                <%@ include file="chatSidebar.jsp" %>
            </aside>
            
            <%
            ArrayList<chatroom> chatRooms = RoomRepository.get().getAllChatrooms();
            %>
            <section class="col-9 d-flex align-items-start justify-content-center p-4">
                <div class="bg-white rounded-4 p-4 w-100" style="max-width: 720px;">
                <form action="./processJoinChat.jsp" method="get">
					<table border="1">
						<tr>
        					<th>이름</th>
        					<th>설명</th>
        					<th>참여인원</th>
        					<th></th>
    					</tr>
						<tr>
							<%
								for(chatroom item: chatRooms)
								{
									out.print("<tr>");
									out.print("<td>" + item.getRoomname() + "</td>");
									out.print("<td>" + item.getDescription() + "</td>");
									out.print("<td>" + item.getEntry() + "</td>");
									out.print("<td>" + "<button type='submit' name='id' value='" + item.getRoomId() + "'>참여하기</button>" + "</td>");
									out.print("</tr>");
								}
							%>
						</tr>
					</table>
				</form>
                </div>
            </section>

        </div>
    </main>
    <div class="text-end">
    		<a href="?language=ko">Korean</a> | <a href="?language=en">English</a>
    </div>
    <%@ include file="footer.jsp" %>

</body>
</html>