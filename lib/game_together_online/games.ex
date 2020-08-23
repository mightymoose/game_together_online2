defmodule GameTogetherOnline.Games do
  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.Games.Game
  alias GameTogetherOnline.Seats
  alias GameTogetherOnline.SeatingCharts

  def create_game(attrs \\ %{}),
    do:
      %Game{}
      |> Game.changeset(attrs)
      |> Repo.insert()
      |> create_seating_charts()

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

  defp create_seating_charts({:ok, game}) do
    Seats.list_seats()
    |> Enum.each(fn %{id: seat_id} ->
      {:ok, _seating_chart} =
        SeatingCharts.create_seating_chart(%{seat_id: seat_id, game_id: game.id})
    end)

    {:ok, game}
  end

  defp create_seating_charts(error), do: error
end
