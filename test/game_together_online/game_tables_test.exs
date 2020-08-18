defmodule GameTogetherOnline.GameTablesTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.Factory
  alias GameTogetherOnline.GameTables
  alias GameTogetherOnline.GameTables.GameTableNotFoundException

  setup do
    game_tables = start_supervised!(GameTogetherOnline.GameTables)
    %{game_tables: game_tables}
  end

  test "get_game_table!/1 returns the game table when one has been stored", %{
    game_tables: game_tables
  } do
    game = Factory.insert(:game)

    GameTogetherOnline.GameTables.create_game_table(game_tables, game)
    assert game == GameTables.get_game_table!(game_tables, game)
  end

  test "get_game_table!/1 raises GameTableNotFoundException when a game table is not found", %{
    game_tables: game_tables
  } do
    game = Factory.insert(:game)

    assert_raise GameTableNotFoundException, fn ->
      GameTables.get_game_table!(game_tables, game)
    end
  end
end
