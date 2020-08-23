defmodule GameTogetherOnline.AssignedSeatsTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Factory
  alias GameTogetherOnline.AssignedSeats
  alias GameTogetherOnline.AssignedSeats.AssignedSeat

  test "create_assigned_seat/1 with valid data creates an assigned_seat" do
    params = Factory.params_for(:assigned_seat)
    {:ok, assigned_seat} = AssignedSeats.create_assigned_seat(params)

    assert Repo.all(AssignedSeat) == [assigned_seat]

    assert(assigned_seat.user_id == params[:user_id])
    assert(assigned_seat.seating_chart_id == params[:seating_chart_id])
  end

  test "create_seating_chart/1 with invalid data returns an error changeset" do
    params = Factory.params_for(:assigned_seat, user_id: nil)
    assert {:error, %Ecto.Changeset{}} = AssignedSeats.create_assigned_seat(params)
    assert [] == Repo.all(AssignedSeat)
  end
end
