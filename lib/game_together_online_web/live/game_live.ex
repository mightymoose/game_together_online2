defmodule GameTogetherOnlineWeb.GameLive do
  use GameTogetherOnlineWeb, :live_view
  require Ecto.Query

  alias GameTogetherOnline.GameTables.GameTable
  alias GameTogetherOnline.Spades.AwaitingPlayers
  alias GameTogetherOnlineWeb.GameView

  def mount(%{"game_id" => game_id}, %{"current_user_id" => _current_user_id}, socket) do
    {
      :ok,
      socket
      |> assign_new(:game, fn -> GameTable.summarize(game_id) end)
    }
  end

  def mount(%{"game_id" => game_id}, _session, socket) do
    {:ok,
     redirect(socket,
       to: Routes.user_path(socket, :new, redirect: Routes.game_path(socket, :show, game_id))
     )}
  end

  def render(%{game: %AwaitingPlayers{} = awaiting_players}),
    do:
      Phoenix.View.render(GameView, "awaiting_players.html", %{
        awaiting_players: awaiting_players
      })
end
