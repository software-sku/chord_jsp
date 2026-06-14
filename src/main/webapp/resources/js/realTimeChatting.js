/**
 * 
 */
function postChat(roomId, messageType, message, chatTime)
{
	$.ajax({
		type : "POST",
		url : "./SubmitChat",
		data: {
			roomId:roomId,
			messageType: messageType,
			message: message,
			chatTime: chatTime,
		},
		success: function(result) {
			if(result == 1) {
					alert("성공");
				}
				else {
					alert("실패");
				}
		}
	});
}