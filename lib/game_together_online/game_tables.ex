defmodule GameTogetherOnline.GameTables do
  use GenServer

  alias GameTogetherOnline.GameTables.GameTableNotFoundException

  def start_link(options \\ []),
    do: GenServer.start_link(__MODULE__, nil, options)

  def create_game_table(game_tables, game) do
    GenServer.cast(game_tables, {:create_game_table, game})
  end

  def get_game_table!(game_tables, game) do
    game_table = GenServer.call(game_tables, {:get_game_table, game})

    case game_table do
      nil ->
        raise GameTableNotFoundException, message: "Could not find a table for game #{game.id}"

      _ ->
        game_table
    end
  end

  @impl true
  def handle_cast({:create_game_table, game}, %{game_tables: game_tables} = state) do
    updated_game_tables = Map.put(game_tables, game.id, game)
    {:noreply, %{state | game_tables: updated_game_tables}}
  end

  @impl true
  def handle_call({:get_game_table, game}, _from, %{game_tables: game_tables} = state) do
    {:reply, game_tables[game.id], state}
  end

  @impl true
  def init(_) do
    {:ok, %{game_tables: %{}}}
  end
end
