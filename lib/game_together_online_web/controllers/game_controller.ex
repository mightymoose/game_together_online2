defmodule GameTogetherOnlineWeb.GameController do
  use GameTogetherOnlineWeb, :controller

  require Ecto.Query

  alias GameTogetherOnline.Games
  alias GameTogetherOnline.GameTables

  def new(conn, _params) do
    case get_session(conn, :current_user_id) do
      nil ->
        redirect(conn,
          to: Routes.user_path(conn, :new)
        )

      _ ->
        {:ok, game} = Games.create_game()

        GameTables.start_game_table(game.id)

        redirect(conn, to: Routes.game_path(conn, :show, game))
    end
  end

  def join(conn, %{"game_id" => game_id}) do
    case get_session(conn, :current_user_id) do
      nil ->
        redirect(conn,
          to: Routes.user_path(conn, :new, redirect: Routes.game_path(conn, :show, game_id))
        )

      current_user_id ->
        redirect(conn,
          to:
            Routes.user_path(conn, :edit, current_user_id,
              redirect: Routes.game_path(conn, :show, game_id)
            )
        )
    end
  end
end
