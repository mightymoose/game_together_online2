defmodule GameTogetherOnline.Deals do
  alias GameTogetherOnline.Deals.Deal
  alias GameTogetherOnline.Hands
  alias GameTogetherOnline.Repo

  def create_deal(attrs \\ {}),
    do:
      %Deal{}
      |> Deal.changeset(attrs)
      |> Repo.insert()
      |> create_hands()
      |> deal_cards()

  defp create_hands({:ok, deal}),
    do:
      {:ok,
       %Deal{
         deal
         | hands:
             Enum.map(0..3, fn hand_number ->
               {:ok, hand} = Hands.create_hand(%{deal_id: deal.id, hand_number: hand_number})
               hand
             end)
       }}

  defp create_hands(error), do: error

  defp deal_cards({:ok, deal}) do
    Deal.deal_cards(deal)
    {:ok, deal}
  end

  defp deal_cards(error), do: error
end
