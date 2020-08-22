defmodule GameTogetherOnline.GameTables.GameTable do
  use GenServer

  alias GameTogetherOnline.Spades.AwaitingPlayers

  def start_link(game_id), do: GenServer.start_link(__MODULE__, game_id, name: via_tuple(game_id))

  def get(game_id),
    do:
      game_id
      |> via_tuple()
      |> GenServer.whereis()

  def summarize(game_id) do
    game_id
    |> via_tuple()
    |> GenServer.call(:summarize)
  end

  def init(game_id), do: {:ok, game_id}

  defp via_tuple(game_id),
    do: {:via, Registry, {GameTogetherOnline.GameTables.GameTable.Registry, game_id}}

  def handle_call(:summarize, _from, game_id), do: {:reply, %AwaitingPlayers{}, game_id}
end
