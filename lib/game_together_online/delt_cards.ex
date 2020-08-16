defmodule GameTogetherOnline.DeltCards do
  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.DeltCards.DeltCard

  def create_delt_card(attrs \\ %{}),
    do:
      %DeltCard{}
      |> DeltCard.changeset(attrs)
      |> Repo.insert()
end
