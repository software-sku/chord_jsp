/**
 *
 */
function getRoomId()
{
	const urlParams = new URLSearchParams(window.location.search);
	const roomId = urlParams.get("id");
	return roomId;
}
function writeChat(chats)
{
	chats.forEach(chat => {
		let li = document.getElementById("chats");
		const span = document.createElement("span");
		li.appendChild(span);
		span.innerText = chat;
		console.log(chat);
	});
}
function getChatCache(roomId)
{
	let cache = sessionStorage.getItem(roomId);
			if(cache == null){cache = "[]";}
			cache = JSON.parse(cache);
			return cache;
}

window.addEventListener("DOMContentLoaded", function() {
	//if(document.getElementById("chats").hasChildNodes){return;}
	let init = getChatCache(getRoomId());
	writeChat(init);
	pollChat();
    }, false);
async function postChat() {
	const roomId = getRoomId();

  const messageType = document.getElementById("messageType").value;
  const chatTime = Date.now();
  const message = document.getElementById(messageType).value;
  const data = {
    roomId: roomId,
    messageType: messageType,
    message: message,
    chatTime: chatTime,
  };
  console.log(data);
  let form_data = new FormData();

  for (let key in data) {
    form_data.append(key, data[key]);
  }

  let entries = form_data.entries();
  for (const pair of entries) {
    console.log(pair[0] + ", " + pair[1]);
  }

  try {
    const response = await fetch("./submitChat", {
      method: "POST",
      body: form_data,
    });
    alert("성공");
    document.getElementById(messageType).value = "";
  } catch (error) {
    alert("실패");
  }
}

function pollChat() {
	const roomId = getRoomId();
  let form_data = new FormData();
  form_data.append("roomId", roomId);

  try {
    const response = fetch("./pollChat", {
      method: "POST",
      body: form_data,
    }).then((response) => {
      if (!response.ok) {
        throw new Error(`HTTP 오류! 상태: ${response.status}`);
      }

      response.json().then((receivedJson) => {
        console.log(receivedJson);
		let cache = sessionStorage.getItem(roomId);
		if(cache == null){cache = "[]";}
		cache = JSON.parse(cache);
		if(cache.length < receivedJson.length){
			sessionStorage.setItem(roomId, JSON.stringify(receivedJson));
			const begin = cache.length;
			writeChat(receivedJson.slice(begin));
		}
      });
    });
  } catch (error) {
    alert("실패");
  }
}
