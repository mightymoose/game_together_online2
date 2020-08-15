defmodule GameTogetherOnline.DealsTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Factory
  alias GameTogetherOnline.Deals
  alias GameTogetherOnline.Deals.Deal

  test "create_deal/1 with valid data creates a deal" do
    params = Factory.params_for(:deal)
    {:ok, deal} = Deals.create_deal(params)

    assert [%{deal | hands: nil}] == Repo.all(Deal)
    assert(deal.game_id == params[:game_id])
  end

  test "create_deal/1 with invalid data returns an error changeset" do
    params = Factory.params_for(:deal, game_id: nil)
    assert {:error, %Ecto.Changeset{}} = Deals.create_deal(params)
    assert [] == Repo.all(Deal)
  end
end
