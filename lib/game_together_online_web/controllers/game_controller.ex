defmodule GameTogetherOnlineWeb.GameController do
  use GameTogetherOnlineWeb, :controller

  require Ecto.Query

  alias GameTogetherOnline.Games
  alias GameTogetherOnline.Games.Game
  alias GameTogetherOnline.GameTables
  alias GameTogetherOnline.Repo
  alias Ecto.Query

  def new(conn, _params) do
    case get_session(conn, :current_user_id) do
      nil ->
        redirect(conn,
          to: Routes.user_path(conn, :new)
        )

      _ ->
        {:ok, %{id: game_id}} = Games.create_game()

        game_with_everything =
          Game
          |> Query.preload(deals: [hands: [delt_cards: [card: [:rank, :suit]]]])
          |> Repo.get!(game_id)

        GameTogetherOnline.GameTables
        |> GameTables.create_game_table(game_with_everything)

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
