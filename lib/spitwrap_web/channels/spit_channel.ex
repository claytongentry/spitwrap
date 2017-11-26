defmodule SpitwrapWeb.SpitChannel do
  use Phoenix.Channel
  alias Spitwrap.Client
  require Logger

  @default_response "Knock the gravy out ya biscuit!"

  def join("spit:" <> room_id, _params, socket) do
    case GenServer.call Client, {:join, room_id} do
      {:ok, ^room_id} -> {:ok, socket}
      other           ->
        Logger.error "Could not join room #{inspect room_id}: #{inspect other}"

        {:error, :join_failed}
    end
  end

  def handle_in("new_spit", %{"body" => body}, socket) do
    broadcast! socket, "new_spit", %{body: body}
    broadcast! socket, "new_spit", %{body: spit_back(body)} # spitbot's response

    {:noreply, socket}
  end

  def handle_in("exit:" <> room_id, _params, socket) do
    GenServer.cast Client, {:exit, room_id}

    {:noreply, socket}
  end

  defp spit_back(body) do
    case GenServer.call Client, {:spit, body} do
      {:ok, response} -> response
      {:error, error} ->
        Logger.error "Dropped the bar: #{inspect error}"

        @default_response
    end
  end
end
