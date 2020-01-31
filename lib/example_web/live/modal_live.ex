defmodule ExampleWeb.ModalLive do
  use Phoenix.LiveView

  def render(assigns) do
    # Using a .leex template file below does not hide the modal
    Phoenix.View.render(ExampleWeb.PageView, "modal.html", assigns)

    # Using ~L sigil hides the modal
    # ~L"""
    # <%= if @show_modal do %>
    #   <div id="modal">
    #     <div id="modal-content">
    #       <p>Phoenix Live View rocks!</p>
    #       <button phx-click="hide_modal">Close</button>
    #     </div>
    #   </div>
    # <% end %>
    # """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, :show_modal, true)}
  end

  def handle_event("hide_modal", _value, socket) do
    {:noreply, assign(socket, :show_modal, false)}
  end
end
