using Microsoft.AspNetCore.SignalR;

namespace SimpleChatApp.Hubs
{
    public class ChatHub : Hub
    {
        public async Task SendMessage(string user, string message)
        {
            // Broadcasts the user's name and message to everyone online
            await Clients.All.SendAsync("ReceiveMessage", user, message);
        }
    }
}
