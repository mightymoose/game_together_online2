defmodule GameTogetherOnline.DeltCardsTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.Factory
  alias GameTogetherOnline.DeltCards
  alias GameTogetherOnline.DeltCards.DeltCard

  test "create_delt_card/1 with valid data creates a delt card" do
    params = Factory.params_for(:delt_card)
    {:ok, delt_card} = DeltCards.create_delt_card(params)

    assert [delt_card] == Repo.all(DeltCard)
    assert(delt_card.hand_id == params[:hand_id])
    assert(delt_card.card_id == params[:card_id])
  end

  test "create_delt_card/1 with invalid data returns an error changeset" do
    params = Factory.params_for(:delt_card, hand_id: nil)
    assert {:error, %Ecto.Changeset{}} = DeltCards.create_delt_card(params)
    assert [] == Repo.all(DeltCard)
  end
end
