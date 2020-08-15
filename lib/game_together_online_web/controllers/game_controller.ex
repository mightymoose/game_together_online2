defmodule GameTogetherOnlineWeb.GameController do
  use GameTogetherOnlineWeb, :controller

  alias GameTogetherOnline.Games

  def new(conn, _params) do
    case get_session(conn, :current_user_id) do
      nil ->
        redirect(conn,
          to: Routes.user_path(conn, :new)
        )

      _ ->
        {:ok, %{id: game_id}} = Games.create_game()
        redirect(conn, to: Routes.game_path(conn, :show, game_id))
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
