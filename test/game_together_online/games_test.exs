defmodule GameTogetherOnline.GamesTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Repo
  alias GameTogetherOnline.Factory
  alias GameTogetherOnline.Games
  alias GameTogetherOnline.Games.Game

  test "create_game/1 with valid data creates a game" do
    params = Factory.params_for(:game)
    {:ok, game} = Games.create_game(params)

    assert [game] == Repo.all(Game)
  end
end
