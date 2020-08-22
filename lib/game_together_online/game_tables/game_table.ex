defmodule GameTogetherOnline.GameTables.GameTable do
  use GenServer

  require Ecto.Query

  alias Ecto.Query
  alias GameTogetherOnline.Games.Game
  alias GameTogetherOnline.Repo

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

  def handle_call(:summarize, _from, game_id) do
    game_summary =
      Game
      |> Query.preload(deals: [hands: [delt_cards: [card: [:rank, :suit]]]])
      |> Repo.get!(game_id)

    {:reply, game_summary, game_id}
  end
end
