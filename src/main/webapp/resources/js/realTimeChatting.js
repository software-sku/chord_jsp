/**
 * 
 */
async function postChat()
{
	const urlParams = new URLSearchParams(window.location.search);
	const roomId = urlParams.get('id');
	
	const messageType = document.getElementById("messageType").value;
	const chatTime = Date.now();
	const message = document.getElementById(messageType).value;
	const data = {
				roomId:roomId,
				messageType: messageType,
				message: message,
				chatTime: chatTime,
			};
			console.log(data);
			let form_data = new FormData();

			for ( let key in data ) {
			    form_data.append(key, data[key]);
			}
			
			let entries = form_data.entries();
			for (const pair of entries) {
			    console.log(pair[0]+ ', ' + pair[1]); 
			}
			
			try {
    const response = await fetch("./submitChat", {
      method: 'POST',
      body: form_data
    });
	alert("성공");
	document.getElementById(messageType).value = "";
  } catch (error) {
    alert("실패");
  }
}