defmodule ExampleWeb.NotificationsLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~L"""
    <div>
      <button id="notifications-toggle" phx-click="open_notifications" phx-hook="OpenNotifications">
        Show Notifications
        <%= if @unread_notifications do %>
          🔴
        <% end %>
      </button>
      <div style="visibility: hidden;" id="notifications-list">
        <%= for notification <- @notifications do %>
          <p class="notification"><%= notification.body %>
        <% end %>
      </div>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    notifications = [
      %{body: "Joseph has sent you a message: 'Hey'"},
      %{body: "Joseph has sent you a message: 'Hey'"},
      %{body: "Joseph has sent you a message: 'Hey'"},
      %{body: "Joseph has added you as a friend."}
    ]

    socket =
      socket
      |> assign(:notifications, notifications)
      |> assign(:unread_notifications, true)

    {:ok, socket}
  end

  def handle_event("open_notifications", _params, socket) do
    {:noreply, assign(socket, :unread_notifications, false)}
  end
end
