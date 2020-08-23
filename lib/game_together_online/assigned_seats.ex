defmodule GameTogetherOnline.AssignedSeats do
  alias GameTogetherOnline.AssignedSeats.AssignedSeat
  alias GameTogetherOnline.Repo

  def create_assigned_seat(attrs \\ %{}),
    do:
      %AssignedSeat{}
      |> AssignedSeat.changeset(attrs)
      |> Repo.insert()
end
