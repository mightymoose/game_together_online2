defmodule GameTogetherOnline.RanksTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Factory
  alias GameTogetherOnline.Ranks

  test "list_ranks/0 returns the ranks" do
    ranks = Factory.insert_list(4, :rank)
    assert ranks == Ranks.list_ranks()
  end
end
