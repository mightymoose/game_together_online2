defmodule GameTogetherOnlineWeb.CardView do
  use GameTogetherOnlineWeb, :view

  alias GameTogetherOnline.Cards.Card

  def card_image(card) do
    "/images/cards/#{card_image_rank(card)}#{card_image_suit(card)}.svg"
  end

  defp card_image_rank(%Card{rank: :two}), do: "2"
  defp card_image_rank(%Card{rank: :three}), do: "3"
  defp card_image_rank(%Card{rank: :four}), do: "4"
  defp card_image_rank(%Card{rank: :five}), do: "5"
  defp card_image_rank(%Card{rank: :six}), do: "6"
  defp card_image_rank(%Card{rank: :seven}), do: "7"
  defp card_image_rank(%Card{rank: :eight}), do: "8"
  defp card_image_rank(%Card{rank: :nine}), do: "9"
  defp card_image_rank(%Card{rank: :ten}), do: "10"
  defp card_image_rank(%Card{rank: :jack}), do: "J"
  defp card_image_rank(%Card{rank: :queen}), do: "Q"
  defp card_image_rank(%Card{rank: :king}), do: "K"
  defp card_image_rank(%Card{rank: :ace}), do: "A"

  defp card_image_suit(%Card{suit: :spades}), do: "S"
  defp card_image_suit(%Card{suit: :clubs}), do: "C"
  defp card_image_suit(%Card{suit: :diamonds}), do: "D"
  defp card_image_suit(%Card{suit: :hearts}), do: "H"
end
