defmodule GameTogetherOnline.Seats do
  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.Seats.Seat

  def list_seats(), do: Repo.all(Seat)
end
