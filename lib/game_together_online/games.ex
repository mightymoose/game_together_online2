defmodule GameTogetherOnline.Games do
  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.Games.Game

  def create_game(attrs \\ %{}),
    do:
      %Game{}
      |> Game.changeset(attrs)
      |> Repo.insert()
end
