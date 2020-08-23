defmodule GameTogetherOnline.SeatingCharts do
  alias GameTogetherOnline.SeatingCharts.SeatingChart
  alias GameTogetherOnline.Repo

  def create_seating_chart(attrs \\ %{}),
    do:
      %SeatingChart{}
      |> SeatingChart.changeset(attrs)
      |> Repo.insert()
end
