defmodule GameTogetherOnlineWeb.GameLiveTest do
  use GameTogetherOnlineWeb.ConnCase

  import Phoenix.LiveViewTest
  require Ecto.Query

  alias GameTogetherOnline.Games
  alias GameTogetherOnline.Games.Game
  alias GameTogetherOnline.GameTables
  alias GameTogetherOnline.Repo
  alias Ecto.Query

  describe "when there is a user in the session" do
    test "disconnected and connected render", %{conn: conn} do
      {:ok, game} = Games.create_game(%{})

      game_with_everything =
        Game
        |> Query.preload(deals: [hands: [delt_cards: [card: [:rank, :suit]]]])
        |> Repo.get!(game.id)

      GameTogetherOnline.GameTables
      |> GameTables.create_game_table(game_with_everything)

      {:ok, page_live, disconnected_html} =
        conn
        |> Plug.Test.init_test_session(%{current_user_id: "user id"})
        |> live(Routes.game_path(conn, :show, game))

      assert disconnected_html =~ "Play the game here"
      assert render(page_live) =~ "Play the game here"
    end
  end

  describe "when there is no user in the session" do
    test "redirect to login page", %{conn: conn} do
      create_user_path =
        Routes.user_path(conn, :new, redirect: Routes.game_path(conn, :show, "123"))

      assert {:error, {:redirect, %{to: ^create_user_path}}} =
               live(conn, Routes.game_path(conn, :show, "123"))
    end
  end
end
