defmodule GameTogetherOnlineWeb.GameLive do
  use GameTogetherOnlineWeb, :live_view
  require Ecto.Query

  alias GameTogetherOnline.GameTables

  def mount(%{"game_id" => game_id}, %{"current_user_id" => _current_user_id}, socket) do
    game =
      GameTogetherOnline.GameTables
      |> GameTables.get_game_table!(%{id: game_id})

    {
      :ok,
      socket
      |> assign_new(:game, fn -> game end)
    }
  end

  def mount(%{"game_id" => game_id}, _session, socket) do
    {:ok,
     redirect(socket,
       to: Routes.user_path(socket, :new, redirect: Routes.game_path(socket, :show, game_id))
     )}
  end
end
