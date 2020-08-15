defmodule GameTogetherOnline.Ranks.RankTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Ranks.Rank
  alias GameTogetherOnline.Factory

  test "name is required" do
    params = Factory.params_for(:rank, name: nil)
    changeset = Rank.changeset(%Rank{}, params)

    assert changeset.errors[:name] == {"can't be blank", [validation: :required]}
  end
end
