defmodule GameTogetherOnline.CardsTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Factory
  alias GameTogetherOnline.Cards
  alias GameTogetherOnline.Unpreloader

  test "list_cards/0 returns the cards" do
    cards = Factory.insert_list(4, :card)

    assert cards ==
             Cards.list_cards()
             |> Enum.map(&Unpreloader.forget(&1, :rank))
             |> Enum.map(&Unpreloader.forget(&1, :suit))
  end
end
