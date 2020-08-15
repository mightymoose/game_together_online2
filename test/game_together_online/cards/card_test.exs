defmodule GameTogetherOnline.Cards.CardTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.Cards.Card
  alias GameTogetherOnline.Factory

  test "rank_id is required" do
    params = Factory.params_for(:card, rank_id: nil)
    changeset = Card.changeset(%Card{}, params)

    assert changeset.errors[:rank_id] == {"can't be blank", [validation: :required]}
  end

  test "rank_id must reference a rank" do
    {:error, changeset} =
      :card
      |> Factory.build(rank_id: "4c8a4914-6ad2-4c43-bc6d-1dc5b7616e0b")
      |> Card.changeset()
      |> Repo.insert()

    assert changeset.errors == [
             rank_id:
               {"does not exist", [constraint: :foreign, constraint_name: "cards_rank_id_fkey"]}
           ]
  end

  test "suit_id is required" do
    params = Factory.params_for(:card, suit_id: nil)
    changeset = Card.changeset(%Card{}, params)

    assert changeset.errors[:suit_id] == {"can't be blank", [validation: :required]}
  end

  test "suit_id must reference a suit" do
    {:error, changeset} =
      :card
      |> Factory.build(suit_id: "4c8a4914-6ad2-4c43-bc6d-1dc5b7616e0b")
      |> Card.changeset()
      |> Repo.insert()

    assert changeset.errors == [
             suit_id:
               {"does not exist", [constraint: :foreign, constraint_name: "cards_suit_id_fkey"]}
           ]
  end
end
