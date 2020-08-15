defmodule GameTogetherOnline.Deals.DealTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.Deals.Deal
  alias GameTogetherOnline.Factory

  test "game_id is required" do
    params = Factory.params_for(:deal, game_id: nil)
    changeset = Deal.changeset(%Deal{}, params)

    assert changeset.errors[:game_id] == {"can't be blank", [validation: :required]}
  end

  test "game_id must reference a game" do
    {:error, changeset} =
      :deal
      |> Factory.build(game_id: "4c8a4914-6ad2-4c43-bc6d-1dc5b7616e0b")
      |> Deal.changeset()
      |> Repo.insert()

    assert changeset.errors == [
             game_id:
               {"does not exist", [constraint: :foreign, constraint_name: "deals_game_id_fkey"]}
           ]
  end
end
