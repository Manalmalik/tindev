import consumer from "./consumer";

consumer.subscriptions.create("NotificationChannel", {
  connected: function() {
    // Called when the subscription is ready for use on the server
    console.log("connected")
  },

  disconnected: function() {
    // Called when the subscription has been terminated by the server
    console.log("disconnected")
  },

  received: function(data) {
    // Called when there's incoming data on the websocket for this channel
    // $("#notifications").prepend(data.html);
    // console.log("received")
    const notification = document.querySelector('#notif-badge');
    notification.classList.remove("d-none");
  }
});


