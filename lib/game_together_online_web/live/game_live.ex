defmodule GameTogetherOnlineWeb.GameLive do
  use GameTogetherOnlineWeb, :live_view
  require Ecto.Query

  alias GameTogetherOnline.GameTables.GameTable

  def mount(%{"game_id" => game_id}, %{"current_user_id" => _current_user_id}, socket) do
    game_summary = GameTable.summarize(game_id)

    {
      :ok,
      socket
      |> assign_new(:game, fn -> game_summary end)
    }
  end

  def mount(%{"game_id" => game_id}, _session, socket) do
    {:ok,
     redirect(socket,
       to: Routes.user_path(socket, :new, redirect: Routes.game_path(socket, :show, game_id))
     )}
  end
end
