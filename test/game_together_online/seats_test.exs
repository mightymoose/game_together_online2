defmodule GameTogetherOnline.SeatsTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Factory
  alias GameTogetherOnline.Seats

  test "list_seats/0 returns the seats" do
    seats = Factory.insert_list(4, :seat)
    assert seats == Seats.list_seats()
  end
end
