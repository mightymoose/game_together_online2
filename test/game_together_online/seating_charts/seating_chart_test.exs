defmodule GameTogetherOnline.SeatingCharts.SeatingChartTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.SeatingCharts.SeatingChart
  alias GameTogetherOnline.Factory

  test "game_id is required" do
    params = Factory.params_for(:seating_chart, game_id: nil)
    changeset = SeatingChart.changeset(%SeatingChart{}, params)

    assert changeset.errors[:game_id] == {"can't be blank", [validation: :required]}
  end

  test "game_id must reference a game" do
    {:error, changeset} =
      :seating_chart
      |> Factory.build(game_id: "4c8a4914-6ad2-4c43-bc6d-1dc5b7616e0b")
      |> SeatingChart.changeset()
      |> Repo.insert()

    assert changeset.errors == [
             game_id:
               {"does not exist",
                [constraint: :foreign, constraint_name: "seating_charts_game_id_fkey"]}
           ]
  end

  test "seat_id is required" do
    params = Factory.params_for(:seating_chart, seat_id: nil)
    changeset = SeatingChart.changeset(%SeatingChart{}, params)

    assert changeset.errors[:seat_id] == {"can't be blank", [validation: :required]}
  end

  test "seat_id must reference a seat" do
    {:error, changeset} =
      :seating_chart
      |> Factory.build(seat_id: "4c8a4914-6ad2-4c43-bc6d-1dc5b7616e0b")
      |> SeatingChart.changeset()
      |> Repo.insert()

    assert changeset.errors == [
             seat_id:
               {"does not exist",
                [constraint: :foreign, constraint_name: "seating_charts_seat_id_fkey"]}
           ]
  end
end
