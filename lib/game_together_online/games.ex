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

  defp create_deal({:ok, game}) do
    Deals.create_deal(%{game_id: game.id})
    {:ok, game}
  end

  defp create_deal(error), do: error
end
