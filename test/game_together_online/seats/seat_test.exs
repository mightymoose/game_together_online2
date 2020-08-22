defmodule GameTogetherOnline.Seats.SeatTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Seats.Seat
  alias GameTogetherOnline.Factory

  test "seat_number is required" do
    params = Factory.params_for(:seat, seat_number: nil)
    changeset = Seat.changeset(%Seat{}, params)

    assert changeset.errors[:seat_number] == {"can't be blank", [validation: :required]}
  end

  test "name is required" do
    params = Factory.params_for(:seat, name: nil)
    changeset = Seat.changeset(%Seat{}, params)

    assert changeset.errors[:name] == {"can't be blank", [validation: :required]}
  end
end
