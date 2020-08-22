defmodule GameTogetherOnline.AssignedSeats.AssignedSeat do
  use Ecto.Schema
  import Ecto.Changeset

  alias GameTogetherOnline.Users.User
  alias GameTogetherOnline.SeatingCharts.SeatingChart

  @primary_key {:id, :binary_id, read_after_writes: true}
  @foreign_key_type :binary_id

  schema "assigned_seats" do
    belongs_to :user, User
    belongs_to :seating_chart, SeatingChart

    timestamps(type: :utc_datetime_usec)
  end

  def changeset(assigned_seat, attrs \\ %{}) do
    assigned_seat
    |> cast(attrs, [:user_id, :seating_chart_id])
    |> validate_required([:user_id, :seating_chart_id])
    |> foreign_key_constraint(:user_id)
    |> foreign_key_constraint(:seating_chart_id)
  end
end
