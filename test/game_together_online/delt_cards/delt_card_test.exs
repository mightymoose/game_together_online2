defmodule GameTogetherOnline.DeltCards.DeltCardTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.DeltCards.DeltCard
  alias GameTogetherOnline.Factory

  test "card_id is required" do
    params = Factory.params_for(:delt_card, card_id: nil)
    changeset = DeltCard.changeset(%DeltCard{}, params)

    assert changeset.errors[:card_id] == {"can't be blank", [validation: :required]}
  end

  test "card_id must reference a card" do
    {:error, changeset} =
      :delt_card
      |> Factory.build(card_id: "4c8a4914-6ad2-4c43-bc6d-1dc5b7616e0b")
      |> DeltCard.changeset()
      |> Repo.insert()

    assert changeset.errors == [
             card_id:
               {"does not exist",
                [constraint: :foreign, constraint_name: "delt_cards_card_id_fkey"]}
           ]
  end

  test "hand_id is required" do
    params = Factory.params_for(:delt_card, hand_id: nil)
    changeset = DeltCard.changeset(%DeltCard{}, params)

    assert changeset.errors[:hand_id] == {"can't be blank", [validation: :required]}
  end

  test "hand_id must reference a hand" do
    {:error, changeset} =
      :delt_card
      |> Factory.build(hand_id: "4c8a4914-6ad2-4c43-bc6d-1dc5b7616e0b")
      |> DeltCard.changeset()
      |> Repo.insert()

    assert changeset.errors == [
             hand_id:
               {"does not exist",
                [constraint: :foreign, constraint_name: "delt_cards_hand_id_fkey"]}
           ]
  end
end
