defmodule GameTogetherOnline.GameTables do
  use DynamicSupervisor

  alias GameTogetherOnline.GameTables.GameTable

  def start_link(_) do
    DynamicSupervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  def start_game_table(game_id) do
    child_spec = %{
      id: GameTable,
      start: {GameTable, :start_link, [game_id]},
      restart: :transient
    }

    DynamicSupervisor.start_child(__MODULE__, child_spec)
  end

  def stop_game_table(game_id) do
    game_table = GameTable.get(game_id)
    DynamicSupervisor.terminate_child(__MODULE__, game_table)
  end

  def init(:ok), do: DynamicSupervisor.init(strategy: :one_for_one)
end
