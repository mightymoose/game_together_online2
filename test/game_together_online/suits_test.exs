defmodule GameTogetherOnline.SuitsTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Factory
  alias GameTogetherOnline.Suits

  test "list_suits/0 returns the suits" do
    suits = Factory.insert_list(4, :suit)
    assert suits == Suits.list_suits()
  end
end
