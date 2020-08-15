defmodule GameTogetherOnlineWeb.CardView do
  use GameTogetherOnlineWeb, :view

  alias GameTogetherOnline.Cards.Card

  def card_image(card) do
    "/images/cards/#{card_image_rank(card)}#{card_image_suit(card)}.svg"
  end

  defp card_image_rank(%Card{rank: %{name: "Two"}}), do: "2"
  defp card_image_rank(%Card{rank: %{name: "Three"}}), do: "3"
  defp card_image_rank(%Card{rank: %{name: "Four"}}), do: "4"
  defp card_image_rank(%Card{rank: %{name: "Five"}}), do: "5"
  defp card_image_rank(%Card{rank: %{name: "Six"}}), do: "6"
  defp card_image_rank(%Card{rank: %{name: "Seven"}}), do: "7"
  defp card_image_rank(%Card{rank: %{name: "Eight"}}), do: "8"
  defp card_image_rank(%Card{rank: %{name: "Nine"}}), do: "9"
  defp card_image_rank(%Card{rank: %{name: "Ten"}}), do: "10"
  defp card_image_rank(%Card{rank: %{name: "Jack"}}), do: "J"
  defp card_image_rank(%Card{rank: %{name: "Queen"}}), do: "Q"
  defp card_image_rank(%Card{rank: %{name: "King"}}), do: "K"
  defp card_image_rank(%Card{rank: %{name: "Ace"}}), do: "A"

  defp card_image_suit(%Card{suit: %{name: "Spades"}}), do: "S"
  defp card_image_suit(%Card{suit: %{name: "Clubs"}}), do: "C"
  defp card_image_suit(%Card{suit: %{name: "Diamonds"}}), do: "D"
  defp card_image_suit(%Card{suit: %{name: "Hearts"}}), do: "H"
end
