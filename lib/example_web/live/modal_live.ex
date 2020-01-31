defmodule ExampleWeb.ModalLive do
  use Phoenix.LiveView

  def render(assigns) do
    # Phoenix.View.render(ExampleWeb.PageView, "modal.html", assigns)

    ~L"""
    <%= if @show_modal do %>
      <div id="modal">
        <div id="modal-content">
          <p>Phoenix Live View rocks!</p>
          <button phx-click="hide_modal">Close</button>
        </div>
      </div>
    <% end %>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :show_modal, true)}
  end

  def handle_event("hide_modal", _value, socket) do
    {:noreply, assign(socket, :show_modal, false)}
  end
end
