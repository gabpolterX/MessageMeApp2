import consumer from "./consumer";

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    console.log("Conectado al canal Chatroom");
  },

  disconnected() {
    console.log("Desconectado del canal Chatroom");
  },

  received(data){
    const messageContainer = $('#message-container');
    if (!messageContainer.text().includes(data.message)){
      messageContainer.append(data.message);
    }
    console.log("mensaje recibido", data.message)
  }

});

