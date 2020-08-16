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
    assert game.started_at == nil
  end

  test "update_game/2 with valid data updates the game" do
    game = Factory.insert(:game)
    params = Factory.params_for(:game, started_at: DateTime.utc_now())

    {:ok, updated_game} = Games.update_game(game, params)

    assert updated_game == Games.get_game!(updated_game.id)
    assert updated_game.started_at == params[:started_at]
  end

  test "start_game/1 with a pending game sets started_at" do
    game = Factory.insert(:game)
    assert game.started_at == nil
    {:ok, updated_game} = Games.start_game(game.id)

    assert [updated_game] == Repo.all(Game)
    assert updated_game.started_at != nil
  end

  test "start_game/1 with a started game returns the game" do
    game = Factory.insert(:game, started_at: DateTime.utc_now())
    {:ok, updated_game} = Games.start_game(game.id)

    assert updated_game.started_at == game.started_at
  end

  test "get_game/1 returns the game with the given id" do
    game = Factory.insert(:game)
    assert Games.get_game!(game.id) == game
  end
end
