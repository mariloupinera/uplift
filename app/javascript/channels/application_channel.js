import consumer from "./consumer";

const initApplicationCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.applicationId;

    consumer.subscriptions.create({ channel: "ApplicationChannel", id: id }, {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
        console.log(data); // called when data is broadcast in the cable
      },
    });
  }
}

export { initApplicationCable };
