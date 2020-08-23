defmodule GameTogetherOnline.SeatingChartsTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Factory
  alias GameTogetherOnline.SeatingCharts
  alias GameTogetherOnline.SeatingCharts.SeatingChart

  test "create_seating_chart/1 with valid data creates a seating_chart" do
    params = Factory.params_for(:seating_chart)
    {:ok, seating_chart} = SeatingCharts.create_seating_chart(params)

    assert Repo.all(SeatingChart) == [seating_chart]

    assert(seating_chart.game_id == params[:game_id])
    assert(seating_chart.seat_id == params[:seat_id])
  end

  test "create_seating_chart/1 with invalid data returns an error changeset" do
    params = Factory.params_for(:seating_chart, game_id: nil)
    assert {:error, %Ecto.Changeset{}} = SeatingCharts.create_seating_chart(params)
    assert [] == Repo.all(SeatingChart)
  end
end
