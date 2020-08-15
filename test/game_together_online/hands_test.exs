defmodule GameTogetherOnline.HandsTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Factory
  alias GameTogetherOnline.Hands
  alias GameTogetherOnline.Hands.Hand

  test "create_hand/1 with valid data creates a hand" do
    params = Factory.params_for(:hand)

    {:ok, hand} = Hands.create_hand(params)

    assert [%{hand | cards: nil}] == Repo.all(Hand)
    assert(hand.deal_id == params[:deal_id])
  end

  test "create_hand/1 with invalid data returns an error changeset" do
    params = Factory.params_for(:hand, deal_id: nil)
    assert {:error, %Ecto.Changeset{}} = Hands.create_hand(params)
    assert [] == Repo.all(Hand)
  end
end
