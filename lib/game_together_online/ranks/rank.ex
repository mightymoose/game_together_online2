defmodule GameTogetherOnline.Ranks.Rank do
  use Ecto.Schema
  import Ecto.Changeset

  alias GameTogetherOnline.Cards.Card

  @primary_key {:id, :binary_id, read_after_writes: true}
  @foreign_key_type :binary_id

  schema "ranks" do
    field :name, :string
    has_many :cards, Card

    timestamps(type: :utc_datetime_usec)
  end

  def changeset(rank, attrs \\ %{}) do
    rank
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
