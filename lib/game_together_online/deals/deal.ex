defmodule GameTogetherOnline.Deals.Deal do
  use Ecto.Schema

  alias GameTogetherOnline.Cards
  alias GameTogetherOnline.Hands.Hand

  alias __MODULE__

  embedded_schema do
    field :hands
  end

  def deal_cards(deal) do
    Cards.list_cards()
    |> Enum.shuffle()
    |> Enum.with_index()
    |> Enum.reduce(deal, &add_to_hand/2)
  end

  defp add_to_hand({card, index}, deal) do
    update_hand(deal, rem(index, 4), fn hand -> Hand.add_card(hand, card) end)
  end

  defp update_hand(%Deal{hands: hands}, index, fun),
    do: %Deal{hands: List.update_at(hands, index, fun)}
end
