defmodule GameTogetherOnline.Hands do
  alias GameTogetherOnline.Hands.Hand
  alias GameTogetherOnline.Repo

  def create_hand(attrs \\ %{}),
    do:
      %Hand{}
      |> Hand.changeset(attrs)
      |> Repo.insert()
      |> create_cards()

  defp create_cards({:ok, hand}),
    do: {:ok, %Hand{hand | cards: []}}

  defp create_cards(error), do: error
end
