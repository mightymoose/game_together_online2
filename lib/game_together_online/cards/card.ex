defmodule GameTogetherOnline.Cards.Card do
  use Ecto.Schema
  import Ecto.Changeset

  alias GameTogetherOnline.Suits.Suit
  alias GameTogetherOnline.Ranks.Rank
  alias GameTogetherOnline.DeltCards.DeltCard

  @primary_key {:id, :binary_id, read_after_writes: true}
  @foreign_key_type :binary_id

  schema "cards" do
    belongs_to :suit, Suit
    belongs_to :rank, Rank
    has_many :delt_cards, DeltCard

    timestamps(type: :utc_datetime_usec)
  end

  def changeset(card, attrs \\ %{}) do
    card
    |> cast(attrs, [:rank_id, :suit_id])
    |> validate_required([:rank_id, :suit_id])
    |> foreign_key_constraint(:rank_id)
    |> foreign_key_constraint(:suit_id)
  end
end
