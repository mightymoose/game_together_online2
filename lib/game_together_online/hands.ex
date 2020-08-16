defmodule GameTogetherOnline.Hands do
  alias GameTogetherOnline.Hands.Hand
  alias GameTogetherOnline.Repo

  def create_hand(attrs \\ %{}),
    do:
      %Hand{}
      |> Hand.changeset(attrs)
      |> Repo.insert()
end
