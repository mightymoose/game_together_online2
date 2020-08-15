defmodule GameTogetherOnline.Suits.SuitTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Suits.Suit
  alias GameTogetherOnline.Factory

  test "name is required" do
    params = Factory.params_for(:suit, name: nil)
    changeset = Suit.changeset(%Suit{}, params)

    assert changeset.errors[:name] == {"can't be blank", [validation: :required]}
  end
end
