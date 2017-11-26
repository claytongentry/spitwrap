defmodule Spitwrap.Client do
  use GenServer

  @lines [
    "First I'm going to stack my flow",
    "Then I'm going to stack some more",
    "Close shop then I do my count",
    "Hide the rest of the yams at my auntie house",
    "Patty cake patty cake microwave",
    "It's young jizzle from the bottom of the map",
    "I'm so cool but I'm so hot and I'm so fly and you is so not",
    "cost a cool quarter million, that's how you'll find me",
    "like I got a flame thrower and some gasoline"
  ]

  def start_link(opts) do
    GenServer.start_link __MODULE__, :ok, opts
  end

  @doc """
  Initialize the client with an empty list to hold
  ongoing spit sessions
  """
  def init(:ok) do
    {:ok, []}
  end

  def handle_call({:join, room_id}, _from, state) do
    {:reply, {:ok, room_id}, [ room_id | state ]}
  end

  # TODO: Get the response here
  def handle_call({:spit, bar}, _from, state) do
    {:reply, {:ok, Enum.random(@lines)}, state}
  end

  def handle_cast({:exit, room_id}, _from, state) do
    {:noreply, List.delete(state, room_id)}
  end
end
