defmodule GameTogetherOnline.Games do
  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.Games.Game
  alias GameTogetherOnline.Deals

  def create_game(attrs \\ %{}),
    do:
      %Game{}
      |> Game.changeset(attrs)
      |> Repo.insert()
      |> create_deal()

  def start_game(game_id) do
    game = get_game!(game_id)

    case game.started_at do
      nil -> update_game(game, %{started_at: DateTime.utc_now()})
      _ -> {:ok, game}
    end
  end

  def get_game!(id), do: Repo.get!(Game, id)

  def update_game(game, attrs \\ %{}),
    do:
      game
      |> Game.changeset(attrs)
      |> Repo.update()

  defp create_deal({:ok, game}) do
    Deals.create_deal(%{game_id: game.id})
    {:ok, game}
  end

  defp create_deal(error), do: error
end
