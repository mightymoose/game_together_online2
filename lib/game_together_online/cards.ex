defmodule GameTogetherOnline.Cards do
  alias GameTogetherOnline.Cards.Card

  def list_suits do
    [
      :spades,
      :clubs,
      :diamonds,
      :hearts
    ]
  end

  def list_ranks do
    [
      :two,
      :three,
      :four,
      :five,
      :six,
      :seven,
      :eight,
      :nine,
      :ten,
      :jack,
      :queen,
      :king,
      :ace
    ]
  end

  def list_cards do
    for rank <- list_ranks(), suit <- list_suits(), do: %Card{suit: suit, rank: rank}
  end
end
