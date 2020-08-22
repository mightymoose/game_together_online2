defmodule GameTogetherOnline.Seats.Seat do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, read_after_writes: true}
  @foreign_key_type :binary_id

  schema "seats" do
    field :seat_number, :integer
    field :name, :string

    timestamps(type: :utc_datetime_usec)
  end

  def changeset(seat, attrs \\ %{}) do
    seat
    |> cast(attrs, [:seat_number, :name])
    |> validate_required([:seat_number, :name])
  end
end
