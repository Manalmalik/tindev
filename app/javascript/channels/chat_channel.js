import consumer from "./consumer";

const initChatCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.chatId;

    consumer.subscriptions.create({ channel: "ChatChannel", id: id }, {
      received(data) {
        console.log("Fook")
        // console.log(data);
        messagesContainer.insertAdjacentHTML('beforeend', data);

        const inputMessage = document.getElementById('message_content');
        inputMessage.value = "";

        console.log(window.location.href)
        const regex = RegExp('categories\/\d+\/tickets\/\d+\/chats\/\d+');
        if (!regex.test(window.location.href)) {
          console.log("yay")
        }

      },
    });
  }
}

export { initChatCable };
