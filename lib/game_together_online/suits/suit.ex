defmodule GameTogetherOnline.Suits.Suit do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, read_after_writes: true}
  @foreign_key_type :binary_id

  alias GameTogetherOnline.Cards.Card

  schema "suits" do
    field :name, :string
    has_many :cards, Card

    timestamps(type: :utc_datetime_usec)
  end

  def changeset(suit, attrs \\ %{}) do
    suit
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
