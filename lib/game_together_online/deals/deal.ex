defmodule GameTogetherOnline.Deals.Deal do
  use Ecto.Schema
  import Ecto.Changeset

  alias GameTogetherOnline.Cards
  alias GameTogetherOnline.Hands.Hand
  alias GameTogetherOnline.Games.Game

  alias __MODULE__

  @primary_key {:id, :binary_id, read_after_writes: true}
  @foreign_key_type :binary_id

  schema "deals" do
    belongs_to :game, Game
    has_many :hands, Hand

    timestamps(type: :utc_datetime_usec)
  end

  def deal_cards(deal) do
    Cards.list_cards()
    |> Enum.shuffle()
    |> Enum.with_index()
    |> Enum.reduce(deal, &add_to_hand/2)
  end

  def changeset(deal, attrs \\ %{}) do
    deal
    |> cast(attrs, [:game_id])
    |> validate_required([:game_id])
    |> foreign_key_constraint(:game_id)
  end

  defp add_to_hand({card, index}, deal) do
    update_hand(deal, rem(index, 4), fn hand -> Hand.add_card(hand, card) end)
  end

  defp update_hand(%Deal{hands: hands}, index, fun),
    do: %Deal{hands: List.update_at(hands, index, fun)}
end
