defmodule SpitwrapWeb.SpitChannel do
  use Phoenix.Channel

  def join("spit:" <> _room_id, _params, socket) do
    {:ok, socket}
  end

  def handle_in("new_spit", %{"body" => body}, socket) do
    broadcast! socket, "new_spit", %{body: body}
    {:noreply, socket}
  end
end
