defmodule GameTogetherOnline.Hands.HandTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.Hands.Hand
  alias GameTogetherOnline.Factory

  test "deal_id is required" do
    params = Factory.params_for(:hand, deal_id: nil)
    changeset = Hand.changeset(%Hand{}, params)

    assert changeset.errors[:deal_id] == {"can't be blank", [validation: :required]}
  end

  test "deal_id must reference a deal" do
    {:error, changeset} =
      :hand
      |> Factory.build(deal_id: "4c8a4914-6ad2-4c43-bc6d-1dc5b7616e0b")
      |> Hand.changeset()
      |> Repo.insert()

    assert changeset.errors == [
             deal_id:
               {"does not exist", [constraint: :foreign, constraint_name: "hands_deal_id_fkey"]}
           ]
  end
end
