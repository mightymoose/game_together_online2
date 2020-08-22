defmodule GameTogetherOnline.SeatingCharts.SeatingChart do
  use Ecto.Schema
  import Ecto.Changeset

  alias GameTogetherOnline.Games.Game
  alias GameTogetherOnline.Seats.Seat

  @primary_key {:id, :binary_id, read_after_writes: true}
  @foreign_key_type :binary_id

  schema "seating_charts" do
    belongs_to :game, Game
    belongs_to :seat, Seat

    timestamps(type: :utc_datetime_usec)
  end

  def changeset(card, attrs \\ %{}) do
    card
    |> cast(attrs, [:game_id, :seat_id])
    |> validate_required([:game_id, :seat_id])
    |> foreign_key_constraint(:game_id)
    |> foreign_key_constraint(:seat_id)
  end
end
