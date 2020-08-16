defmodule GameTogetherOnline.DeltCards.DeltCard do
  use Ecto.Schema
  import Ecto.Changeset

  alias GameTogetherOnline.Cards.Card
  alias GameTogetherOnline.Hands.Hand

  @primary_key {:id, :binary_id, read_after_writes: true}
  @foreign_key_type :binary_id

  schema "delt_cards" do
    belongs_to :hand, Hand
    belongs_to :card, Card

    timestamps(type: :utc_datetime_usec)
  end

  def changeset(delt_card, attrs \\ %{}) do
    delt_card
    |> cast(attrs, [:hand_id, :card_id])
    |> validate_required([:hand_id, :card_id])
    |> foreign_key_constraint(:hand_id)
    |> foreign_key_constraint(:card_id)
  end
end
