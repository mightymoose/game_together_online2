defmodule GameTogetherOnline.GameTables.GameTableTest do
  use GameTogetherOnline.DataCase

  alias GameTogetherOnline.GameTables.GameTable
  alias GameTogetherOnline.Factory

  test "get/1 returns the id of the table if a tables exists" do
    game = Factory.insert(:game)
    game_pid = start_supervised!({GameTable, game.id})

    assert game_pid == GameTable.get(game.id)
  end

  test "get/1 returns nil when no game table exist" do
    assert nil == GameTable.get("5ae5703d-8ed2-4f7b-8b66-bc851aa128f7")
  end
end
