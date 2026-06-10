function checkpassword(){
	

	var roomId = request.getParameter("roomId");
	var inputPassword = request.getParameter("password");
	
	if (room != null) {
	    if (room.getPassword() == null || room.getPassword().equals("")) {
	        response.sendRedirect("chatRoom.jsp?roomId=" + roomId);
	    } else if (room.getPassword().equals(inputPassword)) {
	        response.sendRedirect("chatRoom.jsp?roomId=" + roomId);
	    } else {
	        out.println("<script>alert('비밀번호가 틀렸습니다.'); history.back();</script>");
	    }
	}
	document.chatroom
}

function CheckAddRoom() {
	var roomId = document.getElementById("roomId");
	var roomname= document.getElementById("roomname");
	
	if(roomId.value.length < 10 || roomId.value.length > 30){
			alert("[채팅방id]\n최소 10자에서 최대 30자까지 입력하세요");
			roomname.focus();
			return false;
			}
	
	if(roomname.value.length < 1 || roomname.value.length > 50){
			alert("[채팅방명]\n최소 1자에서 최대 50자까지 입력하세요");
			roomname.focus();
			return false;
			}
	
	document.newRoom.submit();
}