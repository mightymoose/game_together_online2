defmodule GameTogetherOnline.Games.Game do
  use Ecto.Schema
  import Ecto.Changeset

  alias GameTogetherOnline.Deals.Deal

  @primary_key {:id, :binary_id, read_after_writes: true}
  @foreign_key_type :binary_id

  schema "games" do
    timestamps(type: :utc_datetime_usec)
    has_many :deals, Deal
  end

  def changeset(game, attrs \\ %{}) do
    game
    |> cast(attrs, [])
  end
end
