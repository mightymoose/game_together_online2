defmodule GameTogetherOnlineWeb.GameController do
  use GameTogetherOnlineWeb, :controller

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
