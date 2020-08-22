defmodule GameTogetherOnline.AssignedSeats.AssignedSeatTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.AssignedSeats.AssignedSeat
  alias GameTogetherOnline.Factory

  test "user_id is required" do
    params = Factory.params_for(:assigned_seat, user_id: nil)
    changeset = AssignedSeat.changeset(%AssignedSeat{}, params)

    assert changeset.errors[:user_id] == {"can't be blank", [validation: :required]}
  end

  test "user_id must reference a user" do
    {:error, changeset} =
      :assigned_seat
      |> Factory.build(user_id: "4c8a4914-6ad2-4c43-bc6d-1dc5b7616e0b")
      |> AssignedSeat.changeset()
      |> Repo.insert()

    assert changeset.errors == [
             user_id:
               {"does not exist",
                [constraint: :foreign, constraint_name: "assigned_seats_user_id_fkey"]}
           ]
  end

  test "seating_chart_id is required" do
    params = Factory.params_for(:assigned_seat, seating_chart_id: nil)
    changeset = AssignedSeat.changeset(%AssignedSeat{}, params)

    assert changeset.errors[:seating_chart_id] == {"can't be blank", [validation: :required]}
  end

  test "seating_chart_id must reference a seat" do
    {:error, changeset} =
      :assigned_seat
      |> Factory.build(seating_chart_id: "4c8a4914-6ad2-4c43-bc6d-1dc5b7616e0b")
      |> AssignedSeat.changeset()
      |> Repo.insert()

    assert changeset.errors == [
             seating_chart_id:
               {"does not exist",
                [constraint: :foreign, constraint_name: "assigned_seats_seating_chart_id_fkey"]}
           ]
  end
end
