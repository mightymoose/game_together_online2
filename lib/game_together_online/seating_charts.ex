defmodule GameTogetherOnline.SeatingCharts do
  require Ecto.Query

  alias GameTogetherOnline.SeatingCharts.SeatingChart
  alias GameTogetherOnline.Repo
  alias Ecto.Query

  def create_seating_chart(attrs \\ %{}),
    do:
      %SeatingChart{}
      |> SeatingChart.changeset(attrs)
      |> Repo.insert()

  def with_game_id(game_id) do
    SeatingChart
    |> Query.where(game_id: ^game_id)
    |> Query.preload(:seat)
    |> Repo.all()
  end
end
