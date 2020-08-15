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

  defp create_hands({:ok, deal}),
    do:
      {:ok,
       %Deal{
         deal
         | hands: Enum.map(0..3, fn _i -> Hands.create() end)
       }}

  defp create_hands(error), do: error
end
